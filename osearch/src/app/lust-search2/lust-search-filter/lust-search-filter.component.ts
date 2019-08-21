import { Component, OnInit, ElementRef, ViewChild, AfterViewInit, AfterViewChecked } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { LustDataService } from '../../services/lust-data.service';
import { LustSearchFilter } from '../../models/lust-search-filter';
import { CleanupSiteType } from '../../models/cleanup-site-type';
import { TankStatus } from '../../models/tank-status';
import { FileStatus } from '../../models/file-status';
import { ZipCode } from '../../models/zipcode';
import { ProjectManager } from '../../models/project-manager';
import { City } from '../../models/city';
import { DateCompare } from '../../models/date-compare';
import { Region } from '../../models/region';
import { SiteType } from '../../models/site-type';
import { County } from '../../models/county';
import { Observable, of } from 'rxjs';
import { SearchValue } from 'src/app/models/search-value';
import { startWith, debounceTime, switchMap, map, catchError } from 'rxjs/operators';


export class State {
  constructor(public name: string, public population: string, public flag: string) { }
}


@Component({
  selector: 'app-lust-search-filter',
  templateUrl: './lust-search-filter.component.html',
  styleUrls: ['./lust-search-filter.component.scss']
})
export class LustSearchFilterComponent implements OnInit {
  lustSearchFilterForm: FormGroup;
  lustSearchFilter: LustSearchFilter;
  showLustSearchResultsFlag = false;
  tankStatuses: TankStatus[] = [];
  fileStatuses: FileStatus[] = [];
  cleanupSiteTypes: CleanupSiteType[] = [];
  zipCodes: ZipCode[] = [];
  regions: Region[] = [];
  dateCompares: DateCompare[] = [];
  projectManagers: ProjectManager[] = [];
  cities: City[] = [];
  siteTypes: SiteType[] = [];
  counties: County[] = [];
  // @ViewChild('logCounty') nameElementRef: ElementRef;
  public filteredZips: Observable<any[]>;
  public filteredCities: Observable<any[]>;

  state$: Observable<any>;
  prevLustSearchFilter: LustSearchFilter;

  isSearchOnly = false;
  private scrToView: any;

  constructor(private formBuilder: FormBuilder
    , private route: ActivatedRoute , private router: Router
    , private lustDataService: LustDataService) {}

  ngOnInit() {
    if (this.route.snapshot.url.length > 0) {
      this.isSearchOnly = false;
      this.state$ = this.route.paramMap.pipe(
        map(() => window.history.state)
      );
      this.state$.subscribe(res => this.prevLustSearchFilter = res.data);
      this.route.data.subscribe((data: {siteTypes: SiteType[]}) => { this.siteTypes = data.siteTypes; });
      this.route.data.subscribe((data: {cleanupSiteTypes: CleanupSiteType[]}) => {this.cleanupSiteTypes = data.cleanupSiteTypes; });
      this.route.data.subscribe((data: {fileStatuses: FileStatus[]}) => {this.fileStatuses = data.fileStatuses; });
      this.route.data.subscribe((data: {zipCodes: ZipCode[]}) => {this.zipCodes = data.zipCodes; this.zipCodes.shift(); });
      this.route.data.subscribe((data: {regions: Region[]}) => {this.regions = data.regions; });
      this.route.data.subscribe((data: {cities: City[]}) => {this.cities = data.cities; this.cities.shift(); });
      this.route.data.subscribe((data: {dateCompares: DateCompare[]}) => {this.dateCompares = data.dateCompares; });
      this.route.data.subscribe((data: {tankStatuses: TankStatus[]}) => {this.tankStatuses = data.tankStatuses; });
      this.route.data.subscribe((data: {projectManagers: ProjectManager[]}) => {this.projectManagers = data.projectManagers; });
      this.route.data.subscribe((data: {counties: County[]}) => {this.counties = data.counties; });
    } else {
      this.isSearchOnly = true;
      this.lustDataService.getSiteTypes().subscribe(data => { this.siteTypes = data; });
      this.lustDataService.getCleanupSiteTypes().subscribe(data => { this.cleanupSiteTypes = data; });
      this.lustDataService.getFileStatuses().subscribe(data => { this.fileStatuses = data; });
      this.lustDataService.getZipCodes().subscribe(data => { this.zipCodes = data; this.zipCodes.shift(); });
      this.lustDataService.getRegions().subscribe(data => { this.regions = data; });
      this.lustDataService.getCities().subscribe(data => { this.cities = data; this.cities.shift(); });
      this.lustDataService.getDateCompares().subscribe(data => { this.dateCompares = data; });
      this.lustDataService.getTankStatuses().subscribe(data => { this.tankStatuses = data; });
      this.lustDataService.getProjectManagers().subscribe(data => { this.projectManagers = data; });
      this.lustDataService.getCounties().subscribe(data => { this.counties = data; });
    }

    this.createSearchFilterForm();
    this.filteredZips = this.lustSearchFilterForm.controls.siteZipcode.valueChanges
      .pipe(
        startWith(''),
        map(zip => zip ? this.filterZips(zip) : this.zipCodes.slice())
      );

    this.filteredCities = this.lustSearchFilterForm.controls.siteCity.valueChanges
      .pipe(
        startWith(''),
        map(city => city ? this.filterCities(city) : this.cities.slice())
      );

    if (this.prevFilterExists()) {
      this.submitLustSearchFilterForm();
    }
    this.OnScrollIntoView();


  }

