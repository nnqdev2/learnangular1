import { Component, OnInit, Input, Inject, Output, EventEmitter } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../environments/environment';
import { Observable} from 'rxjs';

import { LustDataService } from '../services/lust-data.service';
import { UstSearchFilter } from '../models/ust-search-filter';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ZipCode } from '../models/zipcode';
import { City } from '../models/city';
import { County } from '../models/county';
import { UstSearchResultStat } from '../models/ust-search-result-stat';
import { startWith, map } from 'rxjs/operators';

@Component({
  selector: 'app-ust-search-filter',
  templateUrl: './ust-search-filter.component.html',
  styleUrls: ['./ust-search-filter.component.scss']
})
export class UstSearchFilterComponent implements OnInit {
  ustSearchFilterForm: FormGroup;
  ustSearchFilter: UstSearchFilter;
  showUstSearchResultsFlag = false;
  showSelectButton = false;

  zipCodes: ZipCode[] = [];
  cities: City[] = [];
  counties: County[] = [];
  public filteredZips: Observable<any[]>;
  public filteredCities: Observable<City[]>;

  @Output() rowSelected = new EventEmitter<UstSearchResultStat>();
  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router
  ) {}

  ngOnInit() {
    if (this.route.snapshot.url.length > 0) {
      this.route.data.subscribe((data: {zipCodes: ZipCode[]}) => {this.zipCodes = data.zipCodes; this.zipCodes.shift(); });
      this.route.data.subscribe((data: {cities: City[]}) => {this.cities = data.cities; this.cities.shift(); });
      this.route.data.subscribe((data: {counties: County[]}) => {this.counties = data.counties; });
      this.showSelectButton = false;
    } else {
      this.lustDataService.getZipCodes().subscribe(data => { this.zipCodes = data; this.zipCodes.shift(); });
      this.lustDataService.getCities().subscribe(data => { this.cities = data; this.cities.shift();  });
      this.lustDataService.getCounties().subscribe(data => { this.counties = data; });
      this.showSelectButton = true;
    }
    this.createSearchFilterForm();
    this.filteredZips = this.ustSearchFilterForm.controls.facilityZip.valueChanges
    .pipe(
      startWith(''),
      map(zip => zip ? this.filterZips(zip) : this.zipCodes.slice())
    );
    this.filteredCities = this.ustSearchFilterForm.controls.facilityCity.valueChanges
    .pipe(
      startWith(''),
      map(city => city ? this.filterCities(city) : this.cities.slice())
    );
  }

  private createSearchFilterForm() {
    this.ustSearchFilterForm = this.formBuilder.group({
      facilityId:  [''],
      facilityName:  [''],
      facilityAddress:  [''],
      facilityCity: [''],
      facilityZip: [''],
      facilityCounty: [''],
      sortColumn: [1],
      sortOrder: [1],
      pageNumber: [1],
      rowsPerPage: [40],
    });
  }

  resetUstSearchFilterForm() {
    this.ustSearchFilterForm.reset();
    this.ustSearchFilter = Object.assign({}, this.ustSearchFilterForm.value);
    this.showUstSearchResultsFlag = false;
  }

  submitUstSearchFilterForm() {
    this.showUstSearchResultsFlag = false;
    this.ustSearchFilter = Object.assign({}, this.ustSearchFilterForm.value);
    this.ustSearchFilter.facilityId = +this.ustSearchFilter.facilityId;
    if (Number.isNaN(this.ustSearchFilter.facilityId)) {
      this.ustSearchFilter.facilityId = -1;
    } else if (this.ustSearchFilter.facilityId === 0) {
      this.ustSearchFilter.facilityId = null;
    }
    this.showUstSearchResultsFlag = true;
  }

  // onRowClicked(ustSearchResultStat: UstSearchResultStat) {
  //   this.rowSelected.emit(ustSearchResultStat);
  // }

  onSelected(ustSearchResultStat: UstSearchResultStat) {
    this.rowSelected.emit(ustSearchResultStat);
  }

  filterZips(zc: string) {
    return this.zipCodes.filter(zip => zip.zipCode1.indexOf(zc) === 0);
  }
  filterCities(input: string) {
    return this.cities.filter(city => city.placeName.indexOf(input.toUpperCase()) === 0);
  }
}














