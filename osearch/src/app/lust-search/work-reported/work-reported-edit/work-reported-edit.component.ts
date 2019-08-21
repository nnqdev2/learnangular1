import { Component, OnInit, AfterViewInit } from '@angular/core';
import { BehaviorSubject, Observable, Subject, of } from 'rxjs';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ApGetLogNumber } from 'src/app/models/apGetLogNumber';
import { GuardDialogComponent } from 'src/app/common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from 'src/app/common/dialogs/submit-status-dialog.component';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { WorkReported } from '../../../models/work-reported';
import { LustGenericResult } from 'src/app/models/lust-generic-result';
import { IncidentIdToNameService } from 'src/app/olprr-search/incident-id-to-name.service';
import { WorkReportedPost } from 'src/app/models/work-reported-post';
import { IdDescLookup } from 'src/app/models/id-desc-lookup';
import { SidDescLookup } from 'src/app/models/sid-desc-lookup';
import { debounceTime, switchMap, tap, finalize, map, catchError, startWith } from 'rxjs/operators';
import { SearchValue } from 'src/app/models/search-value';
import { DatePipe } from '@angular/common';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-work-reported-edit',
  templateUrl: './work-reported-edit.component.html',
  styleUrls: ['./work-reported-edit.component.scss']
})
export class WorkReportedEditComponent implements OnInit {
    guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
    submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
    confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
    private myForm: FormGroup;
    private workReported: WorkReported;
    private workTypes: IdDescLookup[];
    private workReportedBys: SidDescLookup[];
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
    private workReportedPost = new WorkReportedPost();
    private loadingSubject = new BehaviorSubject<boolean>(false);
    public loading$ = this.loadingSubject.asObservable();
    maxDate: Date;
    public wrbs$: Observable<SearchValue[]> = null;
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
      this.route.data.subscribe((data: {workTypes: IdDescLookup[]}) => {this.workTypes = data.workTypes; });
      this.route.data.subscribe((data: {workReportedBys: SidDescLookup[]}) => {this.workReportedBys = data.workReportedBys; });
      this.route.pathFromRoot[2].params.subscribe(params => {
        this.lustId = +params['lustid'];
      });
      this.route.params.subscribe(params => {
        this.wrId = +params['wrid'];
      });
      const formTitle = 'Work Reported ';
      this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
        this.logNumber = data.apGetLogNumber.logNumber;
        this.siteName = data.apGetLogNumber.siteName;
      });
      if (isNaN(this.wrId)) {
        this.isUpdate = false;
        this.wrId = 0;
        this.formTitle = 'Add ' + formTitle;
      } else {
        this.route.data.subscribe((data: {workReported: WorkReported}) => {
          this.workReported = data.workReported; this.logNumber = this.workReported.logNumber; });
        this.isUpdate = true;
        this.formTitle = 'Update ' + formTitle;
      }
      this.formTitle = `${this.formTitle} ${this.logNumber} ${this.siteName}`;
      this.returnPath = 'lust/' + this.lustId + '/wrs';
      if (this.isUpdate) {
        this.myForm = this.formBuilder.group({
          wrkType: [this.workReported.workTypeId, Validators.required],
          wrkDate: [this.workReported.wrkDate, Validators.required],
          workBy: [this.workReported.workBy + ' (' + this.workReported.sidWorkBy + ')', Validators.required],
          comment: [this.workReported.comment, Validators.maxLength(8000)],
          lastChangeBy: [{value: this.workReported.lastChangeBy, disabled: true}],
          lastChangeDate:  [{value: this.transformDate(this.workReported.lastChangeDate), disabled: true}],
        },
        {validator: [] }
        );
      } else {
          this.myForm = this.formBuilder.group({
            wrkType: ['', Validators.required],
            wrkDate: ['', Validators.required],
            workBy: ['', Validators.required],
            comment: ['', Validators.maxLength(8000)],
          },
          {validator: [] }
          );
      }
      this.maxDate = new Date();
      this.maxDate.setDate( this.maxDate.getDate());
      this.wrbs$ = this.myForm.controls.workBy.valueChanges.pipe(
        startWith(''),
        debounceTime(300),
        switchMap(value => {
            return this.lookupWrb(encodeURIComponent(value));
        })
      );
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
        this.workReportedPost.workReportedDate = this.myForm.controls.wrkDate.value;
        // this.workReportedPost.lastChangeBy = this.myForm.controls.lastChangeBy.value;
        this.workReportedPost.lastChangeBy = this.authService.getUserIdWoDomain();
        this.workReportedPost.lustId = this.lustId;
        this.workReportedPost.workReportedId = this.wrId;
        this.workReportedPost.workReportedTypeId = this.myForm.controls.wrkType.value;
        this.workReportedPost.comment = this.myForm.controls.comment.value;
        this.setWrbId(this.myForm.controls.workBy.value);
        this.lustDataService.insUpdWorkReported(this.workReportedPost)
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
        message1: 'Are you sure you want to delete ' + this.workReported.workBy + ' ?' ,
      };
      dialogConfig.disableClose =  true;
      this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
      this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
        if (result === 'confirm') {
          this.lustDataService.delWorkReported(this.workReported.wrId).subscribe();
          this.router.navigate([this.returnPath]);
        }
      });
    }

    onResetForm() {
      this.resetFormClicked = true;
      this.myForm.reset();
      this.myForm.markAsPristine();
      if (this.isUpdate) {
        this.route.data.subscribe((data: {workReported: WorkReported}) => {
          this.workReported = data.workReported; this.logNumber = this.workReported.logNumber;
          this.myForm.controls.wrkType.setValue(this.workReported.workTypeId);
          this.myForm.controls.wrkDate.setValue(this.workReported.wrkDate);
          this.myForm.controls.workBy.setValue(this.workReported.workBy + ' (' + this.workReported.sidWorkBy + ')');
          this.myForm.controls.comment.setValue(this.workReported.comment);
          this.myForm.controls.lastChangeBy.setValue(this.workReported.lastChangeBy);
          this.myForm.controls.lastChangeDate.setValue(this.transformDate(this.workReported.lastChangeDate));
      });
      }
    }

    lookupWrb(value: string): Observable<SearchValue[]> {
      return this.lustDataService.searchWorkReportedBys(value).pipe(
        map(results => results),
        catchError(error => {
          console.log(error);
          return of(null);
        })
      );
    }

    private setWrbId(value: string): void {
      this.workReportedPost.oraReid = 0;
      this.workReportedPost.oraConsultantId = 0;
      const wrbValue = value.substring(value.lastIndexOf('(') + 1, value.lastIndexOf(')'));
      if (wrbValue.length > 2) {
        const wrbId = wrbValue.substring(2, wrbValue.length);
        if (wrbValue.substring(0, 2) === 'RE') {
          this.workReportedPost.oraReid = +wrbId;
        }
        if (wrbValue.substring(0, 2) === 'CN') {
          this.workReportedPost.oraConsultantId = +wrbId;
        }
      }
    }

    transformDate(inDate: Date): string {
      return this.datePipe.transform(inDate, 'MM/dd/yyyy');
    }



  }
