import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { FormGroup, FormBuilder, Validators, AbstractControl } from '@angular/forms';

import { GuardDialogComponent } from '../../../common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from '../../../common/dialogs/submit-status-dialog.component';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { LustDataService } from '../../../services/lust-data.service';
import { IncidentIdToNameService } from '../../../olprr-search/incident-id-to-name.service';
import { State } from '../../../models/state';
import { SearchDialogComponent } from '../../search-dialog/search-dialog.component';
import { Consultant } from '../../../models/consultant';
import { ConsultantPostResult } from '../../../models/consultant-post-result';
import { DatePipe } from '@angular/common';
import { AuthService, AuthLevel } from '../../../services/auth.service';
import { Constants } from '../../../constants';


@Component({
  selector: 'app-consultant-edit',
  templateUrl: './consultant-edit.component.html',
  styleUrls: ['./consultant-edit.component.scss']
})
export class ConsultantEditComponent implements OnInit {

  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  private consultantForm: FormGroup;
  private consultantGet: Consultant;
  currentDate: Date;
  errorMessage: string;
  private states: State[];
  private submitClicked = false;
  private resetFormClicked = false;
  private formUpdated = false;
  private deleteClicked = false;
  private cancelClicked = false;
  private errors: any[];
  private lustId = 0;
  private consultantId = 0;
  private isUpdate = false;
  private success = false;
  private returnPath: string;
  private logNumber: string;
  private formTitle: string;
  private consultant = new Consultant();
  private consultantPostResult: ConsultantPostResult;
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  private phoneNumbersOnly: string;
  public phonePlaceHolder = Constants.phone_place_holder;
  authLevel: AuthLevel;
  viewOnly = false;
  returnToList = Constants.returnToList;

