import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ValidationErrors } from '@angular/forms';
import { ActivatedRoute, Router, NavigationStart } from '@angular/router';
import { DatePipe } from '@angular/common';
import { Observable, Subject, BehaviorSubject} from 'rxjs';
import { MatDialog, MatDialogRef, MatDialogConfig, MatRadioChange } from '@angular/material';
import { LustDataService } from 'src/app/services/lust-data.service';
import { SidDescLookup } from 'src/app/models/sid-desc-lookup';
import { GuardDialogComponent } from 'src/app/common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from 'src/app/common/dialogs/submit-status-dialog.component';
import { LustGenericResult } from 'src/app/models/lust-generic-result';
import { ServiceProvider } from 'src/app/models/service-provider';
import { HotcDecomm } from 'src/app/models/hotc-decomm';
import { Quadrant } from 'src/app/models/quadrant';
import { StreetType } from 'src/app/models/street-type';
import { ZipCode } from 'src/app/models/zipcode';
import { State } from 'src/app/models/state';
import { DecommissioningPrint, DecommPrintType } from 'src/app/models/lust-hotc-decommissioning.print';
import { ReturnStatement } from '@angular/compiler';
import { PdfService } from 'src/app/common/pdf.service';
import { PrintService } from 'src/app/common/print.service';
import { DecommPrintHelperService } from '../decomm-helpers/decomm-print-helper.service';
import { environment } from '../../../environments/environment';
import { Constants } from 'src/app/constants';
import { AuthService } from 'src/app/services/auth.service';
import { map, filter } from 'rxjs/operators';
import { SearchAddr } from '../decomm-search-filter/decomm-search-filter.component';

