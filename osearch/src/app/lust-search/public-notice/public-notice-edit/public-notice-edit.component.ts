import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { GuardDialogComponent } from 'src/app/common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from 'src/app/common/dialogs/submit-status-dialog.component';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { FormGroup, FormBuilder, Validators, AbstractControl } from '@angular/forms';
import { PublicNotice } from 'src/app/models/public-notice';
import { IdDescLookup } from 'src/app/models/id-desc-lookup';
import { SidDescLookup } from 'src/app/models/sid-desc-lookup';
import { LustGenericResult } from 'src/app/models/lust-generic-result';
import { PublicNoticePost } from 'src/app/models/public-notice-post';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import { IncidentIdToNameService } from 'src/app/olprr-search/incident-id-to-name.service';
import { ApGetLogNumber } from 'src/app/models/apGetLogNumber';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-public-notice-edit',
  templateUrl: './public-notice-edit.component.html',
  styleUrls: ['./public-notice-edit.component.scss']
})
export class PublicNoticeEditComponent implements OnInit {

  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  private myForm: FormGroup;
  private publicNotice: PublicNotice;
  private publicNoticeTypes: IdDescLookup[];
  private publicNoticeBys: SidDescLookup[];
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
  private wrId = 0;
  private isUpdate = false;
  private returnPath: string;
  private logNumber: string;
  private siteName: string;
  private formTitle: string;
  private publicNoticePost = new PublicNoticePost();
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
    this.route.data.subscribe((data: {publicNoticeTypes: IdDescLookup[]}) => {this.publicNoticeTypes = data.publicNoticeTypes; });
    this.route.data.subscribe((data: {publicNoticeBys: SidDescLookup[]}) => {this.publicNoticeBys = data.publicNoticeBys; });
    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.params.subscribe(params => {
      this.wrId = +params['pnid'];
    });
    const formTitle = 'Public Notice ';
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.logNumber = data.apGetLogNumber.logNumber;
      this.siteName = data.apGetLogNumber.siteName;
    });
    if (isNaN(this.wrId)) {
      this.isUpdate = false;
      this.wrId = 0;
      this.formTitle = 'Add ' + formTitle;
    } else {
      this.route.data.subscribe((data: {publicNotice: PublicNotice}) => {
        this.publicNotice = data.publicNotice; this.logNumber = this.publicNotice.logNumber; });
      this.isUpdate = true;
      this.formTitle = 'Update ' + formTitle;
    }
    this.formTitle = `${this.formTitle} ${this.logNumber} ${this.siteName}`;
    this.returnPath = 'lust/' + this.lustId + '/pns';
    if (this.isUpdate) {
      this.myForm = this.formBuilder.group({
        publicNoticeType: [this.publicNotice.publicNoticeTypeId, Validators.required],
        publicNoticeDate: [this.publicNotice.publicNoticeDate, Validators.required],
        meetingDate: [this.publicNotice.meetingDate],
        meetingRqstInd: [this.publicNotice.meetingRqstInd],
        comment: [this.publicNotice.comment, Validators.maxLength(8000)],
        lastChangeBy: [{value: this.publicNotice.lastChangeBy, disabled: true}],
        lastChangeDate:  [{value: this.transformDate(this.publicNotice.lastChangeDate), disabled: true}],
      },
      {validator: [this.meetingDateValidation.bind(this),
        this.publicNoticeDateValidation.bind(this)] }
      );
    } else {
        this.myForm = this.formBuilder.group({
          publicNoticeType: ['', Validators.required],
          publicNoticeDate: ['', Validators.required],
          meetingDate: [''],
          meetingRqstInd: [false],
          comment: ['', Validators.maxLength(8000)],
          lastChangeBy: [],
          lastChangeDate:  [],

        },
        {validator: [this.meetingDateValidation.bind(this),
          this.publicNoticeDateValidation.bind(this)] }
        );
    }
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
      this.publicNoticePost.publicNoticeDate = this.myForm.controls.publicNoticeDate.value;
      this.publicNoticePost.meetingDate = this.myForm.controls.meetingDate.value;
      this.publicNoticePost.meetingRqstInd = this.myForm.controls.meetingRqstInd.value;
      // this.publicNoticePost.lastChangeBy = this.myForm.controls.lastChangeBy.value;
      this.publicNoticePost.lastChangeBy = this.authService.getUserIdWoDomain();
      this.publicNoticePost.lustId = this.lustId;
      this.publicNoticePost.publicNoticeId = this.wrId;
      this.publicNoticePost.publicNoticeTypeId = this.myForm.controls.publicNoticeType.value;
      this.publicNoticePost.comment = this.myForm.controls.comment.value;
      this.lustDataService.insUpdPublicNotice(this.publicNoticePost)
        .subscribe(
          (data ) => (
            this.lustGenericResult = data,
            this.showSubmitStatusDialog()),
        );
    } else if (this.myForm.invalid) {
        this.errors = this.findInvalidControls();
        console.log('this.errors');
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
      title = 'Successfully saved ' + this.lustGenericResult.id;
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

  onDelete() {
    this.deleteClicked = true;
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete ' + this.publicNotice.description + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delPublicNotice(this.publicNotice.publicNoticeId).subscribe();
        this.router.navigate([this.returnPath]);
      }
    });
  }

  onResetForm() {
    this.resetFormClicked = true;
    this.myForm.reset();
    this.myForm.markAsPristine();
    if (this.isUpdate) {
      this.route.data.subscribe((data: {publicNotice: PublicNotice}) => {
        this.publicNotice = data.publicNotice; this.logNumber = this.publicNotice.logNumber;
        this.myForm.controls.publicNoticeType.setValue(this.publicNotice.publicNoticeTypeId);
        this.myForm.controls.publicNoticeDate.setValue(this.publicNotice.publicNoticeDate);
        this.myForm.controls.meetingDate.setValue(this.publicNotice.meetingDate);
        this.myForm.controls.meetingRqstInd.setValue(this.publicNotice.meetingRqstInd);
        this.myForm.controls.comment.setValue(this.publicNotice.comment);
        this.myForm.controls.lastChangeBy.setValue(this.publicNotice.lastChangeBy);
        this.myForm.controls.lastChangeDate.setValue(this.transformDate(this.publicNotice.lastChangeDate));
    });
    }
  }



  transformDate(inDate: Date): string {
    return this.datePipe.transform(inDate, 'MM/dd/yyyy');
  }

  meetingDateValidation(control: AbstractControl) {
    const meetingDateControl = control.get('meetingDate');
    const publicNoticeDateControl = control.get('publicNoticeDate');
    const meetingDate = new Date(meetingDateControl.value).setHours(0, 0, 0, 0);
    const publicNoticeDate = new Date(publicNoticeDateControl.value).setHours(0, 0, 0, 0);
    if (meetingDate < publicNoticeDate ) {
      meetingDateControl.setErrors({'meetingDateError': true});
      return {
        meetingDateError: {
          meetingDateError: true
        }
      };
    }
    meetingDateControl.setErrors(null);
    return null;
  }

  publicNoticeDateValidation(control: AbstractControl) {
    const meetingDateControl = control.get('meetingDate');
    const publicNoticeDateControl = control.get('publicNoticeDate');
    const meetingDate = new Date(meetingDateControl.value).setHours(0, 0, 0, 0);
    const publicNoticeDate = new Date(publicNoticeDateControl.value).setHours(0, 0, 0, 0);
    if (publicNoticeDate > meetingDate ) {
      publicNoticeDateControl.setErrors({'publicNoticeDateError': true});
      return {
        publicNoticeDateError: {
          publicNoticeDateError: true
        }
      };
    }
    publicNoticeDateControl.setErrors(null);
    return null;
  }

}