  maxDate: Date;

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router, private datePipe: DatePipe
    , private canDeactivateDialog: MatDialog, private submitStatusDialog: MatDialog
    , private confirmDeleteDialog: MatDialog, private idToNameService: IncidentIdToNameService
    , private authService: AuthService
  ) {  }

  ngOnInit() {
    this.loadingSubject.next(true);
    this.setAuthLevel();
    this.setViewOnly();
    this.route.data.subscribe((data: {states: State[]}) => {this.states = data.states; });

    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.params.subscribe(params => {
      this.consultantId = +params['consultantid'];
    });
    if (isNaN(this.consultantId)) {
      this.isUpdate = false;
      this.consultantId = 0;
      this.formTitle = 'Add New Consultant ';
      this.buildAddForm();
    } else {
      this.route.data.subscribe((data: {consultant: Consultant}) => {
        this.consultantGet = data.consultant;
        this.isUpdate = true;
        this.formTitle = 'Update Consultant Details  ';
        this.buildUpdateForm();
      });
    }
    this.returnPath = 'lust/' + this.lustId + '/cssearch';
    this.maxDate = new Date();
    this.maxDate.setDate( this.maxDate.getDate());
    this.disableForm();
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
      this.consultantForm.disable();
    }
  }

  private buildUpdateForm() {
    this.consultantForm = this.formBuilder.group({
      companyName: [this.consultantGet.companyName, Validators.required],
      address: [this.consultantGet.address, Validators.required],
      city:   [this.consultantGet.city, Validators.required],
      state: [this.consultantGet.state, Validators.required],
      zip: [this.consultantGet.zipCode, Validators.compose([Validators.required, Validators.maxLength(10)
        , , Validators.pattern(Constants.zip_format)])],
      phone:   [this.consultantGet.phone, Validators.compose([Validators.required, Validators.maxLength(40)])],
      email:   [this.consultantGet.email, Validators.compose([Validators.email, Validators.maxLength(40)])],
      fax:   [this.consultantGet.fax, Validators.compose([Validators.maxLength(40)])],
      lastChangeBy:   [{value: this.consultantGet.lastChangeBy, disabled: true}],
      lastChangeDate: [{value: this.transformDate(this.consultantGet.lastChangeDate), disabled: true}],
    },
    {validator: [  this.phoneNumberValidation.bind(this),
      this.faxNumberValidation.bind(this) ] }

    );
  }

  private buildAddForm() {
    this.consultantForm = this.formBuilder.group({
      companyName: ['', Validators.required],
      address: ['', Validators.required],
      city:   ['', Validators.required],
      state: ['', Validators.required],
      zip: ['', Validators.compose([Validators.required, Validators.maxLength(10)
        , Validators.pattern(Constants.zip_format)])],
        phone:   ['', Validators.compose([Validators.required, Validators.maxLength(40)])],
      email:   ['',  Validators.compose([Validators.email, Validators.maxLength(40)])],
      fax:   ['', Validators.compose([ Validators.maxLength(40)])],
      lastChangeBy:   [],
      lastChangeDate:   [],

    },
    {validator: [] }
    );
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
    if (
      (this.isActionSelected()) ||
      (this.consultantForm.pristine  && !this.formUpdated)
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

  private findInvalidControls() {
    const invalid = [];
    for (const field of Object.keys(this.consultantForm.controls)) {
        if (this.consultantForm.controls[field].invalid) {
            const name = this.idToNameService.getName(field);
            invalid.push(name + ' is required and must be valid.');
        }
    }

    // const contaminantErrorMessage = this.getContaminantErrorMessage();
    // if (contaminantErrorMessage != null) {
    //   invalid.push(contaminantErrorMessage);
    // }

    // const mediaErrorMessage = this.getMediaErrorMessage();
    // if (mediaErrorMessage != null) {
    //   invalid.push(mediaErrorMessage);
    // }

    return invalid;
  }

  submit(): void {
    this.submitClicked = true;
    if (this.consultantForm.dirty && this.consultantForm.valid) {
      this.setModelToFormData();
      this.lustDataService.insUpdConsultant(this.consultant)
        .subscribe(
          (data ) => (
            this.consultantPostResult = data
            , this.showSubmitStatusDialog()),
        );
    } else if (this.consultantForm.invalid) {
        // this.errors = this.findInvalidControls();
        // console.log('this.errors');
        // console.log(this.errors);
    }
  }

  private showSubmitStatusDialog() {
    let message1 = '';
    let title = '';
    const button1 = 'Close';
    if (this.consultantPostResult.errorMessageHandler !== undefined &&
      this.consultantPostResult.errorMessageHandler !== null &&
      this.consultantPostResult.errorMessageHandler.length > 0 ) {
      title = 'Error  ' + this.consultantPostResult.errorMessageHandler ;
      message1 = this.consultantPostResult.errorMessageHandler;
      this.success = false;
    } else {
      title = 'Success  ' + this.consultantPostResult.consultantIdOut;
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

  private setModelToFormData() {
    this.consultant.companyName = this.consultantForm.controls.companyName.value;
    this.consultant.address = this.consultantForm.controls.address.value;
    this.consultant.city = this.consultantForm.controls.city.value;
    this.consultant.state = this.consultantForm.controls.state.value;
    this.consultant.zipCode = this.consultantForm.controls.zip.value;
    this.consultant.phone = this.consultantForm.controls.phone.value;
    this.consultant.email = this.consultantForm.controls.email.value;
    this.consultant.fax = this.consultantForm.controls.fax.value;
    this.consultant.consultantId = this.consultantId;
    this.consultant.lastChangeBy = this.authService.getUserIdWoDomain();
  }



  cancel() {
    this.cancelClicked = true;
    this.router.navigate([this.returnPath]);
  }

  onDelete() {
    this.deleteClicked = true;
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete  ' + this.consultantGet.companyName + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delConsultant(this.consultantGet.consultantId)
          .subscribe(
            (data ) => (
              this.consultantPostResult = data
              , this.showSubmitStatusDialog()),
          );
      }
    });
  }

  resetForm() {
    this.resetFormClicked = true;
    this.consultantForm.reset();
    this.consultantForm.markAsPristine();
    if (this.isUpdate) {
      this.route.data.subscribe((data: {consultant: Consultant}) => {
        this.consultantGet = data.consultant;
        this.buildUpdateForm();
    });
    }
  }

  transformDate(inDate: Date): string {
    return this.datePipe.transform(inDate, 'MM/dd/yyyy');
  }

  phoneNumberValidation(control: AbstractControl) {
    const phoneNumberControl = control.get('phone');
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

  faxNumberValidation(control: AbstractControl) {
    const phoneNumberControl = control.get('fax');
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




}
