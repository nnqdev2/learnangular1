import { Component, OnInit, OnChanges, SimpleChange } from '@angular/core';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { GuardDialogComponent } from 'src/app/common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from 'src/app/common/dialogs/submit-status-dialog.component';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { FormGroup, FormBuilder, Validators, AbstractControl, ValidatorFn, ValidationErrors } from '@angular/forms';
import { IdDescLookup } from 'src/app/models/id-desc-lookup';
import { SidDescLookup } from 'src/app/models/sid-desc-lookup';
import { LustGenericResult } from 'src/app/models/lust-generic-result';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { distinctUntilChanged, debounceTime, switchMap, tap, finalize, map, catchError, startWith } from 'rxjs/operators';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { DatePipe, DecimalPipe } from '@angular/common';
import { IncidentIdToNameService } from 'src/app/olprr-search/incident-id-to-name.service';
import { ApGetLogNumber } from 'src/app/models/apGetLogNumber';
import { Pcs } from 'src/app/models/pcs';
import { PcsPermit } from 'src/app/models/pcs-permit';
import { PcsPcsPermit } from 'src/app/models/pcs-pcs-permit';
import { normalizeStyles } from '@angular/animations/browser/src/util';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-pcs-edit',
  templateUrl: './pcs-edit.component.html',
  styleUrls: ['./pcs-edit.component.scss']
})
export class PcsEditComponent implements OnInit {


  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  private myForm: FormGroup;
  private pcs: Pcs;
  private pcsPermit: PcsPermit;
  private pcsPcsPermit: PcsPcsPermit;
  private lustGenericResul5: LustGenericResult;
  private landfillFacilities: IdDescLookup[];
  private treatmentFacilities: IdDescLookup[];
  private soilStatuses: IdDescLookup[];
  private landfillAmount2: number;
  private treatmentAmount2: number;
  private offSiteAmount2: number;
  private onSiteAmount2: number;
  currentDate: Date;
  errorMessage: string;
  private success = false;
  private lustGenericResult: LustGenericResult;
  private submitClicked = false;
  private resetFormClicked = false;
  private deleteClicked = false;
  private cancelClicked = false;
  private errors: any[];
  private lustId = 0;
  private pcsId = 0;
  private isUpdate = false;
  private isPermitUpdate = false;
  private returnPath: string;
  private logNumber: string;
  private siteName: string;
  private formTitle: string;
  private deleteText: string;
  private pcsPost = new Pcs();
  private pcsPermitPost = new PcsPermit();
  private pcsPcsPermitPost = new PcsPcsPermit();
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  maxDate: Date;
  authLevel: AuthLevel;
  viewOnly = false;
  returnToList = Constants.returnToList;

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router, private datePipe: DatePipe
    , private canDeactivateDialog: MatDialog, private confirmDeleteDialog: MatDialog
    , private idToNameService: IncidentIdToNameService, private submitStatusDialog: MatDialog
    , private authService: AuthService
  ) {  }

  ngOnInit() {
    this.loadingSubject.next(true);
    this.setAuthLevel();
    this.setViewOnly();
    this.route.data.subscribe((data: {landfillFacilities: IdDescLookup[]}) => {this.landfillFacilities = data.landfillFacilities; });
    this.route.data.subscribe((data: {treatmentFacilities: IdDescLookup[]}) => {this.treatmentFacilities = data.treatmentFacilities; });
    this.route.data.subscribe((data: {soilStatuses: IdDescLookup[]}) => {this.soilStatuses = data.soilStatuses; });
    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.params.subscribe(params => {
      this.pcsId = +params['pcsid'];
    });

    const formTitle = 'PCS ';
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.logNumber = data.apGetLogNumber.logNumber;
      this.siteName = data.apGetLogNumber.siteName;
    });
    if (isNaN(this.pcsId)) {
      this.isUpdate = false;
      this.pcsId = 0;
      this.formTitle = 'Add ' + formTitle;
      // this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      //   this.logNumber = data.apGetLogNumber.logNumber; });
    } else {
      this.route.data.subscribe((data: {pcsPcsPermit: PcsPcsPermit}) => {
        this.pcsPcsPermit = data.pcsPcsPermit;
        this.logNumber = data.pcsPcsPermit.logNumber;
        this.deleteText = 'Delete PCS';
         if (data.pcsPcsPermit.pcsSwPermitId > 0) {
          this.isPermitUpdate = true;
          this.deleteText = 'Delete PCS and Permit';
        }
      });
      this.isUpdate = true;
      this.formTitle = 'Update ' + formTitle;
    }
    this.formTitle = `${this.formTitle} ${this.logNumber} ${this.siteName}`;
    this.returnPath = 'lust/' + this.lustId + '/pcss';
    if (this.isUpdate) {
        const totalCubicYard = this.pcsPcsPermit.landfillAmtYrds3 + this.pcsPcsPermit.thermalAmtYrds3
        + this.pcsPcsPermit.onSiteAmtYrds3 +  this.pcsPcsPermit.offSiteAmtYrds3;
      this.myForm = this.formBuilder.group({
        landFillAmount: [this.pcsPcsPermit.landfillAmtYrds3],
        treatmentAmount: [this.pcsPcsPermit.thermalAmtYrds3],
        onSiteAmount: [this.pcsPcsPermit.onSiteAmtYrds3],
        offSiteAmount: [this.pcsPcsPermit.offSiteAmtYrds3],
        landFillAmount2: [this.convertCubicYardToTon(this.pcsPcsPermit.landfillAmtYrds3)],
        treatmentAmount2: [this.convertCubicYardToTon(this.pcsPcsPermit.thermalAmtYrds3)],
        onSiteAmount2: [this.convertCubicYardToTon(this.pcsPcsPermit.onSiteAmtYrds3)],
        offSiteAmount2: [this.convertCubicYardToTon(this.pcsPcsPermit.offSiteAmtYrds3)],
        disposalDate: [this.pcsPcsPermit.disposalDate],
        onSiteDisposalInd: [this.pcsPcsPermit.onSiteDisposalInd],
        offSiteDispAddr: [this.pcsPcsPermit.offSiteDispAddr],
        dispLandfillFacId: [this.pcsPcsPermit.dispLandfillFacId],
        dispThrmFacId: [this.pcsPcsPermit.dispThrmFacId],
        soilStatusId: [this.pcsPcsPermit.soilStatusId],
        comment: [this.pcsPcsPermit.pcsComment, Validators.maxLength(8000)],
        lastChangeBy: [{value: this.pcsPcsPermit.lastChangeby, disabled: true}],
        lastChangeDate:  [{value: this.transformDate(this.pcsPcsPermit.lastChangeDate), disabled: true}],
        swlaPermitNbr: [this.pcsPcsPermit.swlaPermitNbr],
        applReceivedDate: [this.pcsPcsPermit.applReceivedDate],
        issueDate: [this.pcsPcsPermit.issueDate],
        expirationDate: [this.pcsPcsPermit.expirationDate],
        permitExtensionDate: [this.pcsPcsPermit.permitExtensionDate],
        swFeeInd: [this.pcsPcsPermit.swFeeInd],
        landUseApproveInd: [this.pcsPcsPermit.landUseApproveInd],
        treatmentDescription: [this.pcsPcsPermit.treatmentDescription],
        pcsPermitLastChangeBy: [{value: this.pcsPcsPermit.pcsPermitLastChangeBy, disabled: true}],
        pcsPermitLastChangeDate:  [{value: this.transformDate(this.pcsPcsPermit.pcsPermitLastChangeDate), disabled: true}],
        totalCubic: [totalCubicYard],
        totalTon: [this.convertCubicYardToTon(totalCubicYard)],
      },
      {validator: []}
      );
      this.myForm.controls.totalCubic.disable();
      this.myForm.controls.totalTon.disable();
    } else {
        this.myForm = this.formBuilder.group({
          landFillAmount: [],
          treatmentAmount: [],
          onSiteAmount: [],
          offSiteAmount: [],
          landFillAmount2: [],
          treatmentAmount2: [],
          onSiteAmount2: [],
          offSiteAmount2: [],
          disposalDate: [],
          onSiteDisposalInd: [],
          offSiteDispAddr: [],
          dispLandfillFacId: [],
          dispThrmFacId: [],
          soilStatusId: [],
          comment: [],
          lastChangeBy: [],
          lastChangeDate:  [],
          swlaPermitNbr: [],
          applReceivedDate: [],
          issueDate: [],
          expirationDate: [],
          permitExtensionDate: [],
          swFeeInd: [],
          landUseApproveInd: [],
          treatmentDescription: [],
          pcsPermitLastChangeBy: [{value: '', disabled: true}],
          pcsPermitLastChangeDate:  [{value: '', disabled: true}],
          totalCubic: [{value: '', disabled: true}],
          totalTon: [{value: '', disabled: true}],
        },
        {validator: [] }
        );
    }
    this.myForm.controls.disposalDate.setValidators([Validators.required]);
    this.myForm.setValidators([this.soilStatusValidator.bind(this)
                    , this.landfillFacilityValidator.bind(this), this.landfillAmountValidator.bind(this)
                    , this.landfillAmount2Validator.bind(this), this.treatmentAmount2Validator.bind(this)
                    , this.offSiteAmount2Validator.bind(this), this.onSiteAmount2Validator.bind(this)
                    , this.treatmentFacilityValidator.bind(this), this.treatmentAmountValidator.bind(this)
                    , this.offSiteDispAddrValidator.bind(this), this.offSiteAmountValidator.bind(this)
                    , this.onSiteDisposalIndValidator.bind(this), this.onSiteAmountValidator.bind(this)
                    , this.issueDateValidator.bind(this), this.expirationDateValidator.bind(this)
                    , this.permitExtensionDateValidator.bind(this), this.swlaPermitNbrValidator.bind(this)
                  ]);
    this.disableForm();
    this.maxDate = new Date();
    this.maxDate.setDate( this.maxDate.getDate());
    this.loadingSubject.next(false);
  }

  private setAuthLevel()  {
    this.authLevel = this.authService.getAuthLevel();
  }

  private setViewOnly()  {
    if (this.authLevel < AuthLevel.PM) {
      this.viewOnly = true;
    }
  }

  private disableForm()  {
    if (this.viewOnly) {
      this.myForm.disable();
    }
  }


  onChanges(): void {
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

  private findInvalidControls() {
    const invalid = [];
    for (const field of Object.keys(this.myForm.controls)) {
        if (this.myForm.controls[field].invalid) {
            const name = this.idToNameService.getName(field);
            invalid.push(name + ' is required and must be valid.');
        }
    }

    return invalid;
  }

  submit(): void {
    this.submitClicked = true;
    if (this.myForm.dirty && this.myForm.valid) {
      this.pcsPcsPermitPost.lustId = this.lustId;
      this.pcsPcsPermitPost.pcsId = (this.pcsPcsPermit === undefined ? 0 : this.pcsPcsPermit.pcsId);
      this.pcsPcsPermitPost.pcsSwPermitId = (this.pcsPcsPermit  === undefined ? 0 : this.pcsPcsPermit.pcsSwPermitId);
      this.pcsPcsPermitPost.landfillAmtYrds3 = this.myForm.controls.landFillAmount.value;
      this.pcsPcsPermitPost.thermalAmtYrds3 = this.myForm.controls.treatmentAmount.value;
      this.pcsPcsPermitPost.onSiteAmtYrds3 = this.myForm.controls.onSiteAmount.value;
      this.pcsPcsPermitPost.offSiteAmtYrds3 = this.myForm.controls.offSiteAmount.value;
      this.pcsPcsPermitPost.disposalDate = this.myForm.controls.disposalDate.value;
      this.pcsPcsPermitPost.onSiteDisposalInd = this.myForm.controls.onSiteDisposalInd.value;
      this.pcsPcsPermitPost.offSiteDispAddr = this.myForm.controls.offSiteDispAddr.value;
      this.pcsPcsPermitPost.dispLandfillFacId = this.myForm.controls.dispLandfillFacId.value;
      this.pcsPcsPermitPost.dispThrmFacId = this.myForm.controls.dispThrmFacId.value;
      this.pcsPcsPermitPost.soilStatusId = this.myForm.controls.soilStatusId.value;
      this.pcsPcsPermitPost.pcsComment = this.myForm.controls.comment.value;
      this.pcsPcsPermitPost.lastChangeby = this.authService.getUserIdWoDomain();
      this.pcsPcsPermitPost.swlaPermitNbr = this.myForm.controls.swlaPermitNbr.value;
      this.pcsPcsPermitPost.applReceivedDate = this.myForm.controls.applReceivedDate.value;
      this.pcsPcsPermitPost.issueDate = this.myForm.controls.issueDate.value;
      this.pcsPcsPermitPost.expirationDate = this.myForm.controls.expirationDate.value;
      this.pcsPcsPermitPost.permitExtensionDate = this.myForm.controls.permitExtensionDate.value;
      this.pcsPcsPermitPost.swFeeInd = this.myForm.controls.swFeeInd.value;
      this.pcsPcsPermitPost.landUseApproveInd = this.myForm.controls.landUseApproveInd.value;
      this.pcsPcsPermitPost.treatmentDescription = this.myForm.controls.treatmentDescription.value;
      this.pcsPcsPermitPost.pcsPermitLastChangeBy = this.myForm.controls.pcsPermitLastChangeBy.value;
      this.lustDataService.insUpdPcsPcsPermit(this.pcsPcsPermitPost)
        .subscribe(
          (data ) => (
            this.lustGenericResult = data,
            this.showSubmitStatusDialog()),
        );
    } else if (this.myForm.invalid) {
        this.errors = this.findInvalidControls();
        console.log(this.errors);
    }
  }

  private showSubmitStatusDialog() {
    let message1 = '';
    let title = '';
    const button1 = 'Close';
    if (this.lustGenericResult.errorMessageHandler !== undefined &&
      this.lustGenericResult.errorMessageHandler !== null &&
      this.lustGenericResult.errorMessageHandler.length > 0 ) {
      title = 'Failed to save due to ' + this.lustGenericResult.errorMessageHandler ;
      message1 = this.lustGenericResult.errorMessageHandler;
      this.success = false;
    } else {
      if (this.submitClicked) {
        title = 'Successfully saved pcs id ' + this.lustGenericResult.lustId + ' pcs permit id ' + this.lustGenericResult.id;
      } else {
        title = 'Successfully deleted id ' + this.lustGenericResult.id ;
      }
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
        this.router.navigate([this.returnPath]);
      }
    });
  }

  onCancel() {
    this.cancelClicked = true;
    this.router.navigate([this.returnPath]);
  }

  onDelete(delAll: boolean) {

    const msg = delAll ? 'Are you sure you want to ' + this.deleteText.charAt(0).toLowerCase() + this.deleteText.slice(1) + '?'
          : 'Are you sure you want to delete Permit?';
    this.deleteClicked = true;
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: msg ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        if (delAll) {
          this.lustDataService.delPcsPcsPermit(this.pcsPcsPermit.pcsId).subscribe(
            data => {
              this.lustGenericResult = data;
              this.showSubmitStatusDialog();            }
          );
        } else {
          this.lustDataService.delPcsPermit(this.pcsPcsPermit.pcsSwPermitId).subscribe(
            data => {
              this.lustGenericResult = data;
              this.showSubmitStatusDialog();            }
          );
        }
        // this.router.navigate([this.returnPath]);
      }
    });
  }

  onResetForm() {
    this.resetFormClicked = true;
    this.myForm.reset();
    this.myForm.markAsPristine();
    this.isPermitUpdate = false;
    if (this.isUpdate) {
      this.route.data.subscribe((data: {pcsPcsPermit: PcsPcsPermit}) => {
        this.pcsPcsPermit = data.pcsPcsPermit;
        this.logNumber = data.pcsPcsPermit.logNumber;
        if (data.pcsPcsPermit.pcsSwPermitId > 0) {
          this.isPermitUpdate = true;
        }
        const totalCubicYard = this.pcsPcsPermit.landfillAmtYrds3 + this.pcsPcsPermit.thermalAmtYrds3
        + this.pcsPcsPermit.onSiteAmtYrds3 +  this.pcsPcsPermit.offSiteAmtYrds3;
        this.myForm.controls.landFillAmount.setValue(this.pcsPcsPermit.landfillAmtYrds3);
        this.myForm.controls.treatmentAmount.setValue(this.pcsPcsPermit.thermalAmtYrds3);
        this.myForm.controls.landFillAmount.setValue(this.pcsPcsPermit.landfillAmtYrds3);
        this.myForm.controls.treatmentAmount.setValue(this.pcsPcsPermit.thermalAmtYrds3);
        this.myForm.controls.onSiteAmount.setValue(this.pcsPcsPermit.onSiteAmtYrds3);
        this.myForm.controls.offSiteAmount.setValue(this.pcsPcsPermit.offSiteAmtYrds3);
        this.myForm.controls.landFillAmount2.setValue(this.convertCubicYardToTon(this.pcsPcsPermit.landfillAmtYrds3));
        this.myForm.controls.treatmentAmount2.setValue(this.convertCubicYardToTon(this.pcsPcsPermit.thermalAmtYrds3));
        this.myForm.controls.onSiteAmount2.setValue(this.convertCubicYardToTon(this.pcsPcsPermit.onSiteAmtYrds3));
        this.myForm.controls.offSiteAmount2.setValue(this.convertCubicYardToTon(this.pcsPcsPermit.offSiteAmtYrds3));
        this.myForm.controls.disposalDate.setValue(this.pcsPcsPermit.disposalDate);
        this.myForm.controls.onSiteDisposalInd.setValue(this.pcsPcsPermit.onSiteDisposalInd);
        this.myForm.controls.offSiteDispAddr.setValue(this.pcsPcsPermit.offSiteDispAddr);
        this.myForm.controls.dispLandfillFacId.setValue(this.pcsPcsPermit.dispLandfillFacId);
        this.myForm.controls.dispThrmFacId.setValue(this.pcsPcsPermit.dispThrmFacId);
        this.myForm.controls.soilStatusId.setValue(this.pcsPcsPermit.soilStatusId);
        this.myForm.controls.comment.setValue(this.pcsPcsPermit.pcsComment);
        this.myForm.controls.lastChangeBy.setValue(this.pcsPcsPermit.lastChangeby);
        this.myForm.controls.lastChangeDate.setValue(this.transformDate(this.pcsPcsPermit.lastChangeDate));
        this.myForm.controls.swlaPermitNbr.setValue(this.pcsPcsPermit.swlaPermitNbr);
        this.myForm.controls.applReceivedDate.setValue(this.pcsPcsPermit.applReceivedDate);
        this.myForm.controls.issueDate.setValue(this.pcsPcsPermit.issueDate);
        this.myForm.controls.expirationDate.setValue(this.pcsPcsPermit.expirationDate);
        this.myForm.controls.permitExtensionDate.setValue(this.pcsPcsPermit.permitExtensionDate);
        this.myForm.controls.swFeeInd.setValue(this.pcsPcsPermit.swFeeInd);
        this.myForm.controls.landUseApproveInd.setValue(this.pcsPcsPermit.landUseApproveInd);
        this.myForm.controls.treatmentDescription.setValue(this.pcsPcsPermit.treatmentDescription);
        this.myForm.controls.pcsPermitLastChangeBy.setValue(this.pcsPcsPermit.pcsPermitLastChangeBy);
        this.myForm.controls.pcsPermitLastChangeDate.setValue(this.transformDate(this.pcsPcsPermit.pcsPermitLastChangeDate));
        this.myForm.controls.totalCubic.setValue(totalCubicYard);
        this.myForm.controls.totalTon.setValue(this.convertCubicYardToTon(totalCubicYard));
      });
    }

  }
  transformDate(inDate: Date): string {
    return this.datePipe.transform(inDate, 'MM/dd/yyyy');
  }
  convertCubicYardToTon(amt: number): number {
    if (amt > 0) {
      return (amt * 1.5);
    }
    return null;
  }
  convertTonToCubicYard(amt: number): number {
    if (amt > 0) {
      return (amt / 1.5);
    }
    return null;
  }

  updateTheOtheColumn(name: string, isTon: boolean) {
    const a = this.myForm.get(name).value.toString().trim();
    if (a && a !== null && a.length > 0) {
      if (isTon) {
        this.myForm.get(name.substr(0, (name.length) - 1)).setValue(this.convertTonToCubicYard(+a));
      } else {
        this.myForm.get(name + '2').setValue(this.convertCubicYardToTon(+a));
      }
      this.updateTotals();
    } else {
      if (isTon) {
        this.myForm.get(name.substr(0, (name.length) - 1)).setValue('');
      } else {
        this.myForm.get(name + '2').setValue('');
      }
      this.updateTotals();
    }

  }


  updateTotals() {
    let a = 0, b = 0, c = 0, d = 0, e = 0, f = 0;
    if (!isNaN(this.myForm.controls.landFillAmount.value)) {
      a = +this.myForm.controls.landFillAmount.value;
    }
    if (!isNaN(this.myForm.controls.treatmentAmount.value)) {
      b = +this.myForm.controls.treatmentAmount.value;
    }
    if (!isNaN(this.myForm.controls.offSiteAmount.value)) {
      c = +this.myForm.controls.offSiteAmount.value;
    }
    if (!isNaN(this.myForm.controls.onSiteAmount.value)) {
      d = +this.myForm.controls.onSiteAmount.value;
    }
    e = a + b + c + d;
    f = this.convertCubicYardToTon(e);
    if (e !== null && e > 0) {
      this.myForm.controls.totalCubic.setValue(e);
      this.myForm.controls.totalTon.setValue(f);
    } else {
      this.myForm.controls.totalCubic.setValue(null);
      this.myForm.controls.totalTon.setValue(null);
    }

  }


  soilStatusValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { pcsSoilStatusError: true };
    if (formGroup) {
      if (
            ((formGroup.controls.totalCubic.value === null
              || formGroup.controls.totalCubic.value === ''
              || formGroup.controls.totalCubic.value === 0 )
            &&
            (formGroup.controls.soilStatusId.value === null
              || formGroup.controls.soilStatusId.value  === ''
              || formGroup.controls.soilStatusId.value === 0))
          ||
            (+formGroup.controls.totalCubic.value > 0
              && +formGroup.controls.soilStatusId.value === 1)
      ) {
        formGroup.controls.soilStatusId.setErrors(error);
        return {
            pcsSoilStatusError: {
              pcsSoilStatusError: true
          }
        };
      }
    }
    formGroup.controls.soilStatusId.setErrors(null);
    return null;
  }

  landfillFacilityValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { landfillFacilityError: true };
    if (formGroup) {
      if (
            ((formGroup.controls.landFillAmount.value !== null
              && formGroup.controls.landFillAmount.value !== ''
              && formGroup.controls.landFillAmount.value > 0 )
            &&
            (formGroup.controls.dispLandfillFacId.value === null
              || formGroup.controls.dispLandfillFacId.value  === ''
              || formGroup.controls.dispLandfillFacId.value === 0))
      ) {
        formGroup.controls.dispLandfillFacId.setErrors(error);
        return {
          landfillFacilityError: {
            landfillFacilityError: true
          }
        };
      }
    }
    formGroup.controls.dispLandfillFacId.setErrors(null);
    return null;
  }

  landfillAmountValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { landfillAmountCrossCheckError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.landFillAmount.value !== ''
       && formGroup.controls.landFillAmount.value !== null
       && formGroup.controls.landFillAmount.value !== undefined ) {
        const value = (formGroup.controls.landFillAmount.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.landFillAmount.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.landFillAmount.value === null
              || formGroup.controls.landFillAmount.value === ''
              || (!(formGroup.controls.landFillAmount.value > 0) ))
            &&
            (formGroup.controls.dispLandfillFacId.value !== null
              && formGroup.controls.dispLandfillFacId.value  !== ''
              && formGroup.controls.dispLandfillFacId.value > 0)
      ) {
        formGroup.controls.landFillAmount.setErrors(error);
        return {
          landfillAmountCrossCheckError: {
            landfillAmountCrossCheckError: true
          }
        };
      }
    }
    formGroup.controls.landFillAmount.setErrors(null);
    return null;
  }

  landfillAmount2Validator(formGroup: FormGroup) {
    const error: ValidationErrors = { landfillAmountCrossCheckError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.landFillAmount2.value !== ''
       && formGroup.controls.landFillAmount2.value !== null
       && formGroup.controls.landFillAmount2.value !== undefined ) {
        const value = (formGroup.controls.landFillAmount2.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.landFillAmount2.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.landFillAmount2.value === null
              || formGroup.controls.landFillAmount2.value === ''
              || (!(formGroup.controls.landFillAmount2.value > 0) ))
            &&
            (formGroup.controls.dispLandfillFacId.value !== null
              && formGroup.controls.dispLandfillFacId.value  !== ''
              && formGroup.controls.dispLandfillFacId.value > 0)
      ) {
        formGroup.controls.landFillAmount2.setErrors(error);
        return {
          landfillAmountCrossCheckError: {
            landfillAmountCrossCheckError: true
          }
        };
      }
    }
    formGroup.controls.landFillAmount2.setErrors(null);
    return null;
  }

  treatmentFacilityValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { treatmentFacilityError: true };
    if (formGroup) {
      if (
            ((formGroup.controls.treatmentAmount.value !== null
              && formGroup.controls.treatmentAmount.value !== ''
              && formGroup.controls.treatmentAmount.value > 0 )
            &&
            (formGroup.controls.dispThrmFacId.value === null
              || formGroup.controls.dispThrmFacId.value  === ''
              || formGroup.controls.dispThrmFacId.value === 0))
      ) {
        formGroup.controls.dispThrmFacId.setErrors(error);
        return {
          treatmentFacilityError: {
            treatmentFacilityError: true
          }
        };
      }
    }
    formGroup.controls.dispThrmFacId.setErrors(null);
    return null;
  }

  treatmentAmountValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { treatmentAmountError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.treatmentAmount.value !== ''
       && formGroup.controls.treatmentAmount.value !== null
       && formGroup.controls.treatmentAmount.value !== undefined ) {
        const value = (formGroup.controls.treatmentAmount.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.treatmentAmount.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.treatmentAmount.value === null
              || formGroup.controls.treatmentAmount.value === ''
              || (!(formGroup.controls.treatmentAmount.value > 0) ))
            &&
            (formGroup.controls.dispThrmFacId.value !== null
              && formGroup.controls.dispThrmFacId.value  !== ''
              && formGroup.controls.dispThrmFacId.value > 0)
      ) {
        formGroup.controls.treatmentAmount.setErrors(error);
        return {
          treatmentAmountError: {
            treatmentAmountError: true
          }
        };
      }
    }
    formGroup.controls.treatmentAmount.setErrors(null);
    return null;
  }


  treatmentAmount2Validator(formGroup: FormGroup) {
    const error: ValidationErrors = { treatmentAmountError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.treatmentAmount2.value !== ''
       && formGroup.controls.treatmentAmount2.value !== null
       && formGroup.controls.treatmentAmount2.value !== undefined ) {
        const value = (formGroup.controls.treatmentAmount2.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.treatmentAmount2.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.treatmentAmount2.value === null
              || formGroup.controls.treatmentAmount2.value === ''
              || (!(formGroup.controls.treatmentAmount2.value > 0) ))
            &&
            (formGroup.controls.dispThrmFacId.value !== null
              && formGroup.controls.dispThrmFacId.value  !== ''
              && formGroup.controls.dispThrmFacId.value > 0)
      ) {
        formGroup.controls.treatmentAmount2.setErrors(error);
        return {
          treatmentAmountError: {
            treatmentAmountError: true
          }
        };
      }
    }
    formGroup.controls.treatmentAmount2.setErrors(null);
    return null;
  }

  onSiteDisposalIndValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { onSiteDisposalIndError: true };
    if (formGroup) {
      if (
            ((formGroup.controls.onSiteAmount.value !== null
              && formGroup.controls.onSiteAmount.value !== ''
              && formGroup.controls.onSiteAmount.value > 0 )
            &&
            (formGroup.controls.onSiteDisposalInd.value === null
              || formGroup.controls.onSiteDisposalInd.value  === ''
              || formGroup.controls.onSiteDisposalInd.value === false))
      ) {
        formGroup.controls.onSiteDisposalInd.setErrors(error);
        return {
          onSiteDisposalIndError: {
            onSiteDisposalIndError: true
          }
        };
      }
    }
    formGroup.controls.onSiteDisposalInd.setErrors(null);
    return null;
  }

  onSiteAmountValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { onSiteAmountError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.onSiteAmount.value !== ''
       && formGroup.controls.onSiteAmount.value !== null
       && formGroup.controls.onSiteAmount.value !== undefined ) {
        const value = (formGroup.controls.onSiteAmount.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.onSiteAmount.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.onSiteAmount.value === null
              || formGroup.controls.onSiteAmount.value === ''
              || (!(formGroup.controls.onSiteAmount.value > 0) ))
            &&
            (formGroup.controls.onSiteDisposalInd.value !== null
              && formGroup.controls.onSiteDisposalInd.value  !== ''
              && formGroup.controls.onSiteDisposalInd.value > 0)
      ) {
        formGroup.controls.onSiteAmount.setErrors(error);
        return {
          onSiteAmountError: {
            onSiteAmountError: true
          }
        };
      }
    }
    formGroup.controls.onSiteAmount.setErrors(null);
    return null;
  }

  onSiteAmount2Validator(formGroup: FormGroup) {
    const error: ValidationErrors = { onSiteAmountError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.onSiteAmount2.value !== ''
       && formGroup.controls.onSiteAmount2.value !== null
       && formGroup.controls.onSiteAmount2.value !== undefined ) {
        const value = (formGroup.controls.onSiteAmount2.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.onSiteAmount2.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.onSiteAmount2.value === null
              || formGroup.controls.onSiteAmount2.value === ''
              || (!(formGroup.controls.onSiteAmount2.value > 0) ))
            &&
            (formGroup.controls.onSiteDisposalInd.value !== null
              && formGroup.controls.onSiteDisposalInd.value  !== ''
              && formGroup.controls.onSiteDisposalInd.value > 0)
      ) {
        formGroup.controls.onSiteAmount2.setErrors(error);
        return {
          onSiteAmountError: {
            onSiteAmountError: true
          }
        };
      }
    }
    formGroup.controls.onSiteAmount2.setErrors(null);
    return null;
  }

  offSiteDispAddrValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { offSiteDispAddrError: true };
    if (formGroup) {
      if (
            ((formGroup.controls.offSiteAmount.value !== null
              && formGroup.controls.offSiteAmount.value !== ''
              && formGroup.controls.offSiteAmount.value > 0 )
            &&
            (formGroup.controls.offSiteDispAddr.value === null
              || formGroup.controls.offSiteDispAddr.value  === ''
              || formGroup.controls.offSiteDispAddr.value  === undefined))
      ) {
        formGroup.controls.offSiteDispAddr.setErrors(error);
        return {
          offSiteDispAddrError: {
            offSiteDispAddrError: true
          }
        };
      }
    }
    formGroup.controls.offSiteDispAddr.setErrors(null);
    return null;
  }

  offSiteAmountValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { offSiteAmountError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.offSiteAmount.value !== ''
       && formGroup.controls.offSiteAmount.value !== null
       && formGroup.controls.offSiteAmount.value !== undefined ) {
        const value = (formGroup.controls.offSiteAmount.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.offSiteAmount.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.offSiteAmount.value === null
              || formGroup.controls.offSiteAmount.value === ''
              || (!(formGroup.controls.offSiteAmount.value > 0) ))
            &&
            (formGroup.controls.offSiteDispAddr.value !== null
              && formGroup.controls.offSiteDispAddr.value  !== ''
              && formGroup.controls.offSiteDispAddr.value > 0)
      ) {
        formGroup.controls.offSiteAmount.setErrors(error);
        return {
          offSiteAmountError: {
            offSiteAmountError: true
          }
        };
      }
    }
    formGroup.controls.offSiteAmount.setErrors(null);
    return null;
  }

  offSiteAmount2Validator(formGroup: FormGroup) {
    const error: ValidationErrors = { offSiteAmountError: true };
    if (formGroup) {
      const NUMBER_REGEXP = /^[\d.]+(?:e-?\d+)?$/;
      if (formGroup.controls.offSiteAmount2.value !== ''
       && formGroup.controls.offSiteAmount2.value !== null
       && formGroup.controls.offSiteAmount2.value !== undefined ) {
        const value = (formGroup.controls.offSiteAmount2.value).toString().trim();
        if (value.length > 0) {
          if (!NUMBER_REGEXP.test(value)) {
            formGroup.controls.offSiteAmount2.setErrors({ unSignedNumberError: true });
            return {
                unSignedNumberError: {
                  unSignedNumberError: true
                }
            };
          }
        }
      }
      if (
            (formGroup.controls.offSiteAmount2.value === null
              || formGroup.controls.offSiteAmount2.value === ''
              || (!(formGroup.controls.offSiteAmount2.value > 0) ))
            &&
            (formGroup.controls.offSiteDispAddr.value !== null
              && formGroup.controls.offSiteDispAddr.value  !== ''
              && formGroup.controls.offSiteDispAddr.value > 0)
      ) {
        formGroup.controls.offSiteAmount2.setErrors(error);
        return {
          offSiteAmountError: {
            offSiteAmountError: true
          }
        };
      }
    }
    formGroup.controls.offSiteAmount2.setErrors(null);
    return null;
  }
  issueDateValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { issueDateError: true };
    if (formGroup) {
      const applReceivedDate = new Date(formGroup.controls.applReceivedDate.value);
      const issueDate = new Date(formGroup.controls.issueDate.value);
      if (applReceivedDate > issueDate && formGroup.controls.issueDate.value !== null) {
        formGroup.controls.issueDate.setErrors(error);
        return {
          issueDateError: {
            issueDateError: true
          }
        };
      }
    }
    formGroup.controls.issueDate.setErrors(null);
    return null;
  }


  expirationDateValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { expirationDateError: true };
    if (formGroup) {
      const expirationDate = new Date(formGroup.controls.expirationDate.value);
      const issueDate = new Date(formGroup.controls.issueDate.value);
      if ((expirationDate < issueDate && formGroup.controls.expirationDate.value !== null)
      || (formGroup.controls.issueDate.value === null && formGroup.controls.expirationDate.value !== null) ) {
        formGroup.controls.expirationDate.setErrors(error);
        return {
          expirationDateError: {
            expirationDateError: true
          }
        };
      }
    }
    formGroup.controls.expirationDate.setErrors(null);
    return null;
  }

  permitExtensionDateValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { permitExtensionDateError: true };
    if (formGroup) {
      const permitExtensionDate = new Date(formGroup.controls.permitExtensionDate.value);
      const issueDate = new Date(formGroup.controls.issueDate.value);
      if ((permitExtensionDate < issueDate && formGroup.controls.permitExtensionDate.value !== null)
      || (formGroup.controls.issueDate.value === null && formGroup.controls.permitExtensionDate.value !== null) ) {
        formGroup.controls.permitExtensionDate.setErrors(error);
        return {
          permitExtensionDateError: {
            permitExtensionDateError: true
          }
        };
      }
    }
    formGroup.controls.permitExtensionDate.setErrors(null);
    return null;
  }


  swlaPermitNbrValidator(formGroup: FormGroup) {
    const error: ValidationErrors = { swlaPermitNbrError: true };
    if (formGroup) {
      const modified = this.isPermitModified();
      if (modified) {
        this.myForm.controls.swlaPermitNbr.setErrors(error);
        return {
          swlaPermitNbrError: {
            swlaPermitNbrError: true
          }
        };
      }
    }
    this.myForm.controls.swlaPermitNbr.setErrors(null);
    return null;
  }

  isPermitModified(): boolean {
    if (
        (
          this.myForm.controls.swlaPermitNbr.pristine &&
          this.myForm.controls.swFeeInd.pristine && this.myForm.controls.landUseApproveInd.pristine &&
          this.myForm.controls.applReceivedDate.pristine && this.myForm.controls.issueDate.pristine &&
          this.myForm.controls.expirationDate.pristine && this.myForm.controls.permitExtensionDate.pristine
        )
        ||
        (
          this.isPermitUpdate &&
          this.myForm.controls.swlaPermitNbr.value === this.pcsPcsPermit.swlaPermitNbr &&
          this.myForm.controls.swFeeInd.value === this.pcsPcsPermit.swFeeInd &&
          this.myForm.controls.landUseApproveInd.value === this.pcsPcsPermit.landUseApproveInd &&
          this.myForm.controls.applReceivedDate.value === this.pcsPcsPermit.applReceivedDate &&
          this.myForm.controls.issueDate.value === this.pcsPcsPermit.issueDate &&
          this.myForm.controls.expirationDate.value === this.pcsPcsPermit.expirationDate &&
          this.myForm.controls.permitExtensionDate.value === this.pcsPcsPermit.permitExtensionDate
        )
        ||
        (
          !this.isPermitUpdate &&
          // this.myForm.controls.swlaPermitNbr.value === null &&
          this.myForm.controls.swFeeInd.value === null &&
          this.myForm.controls.landUseApproveInd.value === null &&
          this.myForm.controls.applReceivedDate.value === null &&
          this.myForm.controls.issueDate.value === null &&
          this.myForm.controls.expirationDate.value === null &&
          this.myForm.controls.permitExtensionDate.value === null
        )
        ) {
      return false;
    }
    if (this.myForm.controls.swlaPermitNbr.value !== null &&
      this.myForm.controls.swlaPermitNbr.value.toString().trim().length > 0) {
      return false;
    }
    return true;
  }
}
