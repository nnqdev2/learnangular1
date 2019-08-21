import { Component, OnInit, OnDestroy} from '@angular/core';
import { FormGroup, FormBuilder, Validators, AbstractControl, ValidatorFn, ValidationErrors } from '@angular/forms';
import { ActivatedRoute, Router, NavigationEnd } from '@angular/router';
import { DatePipe } from '@angular/common';
import { Observable, Subject, BehaviorSubject, iif, Subscription} from 'rxjs';
import { map, flatMap, startWith} from 'rxjs/operators';

import { LustDataService } from '../../services/lust-data.service';
import { SiteType } from '../../models/site-type';
import { ConfirmationType } from '../../models/confirmation-type';
import { DiscoveryType } from '../../models/discovery-type';
import { ReleaseCauseType } from '../../models/release-cause-type';
import { SourceType } from '../../models/source-type';
import { State } from '../../models/state';
import { AddressCorrectDataService } from '../../services/address-correct-data.service';
import { AddressCorrectStat } from '../../models/address-correct-stat';
import { AddressCorrect } from '../../models/address-correct';
import { MatDialogConfig, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { GuardDialogComponent } from '../../common/dialogs/guard-dialog.component';
import { City } from '../../models/city';
import { ZipCode } from '../../models/zipcode';
import { County } from '../../models/county';
import { SearchDialogComponent } from '../search-dialog/search-dialog.component';
import { IncidentIdToNameService } from '../../olprr-search/incident-id-to-name.service';
import { PostalCountyLookup } from '../../models/postal-county-lookup';
import { SiteType2 } from '../../models/site-type2';
import { Brownfield } from '../../models/brownfield';
import { ProjectManager } from '../../models/project-manager';
import { LustIncidentGet } from '../../models/lust-incident-get';
import { FileStatus } from '../../models/file-status';
import { LustIncidentUpdateResult } from '../../models/lust-incident-update-Result';
import { LustIncidentUpdateUpdate } from '../../models/lust-incident-update-update';
import { SubmitStatusDialogComponent } from '../../common/dialogs/submit-status-dialog.component';
import { ConfirmDeleteDialogComponent } from '../confirm-delete-dialog/confirm-delete-dialog.component';
import { UstSearchResultStat } from '../../models/ust-search-result-stat';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { AppConfig } from 'src/app/app.config';
import { Constants } from 'src/app/constants';
import { IncidentValidators } from 'src/app/validators/incident.validator';
import { LustSearchFilter } from 'src/app/models/lust-search-filter';
import { ProjectManagerGet } from 'src/app/models/project-manager-get';
@Component({
  selector: 'app-lust-incident-edit',
  templateUrl: './lust-incident-edit.component.html',
  styleUrls: ['./lust-incident-edit.component.scss']
})
export class LustIncidentEditComponent implements OnInit, OnDestroy {
  private guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  private searchDialogRef: MatDialogRef<SearchDialogComponent, any>;
  private submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;

  phoneNumbersOnly: string;
  olprrId: number;
  lustIncidentGet: LustIncidentGet|null;
  private incidentForm: FormGroup;
  confirmationTypes: ConfirmationType[] = [];
  discoveryTypes: DiscoveryType[] = [];
  releaseCauseTypes: ReleaseCauseType[] = [];
  siteTypes: SiteType[] = [];
  siteType2s: SiteType2[] = [];
  brownfields: Brownfield[] = [];
  fileStatuses: FileStatus[] = [];
  projectManagers: ProjectManager[] = [];
  projectManagerGets: ProjectManagerGet[] = [];
  sourceTypes: SourceType[] = [];
  cities: City[] = [];
  states: State[] = [];
  zipcodes: ZipCode[] = [];
  counties: County[] = [];
  addressCorrectStat: AddressCorrectStat;
  addressCorrects: AddressCorrect[];
  addressCorrect: AddressCorrect;
  addressCorrectStatLoaded = false;
  postalCountyLookup: PostalCountyLookup|null;
  countyFips: string;
  leavePage: boolean;

  saAddressCorrectStat: AddressCorrectStat|null;
  rpAddressCorrectStat: AddressCorrectStat|null;
  icAddressCorrectStat: AddressCorrectStat|null;
  saAddressCorrect: AddressCorrect|null;

  currentDate: Date;
  showInvoiceContact = false;
  errorMessage: string;
  emailPattern = '^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$';
  private submitClicked = false;
  private resetFormClicked = false;
  private searchClicked = false;
  private formUpdated = false;

  private errors: any[];
  private showSaAddressCorrect = false;
  private showSaAddressCheck = false;


  private lustIncidentUpdate = new LustIncidentUpdateUpdate();
  private lustIncidentUpdateResult: LustIncidentUpdateResult;


  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  public filteredZips: Observable<any[]>;
  public phonePlaceHolder = Constants.phone_place_holder;

  maxDate: Date;
  isClosed: boolean;
  selectedZip: string;

  showAllErrorsMessages = false;
  authLevel = AuthLevel.Domain;
  disableButtons = false;
  disableDelete = false;
  disableWebDoc = false;
  returnToSearch = Constants.returnToSearch;
  state$: Observable<any>;
  lustSearchFilter: LustSearchFilter;
  navigationSubscription: Subscription;
  pm: ProjectManagerGet;
  pmUserName: string;
  private lastSaRefresh: string;

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder, private datePipe: DatePipe
    , private route: ActivatedRoute, private router: Router, private addressCorrectDataService: AddressCorrectDataService
    , private canDeactivateDialog: MatDialog, private submitStatusDialog: MatDialog, private confirmDeleteDialog: MatDialog
    , private idToNameService: IncidentIdToNameService, private searchDialog: MatDialog, private authService: AuthService
  ) {
    this.navigationSubscription = this.router.events.subscribe((e: any) => {
      if (e instanceof NavigationEnd) {
        this.ngOnInit();
      }
    });
  }

  ngOnInit() {
    this.loadingSubject.next(true);
    this.state$ = this.route.paramMap.pipe(
      map(() => window.history.state)
    );
    this.state$.subscribe(res => this.lustSearchFilter = res.data);
    this.route.data.subscribe((data: {lustIncidentGet: LustIncidentGet}) => {this.lustIncidentGet = data.lustIncidentGet; });
    this.route.data.subscribe((data: {projectManagerGets: ProjectManagerGet[]}) => {this.projectManagerGets = data.projectManagerGets; });
    this.route.data.subscribe((data: {siteTypes: SiteType[]}) => {this.siteTypes = data.siteTypes; });
    this.route.data.subscribe((data: {siteType2s: SiteType2[]}) => {this.siteType2s = data.siteType2s; });
    this.route.data.subscribe((data: {brownfields: Brownfield[]}) => {this.brownfields = data.brownfields; });
    this.route.data.subscribe((data: {cities: City[]}) => {this.cities = data.cities; });
    this.route.data.subscribe((data: {zipCodes: ZipCode[]}) => {this.zipcodes = data.zipCodes; this.zipcodes.shift(); });
    this.route.data.subscribe((data: {counties: County[]}) => {this.counties = data.counties; });
    this.route.data.subscribe((data: {fileStatuses: FileStatus[]}) => {this.fileStatuses = data.fileStatuses; });
    this.setAuthLevel();
    this.createForm();
    this.prepForm();
    this.maxDate = new Date();
    this.maxDate.setDate( this.maxDate.getDate());
    this.loadingSubject.next(false);
    this.OnScrollIntoView();
    this.isClosed = true;
    this.updateSideNav();
    this.filteredZips = this.incidentForm.controls.siteZipcode.valueChanges
      .pipe(
        startWith(''),
        map(zip => zip ? this.filterZips(zip) :  this.zipcodes.slice())
      );
  }

  private setAuthLevel()  {
    this.authLevel = this.authService.getAuthLevel();
  }

  private prepForm()  {
    if (this.authLevel < AuthLevel.Admin) {
      if (this.authLevel === AuthLevel.PM) {
        this.incidentForm.controls.siteName.disable();
        this.incidentForm.controls.qTimeId.disable();
        this.incidentForm.controls.logNumber.disable();
        this.incidentForm.controls.siteCounty.disable();
        this.incidentForm.controls.releaseType.disable();
        this.incidentForm.controls.dateReceived.disable();
        this.incidentForm.controls.finalInvcRqstDate.disable();
        this.incidentForm.controls.closedDate.disable();
        this.disableDelete = true;
      } else  {
        this.incidentForm.disable();
        this.disableButtons = true;
        if (this.authLevel < AuthLevel.WebDoc) {
          this.disableWebDoc = true;
        }
      }
    }

  }


  createForm() {
    if (this.projectManagerGets !== undefined && this.projectManagerGets.length > 0) {
      this.pmUserName = this.projectManagerGets[0].userName;
    }
    this.incidentForm = this.formBuilder.group({
        logNumber: [{value: this.lustIncidentGet.logNumber, disabled: true}],
        qTimeId: [this.lustIncidentGet.qtimeId],
        projectManager: [this.pmUserName],
        facilityId: [this.lustIncidentGet.facilityId],
        siteName:  [this.lustIncidentGet.siteName, Validators.compose([Validators.required, Validators.maxLength(40)])],
        siteAddress:    [this.lustIncidentGet.siteAddress, Validators.compose([Validators.required, Validators.maxLength(40)])],
        siteCity:  [this.lustIncidentGet.siteCity, Validators.compose([Validators.required, Validators.maxLength(20)])],
        siteZipcode: [this.lustIncidentGet.siteZipcode
          , Validators.compose([Validators.required, IncidentValidators.validateZipcode(this.zipcodes)])],
          // , Validators.compose([Validators.required])],
        siteCounty:  [+this.lustIncidentGet.logNbrCounty, Validators.required],
        sitePhone:  [this.lustIncidentGet.sitePhone, Validators.compose([Validators.maxLength(25)])],
        noValidAddress: [this.lustIncidentGet.noValidAddress],
        releaseType:  [this.lustIncidentGet.releaseType, Validators.required],
        geoLocId: [this.lustIncidentGet.geolocId],
        siteType2Id: [this.lustIncidentGet.siteTypeId],
        fileStatusId: [this.lustIncidentGet.fileStatusId],
        closureType: [''],
        brownfieldCodeId: [this.lustIncidentGet.brownfieldCodeId],
        propertyTranPendingInd: [this.lustIncidentGet.propertyTranPendingInd],
        programTransferInd:     [this.lustIncidentGet.programTransferInd],
        hotAuditRejectInd:      [this.lustIncidentGet.hotAuditRejectInd],
        activeReleaseInd:       [this.lustIncidentGet.activeReleaseInd],
        optionLetterSentInd:    [this.lustIncidentGet.optionLetterSentInd],
        dateReceived:  [this.lustIncidentGet.receivedDate, Validators.required],
        discoveryDate: [this.lustIncidentGet.discoveryDate, Validators.required],
        cleanupStartDate:  [this.lustIncidentGet.cleanupStartDate],
        finalInvcRqstDate: [this.lustIncidentGet.finalInvcRqstDate],
        releaseStopDate:  [this.lustIncidentGet.releaseStopDate],
        closedDate: [this.lustIncidentGet.closedDate],
        letterOfAgreementDate: [this.lustIncidentGet.letterOfAgreementDate],
        letterOfAgreementComment: [this.lustIncidentGet.letterOfAgreementComment],
        createDate: [this.lustIncidentGet.createDate],
        siteComment: [this.lustIncidentGet.siteComment],
        seeAlsoComment: [this.lustIncidentGet.seeAlsoComment],
        publicSummaryComment: [this.lustIncidentGet.publicSummaryComment],
        saAddressCorrectAddress: [{value: '', disabled: true}],
        saAddressCorrectCounty:  [{value: '', disabled: true}],
        saAddressCorrectCity:    [{value: '', disabled: true}],
        saAddressCorrectZipcode: [{value: '', disabled: true}],
        saAddressCorrectState:   [{value: '', disabled: true}],
        latDegrees: [this.lustIncidentGet.latDegrees],
        latMinutes: [this.lustIncidentGet.latMinutes],
        lastChange: [{value: this.lustIncidentGet.lastChangeBy, disabled: true}],
        mgmtLastChange: [{value: this.lustIncidentGet.mgmtLastChangeBy, disabled: true}],
        lastChangeDate: [{value: this.transformDate(this.lustIncidentGet.lastChangeDate), disabled: true}],
        mgmtLastChangeDate: [{value: this.transformDate(this.lustIncidentGet.mgmtLastChangeDate), disabled: true}],
        latitude:   [{value: this.displayLatDms(), disabled: true}],
        longtitude:   [{value: this.displayLogDms(), disabled: true}],
        latdegree:   [{value: this.displayLatDec(), disabled: true}],
        longdegree:   [{value: this.displayLogDec(), disabled: true}],
      },
      {validator: [this.siteNoAddressMissingValidation.bind(this),
        this.siteAddressNoAddressValidation.bind(this),
        this.discoveryDateValidation.bind(this),
        this.finalInvoiceRequestDateValidation.bind(this),
        this.finalInvcRqstDateValidation.bind(this),
        this.sitePhoneNumberValidation.bind(this)] }
        // {validator: [this.siteNoAddressMissingValidation.bind(this), this.siteAddressNoAddressValidation.bind(this)] }
    );
  }


  transformDate(inDate: Date): string {
    return this.datePipe.transform(inDate, 'MM/dd/yyyy');
  }

  resetDate(): void {
    this.incidentForm.patchValue({
      dateReceived: this.datePipe.transform(new Date(), 'MM/dd/yyyy')
    });
  }

  runSaAddressCorrect() {
    if (this.incidentForm.controls.siteAddress !== undefined
      && this.incidentForm.controls.siteAddress.value.length > 0 ) {
        this.showSaAddressCorrect = true;
    }
    this.addressCorrectDataService.getAddressCorrectStat(this.incidentForm.controls.siteAddress.value
      , this.incidentForm.controls.siteCity.value, 'OR')
      .pipe(
        map(addressCorrectData => {
          this.saAddressCorrectStat = addressCorrectData;
          this.countyFips = addressCorrectData.Records[0].CountyFIPS.substring(2);
        }),
        flatMap(() => this.lustDataService.getPostalCountyLookup(+this.countyFips)
        ),
    )
    .subscribe(
      (data => {
        this.refreshSaAddressCorrect(data);
      } )
    );
  }

  private refreshSaAddressCorrect(postalCountyLookup: PostalCountyLookup) {
    this.postalCountyLookup = postalCountyLookup;
    this.incidentForm.controls.saAddressCorrectAddress.setValue(this.saAddressCorrectStat.Records[0].AddressLine1);
    this.incidentForm.controls.saAddressCorrectCity.setValue(this.saAddressCorrectStat.Records[0].City);
    this.incidentForm.controls.saAddressCorrectState.setValue(this.saAddressCorrectStat.Records[0].State);
    this.incidentForm.controls.saAddressCorrectZipcode.setValue(this.saAddressCorrectStat.Records[0].PostalCode);
    this.incidentForm.controls.saAddressCorrectCounty.setValue(this.postalCountyLookup.countyCode);
    this.lastSaRefresh = ' - Last Update [' + this.datePipe.transform(Date.now(), 'mediumTime') + ']';
  }

  private addressCorrectNotFound(addressType: string): boolean {
    if ((addressType === 'sa')
    && (this.saAddressCorrectStat !== undefined)
    && (this.saAddressCorrectStat.Records[0].PostalCode.length < 5)) {
      return true;
    }
    return false;
  }

  canDeactivate(): Observable<boolean> | boolean {
    if (
      (this.isActionSelected()) ||
      (this.incidentForm.pristine  && !this.formUpdated)
    ) {
      return true;
    }
    const choice: Subject<boolean> = new Subject<boolean>();
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Discard changes?',
      message1: 'The form has not been Submitted yet, do you really want to leave page?',
      button1: 'Leave',
      button2: 'Stay'
    };
    this.guardDialogRef = this.canDeactivateDialog.open(GuardDialogComponent, dialogConfig);
    this.guardDialogRef.afterClosed().subscribe(result => {
      choice.next(result);
    });
    return choice;
  }

  private isActionSelected(): boolean {
    if  (this.submitClicked) {
      return true;
    }
    if  (this.resetFormClicked) {
      return true;
    }
    if  (this.searchClicked) {
      return true;
    }
    return false;
  }


  submitIncident(): void {
    this.submitClicked = true;
    if ((this.incidentForm.touched || this.incidentForm.dirty)  && (this.incidentForm.valid)) {
        this.updateIncident();
        this.isClosed = true;
    } else if (this.incidentForm.invalid) {
        this.errors = this.findInvalidControls();
        console.log('this.errors');
        this.showAllErrorsMessages = true;
        this.isClosed = false;
        console.log(this.errors);
    }
  }

  updateIncident(): void {
    this.lustIncidentUpdate = Object.assign({},  this.incidentForm.value);
    this.buildUpdateRecord();
    this.lustDataService.updateLustIncident(this.lustIncidentUpdate)
      .subscribe(
          (data ) => (this.lustIncidentUpdateResult = data
                      , this.showSubmitStatusDialog()),
      );
      this.OnScrollIntoView();
  }

  onCreateLustIncidentComplete(): void {
    this.showSubmitStatusDialog();
  }

  private showSubmitStatusDialog() {
    let message1 = '';
    let title = '';
    const button1 = 'Close';
    if (this.lustIncidentUpdateResult.errorMessageHandler !== undefined &&
      this.lustIncidentUpdateResult.errorMessageHandler !== null &&
      this.lustIncidentUpdateResult.errorMessageHandler.length > 0 ) {
      title = 'Failed to update ' + this.lustIncidentGet.logNumber ;
      message1 = this.lustIncidentUpdateResult.errorMessageHandler;
    } else {
      title = 'Successfully updated ' + this.lustIncidentGet.logNumber;
    }
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: title,
      message1: message1,
      button1: button1,
    };
    dialogConfig.disableClose =  true;
    this.submitStatusDialogRef = this.submitStatusDialog.open(SubmitStatusDialogComponent, dialogConfig);
    this.submitStatusDialogRef.afterClosed().subscribe(() => {
      // this.router.navigate(['lust' , this.lustIncidentGet.lustId]);
      this.router.navigateByUrl(`/lust/${this.lustIncidentGet.lustId}`, { state: { data: this.lustSearchFilter } });
    });
  }

  private findInvalidControls() {
    const invalid = [];
    for (const field of Object.keys(this.incidentForm.controls)) {
        if (this.incidentForm.controls[field].invalid) {
            const name = this.idToNameService.getName(field);
            invalid.push(name + ' is required and must be valid.');
        }
    }

    return invalid;
  }

  private buildUpdateRecord() {
    if (this.incidentForm.controls.sitePhone === null || this.incidentForm.controls.sitePhone === undefined
      || this.incidentForm.controls.sitePhone.value === null || this.incidentForm.controls.sitePhone.value === undefined) {
      this.lustIncidentUpdate.sitePhone = '';
    }

    this.lustIncidentUpdate.countyId = +this.incidentForm.controls.siteCounty.value;
    this.lustIncidentUpdate.activeReleaseInd = (this.incidentForm.controls.activeReleaseInd.value ? 1 : 0);
    this.lustIncidentUpdate.hotAuditRejectInd = (this.incidentForm.controls.hotAuditRejectInd.value ? 1 : 0);
    this.lustIncidentUpdate.programTransferInd = (this.incidentForm.controls.programTransferInd.value ? 1 : 0);
    this.lustIncidentUpdate.propertyTranPendingInd = (this.incidentForm.controls.propertyTranPendingInd.value ? 1 : 0);
    this.lustIncidentUpdate.optionLetterSentInd = (this.incidentForm.controls.optionLetterSentInd.value ? 1 : 0);
    this.lustIncidentUpdate.noValidAddress = (this.incidentForm.controls.noValidAddress.value ? 1 : 0);
    // this.lustIncidentUpdate.lustIdIn = this.lustIncidentGet.crisCheck;
    if (this.lustIncidentGet.crisCheck === 0) {
      this.lustIncidentUpdate.lustIdIn = this.lustIncidentGet.lustId;
    } else {
      this.lustIncidentUpdate.lustIdIn = this.lustIncidentGet.crisCheck;
    }
    this.lustIncidentUpdate.managementIdIn = (this.lustIncidentGet.managementId ? this.lustIncidentGet.managementId : 0) ;
    this.lustIncidentUpdate.hotInd = 0;
    this.lustIncidentUpdate.regTankInd = 0;
    this.lustIncidentUpdate.nonRegTankInd = 0;
    if (this.incidentForm.controls.releaseType.value === 'H')  {
      this.lustIncidentUpdate.hotInd = 1;
    } else if (this.incidentForm.controls.releaseType.value === 'U')  {
        this.lustIncidentUpdate.nonRegTankInd = 1;
    } else {
      this.lustIncidentUpdate.regTankInd = 1;
    }
    this.lustIncidentUpdate.siteComment = this.incidentForm.controls.siteComment.value;
    this.lustIncidentUpdate.seeAlsoComment = this.incidentForm.controls.seeAlsoComment.value;
    this.lustIncidentUpdate.publicSummaryComment = this.incidentForm.controls.publicSummaryComment.value;
    this.lustIncidentUpdate.olprrId = this.lustIncidentGet.olprrId;
    this.lustIncidentUpdate.dateReceived = this.incidentForm.controls.dateReceived.value;
    this.lustIncidentUpdate.discoveryDate = this.incidentForm.controls.discoveryDate.value;
    this.lustIncidentUpdate.siteTypeId = this.incidentForm.controls.siteType2Id.value;
    this.lustIncidentUpdate.fileStatusId = this.incidentForm.controls.fileStatusId.value;
    this.lustIncidentUpdate.brownfieldCodeId = this.incidentForm.controls.brownfieldCodeId.value;
    this.lustIncidentUpdate.geolocId = this.incidentForm.controls.geoLocId.value;
    this.lustIncidentUpdate.cleanupStartDt = this.incidentForm.controls.cleanupStartDate.value;
    this.lustIncidentUpdate.releaseStopDt = this.incidentForm.controls.releaseStopDate.value;
    this.lustIncidentUpdate.finalInvcRqstDt = this.incidentForm.controls.finalInvcRqstDate.value;
    this.lustIncidentUpdate.letterOfAgreementDt = this.incidentForm.controls.letterOfAgreementDate.value;
    this.lustIncidentUpdate.letterOfAgreementComment = this.incidentForm.controls.letterOfAgreementComment.value;
    this.lustIncidentUpdate.lastChangeBy = this.authService.getUserIdWoDomain();
    this.lustIncidentUpdate.closedDt = this.incidentForm.controls.closedDate.value;
    this.buildReopenSiteTrackingComment();

    // if (this.authService.isLustProjectManagerRoleOnly()) {
    //   this.lustIncidentUpdate.siteName = this.lustIncidentGet.siteName;
    //   this.lustIncidentUpdate.countyId = +this.lustIncidentGet.logNbrCounty;
    //   this.lustIncidentUpdate.siteTypeId = this.lustIncidentGet.siteTypeId;
    //   this.lustIncidentUpdate.dateReceived = this.lustIncidentGet.receivedDate;
    //   this.lustIncidentUpdate.finalInvcRqstDt = this.lustIncidentGet.finalInvcRqstDate;
    //   this.lustIncidentUpdate.closedDt = this.lustIncidentGet.closedDate;
    // }
  }

  private buildReopenSiteTrackingComment() {
    this.datePipe.transform(new Date(), 'MM/dd/yyyy')
    if (this.lustIncidentGet.finalInvcRqstDate !== null && this.incidentForm.controls.finalInvcRqstDate.value === null) {
      const siteReopenTrackingComment = `  Site re-opened on ${this.datePipe.transform(new Date(), 'MM/dd/yyyy')}`
      + `  By ${this.authService.getUserIdWoDomain()}.   Previous Final Invoice Request Date  `
      + `${this.datePipe.transform(this.lustIncidentGet.finalInvcRqstDate, 'MM/dd/yyyy')}`
      + ` Previous Closed Date ${this.datePipe.transform(this.lustIncidentGet.closedDate, 'MM/dd/yyyy')}.`;
      this.lustIncidentUpdate.siteComment = this.lustIncidentUpdate.siteComment + siteReopenTrackingComment;
    }
  }

  resetFlags() {
    this.showAllErrorsMessages = false;
    this.submitClicked = false;
    this.resetFormClicked = false;
    this.searchClicked = false;
    this.formUpdated = false;
  }

  resetForm(): void {
    this.loadingSubject.next(true);
    this.resetFlags();
    this.resetDate();
    this.resetFormClicked = true;
    this.incidentForm.markAsUntouched();
    this.route.data.subscribe((data: {lustIncidentGet: LustIncidentGet}) => {this.lustIncidentGet = data.lustIncidentGet; });
    this.createForm();
    // this.disablebByRole();
    this.maxDate = new Date();
    this.maxDate.setDate( this.maxDate.getDate());
    this.loadingSubject.next(false);
  }

  delete() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete this incident ' + this.lustIncidentGet.logNumber + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delLustIncident(this.lustIncidentGet.lustId).subscribe();
        this.router.navigate(['lsearch']);
      }
    });
  }

  private openUstSearch() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      searchType: 'UST',
    };
    this.searchDialogRef = this.searchDialog.open(SearchDialogComponent, dialogConfig);
    this.searchDialogRef.afterClosed().subscribe(result => {
      if (result !== undefined) {
        this.updateSiteAddress(result);
      }
    });
  }

  private updateSiteAddress(ustSearchResultStat: UstSearchResultStat) {
    this.incidentForm.controls.facilityId.setValue(ustSearchResultStat.facilityId);
    this.incidentForm.controls.siteName.setValue(ustSearchResultStat.facilityName);
    this.incidentForm.controls.siteAddress.setValue(ustSearchResultStat.facilityAddress);
    this.incidentForm.controls.siteCity.setValue(ustSearchResultStat.facilityCity);
    this.incidentForm.controls.siteCounty.setValue(ustSearchResultStat.countyCode);
    if (ustSearchResultStat.facilityZip.length > 5) {
      this.incidentForm.controls.siteZipcode.setValue(ustSearchResultStat.facilityZip.substring(0, 5));
    } else {
      this.incidentForm.controls.siteZipcode.setValue(ustSearchResultStat.facilityZip);
    }

    this.formUpdated = true;
    this.incidentForm.markAsDirty();
    this.incidentForm.updateValueAndValidity();
  }

  OnScrollIntoView () {
    // Attempt to bring the Search Results into view
    scroll(0, 0);
    // const scrToView = document.getElementById('topOfForm');
    // console.log(scrToView);
    // if (scrToView) {
    //   scrToView.scrollIntoView();
    // }
  }

  siteAddressNoAddressValidation(control: AbstractControl) {
    // Validation - No Valid Address cannot be checked if siteAddress contains a value.  Other fields
    // such as SiteCity and SiteZipCode are required.
    let noValidAddressTemp = false;
    const noValidAddress = control.get('noValidAddress');
    const siteAddress = control.get('siteAddress');
    noValidAddressTemp = noValidAddress.value;
    if ((noValidAddressTemp === true) && siteAddress.value.length !== 0) {
      noValidAddress.setErrors({'noValidAddress': true});

      return {
        noValidAddressSiteAddressError: {
          noValidAddressSiteAddressError: true
        }
      };
    }  else {
      noValidAddress.setErrors(null);
      return null;
    }
  }

  discoveryDateValidation(control: AbstractControl) {
    const discoveryDateControl = control.get('discoveryDate');
    const receivedDateControl = control.get('dateReceived');
    const receivedDate = new Date(receivedDateControl.value).setHours(0, 0, 0, 0);
    const discoveryDate = new Date(discoveryDateControl.value).setHours(0, 0, 0, 0);
    if (discoveryDate > receivedDate ) {
      discoveryDateControl.setErrors({'discoveryDateError': true});
      return {
        discoveryDateError: {
          discorveryDateError: true
            }
        };
      } else {
          receivedDateControl.setErrors(null);
          return null;
    }
  }

  finalInvcRqstDateValidation(control: AbstractControl) {
    const finalInvcRqstDateControl = control.get('finalInvcRqstDate');
    const closedDateControl = control.get('closedDate');
    const finalInvcRqstDate = new Date(finalInvcRqstDateControl.value).setHours(0, 0, 0, 0);
    const closedDate = new Date(closedDateControl.value).setHours(0, 0, 0, 0);

    if (finalInvcRqstDateControl.value === null && closedDateControl.value !== null) {
      finalInvcRqstDateControl.setErrors({'finalInvcRqstDateRequiredError': true});
      return {
        finalInvcRqstDateRequiredError: {
          finalInvcRqstDateRequiredError: true
          }
        };
    }

    if (finalInvcRqstDate > closedDate && closedDateControl.value !== null) {
      finalInvcRqstDateControl.setErrors({'finalInvcRqstDateGreaterClosedDateError': true});
      return {
        finalInvcRqstDateGreaterClosedDateError: {
          finalInvcRqstDateGreaterClosedDateError: true
          }
        };
    }
    finalInvcRqstDateControl.setErrors(null);
    return null;
  }

  receivedDateValidation(control: AbstractControl) {

    const receivedDatefd = control.get('dateReceived');
    const receivedDate = new Date(receivedDatefd.value).setHours(0, 0, 0, 0);
    const closedDate = new Date(control.get('closedDate').value).setHours(0, 0, 0, 0);
    const cleanupStartDate = new Date(control.get('cleanupStartDate').value).setHours(0, 0, 0, 0);
    const releaseStopDate = new Date(control.get('releaseStopDate').value).setHours(0, 0, 0, 0);
    const finalInvcRqstDate  = new Date(control.get('finalInvcRqstDate').value).setHours(0, 0, 0, 0);
    const letterOfAgreementDate = new Date(control.get('letterOfAgreementDate').value).setHours(0, 0, 0, 0);



    if (receivedDate > closedDate || receivedDate > cleanupStartDate || receivedDate > releaseStopDate
            || receivedDate > finalInvcRqstDate || receivedDate > letterOfAgreementDate ) {

        receivedDatefd.setErrors({'receivedDateAfterCloseDate': true});

      return {
        receivedDateAfterCloseDateError: {
          receivedDateAfterCloseDateError: true
            }
        };

      } else {
          receivedDatefd.setErrors(null);
          return null;
        }
    }

    siteNoAddressMissingValidation(control: AbstractControl) {

      const noValidAddressMissingfd = control.get('noValidAddress');
      const noValidAddressMissing = control.get('noValidAddress').value;
      const siteAddressMissingfd = control.get('siteAddress');
      // const siteAddressMissing = control.get('siteAddress').value;
      const siteCityMissingfd = control.get('siteCity');
      const siteCountyMissingfd = control.get('siteCounty');
      const siteZipcodeMissingfd = control.get('siteZipcode');

      if ((noValidAddressMissingfd.value === 0 || noValidAddressMissing.value === 0 || noValidAddressMissingfd.value === false)) {
        siteAddressMissingfd.setValidators([Validators.required, Validators.maxLength(40)]);
        siteCityMissingfd.setValidators([Validators.required, Validators.maxLength(20)]);
        if (siteCountyMissingfd !== null) {
          siteCountyMissingfd.setValidators([Validators.required]);
          siteCountyMissingfd.updateValueAndValidity({emitEvent: false, onlySelf: true});
         }
         if (siteZipcodeMissingfd !== null) {
           siteZipcodeMissingfd.setValidators([Validators.required, IncidentValidators.validateZipcode(this.zipcodes)]);
         }
         if (siteAddressMissingfd !== null) {
          siteAddressMissingfd.updateValueAndValidity({emitEvent: false, onlySelf: true});
        }
        siteCityMissingfd.updateValueAndValidity({emitEvent: false, onlySelf: true});
        siteZipcodeMissingfd.updateValueAndValidity({emitEvent: false, onlySelf: true});



      } else {
        siteAddressMissingfd.clearValidators();
        siteCityMissingfd.clearValidators();
        siteCountyMissingfd.clearValidators();
        siteZipcodeMissingfd.clearValidators();


      }
    }


    finalInvoiceRequestDateValidation(control: AbstractControl) {
      const csdControl = control.get('cleanupStartDate');
      const firdControl = control.get('finalInvcRqstDate');

      if (firdControl.value === null) {
        csdControl.setErrors(null);
        return null;
      }

      if (csdControl.value === null && firdControl.value !== null ) {
        csdControl.setErrors({'cleanupStartDateError': true});
        return { cleanupStartDateError: {
          cleanupStartDateError: true
          }
        };
      }
      const csdValue = new Date(csdControl.value).setHours(0, 0, 0, 0);
      const firdValue = new Date(firdControl.value).setHours(0, 0, 0, 0);
      if (csdValue > firdValue ) {
        firdControl.setErrors({'finalInvcRqstDateError': true});
        return { finalInvcRqstDateError: {
          finalInvcRqstDateError: true
          }
        };
      }

      csdControl.setErrors(null);
      firdControl.setErrors(null);
      return null;
    }

    public displayLatDms(): string {
      return 'Deg, Min, Sec:' + this.lustIncidentGet.latDegrees + 'º ' + this.lustIncidentGet.latMinutes + '\' '
      + this.lustIncidentGet.latSeconds + '\'\'';
    }

    public displayLogDms(): string {
      const degrees = this.lustIncidentGet.longDegrees.toString().replace('-', '');
      return 'Deg, Min, Sec:' +  degrees + 'º ' + this.lustIncidentGet.longMinutes
            + '\' ' + this.lustIncidentGet.longSeconds + '\'\'';
    }

    public displayLatDec(): string {
      return 'Decimal:' + this.lustIncidentGet.latDecimals.toString() + ' ' +
      this.getCoordLat(this.lustIncidentGet.latDecimals.toString());
    }

    public displayLogDec(): string {
      return 'Decimal:' + this.lustIncidentGet.longDecimals.toString() + ' ' +
        this.getCoordLog(this.lustIncidentGet.longDecimals.toString());
    }


    getCoordLat(degrees: string): string {
      let rtn = ' N';
      if (degrees.includes('-', 1 )) {
          rtn = ' S';
      }
      return rtn;
    }

    getCoordLog(degrees: string): string {
      let rtn = ' W';
      if (degrees.includes('-', 1 )) {
          rtn = ' E';
      }
      return rtn;
    }

    LustEntry(): void {
      const ViewLustId = this.lustIncidentGet.lustId;
      const url = Constants.web_docs_entry + '?SourceIdType=' + Constants.web_docs_Source_Id_Type.toString() +
      '&SourceId=' + ViewLustId.toString() + '&Screen=Load';
      const newWindow = window.open(url);

    }


    LustViewDocs(): void {
      const ViewLustId = this.lustIncidentGet.lustId;
      const url = Constants.web_docs_view + '?SourceIdType=' + Constants.web_docs_Source_Id_Type.toString() +
      '&SourceId=' + ViewLustId.toString() + '&Screen=Load';
      const newWindow = window.open(url);
    }

    updateSideNav() {
      const lustIdentifier = document.getElementById('lustIdentifier');
      const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
      lustIdentifier.textContent = 'LUST ID: ' + this.lustIncidentGet.logNumber;
      console.log('This will be the LUST ID Key value = ' + this.lustIncidentGet.lustId.toString());
      lustIDKeyIdentifier.textContent = this.lustIncidentGet.lustId.toString();
      const lustMenu = document.getElementById('lustMenu');
      lustMenu.style.display = 'block';

    }

    private openLit() {
      const params = encodeURI('LUST' + this.authService.getUserIdWoDomain() + '&address='
                        + this.incidentForm.controls.siteAddress.value + '&city=' + this.incidentForm.controls.siteCity.value +  '&zip='
                        + this.incidentForm.controls.siteZipcode.value + '&facname=' + this.incidentForm.controls.siteName.value);
      const lit_url = AppConfig.lit_site_setup + params;
      window.open(lit_url, '_blank');
    }

    filterZips(zc: string) {
      return this.zipcodes.filter(zip => zip.zipCode1.indexOf(zc) === 0);
    }

    decline(): void {
      // this.router.navigate(['lsearch']);
      this.router.navigateByUrl('lsearch', { state: { data: this.lustSearchFilter } });
    }


    sitePhoneNumberValidation(control: AbstractControl) {
      const phoneNumberControl = control.get('sitePhone');
      this.phoneNumbersOnly = '';
      if (phoneNumberControl === null || phoneNumberControl === undefined || phoneNumberControl.value === null ||
         phoneNumberControl.value === undefined) {
          phoneNumberControl.setErrors(null);
          return null;
      } else {
        const phoneNumberString = phoneNumberControl.value.toString();
        this.phoneNumbersOnly = phoneNumberString.replace(/\D/g, '');
        if (this.phoneNumbersOnly.length > 8) {
          if (this.phoneNumbersOnly.length < 10) {
            phoneNumberControl.setErrors({'PhoneNumberFormatInvalid': true});
            return {
              noValidPhoneNumberError: {
              noValidPhoneNumberError: true
              }
            };
          }
        } else {
            phoneNumberControl.setErrors(null);
            return null;
        }
      }
    }

    ngOnDestroy() {
      if (this.navigationSubscription) {
         this.navigationSubscription.unsubscribe();
      }
    }

}
