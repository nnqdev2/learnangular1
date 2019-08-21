import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { FormGroup, FormBuilder, Validators, FormControl } from '@angular/forms';

import { GuardDialogComponent } from '../../../common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from '../../../common/dialogs/submit-status-dialog.component';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { LustDataService } from '../../../services/lust-data.service';
import { IncidentIdToNameService } from '../../../olprr-search/incident-id-to-name.service';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { ProjectManagerPost } from '../../../models/project-manager-post';
import { ProjectManagerPostResult } from '../../../models/project-manager-post-result';
import { ProjectManagerGet} from '../../../models/project-manager-get';
import { ManagerSearchResultStat } from '../../../models/manager-search-result-stat';
import { ProjectManagerHistIdGet} from '../../../models/project-manager-histid-get';
import { DatePipe, getLocaleDateFormat } from '@angular/common';
import { ProjectManager } from '../../../models/project-manager';
import { ProjectManagersResolver } from '../../../resolvers/project-managers-resolver.service';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';
import { PmActive } from 'src/app/models/pm-active';

@Component({
  selector: 'app-project-manager-edit',
  templateUrl: './project-manager-edit.component.html',
  styleUrls: ['./project-manager-edit.component.scss']
})
export class ProjectManagerEditComponent implements OnInit {
  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  private apGetLogNumber: ApGetLogNumber;
  private projectManagerForm: FormGroup;
  private projectManagerHistIdGet: ProjectManagerHistIdGet;
  private projectManagerGet: ProjectManagerGet;
  private projectManagerPost = new ProjectManagerPost();
  private projectManagerPostResult: ProjectManagerPostResult;
  private ManagerSearchResultStat: ManagerSearchResultStat;
  private projectManagers: ProjectManager[];
  private projectManagersResolver: ProjectManagersResolver;
  private lustId = 0;
  private projMgrHistId = 0;
  private logNumber: string;
  private returnPath: string;
  private formTitle: string;
  private todaysDate: Date;
  private isUpdate = false;
  private formUpdate = false;
  private submitClicked = false;
  private resetFormClicked = false;
  private deleteClicked = false;
  private cancelClicked = false;
  private success = false;
  private errors: any[];
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  private lognumber: string;
  private showUnameDrpFlag = false;
  private showUnametxtBoxFlag = false;
  authLevel: AuthLevel;
  viewOnly = false;
  returnToList = Constants.returnToList;
  maxDate: Date;
  pmActives: PmActive[];

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router, private datePipe: DatePipe
    , private canDeactivateDialog: MatDialog, private confirmDeleteDialog: MatDialog
    , private idToNameService: IncidentIdToNameService, private submitStatusDialog: MatDialog
    , private authService: AuthService
  ) {  }

  ngOnInit() {
    // console.log('Project Manager ngOnInit');
    this.maxDate = new Date();
    this.todaysDate = new Date();
    this.todaysDate.setDate( this.todaysDate.getDate());

    this.loadingSubject.next(true);
    this.setAuthLevel();
    this.setViewOnly();
    this.route.data.subscribe((data: {pmActives: PmActive[]}) => {this.pmActives = data.pmActives; });
    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });

    this.route.params.subscribe(params => {
      this.projMgrHistId = +params['projMgrHistId'];
    });

    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.apGetLogNumber = data.apGetLogNumber;
      this.logNumber = data.apGetLogNumber.logNumber;
     });

    if (isNaN(this.projMgrHistId) ) {
      this.isUpdate = false;
      this.showUnameDrpFlag = true;
      this.showUnametxtBoxFlag = false;
      this.projMgrHistId = 0;
      this.formTitle = 'Add New Project Manager ';
      this.AddForm();
      this.disableForm();
      } else {
        this.showUnameDrpFlag = false;
        this.showUnametxtBoxFlag = true;
        this.route.data.subscribe((data: {projectManagerHistIdGet: ProjectManagerHistIdGet}) => {
          this.projectManagerHistIdGet = data.projectManagerHistIdGet; this.logNumber = this.projectManagerHistIdGet.logNumber;
          this.isUpdate = true;
          this.formTitle = 'Update Project Manager ';
           this.UpdateForm();
           this.disableForm();
       }) ;
    }
    this.formTitle = `${this.formTitle} ${this.logNumber} ${this.apGetLogNumber.siteName}`;
    this.returnPath = 'lust/' + this.lustId + '/projectmanagers';
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
      this.projectManagerForm.disable();
    }
  }

  transformDate(inDate: Date): string {
    return this.datePipe.transform(inDate, 'MM/dd/yyyy');
  }
  submit(): void {
    this.submitClicked = true;
    if (this.projectManagerForm.dirty && this.projectManagerForm.valid) {
      this.setModelToFormData();
      this.lustDataService.updateLustProjectManager(this.projectManagerPost)
        .subscribe(
          (data ) => (
            this.projectManagerPostResult = data
            , this.showSubmitStatusDialog()),
        );
    } else if (this.projectManagerForm.invalid) {
        this.errors = this.findInvalidControls();
        console.log('this.errors');
        console.log(this.errors);
    }
  }

  private setModelToFormData() {
    this.projectManagerPost.projMgrHistId = this.projMgrHistId;
    this.projectManagerPost.lustId = this.lustId;
    this.setUserNameToFormData();
    this.projectManagerPost.assignedDate = this.projectManagerForm.controls.assignedDate.value;
    this.projectManagerPost.endDate = this.projectManagerForm.controls.endDate.value;
    this.projectManagerPost.lastChangeBy = this.authService.getUserIdWoDomain();
  }

  private setUserNameToFormData() {
    if (this.showUnameDrpFlag === true) {
      this.projectManagerPost.pmLogin = this.projectManagerForm.controls.uName.value;
    } else if (this.showUnametxtBoxFlag === true) {
      this.projectManagerPost.pmLogin = this.projectManagerForm.controls.userName.value;
    }
  }

  private UpdateProjectManager(managerSearchResultStat: ManagerSearchResultStat) {
    this.projectManagerForm.controls.userName.setValue(managerSearchResultStat.userName);
    this.projectManagerForm.controls.assignedDate.setValue(managerSearchResultStat.assignedDate);
    this.projectManagerForm.controls.endDate.setValue(managerSearchResultStat.endDt);
    this.projectManagerForm.controls.lastChangeBy.setValue(managerSearchResultStat.lastChangeBy);
    this.projectManagerForm.controls.lastChangeDate.setValue(managerSearchResultStat.lastChangeDate);
    this.projectManagerForm.controls.uName.setValue(managerSearchResultStat.userName);
    this.formUpdate = true;
   }

  private findInvalidControls() {
    const invalid = [];
    for (const field of Object.keys(this.projectManagerForm.controls)) {
        if (this.projectManagerForm.controls[field].invalid) {
            const name = this.idToNameService.getName(field);
            invalid.push(name + ' is required and must be valid.');
        }
    }
     return invalid;
  }

  private resetForm() {
    this.resetFormClicked = true;
    this.projectManagerForm.reset();
    this.projectManagerForm.markAsPristine();
    if (this.isUpdate) {
      this.route.data.subscribe((data: {projectManagerGet: ProjectManagerGet}) => {
        this.projectManagerGet = data.projectManagerGet;
        this.UpdateForm();
      });
    }
  }

  cancel() {
    this.cancelClicked = true;
    this.router.navigate([this.returnPath]);
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
      (this.projectManagerForm.pristine  && !this.formUpdate)
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

  private showSubmitStatusDialog() {
    let message = '';
    let title = '';
    const button = 'Close';
    if (this.projectManagerPostResult.errorMessageHandler !== undefined &&
      this.projectManagerPostResult.errorMessageHandler !== null &&
      this.projectManagerPostResult.errorMessageHandler.length > 0 ) {
      title = 'Failed to save due to ' + this.projectManagerPostResult.errorMessageHandler ;
      message = this.projectManagerPostResult.errorMessageHandler;
      this.success = false;
    } else {
      title = 'Successfully saved ' + this.projectManagerPostResult.id;
      this.success = true;
    }
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: title,
      message: message,
      button1: button,
    };
    dialogConfig.disableClose =  true;
    this.submitStatusDialogRef = this.submitStatusDialog.open(SubmitStatusDialogComponent, dialogConfig);
    this.submitStatusDialogRef.afterClosed().subscribe(() => {
      if (this.success) {
        this.router.navigate([this.returnPath]);
      }
    });
  }

  private UpdateForm() {
    if (this.showUnametxtBoxFlag === true) {
      this.projectManagerForm = this.formBuilder.group({
        userName:  [{value: (this.projectManagerHistIdGet.userName), disabled: true} ],
        assignedDate:   [this.projectManagerHistIdGet.assignedDate, Validators.required],
        endDate:   [this.projectManagerHistIdGet.endDate],
        lastChangeBy: [{value: (this.projectManagerHistIdGet.lastChangeBy), disabled: true} ],
        lastChangeDate: [{value: (this.transformDate(this.projectManagerHistIdGet.lastChangeDate)), disabled: true} ],
      },
      {validator: [] }
      );
    }
  }

  private AddForm() {
    if (this.showUnameDrpFlag === true) {
      this.projectManagerForm = this.formBuilder.group({
        uName: ['', Validators.required],
        assignedDate: ['', Validators.required],
        endDate: [''],
        lastChangeBy: [{value: this.authService.getUserIdWoDomain(), disabled: true}],
        lastChangeDate:  [{value: this.todaysDate, disabled: true}]
      },
      {validator: [] }
      );
    }
  }
}
