import { Component, OnInit, AfterViewInit, OnChanges, DoCheck } from '@angular/core';
import { Observable, Subject, BehaviorSubject, iif} from 'rxjs';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialogConfig, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { GuardDialogComponent } from '../../../common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from '../../../common/dialogs/submit-status-dialog.component';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { FormGroup, FormBuilder, Validators, AbstractControl } from '@angular/forms';
import { IncidentValidators } from '../../../validators/incident.validator';  //  '../../validators/incident.validator';
import { LustDataService } from '../../../services/lust-data.service';
import { LustSiteControlGet } from '../../../models/lust-site-control-get';
import { SiteControlType } from '../../../models/lust-site-control-type';
import { ProjectManager } from '../../../models/project-manager';
import { LustSiteControlDescriptionEngineeringType } from '../../../models/lust-site-control-description-engineering-type';
import { LustSiteControlDescriptionInstitutionalType } from '../../../models/lust-site-control-description-institutional-type';
import { IncidentIdToNameService } from '../../../olprr-search/incident-id-to-name.service';
import { LustScoringRangeGet } from 'src/app/models/lust-scoring-range-get';
import { RealSiteControlTypes } from '../../../models/site-control-type';
import { SiteControlPostResult } from '../../../models/site-control-post-result';
import { SiteControlPost } from 'src/app/models/site-control-post';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';
import { PmActive } from 'src/app/models/pm-active';


@Component({
  selector: 'app-site-control-edit',
  templateUrl: './site-control-edit.component.html',
  styleUrls: ['./site-control-edit.component.scss']
})





export class SiteControlEditComponent implements OnInit, AfterViewInit, OnChanges, DoCheck {
  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;



