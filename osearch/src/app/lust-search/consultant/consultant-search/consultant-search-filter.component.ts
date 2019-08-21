import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
import { ConsultantSearchFilter } from '../../../models/consultant-search-filter';
import { ActivatedRoute, Router } from '@angular/router';
import { BehaviorSubject} from 'rxjs';
import { LustDataService } from '../../../services/lust-data.service';
import { ConsultantSearchResultStat } from '../../../models/consultant-search-result-stat';
import { ApGetLogNumber } from 'src/app/models/apGetLogNumber';
import { Constants } from 'src/app/constants';
import { AuthLevel, AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-consultant-search-filter',
  templateUrl: './consultant-search-filter.component.html',
  styleUrls: ['./consultant-search-filter.component.scss']
})
export class ConsultantSearchFilterComponent implements OnInit {
    consultantSearchFilterForm: FormGroup;
    consultantSearchFilter: ConsultantSearchFilter;
    showSearchResultsFlag = false;
    lustId: number;
    private apGetLogNumber: ApGetLogNumber;
    public logNumber: string;
    private loadingSubject = new BehaviorSubject<boolean>(false);
    @Output() rowSelected = new EventEmitter<ConsultantSearchResultStat>();
    exportToCsv = Constants.exportToCSV;
    authLevel: AuthLevel;
    showAdd: boolean;

    constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
      , private route: ActivatedRoute, private router: Router, private authService: AuthService
    ) {}
    ngOnInit() {
      this.setAuthLevel();
      this.setShowAdd();
      this.logNumber = '';
      this.route.parent.params.subscribe(params => {
        this.lustId = +params['lustid'];
        this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
          this.apGetLogNumber = data.apGetLogNumber;
         });
      });
      this.createSearchFilterForm();
    }


    setAuthLevel() {
      this.authLevel = this.authService.getAuthLevel();
    }

    setShowAdd() {
      this.showAdd = true;
      if (this.authLevel < AuthLevel.PM) {
        this.showAdd = false;
      }
    }

    private createSearchFilterForm() {
      this.consultantSearchFilterForm = this.formBuilder.group({
        companyName:  [''],
        address:  [''],
        city: [''],
        zipCode: [''],
        sortColumn: [1],
        sortOrder: [1],
        pageNumber: [1],
        rowsPerPage: [40],
      });
    }
    resetSearchFilterForm() {
      this.consultantSearchFilterForm.reset();
      this.consultantSearchFilter = Object.assign({}, this.consultantSearchFilterForm.value);
      this.showSearchResultsFlag = false;
    }
    submitSearchFilterForm() {
      this.showSearchResultsFlag = false;
      this.consultantSearchFilter = Object.assign({}, this.consultantSearchFilterForm.value);
      this.showSearchResultsFlag = true;
    }
    onSelected(consultantSearchResultStat: ConsultantSearchResultStat) {
      this.rowSelected.emit(consultantSearchResultStat);
    }
    onAdd() {
      this.router.navigate(['../consultant'], {relativeTo: this.route});
    }
  }
