import { Component, OnInit, createPlatform, OnChanges, SimpleChanges } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ValidationErrors } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import { Observable, Subject, BehaviorSubject} from 'rxjs';
import { MatDialog, MatDialogRef, MatDialogConfig, MatRadioChange, MatRadioButton } from '@angular/material';
import { HotcContact } from 'src/app/models/hotc-contact';
import { LustDataService } from 'src/app/services/lust-data.service';
import { LustHotcGet } from 'src/app/models/lust-hotc-get';
import { SidDescLookup } from 'src/app/models/sid-desc-lookup';
import { GuardDialogComponent } from 'src/app/common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from 'src/app/common/dialogs/submit-status-dialog.component';
import { LustHotcPost } from 'src/app/models/lust-hotc-post';
import { LustGenericResult } from 'src/app/models/lust-generic-result';
import { ServiceProvider } from 'src/app/models/service-provider';
import { DecommPrintType, DecommissioningPrint } from 'src/app/models/lust-hotc-decommissioning.print';
import { PrintService } from 'src/app/common/print.service';
import { DecommPrintHelperService } from '../decomm-helpers/decomm-print-helper.service';
import { AuthService } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-lust-hot-decomm',
  templateUrl: './lust-hot-decomm.component.html',
  styleUrls: ['./lust-hot-decomm.component.scss']
})
export class LustHotDecommComponent implements OnInit {
  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  lustHotcGet: LustHotcGet;
  lustHotcPost = new LustHotcPost();
  serviceProvider: ServiceProvider;
  private postResult: LustGenericResult;
  private lustId = 0;
  private hotcContact = new HotcContact();
  hotcDecommTypes: SidDescLookup;
  hotcFeeDefaults: SidDescLookup;
  currentDate: Date = new Date(Date.now());
  errorMessage: string;
  serviceProviderType: string;
  serviceProviderIdRequired = false;
  hotId = 0;
  private success = false;
  private submitClicked = false;
  private resetFormClicked = false;
  private deleteClicked = false;
  private cancelClicked = false;
  private errors: any[];
  private siteNameAliasId = 0;
  private isUpdate = false;
  private returnPath: string;
  private logNumber: string;
  private formTitle: string;
  private numbersOnly = new RegExp(/^\d+$/);
  private yesNo = new RegExp(/^[ynYN]$/);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  maxDate: Date;
  private defaultFeeAmt: number;