  // siteControl: LustScoringRangeGet;
  logNumber: string;
  siteName: string;
  private lustId = 0;
  private siteControlId = 0;
  private maxDate: Date;
  siteControlPostResult: SiteControlPostResult;
  lustSiteControlGet: LustSiteControlGet|null;
  siteControlPost = new SiteControlPost();
  siteControlTypes: SiteControlType[] = [];
  projectManagers: ProjectManager[] = [];
  controlEngineeringTypes: RealSiteControlTypes[] = [];
  controlInstitutionalTypes: RealSiteControlTypes[] = [];
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  private siteControlForm: FormGroup;
  private deleteClicked = false;
  private returnPath: string;
  private theRealControlTypes: RealSiteControlTypes[];
  private submitClicked = false;
  private errors: any[];
  private success = false;
  private cancelClicked = false;
  isClosed = true;
  showAllErrorsMessages = false;
  authLevel: AuthLevel;
  viewOnly = false;
  returnToList = Constants.returnToList;
  pmActives: PmActive[];

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder, private route: ActivatedRoute,
    private router: Router, private confirmDeleteDialog: MatDialog, private submitStatusDialog: MatDialog,
    private idToNameService: IncidentIdToNameService, private authService: AuthService) { }




  ngOnInit() {
    this.loadingSubject.next(true);
    this.setAuthLevel();
    this.setViewOnly();
    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.params.subscribe(params => {
      this.siteControlId = +params['scid'];
    });
    // this.route.params.subscribe(params => {
    //   this.siteControlId = +params['sitecontrolid'];
    // });
    // this.route.pathFromRoot[2].params.subscribe(params => {
    //   this.siteControlId = +params['scid'];
    // });

    this.maxDate = new Date();
    this.maxDate.setDate( this.maxDate.getDate());
    this.route.data.subscribe((data: {siteControl: LustSiteControlGet}) => {this.lustSiteControlGet = data.siteControl; });
    this.route.data.subscribe((data: {siteControlTypes: SiteControlType[]}) => {this.siteControlTypes = data.siteControlTypes; });
    this.route.data.subscribe((data: {projectManagers: ProjectManager[]}) => {this.projectManagers = data.projectManagers; });
    this.route.data.subscribe((data: {pmActives: PmActive[]}) => {this.pmActives = data.pmActives; });
    this.route.data.subscribe((data: {controlEngineeringTypes: RealSiteControlTypes[]}) => {
      this.controlEngineeringTypes = data.controlEngineeringTypes; });
    this.route.data.subscribe((data: {controlInstitutionalTypes: RealSiteControlTypes[]}) => {
      this.controlInstitutionalTypes = data.controlInstitutionalTypes; });
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.logNumber = data.apGetLogNumber.logNumber;
      this.siteName = data.apGetLogNumber.siteName;
    });

    if (this.lustSiteControlGet !== undefined)  {
        this.siteControlId = this.lustSiteControlGet.siteControlId;
    }

    if (isNaN(this.siteControlId) ) {
    // if (isNaN(this.siteControlId) || this.lustSiteControlGet === undefined) {
      this.siteControlId = 0;
      this.createAddForm();
    } else {
      this.route.data.subscribe((data: {lustSiteControlGet: LustSiteControlGet}) => {this.lustSiteControlGet = data.lustSiteControlGet;
        this.setShowEngineeringInstitutionalOnLoad();
        this.createForm();
      });
    }
    this.disableForm();
    this.returnPath = 'lust/' + this.lustId + '/sitecontrols';
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
      this.siteControlForm.disable();
    }
  }

  ngOnChanges() {
    if (this.errors === undefined) {
       this.isClosed = true;
      const errorPage = document.getElementById('errorsPage');
      if (errorPage !== null) {
        errorPage.remove();
      }
    }  }

  ngAfterViewInit() {
    if (this.errors === null) {
      this.isClosed = true;
      const errorPage = document.getElementById('errorsPage');
      if (errorPage !== null) {
        errorPage.remove();
      }
    }
  }

  ngDoCheck() {
    this.errors = this.findInvalidControls();
    if (this.errors === undefined || this.errors === null || this.errors.length === 0) {
      this.isClosed = true;
      const errorPage = document.getElementById('errorsPage');
      if (errorPage !== null) {
        errorPage.remove();
      }
    }
  }

  submitSiteControl() {
    this.submitClicked = true;
    if (this.siteControlForm.dirty && this.siteControlForm.valid) {
      this.setModelToFormData();
      this.isClosed = true;
      this.lustDataService.updateLustSiteControl(this.siteControlPost)
        .subscribe(
          (data ) => (
            this.siteControlPostResult = data
            , this.showSubmitStatusDialog()),
        );
    } else if (this.siteControlForm.invalid) {
        this.errors = this.findInvalidControls();
        console.log('this.errors =' + this.errors);
        this.showAllErrorsMessages = true;
        this.isClosed = false;
    }


  }

  private showSubmitStatusDialog() {
    let message1 = '';
    let title = '';
    const button1 = 'Close';
    if (this.siteControlPostResult.errorMessageHandler !== undefined &&
      this.siteControlPostResult.errorMessageHandler !== null &&
      this.siteControlPostResult.errorMessageHandler.length > 0 ) {
      title = 'Failed to save due to ' + this.siteControlPostResult.errorMessageHandler ;
      message1 = this.siteControlPostResult.errorMessageHandler;
      this.success = false;
    } else {
      title = 'Successfully saved ' + this.siteControlPostResult.id;
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

  createForm() {
    this.siteControlForm = this.formBuilder.group({
      siteControlId: [this.lustSiteControlGet.siteControlId],
      controlId: [this.lustSiteControlGet.controlId, Validators.required ],
      controlBeginDate: [this.lustSiteControlGet.controlBeginDate, Validators.required],
      controlEndDate: [this.lustSiteControlGet.controlEndDate],
      frequencyOfReview: [this.lustSiteControlGet.frequencyOfReview, Validators.pattern('^([+-]?[1-9]\\d*|0)$')],
      controlComment: [this.lustSiteControlGet.controlComment],
      lastReviewBy: [this.lustSiteControlGet.lastReviewBy],
      lastReviewDate: [this.lustSiteControlGet.lastReviewDate],
      lastChangeBy: [this.lustSiteControlGet.lastChangeBy],
      lastChangeDate: [this.lustSiteControlGet.lastChangeDate],
      typeId: [this.lustSiteControlGet.typeId],
      lustId: [this.lustSiteControlGet.lustId],
      logNumber: [this.lustSiteControlGet.logNumber]
    },
    {validator: [ this.ValidateControlBeginDate.bind(this),
                  this.ValidateLastReviewedby.bind(this)
                ]}
     );
  }

  createAddForm() {
    this.siteControlForm = this.formBuilder.group({
      siteControlId: [''],
      controlId: ['', Validators.required],
      controlBeginDate: [{value: '', disabled: false}, Validators.required],
      controlEndDate: [{value: '', disabled: false}],
      frequencyOfReview: ['', Validators.compose([Validators.pattern('^([+-]?[1-9]\\d*|0)$')])],
      controlComment: [''],
      lastReviewBy: [''],
      lastReviewDate: [{value: '', disabled: false}],
      lastChangeBy: [''],
      lastChangeDate: [''],
      typeId: [''],
    },
    {validator: [ this.ValidateControlBeginDate.bind(this),
                  this.ValidateLastReviewedby.bind(this)
    ]}
    );
  }



  setModelToFormData() {
    console.log('setModelToFormData');
    this.siteControlPost.siteControlId = this.siteControlId;

    this.siteControlPost.controlId = this.siteControlForm.controls.controlId.value;
    this.siteControlPost.controlBeginDate = this.siteControlForm.controls.controlBeginDate.value;
    this.siteControlPost.controlEndDate = this.siteControlForm.controls.controlEndDate.value;
    if (this.siteControlForm.controls.frequencyOfReview.value === '' ) {
      this.siteControlPost.frequencyOfReview = 0;
    } else {
      this.siteControlPost.frequencyOfReview = this.siteControlForm.controls.frequencyOfReview.value;
    }
    this.siteControlPost.controlComment = this.siteControlForm.controls.controlComment.value;
    this.siteControlPost.lastReviewBy = this.siteControlForm.controls.lastReviewBy.value;
    this.siteControlPost.lastReviewDate = this.siteControlForm.controls.lastReviewDate.value;
    this.siteControlPost.lastChangeBy = this.authService.getUserIdWoDomain();
    // this.siteControlPost.lastChangeDate = maxDate;
    this.siteControlPost.typeId =  this.siteControlForm.controls.typeId.value;
    this.siteControlPost.lustId = this.lustId;
    this.siteControlPost.logNumber = this.logNumber;
  }

  setShowEngineeringInstitutionalOnLoad() {
    if (this.lustSiteControlGet.typeId === 1) {
      this.theRealControlTypes = this.controlInstitutionalTypes;
    } else {
      this.theRealControlTypes = this.controlEngineeringTypes;
    }

  }

  setShowEngineeringInstitutional() {
    this.siteControlForm.controls.typeId.valueChanges.subscribe(data => {
      if (data === 1) {
        this.theRealControlTypes = this.controlInstitutionalTypes;
      } else if (data === 2) {
        this.theRealControlTypes = this.controlEngineeringTypes;
      }
    }
    );
  }


  findInvalidControls() {
    const invalid = [];
    for (const field of Object.keys(this.siteControlForm.controls)) {
        if (this.siteControlForm.controls[field].invalid) {
            const name = this.idToNameService.getName(field);
            invalid.push(name + ' is required and must be valid.');
        }
    }
    return invalid;
  }


  ValidateControlBeginDate(control: AbstractControl) {
    const beginDate = control.get('controlBeginDate');
    const endDate = control.get('controlEndDate');
    if ((beginDate.dirty && beginDate.value !== '') && (endDate.dirty && endDate.value !== '')) {
      if (beginDate.value > endDate.value) {
      beginDate.setErrors({'SiteControlDateBeginAfterEnd': true});
      return {
          validateBeginDateError: {
            validateBeginDateError: true
          }
        };
      } else {
        // beginDate.setErrors(null);
        return null;
      }
    } else {
      //  beginDate.setErrors(null);
      return null;
    }
  }


  ValidateLastReviewedby(control: AbstractControl) {
   const beginDateToReview = control.get('controlBeginDate');
    const reviewDate = control.get('lastReviewDate');
    if ((beginDateToReview.dirty && beginDateToReview.value !== '') && (reviewDate.dirty && reviewDate.value !== '')) {
      if (beginDateToReview.value > reviewDate.value) {
        beginDateToReview.setErrors({'SiteControlDateBeginAfterLastReview': true});
      return {
          validateBeginDateError: {
            validateBeginDateError: true
          }
        };
      } else {
        // beginDateToReview.setErrors(null);
        return null;
      }
    } else {
      // beginDateToReview.setErrors(null);
      return null;
    }
  }


  delete() {
    this.deleteClicked = true;
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete Site Control ' + this.lustSiteControlGet.siteControlId + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delSiteControl(this.lustSiteControlGet.siteControlId).subscribe();
        this.router.navigate([this.returnPath]);
      }
    });
  }


  cancel() {
    this.cancelClicked = true;
    this.router.navigate([this.returnPath]);
  }

}
