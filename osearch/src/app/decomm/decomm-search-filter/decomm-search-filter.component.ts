import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormBuilder } from '@angular/forms';
import { HotcSearchFilter } from 'src/app/models/hotc-search-filter';
import { HotcSearchResultStat } from 'src/app/models/hotc-search-result-stat';
import { LustDataService } from 'src/app/services/lust-data.service';
import { County } from 'src/app/models/county';
import { Quadrant } from 'src/app/models/quadrant';
import { StreetType } from 'src/app/models/street-type';
import { ZipCode } from 'src/app/models/zipcode';
import { SidDescLookup } from 'src/app/models/sid-desc-lookup';
import { startWith, map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-decomm-search-filter',
  templateUrl: './decomm-search-filter.component.html',
  styleUrls: ['./decomm-search-filter.component.scss']
})
export class DecommSearchFilterComponent implements OnInit {
  hotcSearchFilterForm: FormGroup;
  hotcSearchFilter: HotcSearchFilter;
  showSearchResultsFlag = false;
  @Output() rowSelected = new EventEmitter<HotcSearchResultStat>();
  counties: County[] = [];
  quadrants: Quadrant[] = [];
  streetTypes: StreetType[] = [];
  zipCodes: ZipCode[] = [];
  lustHotcSearchTypes: SidDescLookup[] = [];
  public filteredZips: Observable<any[]>;
  public showAdd = false;
  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router, private authService: AuthService
  ) {}
  ngOnInit() {
    this.route.data.subscribe((data: {counties: County[]}) => {this.counties = data.counties; });
    this.route.data.subscribe((data: {quadrants: Quadrant[]}) => {this.quadrants = data.quadrants; });
    this.route.data.subscribe((data: {streetTypes: StreetType[]}) => {this.streetTypes = data.streetTypes; });
    this.route.data.subscribe((data: {zipCodes: ZipCode[]}) => {this.zipCodes = data.zipCodes;  this.zipCodes.shift(); });
    this.route.data.subscribe((data: {lustHotcSearchTypes: SidDescLookup[]}) => {this.lustHotcSearchTypes = data.lustHotcSearchTypes; });
    this.createSearchFilterForm();
    this.showAdd = false;
    if (this.authService.isLustAdminRole()) {
      this.showAdd = true;
    }
    this.filteredZips = this.hotcSearchFilterForm.controls.zipCode.valueChanges
    .pipe(
      startWith(''),
      map(zip => zip ? this.filterZips(zip) : this.zipCodes.slice())
    );
  }
  private createSearchFilterForm() {
    this.hotcSearchFilterForm = this.formBuilder.group({
      id: [],
      streetNbr: [],
      streetQuad: [],
      streetName: [],
      streetType: [],
      otherAddr: [],
      city: [],
      zipCode: [],
      county: [],
      year: [],
      searchType: ['3'],
      finalInvRqstdate: [],
      closedDate: [],
      sortColumn: [1],
      sortOrder: [1],
      pageNumber: [1],
      rowsPerPage: [40],
    });
  }

  resetSearchFilterForm() {
    this.hotcSearchFilterForm.reset();
    this.hotcSearchFilter = Object.assign({}, this.hotcSearchFilterForm.value);
    this.showSearchResultsFlag = false;
  }
  submitSearchFilterForm() {
    this.showSearchResultsFlag = false;
    this.hotcSearchFilter = Object.assign({}, this.hotcSearchFilterForm.value);
    if (this.hotcSearchFilter.id) {
      if ((!Number(this.hotcSearchFilter.id))) {
        this.hotcSearchFilter.id = -1;
      }
    }
    this.showSearchResultsFlag = true;
  }
  onSelected(hotcSearchResultStat: HotcSearchResultStat) {
    this.rowSelected.emit(hotcSearchResultStat);
  }

  onAddHot() {
    const searchAddr: SearchAddr = {
      streetNbr: this.hotcSearchFilterForm.controls.streetNbr.value,
      streetQuad: this.hotcSearchFilterForm.controls.streetQuad.value,
      streetName: this.hotcSearchFilterForm.controls.streetName.value,
      streetType: this.hotcSearchFilterForm.controls.streetType.value,
      city: this.hotcSearchFilterForm.controls.city.value,
      zip: this.hotcSearchFilterForm.controls.zipCode.value,
      otherAddr: this.hotcSearchFilterForm.controls.otherAddr.value,
    };
    this.router.navigateByUrl('/dhot', { state: { data: searchAddr } });
  }

  onAddLust() {
    this.router.navigate(['../dlust'], {relativeTo: this.route});
  }
  onInputEntry(event, nextInput) {
    const input = event.target;
    const length = input.value.length;
    const maxLength = input.attributes.maxLength.value;
    if (length >= maxLength) {
      nextInput.focus();
    }
  }
  filterZips(zc: string) {
    return this.zipCodes.filter(zip => zip.zipCode1.indexOf(zc) === 0);
  }
}

export class SearchAddr {
  streetName: string;
  streetQuad: string;
  streetNbr: string;
  streetType: string;
  city: string;
  zip: string;
  otherAddr: string;
}