  filterZips(zc: string) {
    return this.zipCodes.filter(zip => zip.zipCode1.indexOf(zc) === 0);
  }
  filterCities(input: string) {
    return this.cities.filter(city => city.placeName.indexOf(input.toUpperCase()) === 0);
  }

  private prevFilterExists(): boolean {
    if (this.prevLustSearchFilter !== undefined && this.prevLustSearchFilter !== null) {
      if (Object.keys(this.prevLustSearchFilter).length === 0) {
        return false;
      }
      const hasValues = (obj) => Object.values(obj).some(v => v !== null && typeof v !== 'undefined');
      // Object.keys(this.prevLustSearchFilter).forEach(key => console.log(key));
      return (hasValues(this.prevLustSearchFilter));
    }
    return false;
  }

  private getValue(valueIn: any, defaultReturnValue: any = ''): any {
    if (valueIn !== undefined && valueIn !== null) {
      return valueIn;
    }
    return defaultReturnValue;
  }

  private createSearchFilterFormOrig() {
    this.lustSearchFilterForm = this.formBuilder.group({
      logCounty:  ['', Validators.compose([Validators.maxLength(2), Validators.pattern('[0-9][0-9]')])],
      logYear:  ['', Validators.compose([Validators.maxLength(2), Validators.pattern('[0-9][0-9]')])],
      logSeqNbr: ['', Validators.compose([Validators.maxLength(4), Validators.pattern('[0-9][0-9][0-9][0-9]')])],
      facilityId: [''],
      siteName:  [''],
      siteAddress:  [''],
      siteZipcode: [''],
      siteCounty: [''],
      siteCity: [''],
      regionCode: [''],
      releaseSiteTypeCode:  [''],
      cleanupSiteTypeId:  [''],
      fileStatusId: [''],
      projectManagerCode: [''],
      contactFirstName:  [''],
      contactLastName:  [''],
      contactOrganization: [''],
      tankStatusId: [''],
      hotAuditRejectInd:  [0],
      compareDate1Id:  [''],
      compareDate2Id: [''],
      compareDate1IdFromDate: [''],
      compareDate1IdToDate:  [''],
      compareDate2IdFromDate:  [''],
      compareDate2IdToDate: [''],
      sortColumn: [1],
      sortOrder: [1],
      pageNumber: [1],
      rowsPerPage: [40],
    });
  }

  private createSearchFilterForm() {
    if (this.isSearchOnly || !this.prevFilterExists()) {
      this.lustSearchFilterForm = this.formBuilder.group({
        logCounty:  ['', Validators.compose([Validators.maxLength(2), Validators.pattern('[0-9][0-9]')])],
        logYear:  ['', Validators.compose([Validators.maxLength(2), Validators.pattern('[0-9][0-9]')])],
        logSeqNbr: ['', Validators.compose([Validators.maxLength(4), Validators.pattern('[0-9][0-9][0-9][0-9]')])],
        facilityId: [''],
        siteName:  [''],
        siteAddress:  [''],
        siteZipcode: [''],
        siteCounty: [''],
        siteCity: [''],
        regionCode: [''],
        releaseSiteTypeCode:  [''],
        cleanupSiteTypeId:  [''],
        fileStatusId: [''],
        projectManagerCode: [''],
        contactFirstName:  [''],
        contactLastName:  [''],
        contactOrganization: [''],
        tankStatusId: [''],
        hotAuditRejectInd:  [0],
        compareDate1Id:  [''],
        compareDate2Id: [''],
        compareDate1IdFromDate: [''],
        compareDate1IdToDate:  [''],
        compareDate2IdFromDate:  [''],
        compareDate2IdToDate: [''],
        sortColumn: [1],
        sortOrder: [1],
        pageNumber: [1],
        rowsPerPage: [40],
      });
    } else {
      this.lustSearchFilterForm = this.formBuilder.group({
        logCounty:  [this.getValue(this.prevLustSearchFilter.logCounty)
              , Validators.compose([Validators.maxLength(2), Validators.pattern('[0-9][0-9]')])],
        logYear:  [this.getValue(this.prevLustSearchFilter.logYear)
              , Validators.compose([Validators.maxLength(2), Validators.pattern('[0-9][0-9]')])],
        logSeqNbr: [this.getValue(this.prevLustSearchFilter.logSeqNbr)
              , Validators.compose([Validators.maxLength(4), Validators.pattern('[0-9][0-9][0-9][0-9]')])],
        facilityId: [this.getValue(this.prevLustSearchFilter.facilityId)],
        siteName:  [this.getValue(this.prevLustSearchFilter.siteName)],
        siteAddress:  [this.getValue(this.prevLustSearchFilter.siteAddress)],
        siteZipcode: [this.getValue(this.prevLustSearchFilter.siteZipcode)],
        siteCounty: [this.getValue(this.prevLustSearchFilter.siteCounty)],
        siteCity: [this.getValue(this.prevLustSearchFilter.siteCity)],
        regionCode: [this.getValue(this.prevLustSearchFilter.regionCode)],
        releaseSiteTypeCode:  [this.getValue(this.prevLustSearchFilter.releaseSiteTypeCode)],
        cleanupSiteTypeId:  [this.getValue(this.prevLustSearchFilter.cleanupSiteTypeId)],
        fileStatusId: [this.getValue(this.prevLustSearchFilter.fileStatusId)],
        projectManagerCode: [this.getValue(this.prevLustSearchFilter.projectManagerCode)],
        contactFirstName:  [this.getValue(this.prevLustSearchFilter.contactFirstName)],
        contactLastName:  [this.getValue(this.prevLustSearchFilter.contactLastName)],
        contactOrganization: [this.getValue(this.prevLustSearchFilter.contactOrganization)],
        tankStatusId: [this.getValue(this.prevLustSearchFilter.tankStatusId)],
        hotAuditRejectInd:  [this.getValue(this.prevLustSearchFilter.hotAuditRejectInd)],
        compareDate1Id:  [this.getValue(this.prevLustSearchFilter.compareDate1Id)],
        compareDate2Id: [this.getValue(this.prevLustSearchFilter.compareDate2Id)],
        compareDate1IdFromDate: [this.getValue(this.prevLustSearchFilter.compareDate1IdFromDate)],
        compareDate1IdToDate:  [this.getValue(this.prevLustSearchFilter.compareDate1IdToDate)],
        compareDate2IdFromDate:  [this.getValue(this.prevLustSearchFilter.compareDate2IdFromDate)],
        compareDate2IdToDate: [this.getValue(this.prevLustSearchFilter.compareDate2IdToDate)],
        sortColumn: [this.getValue(this.prevLustSearchFilter.sortColumn, 1)],
        sortOrder: [this.getValue( this.prevLustSearchFilter.sortOrder, 1)],
        pageNumber: [this.getValue(this.prevLustSearchFilter.pageNumber, 1)],
        rowsPerPage: [this.getValue(this.prevLustSearchFilter.rowsPerPage, 40)],
      });
    }
  }