  private myForm: FormGroup;
  private contactNotExist = 'Contact information does not exist for this LUST Incident';
  showStatusButtons: boolean;
  returnToSearch = Constants.returnToSearch;

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router, private datePipe: DatePipe
    , private canDeactivateDialog: MatDialog, private submitStatusDialog: MatDialog
    , private printService: PrintService, private decommPrintHelperService: DecommPrintHelperService
    , private authService: AuthService) { }

  ngOnInit() {
    this.loadingSubject.next(true);
    this.route.data.subscribe((data: {lustHotcGet: LustHotcGet}) => {this.lustHotcGet = data.lustHotcGet;
                                                                      this.hotId = this.lustHotcGet.hotcHotManagementHotId; });
    this.route.data.subscribe((data: {hotcDecommTypes: SidDescLookup}) => {this.hotcDecommTypes = data.hotcDecommTypes; });
    this.route.data.subscribe((data: {hotcFeeDefaults: SidDescLookup}) => {this.hotcFeeDefaults = data.hotcFeeDefaults; });
    this.route.params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.setServiceProviderType();
    this.defaultFeeAmt = this.hotcFeeDefaults[0];
    this.setShowStatusButtons();
    this.myForm = this.formBuilder.group({
      logNumber: [{value: this.lustHotcGet.lustIncidentLogNumber, disabled: true}],
      hotId: [{value: this.lustHotcGet.hotcHotManagementHotId, disabled: true}],
      todayDate: [{value: this.transformDate(new Date()), disabled: true}],
      decommDate:  [this.lustHotcGet.lustManagementReleaseStopDate, Validators.required],
      checkReceivedDate:  [this.lustHotcGet.hotcHotManagementCheckReceivedDate, Validators.required],
      auditDate:  [this.lustHotcGet.hotcHotManagementAuditDate],
      fileClosedDate:  [(this.lustHotcGet.lustManagementFinalInvcRqstDate ?
          this.lustHotcGet.lustManagementFinalInvcRqstDate : this.currentDate)
         , Validators.required],
      checkNbr:  [this.lustHotcGet.hotcHotMangementCheckNbr, Validators.required],
      reportRejected:  [this.lustHotcGet.hotcHotManagementReportRejected, Validators.pattern(this.yesNo)],
      decommType:  [this.lustHotcGet.hotcHotManagementDecommType, Validators.required],
      feeAmt:  [ this.getFeeAmt(), Validators.required],
      comment:  [this.lustHotcGet.hotcHotManagementHotComments],
      status: [{value: this.lustHotcGet.status, disabled: true}],
      serviceProviderType:  [this.serviceProviderType],
      serviceProviderId:  [(this.getServiceProviderId()), Validators.pattern(this.numbersOnly)],
      serviceProviderFullName:  [{value: this.lustHotcGet.serviceOwnerFullName, disabled: true}],
      serviceProviderStatus:  [{value: this.lustHotcGet.serviceOwnerLicenseStatus, disabled: true}],
    },
    {validator: [this.checkReceivedDateValidator.bind(this)] }
    );
    this.setInitContact();
    this.prepServiceProvider();
    this.setIsUpdate();
    this.maxDate = new Date();
    this.maxDate.setDate( this.maxDate.getDate());
    this.onChanges();
    this.disableForm();
    this.loadingSubject.next(false);
  }

  private setShowStatusButtons()  {
    this.showStatusButtons = false;
    if (this.authService.isLustAdminRole()) {
      this.showStatusButtons = true;
    }
  }

  private disableForm()  {
    if (!this.showStatusButtons) {
      this.myForm.disable();
    }
  }

  private isActionSelected(): boolean {
    if  (this.submitClicked) {
      return true;
    }
    if  (this.resetFormClicked) {
      return true;
    }
    if  (this.deleteClicked) {
      return true;
    }
    if  (this.cancelClicked) {
      return true;
    }
    return false;
  }

  canDeactivate(): Observable<boolean> | boolean {
    if (this.myForm.pristine  || this.isActionSelected() ) {
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

  transformDate(inDate: Date): string {
    return this.datePipe.transform(inDate, 'MM/dd/yyyy');
  }

  getFeeAmt() {
    if (this.lustHotcGet.hotcHotManagementFeeAmt === undefined || this.lustHotcGet.hotcHotManagementFeeAmt === null) {
      this.lustHotcGet.hotcHotManagementFeeAmt = this.hotcFeeDefaults[0].descript;
    }
    return this.lustHotcGet.hotcHotManagementFeeAmt;
  }

  onChange(change: MatRadioChange) {
    if (change.value === '2') {
      this.enableServiceProviderControl();
    } else {
      this.serviceProviderIdRequired = false;
      this.myForm.controls.serviceProviderId.disable();
    }
  }

  onChanges() {
    this.myForm.controls.serviceProviderId.valueChanges.subscribe(
      data => {
        this.myForm.controls.serviceProviderFullName.setValue('');
        this.myForm.controls.serviceProviderStatus.setValue('');
        if ( !isNaN(data) && data > 0) {
          this.lustDataService.getHotServiceProvider(data)
          .subscribe(
            serviceProvider => {
              this.myForm.controls.serviceProviderFullName.setValue(serviceProvider.fullName);
              this.myForm.controls.serviceProviderStatus.setValue(serviceProvider.licenseStatus);
            }
          );
        }
      }
    );
  }


  private setIsUpdate() {
    if (this.lustHotcGet.lustManagementMangementId === null || this.lustHotcGet.lustManagementMangementId === undefined
      || (isNaN(+this.lustHotcGet.lustManagementMangementId))) {
        this.isUpdate = false;
    } else {
      this.isUpdate = true;
    }
  }

  private prepServiceProvider() {
    if (this.serviceProviderType === '2') {
      this.enableServiceProviderControl();
    }
  }

  private enableServiceProviderControl() {
    this.serviceProviderIdRequired = true;
    this.myForm.controls.serviceProviderId.setValidators([Validators.required, Validators.pattern('[0-9]*')]);
    this.myForm.controls.serviceProviderId.enable();
  }

  private setServiceProviderType() {
    if (this.lustHotcGet.hotcHotManagementHotSpId === null || this.lustHotcGet.hotcHotManagementHotSpId === undefined ) {
      this.serviceProviderType = '';
    } else if ((this.lustHotcGet.hotcHotManagementHotSpId.includes('HOWNR'))) {
      this.serviceProviderType = '1';
    } else if (!isNaN(+this.lustHotcGet.hotcHotManagementHotSpId)) {
      this.serviceProviderType = '2';
    } else {
      this.serviceProviderType = ' ';
    }
  }

  onResetForm() {
    this.resetFormClicked = true;
    this.myForm.reset();
    this.myForm.markAsPristine();
    this.route.data.subscribe((data: {lustHotcGet: LustHotcGet}) => {
      this.lustHotcGet = data.lustHotcGet;
      this.setIsUpdate();
      this.setServiceProviderType();
      this.myForm.controls.todayDate.setValue( this.transformDate(new Date()));
      this.myForm.controls.logNumber.setValue(this.lustHotcGet.lustIncidentLogNumber);
      this.myForm.controls.hotId.setValue(this.lustHotcGet.hotcHotManagementHotId);
      this.myForm.controls.decommDate.setValue(this.lustHotcGet.lustManagementReleaseStopDate);
      this.myForm.controls.checkReceivedDate.setValue(this.lustHotcGet.hotcHotManagementCheckReceivedDate);
      this.myForm.controls.auditDate.setValue(this.lustHotcGet.hotcHotManagementAuditDate);
      this.myForm.controls.fileClosedDate.setValue(this.lustHotcGet.lustManagementFinalInvcRqstDate);
      this.myForm.controls.checkNbr.setValue(this.lustHotcGet.hotcHotMangementCheckNbr);
      this.myForm.controls.reportRejected.setValue(this.lustHotcGet.hotcHotManagementReportRejected);
      this.myForm.controls.decommType.setValue(this.lustHotcGet.hotcHotManagementDecommType);
      this.myForm.controls.feeAmt.setValue(this.getFeeAmt());
      this.myForm.controls.comment.setValue(this.lustHotcGet.hotcHotManagementHotComments);
      this.myForm.controls.status.setValue(this.lustHotcGet.status);
      this.myForm.controls.serviceProviderType.setValue(this.serviceProviderType);
      this.myForm.controls.serviceProviderId.setValue(this.getServiceProviderId());
      this.myForm.controls.serviceProviderFullName.setValue(this.lustHotcGet.serviceOwnerFullName);
      this.myForm.controls.serviceProviderStatus.setValue(this.lustHotcGet.serviceOwnerLicenseStatus);
      this.prepServiceProvider();
      this.setInitContact();
    } );
  }

  onCancel() {
    this.router.navigate(['/dsearch']);
  }

  onLustIncident() {
    this.router.navigate(['/lust/' + this.lustId]);
  }

  onPrintLetter() {
    const decommPrint = new DecommissioningPrint();
    decommPrint.printType = this.getDecommPrintType();
    decommPrint.hotId = this.lustHotcGet.hotcHotManagementHotId,
    decommPrint.organization = this.lustHotcGet.contactOrganization,
    decommPrint.firstName = this.lustHotcGet.contactFirstName;
    decommPrint.lastName = this.lustHotcGet.contactLastName;
    decommPrint.city = this.lustHotcGet.contactCity;
    decommPrint.state = this.lustHotcGet.contactState;
    decommPrint.zipcode = this.lustHotcGet.contactZip;
    if (this.lustHotcGet.hotcHotManagementHotSpId.includes('HOWNR')) {
      decommPrint.serviceProviderName = 'HOWNR';
    } else {
      decommPrint.serviceProviderName = this.lustHotcGet.serviceOwnerFullName;
    }
    decommPrint.logNumber = this.lustHotcGet.lustIncidentLogNumber;
    const logNumberArr = this.lustHotcGet.lustIncidentLogNumber.split('-');
    decommPrint.logCounty = +logNumberArr[0];
    decommPrint.logYear = +logNumberArr[1];
    decommPrint.logSeq = +logNumberArr[2];
    decommPrint.address = this.lustHotcGet.contactStreet;
    decommPrint.lustIncidentSiteAddress = this.lustHotcGet.lustIncidentSiteAddress;
    decommPrint.lustIncidentSiteCity = this.lustHotcGet.lustIncidentSiteCity;
    decommPrint.lustIncidentSiteZip = this.lustHotcGet.lustIncidentSiteZip;
    decommPrint.lustIncidentSiteName = this.lustHotcGet.lustIncidentSiteName;
    const letter = this.decommPrintHelperService.formatLetter(decommPrint);
    this.printService.print(letter);
  }

  private getDecommPrintType(): DecommPrintType {
    if (this.lustHotcGet.hotcHotManagementHotSpId.includes('HOWNR')) {
      return DecommPrintType.LustHomeOwner;
    }
    return DecommPrintType.LustServiceProvider;
  }

  onSubmit() {
    this.submitClicked = true;
    if (this.myForm.dirty && this.myForm.valid) {
      this.setModelToFormData();
      this.lustDataService.insUpdLustHotc(this.lustHotcPost)
        .subscribe(
          (data ) => (
            this.postResult = data
            , this.refreshHotId(this.postResult.id)
            , this.showSubmitStatusDialog()),
        );
    } else if (this.myForm.invalid) {
        // this.errors = this.findInvalidControls();
        // console.log('this.errors');
        // console.log(this.errors);
    }
  }

  refreshHotId(hotId: number) {
    this.hotId = (hotId > 0 ? hotId : this.hotId);
    this.myForm.controls.hotId.setValue(this.hotId);
  }

  private showSubmitStatusDialog() {
    let message1 = '';
    let title = '';
    const button1 = 'Close';
    if (this.postResult.errorMessageHandler !== undefined &&
      this.postResult.errorMessageHandler !== null &&
      this.postResult.errorMessageHandler.length > 0 ) {
      title = 'Error  ' + this.postResult.errorMessageHandler ;
      message1 = this.postResult.errorMessageHandler;
      this.success = false;
    } else {
      title = 'Success  ' + this.hotId;
      this.lustId = this.postResult.lustId;
      this.success = true;
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
      if (this.success) {
        this.returnPath = 'dlust/' + this.lustId;
        this.router.navigate([this.returnPath]);
      }
    });
  }

  private setModelToFormData() {
    this.lustHotcPost.hotcHotManagementLogNumber = this.myForm.controls.logNumber.value;
    this.lustHotcPost.hotcHotManagementHotId =
        ((this.lustHotcGet.hotcHotManagementHotId === null) ? 0 : this.lustHotcGet.hotcHotManagementHotId);
    this.lustHotcPost.lustManagementLustId = this.lustHotcGet.lustIncidentLustId;
    this.lustHotcPost.lustManagementMangementId =
        ((this.lustHotcGet.lustManagementMangementId === null) ? 0 : this.lustHotcGet.lustManagementMangementId);
    this.lustHotcPost.lustManagementReleaseStopDate = this.myForm.controls.decommDate.value;
    this.lustHotcPost.lustManagementFinalInvcRqstDate = this.myForm.controls.fileClosedDate.value;
    this.lustHotcPost.hotcHotMangementCheckNbr = this.myForm.controls.checkNbr.value;
    this.lustHotcPost.hotcHotManagementCheckReceivedDate = this.myForm.controls.checkReceivedDate.value;
    this.lustHotcPost.hotcHotManagementFeeAmt = +this.myForm.controls.feeAmt.value;
    this.lustHotcPost.hotcHotManagementAuditDate = this.myForm.controls.auditDate.value;
    this.lustHotcPost.hotcHotManagementDecommType = this.myForm.controls.decommType.value;
    this.lustHotcPost.hotcHotManagementReportRejected = this.myForm.controls.reportRejected.value;
    if (this.serviceProviderIdRequired) {
      this.lustHotcPost.hotcHotManagementHotSpId = this.myForm.controls.serviceProviderId.value;
    } else {
      this.lustHotcPost.hotcHotManagementHotSpId = 'HOWNR';
    }
    this.lustHotcPost.hotcHotManagementHotComments = this.myForm.controls.comment.value;
    this.lustHotcPost.lustManagementLastChangeBy = this.authService.getUserIdWoDomain();
  }

  onContactSelected(hotcContact: HotcContact) {
    this.hotcContact = Object.assign({}, hotcContact);
  }

  private setInitContact() {
    if (this.lustHotcGet.status.search(this.contactNotExist) < 0) {
      this.hotcContact.firstName = this.lustHotcGet.contactFirstName;
      this.hotcContact.lastName = this.lustHotcGet.contactLastName;
      this.hotcContact.organization = this.lustHotcGet.contactOrganization;
      this.hotcContact.street = this.lustHotcGet.contactStreet;
      this.hotcContact.city = this.lustHotcGet.contactCity;
      this.hotcContact.state = this.lustHotcGet.contactState;
      this.hotcContact.affilId = this.lustHotcGet.contactAffilId;
      this.hotcContact.zipcode = this.lustHotcGet.contactZip;
    }
  }

  private getServiceProviderId(): string {
    return ((this.lustHotcGet.hotcHotManagementHotSpId !== null
      && this.lustHotcGet.hotcHotManagementHotSpId !== undefined
      &&  this.lustHotcGet.hotcHotManagementHotSpId.includes('HOWNR') )
      ? null : this.lustHotcGet.hotcHotManagementHotSpId);
  }

  checkReceivedDateValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotCheckReceivedDateError: true };
    if (formGroup) {
      if ( (formGroup.controls.checkReceivedDate.value < formGroup.controls.decommDate.value)
      ) {
        formGroup.controls.checkReceivedDate.setErrors(error);
        return {
          hotCheckReceivedDateError: {
            hotCheckReceivedDateError: true
          }
        };
      }
    }
    formGroup.controls.checkReceivedDate.setErrors(null);
    return null;
  }
}