@Component({
  selector: 'app-hot-clean-decomm',
  templateUrl: './hot-clean-decomm.component.html',
  styleUrls: ['./hot-clean-decomm.component.scss']
})
export class HotCleanDecommComponent implements OnInit {
  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  hotcDecommGet: HotcDecomm;
  hotcDecommPost = new HotcDecomm();
  serviceProvider: ServiceProvider;
  private postResult: LustGenericResult;
  hotId: number;
  quadrants: Quadrant[] = [];
  streetTypes: StreetType[] = [];
  zipCodes: ZipCode[] = [];
  states: State[] = [];
  hotcDecommTypes: SidDescLookup;
  hotcFeeDefaults: SidDescLookup;
  currentDate: Date = new Date(Date.now());
  errorMessage: string;
  serviceProviderType: string;
  serviceProviderIdRequired = false;
  private success = false;
  private submitClicked = false;
  private resetFormClicked = false;
  private deleteClicked = false;
  private cancelClicked = false;
  private isUpdate = false;
  private returnPath: string;
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  maxDate: Date;
  private myForm: FormGroup;
  // private zipPattern = new RegExp(/^[0-9]{5}(?:-[0-9]{4})?$/);
  private zipPattern = Constants.zip_format;
  private numbersOnly = new RegExp(/^\d+$/);
  private yesNo = new RegExp(/^[ynYN]$/);
  private fourNumbersOnly = new RegExp(/^\d{4}$/);
  private zeroOneToThirtySix = new RegExp(/\b(0?[1-9]|[1-3][0-6])\b/);
  private currentYear = ((new Date()).getFullYear());
  // private currentYear = new Date().getFullYear().toString().substr(-2);
  showStatusButtons: boolean;
  returnToSearch = Constants.returnToSearch;
  state$: Observable<any>;
  addr: SearchAddr;

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router, private datePipe: DatePipe
    , private canDeactivateDialog: MatDialog, private submitStatusDialog: MatDialog
    , private printService: PrintService, private pdfService: PdfService
    , private decommPrintHelperService: DecommPrintHelperService, private authService: AuthService) { }

  ngOnInit() {
    this.loadingSubject.next(true);
    this.state$ = this.route.paramMap.pipe(
      map(() => window.history.state)
    );
    this.state$.subscribe(res => this.addr = res.data);
    this.route.data.subscribe((data: {states: State[]}) => {this.states = data.states; });
    this.route.data.subscribe((data: {quadrants: Quadrant[]}) => {this.quadrants = data.quadrants; });
    this.route.data.subscribe((data: {streetTypes: StreetType[]}) => {this.streetTypes = data.streetTypes; });
    this.route.data.subscribe((data: {zipCodes: ZipCode[]}) => {this.zipCodes = data.zipCodes; });
    this.route.data.subscribe((data: {hotcDecommTypes: SidDescLookup}) => {this.hotcDecommTypes = data.hotcDecommTypes; });
    this.route.data.subscribe((data: {hotcFeeDefaults: SidDescLookup}) => {this.hotcFeeDefaults = data.hotcFeeDefaults; });
    this.route.params.subscribe(params => {
      this.hotId = +params['hotid'];
    });

    if (isNaN(this.hotId)) {
      this.isUpdate = false;
      this.hotId = 0;
    } else {
      this.route.data.subscribe((data: {hotcDecomm: HotcDecomm}) => {
        this.hotcDecommGet = data.hotcDecomm;
        this.hotId = this.hotcDecommGet.hotId;
        this.isUpdate = true;
        this.setServiceProviderType();
      } );
    }
    this.returnPath = 'dhot/' + this.hotId;
    this.setShowStatusButtons();
    this.myForm = this.formBuilder.group({
      county: [(this.isUpdate ? this.hotcDecommGet.dhotCounty : null)
        , Validators.compose([Validators.required, Validators.maxLength(4), Validators.pattern(this.zeroOneToThirtySix)])],
      year: [(this.isUpdate ? this.hotcDecommGet.dhotYear : this.currentYear)
        , Validators.compose([Validators.required, Validators.pattern(this.fourNumbersOnly), Validators.maxLength(4)])],
      hotStreetNbr: [(this.isUpdate ? this.hotcDecommGet.hotStreetNbr : (this.addr ? this.addr.streetNbr : null))
        , Validators.maxLength(7)],
      hotQuad: [(this.isUpdate ? this.hotcDecommGet.hotStreetQuad : (this.addr ? this.addr.streetQuad : null))],
      hotStreet: [(this.isUpdate ? this.hotcDecommGet.hotStreetNm : (this.addr ? this.addr.streetName : null))],
      hotStreetType: [(this.isUpdate ? this.hotcDecommGet.hotStreetType : (this.addr ? this.addr.streetType : null))],
      hotCity: [(this.isUpdate ? this.hotcDecommGet.hotCity : (this.addr ? this.addr.city : null)), Validators.required],
      hotZip: [(this.isUpdate ? this.hotcDecommGet.hotZip : (this.addr ? this.addr.zip : null))
        , Validators.compose([Validators.required, Validators.maxLength(10), Validators.pattern(this.zipPattern)])],
      hotOtherAddress: [(this.isUpdate ? this.hotcDecommGet.hotAddrCmnt : (this.addr ? this.addr.otherAddr : null))],
      firstName: [(this.isUpdate ? this.hotcDecommGet.rpFirstNm : null), Validators.required],
      lastName: [(this.isUpdate ? this.hotcDecommGet.rpLastNm : null), Validators.required],
      company: [(this.isUpdate ? this.hotcDecommGet.rpCompanyNm : null), Validators.required],
      streetNbr: [(this.isUpdate ? this.hotcDecommGet.rpStreetNbr : null), Validators.maxLength(7)],
      quad: [(this.isUpdate ? this.hotcDecommGet.rpStreetQuad : null)],
      street: [(this.isUpdate ? this.hotcDecommGet.rpStreetNm : null)],
      streetType: [(this.isUpdate ? this.hotcDecommGet.rpStreetType : null)],
      city: [(this.isUpdate ? this.hotcDecommGet.rpCity : null), Validators.required],
      state: [(this.isUpdate ? this.hotcDecommGet.rpState : null), Validators.required],
      zip: [(this.isUpdate ? this.hotcDecommGet.rpZip : null)
        , Validators.compose([Validators.required, Validators.maxLength(10), Validators.pattern(this.zipPattern)])],
      otherAddress: [(this.isUpdate ? this.hotcDecommGet.rpAddrCmnt : null)],
      hotId: [{value: (this.isUpdate ? this.hotcDecommGet.hotId : null), disabled: true}],
      todayDate: [{value: this.transformDate(new Date()), disabled: true}],
      decommDate:  [(this.isUpdate ? this.hotcDecommGet.decommissionDate : null), Validators.required],
      checkReceivedDate:  [(this.isUpdate ? this.hotcDecommGet.checkReceivedDate : null), Validators.required],
      auditDate:  [(this.isUpdate ? this.hotcDecommGet.auditDate : null)],
      fileClosedDate:  [(this.isUpdate
        ? this.hotcDecommGet.fileClosedDate : this.currentDate), Validators.required],
      checkNbr:  [(this.isUpdate ? this.hotcDecommGet.checkNbr : null), Validators.required],
      reportRejected:  [(this.isUpdate ? this.hotcDecommGet.reportRejected : null), Validators.pattern(this.yesNo)],
      decommType:  [(this.isUpdate ? this.hotcDecommGet.decommType : null), Validators.required],
      feeAmt:  [ this.getFeeAmt(), Validators.required],
      comment:  [(this.isUpdate ? this.hotcDecommGet.hotComments : null)],
      serviceProviderType:  [this.serviceProviderType],
      serviceProviderId:  [this.getServiceProviderId(), Validators.pattern(this.numbersOnly)],
      serviceProviderFullName:  [{value: (this.isUpdate ? this.hotcDecommGet.fullName : null), disabled: true}],
      serviceProviderStatus:  [{value: (this.isUpdate ? this.hotcDecommGet.licenseStatus : null), disabled: true}],
    },
    {validator: [
      this.hotStreetNbrValidator.bind(this), this.hotStreetValidator.bind(this), this.hotOtherAddressValidator.bind(this)
      , this.streetNbrValidator.bind(this), this.streetValidator.bind(this), this.otherAddressValidator.bind(this)
      , this.firstNameValidator.bind(this), this.lastNameValidator.bind(this), this.companyValidator.bind(this)
      , this.checkReceivedDateValidator.bind(this)
    ]}
    );

    this.prepServiceProvider();
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
    if (this.isUpdate) {
      return this.hotcDecommGet.feeAmt;
    }
    return this.hotcFeeDefaults[1].descript;
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
    if (this.hotcDecommGet.hotSpId === null || this.hotcDecommGet.hotSpId === undefined ) {
      this.serviceProviderType = '';
    } else if (this.hotcDecommGet.hotSpId.includes('HOWNR')) {
      this.serviceProviderType = '1';
    } else if (!isNaN(+this.hotcDecommGet.hotSpId)) {
      this.serviceProviderType = '2';
    } else {
      this.serviceProviderType = ' ';
    }
  }

  onResetForm() {
    this.resetFormClicked = true;
    this.myForm.reset();
    this.myForm.markAsPristine();
    this.myForm.controls.todayDate.setValue(this.transformDate(new Date()));
    if (this.isUpdate) {
      this.route.data.subscribe((data: {hotcDecomm: HotcDecomm}) => {
        this.hotcDecommGet = data.hotcDecomm;
        this.hotId = this.hotcDecommGet.hotId;
        this.setServiceProviderType();
        this.myForm.controls.hotStreetNbr.setValue(this.hotcDecommGet.hotStreetNbr);
        this.myForm.controls.hotQuad.setValue(this.hotcDecommGet.hotStreetQuad);
        this.myForm.controls.hotStreet.setValue(this.hotcDecommGet.hotStreetNm);
        this.myForm.controls.hotStreetType.setValue(this.hotcDecommGet.hotStreetType);
        this.myForm.controls.hotCity.setValue(this.hotcDecommGet.hotCity);
        this.myForm.controls.hotZip.setValue(this.hotcDecommGet.hotZip);
        this.myForm.controls.hotOtherAddress.setValue(this.hotcDecommGet.hotAddrCmnt);
        this.myForm.controls.firstName.setValue(this.hotcDecommGet.rpFirstNm);
        this.myForm.controls.lastName.setValue(this.hotcDecommGet.rpLastNm);
        this.myForm.controls.company.setValue(this.hotcDecommGet.rpCompanyNm);
        this.myForm.controls.streetNbr.setValue(this.hotcDecommGet.rpStreetNbr);
        this.myForm.controls.quad.setValue(this.hotcDecommGet.rpStreetQuad);
        this.myForm.controls.street.setValue(this.hotcDecommGet.rpStreetNm);
        this.myForm.controls.streetType.setValue(this.hotcDecommGet.rpStreetType);
        this.myForm.controls.city.setValue(this.hotcDecommGet.rpCity);
        this.myForm.controls.state.setValue(this.hotcDecommGet.rpState);
        this.myForm.controls.zip.setValue(this.hotcDecommGet.rpZip);
        this.myForm.controls.otherAddress.setValue(this.hotcDecommGet.rpAddrCmnt);
        this.myForm.controls.county.setValue(this.hotcDecommGet.dhotCounty);
        this.myForm.controls.year.setValue(this.hotcDecommGet.dhotYear);
        this.myForm.controls.hotId.setValue(this.hotcDecommGet.hotId);
        this.myForm.controls.decommDate.setValue(this.hotcDecommGet.decommissionDate);
        this.myForm.controls.checkReceivedDate.setValue(this.hotcDecommGet.checkReceivedDate);
        this.myForm.controls.auditDate.setValue(this.hotcDecommGet.auditDate);
        this.myForm.controls.fileClosedDate.setValue(this.hotcDecommGet.fileClosedDate);
        this.myForm.controls.checkNbr.setValue(this.hotcDecommGet.checkNbr);
        this.myForm.controls.reportRejected.setValue(this.hotcDecommGet.reportRejected);
        this.myForm.controls.decommType.setValue(this.hotcDecommGet.decommType);
        this.myForm.controls.comment.setValue(this.hotcDecommGet.hotComments);
        this.myForm.controls.serviceProviderType.setValue(this.serviceProviderType);
        this.myForm.controls.serviceProviderId.setValue(this.getServiceProviderId());
        this.myForm.controls.serviceProviderFullName.setValue(this.hotcDecommGet.fullName);
        this.myForm.controls.serviceProviderStatus.setValue(this.hotcDecommGet.licenseStatus);
        this.prepServiceProvider();
      } );
    }
    this.myForm.controls.feeAmt.setValue(this.getFeeAmt());
  }

  onCancel() {
    this.router.navigate(['/dsearch']);
  }

  onLustIncident() {
    this.router.navigate(['/lust/' + this.hotId]);
  }

  onPrintLetter() {
    const hotcDecommPrint = new DecommissioningPrint();
    hotcDecommPrint.printType = this.getDecommPrintType();
    hotcDecommPrint.hotId = this.hotcDecommGet.hotId,
    hotcDecommPrint.organization = this.hotcDecommGet.rpCompanyNm,
    hotcDecommPrint.firstName = this.hotcDecommGet.rpFirstNm;
    hotcDecommPrint.lastName = this.hotcDecommGet.rpLastNm;
    hotcDecommPrint.city = this.hotcDecommGet.rpCity;
    hotcDecommPrint.state = this.hotcDecommGet.rpState;
    hotcDecommPrint.zipcode = this.hotcDecommGet.rpZip;
    hotcDecommPrint.serviceProviderName = this.hotcDecommGet.fullName;
    hotcDecommPrint.logCounty = +this.hotcDecommGet.dhotCounty;
    hotcDecommPrint.logYear = +this.hotcDecommGet.dhotYear;
    hotcDecommPrint.logSeq = this.hotcDecommGet.hotId;
    hotcDecommPrint.logNumber = this.hotcDecommGet.hotId.toString();
    hotcDecommPrint.addressComment = this.hotcDecommGet.rpAddrCmnt;
    hotcDecommPrint.streetNbr =  this.hotcDecommGet.rpStreetNbr;
    hotcDecommPrint.quadrant = this.hotcDecommGet.rpStreetQuad;
    hotcDecommPrint.streetName = this.hotcDecommGet.rpStreetNm;
    hotcDecommPrint.streetType = this.hotcDecommGet.rpStreetType;
    hotcDecommPrint.hotStreetNbr = this.hotcDecommGet.hotStreetNbr;
    hotcDecommPrint.hotStreetQuad = this.hotcDecommGet.hotStreetQuad;
    hotcDecommPrint.hotStreetNm = this.hotcDecommGet.hotStreetNm;
    hotcDecommPrint.hotStreetType = this.hotcDecommGet.hotStreetType;
    hotcDecommPrint.hotAddrCmnt = this.hotcDecommGet.hotAddrCmnt;
    hotcDecommPrint.hotCity = this.hotcDecommGet.hotCity;
    hotcDecommPrint.hotZipcode = this.hotcDecommGet.hotZip;
    const letter = this.decommPrintHelperService.formatLetter(hotcDecommPrint);
    this.printService.print(letter);
  }

  private getDecommPrintType(): DecommPrintType {
    if (this.hotcDecommGet.hotSpId.includes('HOWNR')) {
      return DecommPrintType.HotcHomeOwner;
    }
    return DecommPrintType.HotcServiceProvider;
  }

  onSubmit() {
    this.submitClicked = true;
    if (this.myForm.dirty && this.myForm.valid) {
      this.setModelToFormData();
      this.lustDataService.insUpdHotcDecomm(this.hotcDecommPost)
        .subscribe(
          (data ) => (
            this.postResult = data
            , this.hotId = this.postResult.id
            , this.showSubmitStatusDialog())
        );
    } else if (this.myForm.invalid) {
        // this.errors = this.findInvalidControls();
        // console.log('this.errors');
        // console.log(this.errors);
    }
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
      title = 'Success  ' + this.postResult.id;
      this.hotId = this.postResult.id;
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
        this.returnPath = 'dhot/' + this.hotId;
        this.router.navigate([this.returnPath]);
      }
    });
    this.myForm.controls.hotId.setValue(this.postResult.id);
  }

  private setModelToFormData() {
    this.hotcDecommPost.dhotCounty = this.myForm.controls.county.value;
    this.hotcDecommPost.dhotYear = this.myForm.controls.year.value;
    this.hotcDecommPost.hotId = this.hotId;
    this.hotcDecommPost.hotStreetNbr = this.myForm.controls.hotStreetNbr.value;
    this.hotcDecommPost.hotStreetNm = this.myForm.controls.hotStreet.value;
    this.hotcDecommPost.hotStreetQuad = this.myForm.controls.hotQuad.value;
    this.hotcDecommPost.hotStreetType = this.myForm.controls.hotStreetType.value;
    this.hotcDecommPost.hotCity = this.myForm.controls.hotCity.value;
    this.hotcDecommPost.hotZip = this.myForm.controls.hotZip.value;
    this.hotcDecommPost.hotAddrCmnt = this.myForm.controls.hotOtherAddress.value;
    this.hotcDecommPost.rpFirstNm = this.myForm.controls.firstName.value;
    this.hotcDecommPost.rpLastNm = this.myForm.controls.lastName.value;
    this.hotcDecommPost.rpCompanyNm = this.myForm.controls.company.value;
    this.hotcDecommPost.rpStreetNbr = this.myForm.controls.streetNbr.value;
    this.hotcDecommPost.rpStreetNm = this.myForm.controls.street.value;
    this.hotcDecommPost.rpStreetQuad = this.myForm.controls.quad.value;
    this.hotcDecommPost.rpStreetType = this.myForm.controls.streetType.value;
    this.hotcDecommPost.rpAddrCmnt = this.myForm.controls.otherAddress.value;
    this.hotcDecommPost.rpCity = this.myForm.controls.city.value;
    this.hotcDecommPost.rpState = this.myForm.controls.state.value;
    this.hotcDecommPost.rpZip = this.myForm.controls.zip.value;
    this.hotcDecommPost.decommissionDate = this.myForm.controls.decommDate.value;
    this.hotcDecommPost.fileClosedDate = this.myForm.controls.fileClosedDate.value;
    this.hotcDecommPost.checkNbr = this.myForm.controls.checkNbr.value;
    this.hotcDecommPost.checkReceivedDate = this.myForm.controls.checkReceivedDate.value;
    this.hotcDecommPost.feeAmt = +this.myForm.controls.feeAmt.value;
    this.hotcDecommPost.auditDate = this.myForm.controls.auditDate.value;
    this.hotcDecommPost.decommType = this.myForm.controls.decommType.value;
    this.hotcDecommPost.reportRejected = this.myForm.controls.reportRejected.value;
    if (this.serviceProviderIdRequired) {
      this.hotcDecommPost.hotSpId = this.myForm.controls.serviceProviderId.value;
    } else {
      this.hotcDecommPost.hotSpId = 'HOWNR';
    }
    this.hotcDecommPost.hotComments = this.myForm.controls.comment.value;
  }

  hotStreetNbrValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotAddressError: true };
    if (formGroup) {
      if ( (formGroup.controls.hotStreetNbr.value === null
            && formGroup.controls.hotStreet.value === null
            && formGroup.controls.hotOtherAddress.value === null )
          || ( formGroup.controls.hotStreetNbr.value === null
            && formGroup.controls.hotStreet.value !== null
            && formGroup.controls.hotOtherAddress.value === null)
      ) {
        formGroup.controls.hotStreetNbr.setErrors(error);
        return {
          hotAddressError: {
            hotAddressError: true
          }
        };
      }
    }
    formGroup.controls.hotStreetNbr.setErrors(null);
    return null;
  }

  hotStreetValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotAddressError: true };
    if (formGroup) {
      if ( (formGroup.controls.hotStreetNbr.value === null
            && formGroup.controls.hotStreet.value === null
            && formGroup.controls.hotOtherAddress.value === null)
          || ( formGroup.controls.hotStreetNbr.value !== null
            && formGroup.controls.hotStreet.value === null
            && formGroup.controls.hotOtherAddress.value === null)
      ) {
        formGroup.controls.hotStreet.setErrors(error);
        return {
          hotAddressError: {
            hotAddressError: true
          }
        };
      }
    }
    formGroup.controls.hotStreet.setErrors(null);
    return null;
  }

  hotOtherAddressValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotAddressError: true };
    if (formGroup) {
      if ( (formGroup.controls.hotStreetNbr.value === null
            && formGroup.controls.hotStreet.value === null
            && formGroup.controls.hotOtherAddress.value === null )
      ) {
        formGroup.controls.hotOtherAddress.setErrors(error);
        return {
          hotAddressError: {
            hotAddressError: true
          }
        };
      }
    }
    formGroup.controls.hotOtherAddress.setErrors(null);
    return null;
  }

  streetNbrValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotRpAddressError: true };
    if (formGroup) {
      if ( (formGroup.controls.streetNbr.value === null
            && formGroup.controls.street.value === null
            && formGroup.controls.otherAddress.value === null )
          || ( formGroup.controls.streetNbr.value === null
            && formGroup.controls.street.value !== null
            && formGroup.controls.otherAddress.value === null)
      ) {
        formGroup.controls.streetNbr.setErrors(error);
        return {
          hotRpAddressError: {
            hotRpAddressError: true
          }
        };
      }
    }
    formGroup.controls.streetNbr.setErrors(null);
    return null;
  }

  streetValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotRpAddressError: true };
    if (formGroup) {
      if ( (formGroup.controls.streetNbr.value === null
            && formGroup.controls.street.value === null
            && formGroup.controls.otherAddress.value === null )
          || ( formGroup.controls.streetNbr.value !== null
            && formGroup.controls.street.value === null
            && formGroup.controls.otherAddress.value === null)
      ) {
        formGroup.controls.street.setErrors(error);
        return {
          hotRpAddressError: {
            hotRpAddressError: true
          }
        };
      }
    }
    formGroup.controls.street.setErrors(null);
    return null;
  }

  otherAddressValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotRpAddressError: true };
    if (formGroup) {
      if ( (formGroup.controls.streetNbr.value === null
            && formGroup.controls.street.value === null
            && formGroup.controls.otherAddress.value === null )
      ) {
        formGroup.controls.otherAddress.setErrors(error);
        return {
          hotRpAddressError: {
            hotRpAddressError: true
          }
        };
      }
    }
    formGroup.controls.otherAddress.setErrors(null);
    return null;
  }

  firstNameValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotRpNameError: true };
    if (formGroup) {
      if ( (formGroup.controls.firstName.value === null
            && formGroup.controls.lastName.value === null
            && formGroup.controls.company.value === null )
          || ( formGroup.controls.firstName.value === null
            && formGroup.controls.lastName.value !== null
            && formGroup.controls.company.value === null)
      ) {
        formGroup.controls.firstName.setErrors(error);
        return {
          hotRpNameError: {
            hotRpNameError: true
          }
        };
      }
    }
    formGroup.controls.firstName.setErrors(null);
    return null;
  }

  lastNameValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotRpNameError: true };
    if (formGroup) {
      if ( (formGroup.controls.firstName.value === null
            && formGroup.controls.lastName.value === null
            && formGroup.controls.company.value === null )
          || ( formGroup.controls.firstName.value !== null
            && formGroup.controls.lastName.value === null
            && formGroup.controls.company.value === null)
      ) {
        formGroup.controls.lastName.setErrors(error);
        return {
          hotRpNameError: {
            hotRpNameError: true
          }
        };
      }
    }
    formGroup.controls.lastName.setErrors(null);
    return null;
  }

  companyValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotRpNameError: true };
    if (formGroup) {
      if ( (formGroup.controls.firstName.value === null
            && formGroup.controls.lastName.value === null
            && formGroup.controls.company.value === null )
      ) {
        formGroup.controls.company.setErrors(error);
        return {
          hotRpNameError: {
            hotRpNameError: true
          }
        };
      }
    }
    formGroup.controls.company.setErrors(null);
    return null;
  }

  checkReceivedDateValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { hotCheckReceivedDateError: true };
    if (formGroup) {
      if ((new Date (formGroup.controls.checkReceivedDate.value).setHours(0, 0, 0, 0))
      < (new Date (formGroup.controls.decommDate.value).setHours(0, 0, 0, 0))) {
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

  private getServiceProviderId(): string {
    if (this.isUpdate) {
      return ((this.hotcDecommGet.hotSpId !== null
        && this.hotcDecommGet.hotSpId !== undefined
        && this.hotcDecommGet.hotSpId.includes('HOWNR') )
        ? null : this.hotcDecommGet.hotSpId);
    }
    return null;
  }


  copySiteAddress() {
    this.myForm.controls.streetNbr.setValue(this.myForm.controls.hotStreetNbr.value);
    this.myForm.controls.quad.setValue(this.myForm.controls.hotQuad.value);
    this.myForm.controls.street.setValue(this.myForm.controls.hotStreet.value);
    this.myForm.controls.streetType.setValue(this.myForm.controls.hotStreetType.value);
    this.myForm.controls.city.setValue(this.myForm.controls.hotCity.value);
    this.myForm.controls.state.setValue('OR');
    this.myForm.controls.zip.setValue(this.myForm.controls.hotZip.value);
    this.myForm.controls.otherAddress.setValue(this.myForm.controls.hotOtherAddress.value);
  }

  onInputEntry(event, nextInput) {
    const input = event.target;
    const length = input.value.length;
    const maxLength = input.attributes.maxLength.value;
    if (length >= maxLength) {
      nextInput.focus();
    }
  }
}