  resetLustSearchFilterForm() {
    this.lustSearchFilterForm.reset();
    this.lustSearchFilter = Object.assign({}, this.lustSearchFilterForm.value);
    this.showLustSearchResultsFlag = false;
  }

  submitLustSearchFilterForm() {
    if (this.lustSearchFilterForm.controls.hotAuditRejectInd.value === false) {
      this.lustSearchFilterForm.controls.hotAuditRejectInd.setValue(0);
    }
    if (this.lustSearchFilterForm.controls.hotAuditRejectInd.value === true) {
      this.lustSearchFilterForm.controls.hotAuditRejectInd.setValue(1);
    }
    this.showLustSearchResultsFlag = false;
    this.lustSearchFilter = Object.assign({}, this.lustSearchFilterForm.value);
    this.lustSearchFilter.compareDate1IdFromDate = this.checkDateRange(this.lustSearchFilter.compareDate1IdFromDate);
    this.lustSearchFilter.compareDate2IdFromDate = this.checkDateRange(this.lustSearchFilter.compareDate2IdFromDate);
    this.lustSearchFilter.compareDate1IdToDate = this.checkDateRange(this.lustSearchFilter.compareDate1IdToDate);
    this.lustSearchFilter.compareDate2IdToDate = this.checkDateRange(this.lustSearchFilter.compareDate2IdToDate);
    if (this.lustSearchFilter.facilityId) {
      if ((!Number(this.lustSearchFilter.facilityId))) {
        this.lustSearchFilter.facilityId = '-1';
      }
    }
    // console.log(JSON.stringify(this.lustSearchFilter));
    this.showLustSearchResultsFlag = true;

    // Scroll to top of control (grid list)
    const scrToView = document.getElementById('topSearchResults');
    if (scrToView) {
      scrToView.scrollIntoView();
      scrToView.scrollTop = scrToView.scrollHeight;
    }

  }


  createIncident() {
    this.router.navigate(['lust']);
  }

  onInputEntry(event, nextInput) {
    const input = event.target;
    const length = input.value.length;
    const maxLength = input.attributes.maxLength.value;


    if (length >= maxLength) {
      nextInput.focus();
    }
  }

  OnScrollIntoView () {
    // Attempt to bring the Search Results into view
    scroll(0, 0);
    this.scrToView = document.getElementById('bottomOfForm');
    console.log(this.scrToView);
    if (this.scrToView) {
      console.log('bottomOfForm found');
      this.scrToView.scrollIntoView();
    }
  }

  checkDateRange(dateIn: Date): Date {
    const minDate = new Date('January 1, 1753');
    const maxDate = new Date('December 31, 9999');
    if (dateIn) {
      if (dateIn && dateIn < minDate ) {
        return minDate;
      } else if (dateIn > maxDate) {
        return maxDate;
      } else {
        return dateIn;
      }
    }  else {
      return dateIn;
    }

  }
}














