import { Component, OnInit, ElementRef, AfterViewInit, ViewChild } from '@angular/core';
import { AbstractControl, Validators, FormGroup, FormBuilder } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';

import { Observable, Subject, BehaviorSubject} from 'rxjs';
import { map, flatMap} from 'rxjs/operators';

import { LustDataService } from '../../services/lust-data.service';
import { IdToNameService } from '../../olprr-incident/id-to-name.service';
import { DiscoveryType } from '../../models/discovery-type';
import { ReleaseCauseType } from '../../models/release-cause-type';
import { AssessmentReleaseSourceType } from '../../models/assessment-release-source-type';
import { AssessmentConfirmationType } from '../../models/assessment-confirmation-type';
import { AssessmentDiscoveryType } from '../../models/assessment-discovery-type';
import { AssessmentReleaseCauseType } from '../../models/assessment-release-cause-type';
import { DrinkingWaterReplacementType } from '../../models/drinking-water-replacement-type';
import { NonDrinkingWaterSupplyType } from '../../models/non-drinking-water-supply-type';
import { DrinkingWaterImpactType } from '../../models/drinking-water-impact-type';
import { DrinkingWaterImpactLikelyType } from '../../models/drinking-water-impact-likely-type';
import { VaporLevelType } from '../../models/vapor-level-type';
import { PopulationExposedType } from '../../models/population-exposed-type';
import { EnvironmentalType } from '../../models/environmental-type';
import { SoilPermiabilityType } from '../../models/soil-permiability-type';
import { UtilityImpactType } from '../../models/utility-impact-type';
import { RainfallAnnualType } from '../../models/rainfall-annual-type';
import { AquiferDepthType } from '../../models/aquifer-depth-type';
import { SurfaceWaterDistanceType } from '../../models/surface-water-distance-type';
import { EnvironmentalImpactLikelyType } from '../../models/environmental-impact-likely-type';
import { LustAssessmentGet } from '../../models/assessment-get';
import { LustAssessmentGetResolver } from '../../resolvers/lust-assessment-get-resolver.service';
import { LustAssessmentUpdate } from '../../models/lust-assessment';
import { ApGetLogNumber } from '../../models/apGetLogNumber';
import { LustScoringValuesGet } from '../../models/lust-scoring-values-get';
import { LustScoringRangeGet } from '../../models/lust-scoring-range-get';
import { LustSiteScorePost } from '../../models/lust-site-score-post';
import { AssessmentPost } from '../../models/assessment-post';
import { AssessmentPostResult } from '../../models/assessment-post-result';
import { SubmitStatusDialogComponent } from '../../common/dialogs/submit-status-dialog.component';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
// import { LustSiteScorePostResolver } from '../../resolvers/lust-site-score-resolver.service';

@Component({
  selector: 'app-assessment',
  templateUrl: './assessment.component.html',
  styleUrls: ['./assessment.component.scss']
})
export class AssessmentComponent implements OnInit, AfterViewInit {
  @ViewChild('siteScoreLow') siteScoreLow: ElementRef;
  reportedInvalidChoiceMsg = 'NOT REPORTED is not accepted to Create or Update a record. Please select a different value.';

  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;

  logNumber: string;
  siteName: string;
  lustId: number;
  assessmentPost = new AssessmentPost();
  lustSiteScorePost = new LustSiteScorePost();
  assessmentPostResult: AssessmentPostResult;
  lustAssessmentGet: LustAssessmentGet|null;
  lustScoringValuesGet: LustScoringValuesGet|null;
  lustScoringRangeGet: LustScoringRangeGet|null;
  lustAssessmentUpdate: LustAssessmentUpdate;
  errorMessage: string;
  assessmentDiscoveryTypes: AssessmentDiscoveryType[] = [];
  assessmentReleaseCauseTypes: AssessmentReleaseCauseType[] = [];
  assessmentReleaseSourceTypes: AssessmentReleaseSourceType[] = [];
  assessmentConfirmationTypes: AssessmentConfirmationType[] = [];

  dwReplacementTypes: DrinkingWaterReplacementType[] = [];
  dwImpactTypes: DrinkingWaterImpactType[] = [];
  dwImpactLikelyTypes: DrinkingWaterImpactLikelyType[] = [];
  vaporLevelTypes: VaporLevelType[] = [];
  populationExposedTypes: PopulationExposedType[] = [];
  environmentTypes: EnvironmentalType[] = [];
  environmentImpactLikelyTypes: EnvironmentalImpactLikelyType[] = [];

  nonDwReplacementTypes: NonDrinkingWaterSupplyType[] = [];
  utilityImpactTypes: UtilityImpactType[] = [];
  rainFallAnnualTypes: RainfallAnnualType[] = [];
  soilPermiabilityTypes: SoilPermiabilityType[] = [];
  aquiferDepthTypes: AquiferDepthType[] = [];
  swDistanceTypes: SurfaceWaterDistanceType[] = [];
  noColor: string;

  isClosed = true;
  isContaminantClosed = false;
  isMediaClosed = false;
  showAllErrorsMessages = false;
  assessmentForm: FormGroup;
  showMediaErrorMessage = false;
  showContaminantErrorMessage = false;
  submitClicked = false;

  assessmentLastChangedBy: string;

  siteScoreId: number;


  lowScore: number;
  avgScore: number;
  highScore: number;
  scoreCount: number;
  scoreRange: string;



  avgScoreProperty: string;
  currentScore: number;

  contaminantErrorMessage: string;
  mediaErrorMessage: string;
  contaminantErrorMessages: [string];
  mediaErrorMessages: [string];
  private errors: any[];
  private success = false;
  private apGetLogNumber: ApGetLogNumber;
  private isUpdate = false;
  private formTitle: string;
  private assessmentId: number;

  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  authLevel: AuthLevel;
  viewOnly = false;

  constructor(private lustDataService: LustDataService,  private idToNameService: IdToNameService,
    private route: ActivatedRoute, private router: Router, private formBuilder: FormBuilder, public elm: ElementRef,
    private submitStatusDialog: MatDialog, private authService: AuthService) { }

  ngOnInit() {
    console.log('********************edit assessment ngOnInit(XX)');
    // this.route.params.subscribe(params => {
    //   console.log('Getting ID = ' +  +params['/id/']);

    this.loadingSubject.next(true);
    this.setAuthLevel();
    this.setViewOnly();

    this.route.data.subscribe((data: {lustAssessmentGet: LustAssessmentGet}) => {this.lustAssessmentGet = data.lustAssessmentGet; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {assessmentDiscoveryTypes: AssessmentDiscoveryType[]}) => {this.assessmentDiscoveryTypes = data.assessmentDiscoveryTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {assessmentReleaseCauseTypes: AssessmentReleaseCauseType[]}) => {this.assessmentReleaseCauseTypes = data.assessmentReleaseCauseTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {assessmentReleaseSourceTypes: AssessmentReleaseSourceType[]}) => {this.assessmentReleaseSourceTypes = data.assessmentReleaseSourceTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {assessmentConfirmationTypes: AssessmentConfirmationType[]}) => {this.assessmentConfirmationTypes = data.assessmentConfirmationTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {dwReplacementTypes: DrinkingWaterReplacementType[]}) => {this.dwReplacementTypes = data.dwReplacementTypes; });
    this.route.data.subscribe((data: {dwImpactTypes: DrinkingWaterImpactType[]}) => {this.dwImpactTypes = data.dwImpactTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {dwImpactLikelyTypes: DrinkingWaterImpactLikelyType[]}) => {this.dwImpactLikelyTypes = data.dwImpactLikelyTypes; });
    this.route.data.subscribe((data: {vaporLevelTypes: VaporLevelType[]}) => {this.vaporLevelTypes = data.vaporLevelTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {populationExposedTypes: PopulationExposedType[]}) => {this.populationExposedTypes = data.populationExposedTypes; });
    this.route.data.subscribe((data: {environmentTypes: EnvironmentalType[]}) => {this.environmentTypes = data.environmentTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {environmentImpactLikelyTypes: EnvironmentalImpactLikelyType[]}) => {this.environmentImpactLikelyTypes = data.environmentImpactLikelyTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {nonDwReplacementTypes: NonDrinkingWaterSupplyType[]}) => {this.nonDwReplacementTypes = data.nonDwReplacementTypes; });
    this.route.data.subscribe((data: {utilityImpactTypes: UtilityImpactType[]}) => {this.utilityImpactTypes = data.utilityImpactTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {rainFallAnnualTypes: RainfallAnnualType[]}) => {this.rainFallAnnualTypes = data.rainFallAnnualTypes; });
    // tslint:disable-next-line:max-line-length
    this.route.data.subscribe((data: {soilPermiabilityTypes: SoilPermiabilityType[]}) => {this.soilPermiabilityTypes = data.soilPermiabilityTypes; });
    this.route.data.subscribe((data: {aquiferDepthTypes: AquiferDepthType[]}) => {this.aquiferDepthTypes = data.aquiferDepthTypes; });
    this.route.data.subscribe((data: {swDistanceTypes: SurfaceWaterDistanceType[]}) => {this.swDistanceTypes = data.swDistanceTypes; });
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {this.logNumber = data.apGetLogNumber.logNumber;
      this.siteName = data.apGetLogNumber.siteName;
    });
    // this.route.data.subscribe((data: {lustScoringValues: LustScoringValuesGet}) =>
    //      {this.lustScoringValuesGet = data.lustScoringValues; });
    // tslint:disable-next-line:max-line-length
    // this.route.data.subscribe((data: {lustScoringRangeGet: LustScoringRangeGet}) => {this.lustScoringRangeGet = data.lustScoringRangeGet; });
    // this.createForm();

    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    console.log('this.LustId = ' + this.lustId);
    if (this.lustAssessmentGet === undefined) {
      this.isUpdate = false;
      this.formTitle = 'Add New Contact for Log Number ';
      this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
        this.apGetLogNumber = data.apGetLogNumber;
        this.logNumber = this.apGetLogNumber.logNumber;
        this.buildAddForm();
        this.disableForm();
        this.assessmentPost.assessmentId = 0;
      });
    } else {

      this.isUpdate = true;



      this.currentScore = this.lustAssessmentGet.currentSiteScore;
      this.assessmentLastChangedBy = this.lustAssessmentGet.assessmentLastChangeBy;
      // this.avgScoreProperty = this.lustScoringRangeGet.scoreRange;
      this.siteScoreId = this.lustAssessmentGet.siteScoreId;
      console.log('siteScoreId =' + this.siteScoreId);
      this.lowScore = this.lustAssessmentGet.lowScore;
      this.avgScore = this.lustAssessmentGet.avgScore;
      this.highScore = this.lustAssessmentGet.highScore;
      this.scoreCount = this.lustAssessmentGet.scoreCount;
      this.scoreRange = this.lustAssessmentGet.scoreRange;
      this.assessmentId = this.lustAssessmentGet.assessmentId;
      console.log(this.currentScore);
      // this.OnScrollIntoView();
      // this.noColor = 'yellow';

      console.log(this.lustAssessmentGet);
      this.createForm();
      this.disableForm();
      // console.log('ngOnInit Complete');
      // console.log('log number ' + this.logNumber);
      // console.log('CleanUp Necessary ' + this.lustAssessmentGet.cleanupNecessaryInd);
      // this.thermo(1);
  }
    this.formTitle = this.formTitle + this.logNumber;
    this.loadingSubject.next(false);


  this.checkLUSTId();


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
      this.assessmentForm.disable();
    }
  }




  ngAfterViewInit() {
    console.log('ngAfterViewInitupdate = ' + this.isUpdate);
    if (this.isUpdate) {
      this.thermo();
    } else {
      this.thermoInit();
    }

  }
  createForm() {
    this.assessmentForm = this.formBuilder.group({
      discoverDate: [this.lustAssessmentGet.discoverDate],
      assessmentId: [this.lustAssessmentGet.assessmentId],
      discoveryId: [this.lustAssessmentGet.discoveryId, Validators.required],
      releaseCauseId:  [this.lustAssessmentGet.releaseCauseId, Validators.required],
      releaseSourceId:  [this.lustAssessmentGet.releaseSourceId, Validators.required],
      confirmationId:  [this.lustAssessmentGet.confirmationId, Validators.required ],
      dwMediaInd:  [this.lustAssessmentGet.dwMediaInd],
      gwMediaInd:  [this.lustAssessmentGet.gwMediaInd],
      swMediaInd:  [this.lustAssessmentGet.swMediaInd],
      slMediaInd:  [this.lustAssessmentGet.slMediaInd],
      fvMediaInd:  [this.lustAssessmentGet.fvMediaInd],
      fpMediaInd:  [this.lustAssessmentGet.fpMediaInd],
      ugContamInd:  [this.lustAssessmentGet.ugContamInd],
      hoContamInd:  [this.lustAssessmentGet.hoContamInd],
      lbContamInd:  [this.lustAssessmentGet.lbContamInd],
      opContamInd:  [this.lustAssessmentGet.opContamInd],
      lgContamInd:  [this.lustAssessmentGet.lgContamInd],
      woContamInd:  [this.lustAssessmentGet.woContamInd],
      svContamInd:  [this.lustAssessmentGet.svContamInd],
      mtbeContamInd:  [this.lustAssessmentGet.mtbeContamInd],
      mgContamInd:  [this.lustAssessmentGet.mgContamInd],
      dsContamInd:  [this.lustAssessmentGet.dsContamInd],
      chContamInd:  [this.lustAssessmentGet.chContamInd],
      unContamInd:  [this.lustAssessmentGet.unContamInd],
      cleanupNecessaryInd:  [this.lustAssessmentGet.cleanupNecessaryInd],
      delineateGW:  [this.lustAssessmentGet.delineateGW],
      gwDelineated:  [this.lustAssessmentGet.gwDelineated],
      fpRemovedInd:  [this.lustAssessmentGet.fpRemovedInd],
      capRequested:  [this.lustAssessmentGet.capRequested],
      capApproved:  [this.lustAssessmentGet.capApproved],
      migrationInd:  [this.lustAssessmentGet.migrationInd],
      delineateSL:  [this.lustAssessmentGet.delineateSL],
      slDelineated:  [this.lustAssessmentGet.slDelineated],
      vpRemovedInd:  [this.lustAssessmentGet.vpRemovedInd],
      capSubmitted:  [this.lustAssessmentGet.capSubmitted],
      gwCompMonitoring:  [this.lustAssessmentGet.gwCompMonitoring],
      dwReplMeasure: [this.lustAssessmentGet.dwReplMeasure],
      nonDwSupTypMeasure: [this.lustAssessmentGet.nonDwSupTypMeasure],
      dwImpMeasure: [this.lustAssessmentGet.dwImpMeasure],
      utImpMeasure: [this.lustAssessmentGet.utImpMeasure],
      dwImpLiklyMeasure: [this.lustAssessmentGet.dwImpLiklyMeasure],
      rainfallAnnualMeasure: [this.lustAssessmentGet.rainfallAnnualMeasure],
      vprLvlMeasure: [this.lustAssessmentGet.vprLvlMeasure],
      soilPermMeasure: [this.lustAssessmentGet.soilPermMeasure],
      popExposdMeasure: [this.lustAssessmentGet.popExposdMeasure],
      aqfrDepthMeasure: [this.lustAssessmentGet.aqfrDepthMeasure],
      envTypMeasure: [this.lustAssessmentGet.envTypMeasure],
      swDistMeasure: [this.lustAssessmentGet.swDistMeasure],
      envImpLilelyMeasure: [this.lustAssessmentGet.envImpLilelyMeasure],
      amntReleaseComment: [this.lustAssessmentGet.amntReleaseComment],
      contamComment: [this.lustAssessmentGet.contamComment]

    },
    {validator: [
      this.reportCauseRequiredValidation.bind(this),
      this.reportSourceRequiredValidation.bind(this),
   ] }
  );
    console.log('Create Form completed');
  }

  private buildAddForm() {
    this.assessmentForm = this.formBuilder.group({
      discoverDate: [''],
      assessmentId: [''],
      discoveryId: ['', Validators.required],
      releaseCauseId: ['', Validators.required],
      releaseSourceId: ['', Validators.required],
      confirmationId: ['', Validators.required],
      dwMediaInd: [''],
      gwMediaInd: [''],
      swMediaInd: [''],
      slMediaInd: [''],
      fvMediaInd: [''],
      fpMediaInd: [''],
      ugContamInd: [''],
      hoContamInd: [''],
      lbContamInd: [''],
      opContamInd: [''],
      lgContamInd: [''],
      woContamInd: [''],
      svContamInd: [''],
      mtbeContamInd: [''],
      mgContamInd: [''],
      dsContamInd: [''],
      chContamInd: [''],
      unContamInd: [''],
      cleanupNecessaryInd: [''],
      delineateGW: [''],
      gwDelineated: [''],
      fpRemovedInd: [''],
      capRequested: [''],
      capApproved: [''],
      migrationInd: [''],
      delineateSL: [''],
      slDelineated: [''],
      vpRemovedInd: [''],
      capSubmitted: [''],
      gwCompMonitoring: [''],
      dwReplMeasure: [''],
      nonDwSupTypMeasure: [''],
      dwImpMeasure: [''],
      utImpMeasure: [''],
      dwImpLiklyMeasure: [''],
      rainfallAnnualMeasure: [''],
      vprLvlMeasure: [''],
      soilPermMeasure: [''],
      popExposdMeasure: [''],
      aqfrDepthMeasure: [''],
      envTypMeasure: [''],
      swDistMeasure: [''],
      envImpLilelyMeasure: [''],
      amntReleaseComment: [''],
      contamComment: [''],
    },
    {validator: [
      this.reportCauseRequiredValidation.bind(this),
      this.reportSourceRequiredValidation.bind(this),
    ] }
    );
  }


  submitAssessment(): void {
    this.submitClicked = true;
    console.log('Form Dirty = ' + this.assessmentForm.dirty);
    console.log('Form Valid = ' + this.assessmentForm.valid);
    console.log('Media Error Messages =' + this.getMediaErrorMessage());
    console.log('Contaminant Error messages = ' + this.getContaminantErrorMessage());
    // tslint:disable-next-line:max-line-length
    if (this.assessmentForm.dirty && this.assessmentForm.valid && this.getMediaErrorMessage() === null && this.getContaminantErrorMessage() === null)  {
      console.log('Before buildAssessment');
      this.buildLustAssessment();
      console.log(this.assessmentPost);
      this.lustDataService.updateLustAssessment(this.assessmentPost)
        .subscribe(
          (data ) => (

            this.assessmentPostResult = data,
            console.log(this.assessmentPostResult),
            this.scoreRange = this.assessmentPostResult.scoreRange,
            this.currentScore = this.assessmentPostResult.updateSiteScore,
            this.avgScore = this.assessmentPostResult.avgScore,
            this.highScore = this.assessmentPostResult.highScore,
            this.assessmentId = this.assessmentPostResult.assessmentIdOut,
            this.siteScoreId = this.assessmentPostResult.siteScoreIdOut,
            console.log('new scoreRange value ' + this.scoreRange),
            console.log('new currentScore ' + this.currentScore),
            console.log('new assessment Id =' + this.assessmentId),
            this.isUpdate = true,
            this.showSubmitStatusDialog()),
        );



      this.thermo();
    } else if (this.assessmentForm.invalid || this.getMediaErrorMessage() != null || this.getContaminantErrorMessage() != null) {
        this.errors = this.findInvalidControls();
        this.contaminantErrorMessage = this.getContaminantErrorMessage();
        if (this.contaminantErrorMessage != null) {
          this.contaminantErrorMessages = [this.contaminantErrorMessage];
          this.errors.push(this.contaminantErrorMessage);
          this.showContaminantErrorMessage = true;
        }

        this.mediaErrorMessage = this.getMediaErrorMessage();
        if (this.mediaErrorMessage != null) {
        this.mediaErrorMessages = [this.mediaErrorMessage];
        this.errors.push(this.mediaErrorMessage);
        this.showMediaErrorMessage = true;
        }
        this.showAllErrorsMessages = true;
        this.isClosed = false;
        console.log('ok why the errors not showing?????');
    }
  }

  private showSubmitStatusDialog() {
    let message1 = '';
    let title = '';
    const button1 = 'Close';
    if (this.assessmentPostResult.errorMessageHandler !== undefined &&
      this.assessmentPostResult.errorMessageHandler !== null &&
      this.assessmentPostResult.errorMessageHandler.length > 0 ) {
      title = 'Failed to save due to ' + this.assessmentPostResult.errorMessageHandler ;
      message1 = this.assessmentPostResult.errorMessageHandler;
      this.success = false;
    } else {
      title = 'Successfully saved Assessment Id ' + this.assessmentPostResult.assessmentIdOut;
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
        // this.router.navigate([this.returnPath]);
        console.log('Success after dialog');
      }
    });
  }



  // saveAssessment(): void {
  //   const p = Object.assign({},  this.assessmentForm.value, this.assessmentForm);

  //   console.log('*********p is ' + JSON.stringify(p));

  //   this.lustDataService.insUpdAssessment(p)
  //       .subscribe(
  //           () => this.onCreateComplete(),
  //           (error: any) => this.errorMessage = <any>error
  //       );
  // }

  onCreateComplete(): void {
    console.log('ok did it hip hip hoorayyy!!!!');
    // this.showSubmitStatusDialog();

  }

  private findInvalidControls() {
    const invalid = [];
    const controls = this.assessmentForm.controls;
    for (const field of Object.keys(this.assessmentForm.controls)) {
        if (this.assessmentForm.controls[field].invalid) {
            console.log('**********HELLLOOOO????');
            console.log(field);
            const name = this.idToNameService.getName(field);
            invalid.push(name + ' is required and must be valid.');
        }
    }

    const contaminantErrorMessage = this.getContaminantErrorMessage();
    if (contaminantErrorMessage != null) {
      invalid.push(contaminantErrorMessage);
    }

    const mediaErrorMessage = this.getMediaErrorMessage();
    if (mediaErrorMessage != null) {
      invalid.push(mediaErrorMessage);
    }
    return invalid;
  }


  private buildLustAssessment() {
    console.log('Building Assessment for LustId = ' + this.lustId);
    this.assessmentPost.lustId = this.lustId;
    this.assessmentPost.assessmentId = this.assessmentForm.controls.assessmentId.value;
    this.assessmentPost.discoverDate = this.assessmentForm.controls.discoverDate.value;
    this.assessmentPost.discoveryId = this.assessmentForm.controls.discoveryId.value;
    this.assessmentPost.releaseCauseId = this.assessmentForm.controls.releaseCauseId.value;
    this.assessmentPost.releaseSourceId = this.assessmentForm.controls.releaseSourceId.value;
    this.assessmentPost.confirmationId = this.assessmentForm.controls.confirmationId.value;
    this.assessmentPost.dwMediaInd = (this.assessmentForm.controls.dwMediaInd.value ? true : false);
    this.assessmentPost.gwMediaInd = (this.assessmentForm.controls.gwMediaInd.value ? true : false);
    this.assessmentPost.swMediaInd = (this.assessmentForm.controls.swMediaInd.value ? true : false);
    this.assessmentPost.slMediaInd = (this.assessmentForm.controls.slMediaInd.value ? true : false);
    this.assessmentPost.slMediaInd = (this.assessmentForm.controls.slMediaInd.value ? true : false);
    
    this.assessmentPost.fvMediaInd = (this.assessmentForm.controls.fvMediaInd.value ? true : false);
    this.assessmentPost.fpMediaInd = (this.assessmentForm.controls.fpMediaInd.value ? true : false);
    this.assessmentPost.unContamInd = (this.assessmentForm.controls.unContamInd.value ? true : false);
    this.assessmentPost.ugContamInd = (this.assessmentForm.controls.ugContamInd.value ? true : false);
    this.assessmentPost.hoContamInd = (this.assessmentForm.controls.hoContamInd.value ? true : false);
    this.assessmentPost.lbContamInd = (this.assessmentForm.controls.lbContamInd.value ? true : false);
    this.assessmentPost.opContamInd = (this.assessmentForm.controls.opContamInd.value ? true : false);
    this.assessmentPost.lgContamInd = (this.assessmentForm.controls.lgContamInd.value ? true : false);
    this.assessmentPost.woContamInd = (this.assessmentForm.controls.woContamInd.value ? true : false);
    this.assessmentPost.svContamInd = (this.assessmentForm.controls.svContamInd.value ? true : false);
    this.assessmentPost.mtbeContamInd = (this.assessmentForm.controls.mtbeContamInd.value ? true : false);
    this.assessmentPost.mgContamInd = (this.assessmentForm.controls.mgContamInd.value ? true : false);
    this.assessmentPost.dsContamInd = (this.assessmentForm.controls.dsContamInd.value ? true : false);
    this.assessmentPost.chContamInd = (this.assessmentForm.controls.chContamInd.value ? true : false);
    // this.assessmentPost.unContamInd = this.assessmentForm.controls.unContamInd.value;
    this.assessmentPost.cleanupNecessaryInd = (this.assessmentForm.controls.cleanupNecessaryInd.value ? true : false);
    this.assessmentPost.delineateGW = (this.assessmentForm.controls.delineateGW.value ? true : false);
    this.assessmentPost.gwDelineated = (this.assessmentForm.controls.gwDelineated.value ? true : false);
    this.assessmentPost.fpRemovedInd = (this.assessmentForm.controls.fpRemovedInd.value  ? true : false);
    this.assessmentPost.capRequested = (this.assessmentForm.controls.capRequested.value  ? true : false);
    this.assessmentPost.capApproved = (this.assessmentForm.controls.capApproved.value ? true : false);
    this.assessmentPost.migrationInd = (this.assessmentForm.controls.migrationInd.value ? true : false);

    this.assessmentPost.delineateSL = (this.assessmentForm.controls.delineateSL.value ? true : false);
    this.assessmentPost.slDelineated = (this.assessmentForm.controls.slDelineated.value ? true : false);
    this.assessmentPost.vpRemovedInd = (this.assessmentForm.controls.vpRemovedInd.value ? true : false);
    this.assessmentPost.capSubmitted = (this.assessmentForm.controls.capSubmitted.value ? true : false);
    this.assessmentPost.gwCompMonitoring = (this.assessmentForm.controls.gwCompMonitoring.value ? true : false);
    this.assessmentPost.lastChangeBy = this.assessmentLastChangedBy;
    this.assessmentPost.amntReleaseComment = this.assessmentForm.controls.amntReleaseComment.value;
    this.assessmentPost.contamComment = this.assessmentForm.controls.contamComment.value;
    // Site Score Data
    console.log('setting siteScoreIdIn and assessmentId');
    console.log('Value of isUpdate ' + this.isUpdate);

    this.assessmentPost.siteScoreIdIn = this.siteScoreId;
    if (this.assessmentPost.siteScoreIdIn === undefined) {
      this.assessmentPost.siteScoreIdIn = 0;
    }
    console.log('setting assessmentId');
    if (this.isUpdate) {
      this.assessmentPost.assessmentId = this.assessmentId;
    } else {
      console.log('insert setting assessmentId = 0');
      this.assessmentPost.assessmentId = 0;
      console.log('assessmentId should be = 0 / actual = ' + this.assessmentPost.assessmentId);
    }

    if (this.assessmentForm.controls.dwReplMeasure.value === undefined || this.assessmentForm.controls.dwReplMeasure.value === null) {
      this.assessmentPost.DwReplmeasr = 0;
    } else {
      this.assessmentPost.DwReplmeasr = this.assessmentForm.controls.dwReplMeasure.value;
    }
    // tslint:disable-next-line:max-line-length
    if (this.assessmentForm.controls.dwImpMeasure.value === undefined || this.assessmentForm.controls.dwImpMeasure.value === null) {
      this.assessmentPost.DwImpmeasr = 0;
    } else {
      this.assessmentPost.DwImpmeasr = this.assessmentForm.controls.dwImpMeasure.value;
    }
    // tslint:disable-next-line:max-line-length
    if (this.assessmentForm.controls.dwImpLiklyMeasure.value === undefined || this.assessmentForm.controls.dwImpLiklyMeasure.value === null) {
      this.assessmentPost.DwImpLiklymeasr = 0;
    } else {
      this.assessmentPost.DwImpLiklymeasr = this.assessmentForm.controls.dwImpLiklyMeasure.value;
    }
    if (this.assessmentForm.controls.vprLvlMeasure.value === undefined || this.assessmentForm.controls.vprLvlMeasure.value === null) {
      this.assessmentPost.VprLvlmeasr = 0;
    } else {
      this.assessmentPost.VprLvlmeasr = this.assessmentForm.controls.vprLvlMeasure.value;
    }
    if (this.assessmentForm.controls.popExposdMeasure.value === undefined || this.assessmentForm.controls.popExposdMeasure.value === null) {
      this.assessmentPost.PopExposdmeasr = 0;
    } else {
      this.assessmentPost.PopExposdmeasr = this.assessmentForm.controls.popExposdMeasure.value;
    }
    if (this.assessmentForm.controls.envTypMeasure.value === undefined || this.assessmentForm.controls.envTypMeasure.value === null) {
      this.assessmentPost.EnvTypmeasr = 0;
    } else {
      this.assessmentPost.EnvTypmeasr = this.assessmentForm.controls.envTypMeasure.value;
    }
    // tslint:disable-next-line:max-line-length
    if (this.assessmentForm.controls.envImpLilelyMeasure.value === undefined || this.assessmentForm.controls.envImpLilelyMeasure.value === null) {
      this.assessmentPost.EnvImpLilelymeasr = 0;
    } else {
      this.assessmentPost.EnvImpLilelymeasr = this.assessmentForm.controls.envImpLilelyMeasure.value;
    }
    // tslint:disable-next-line:max-line-length
    if (this.assessmentForm.controls.nonDwSupTypMeasure.value === undefined || this.assessmentForm.controls.nonDwSupTypMeasure.value === null) {
      this.assessmentPost.NonDwSupTypmeasr = 0;
    } else {
      this.assessmentPost.NonDwSupTypmeasr = this.assessmentForm.controls.nonDwSupTypMeasure.value;
    }
    if (this.assessmentForm.controls.utImpMeasure.value === undefined || this.assessmentForm.controls.utImpMeasure.value === null) {
      this.assessmentPost.UtImpmeasr = 0;
    } else {
      this.assessmentPost.UtImpmeasr = this.assessmentForm.controls.utImpMeasure.value;
    }
    // tslint:disable-next-line:max-line-length
    if (this.assessmentForm.controls.rainfallAnnualMeasure.value === undefined || this.assessmentForm.controls.rainfallAnnualMeasure.value === null) {
      this.assessmentPost.RainfallAnnualmeasr = 0;
    } else {
      this.assessmentPost.RainfallAnnualmeasr = this.assessmentForm.controls.rainfallAnnualMeasure.value;
    }
     if (this.assessmentForm.controls.soilPermMeasure.value === undefined || this.assessmentForm.controls.soilPermMeasure.value === null) {
      this.assessmentPost.SoilPermmeasr = 0;
     } else {
      this.assessmentPost.SoilPermmeasr = this.assessmentForm.controls.soilPermMeasure.value;
     }
    if (this.assessmentForm.controls.aqfrDepthMeasure.value === undefined || this.assessmentForm.controls.aqfrDepthMeasure.value === null) {
      this.assessmentPost.AqfrDepthmeasr = 0;
    } else {
      this.assessmentPost.AqfrDepthmeasr = this.assessmentForm.controls.aqfrDepthMeasure.value;
    }
    if (this.assessmentForm.controls.swDistMeasure.value === undefined || this.assessmentForm.controls.swDistMeasure.value === null) {
      this.assessmentPost.SwDistmeasr = 0;
    } else {
      this.assessmentPost.SwDistmeasr = this.assessmentForm.controls.swDistMeasure.value;
    }
    this.assessmentPost.lastChangeBy = this.authService.getUserIdWoDomain();
    console.log(this.assessmentPost);
    console.log( JSON.stringify(this.assessmentPost));

  }

  discoverDateValidation(control: AbstractControl) {
    // Discover Date cannot be blank
      const discoverDate = control.get('discoverDate');
      if ((discoverDate.dirty === true) && (discoverDate.value == null || discoverDate.value === 'undefined')) {
        discoverDate.setErrors({'discoverDate': true});
      return {
        discoverDateError: {
          discoverDateError: true
        }
      };
    } else {
      discoverDate.setErrors(null);
      return null;
    }

  }


  reportCauseRequiredValidation(control: AbstractControl) {
    const releaseCauseType = control.get('releaseCauseId');
    if (releaseCauseType.dirty && releaseCauseType.value === 8) {
      releaseCauseType.setErrors({'releaseCauseeNotReportedError': true});
      return {
          reportCauseError: {
            reportCauseError: true
          }

      };
    } else {
      releaseCauseType.setErrors(null);
      return null;
    }

  }

  reportSourceRequiredValidation(control: AbstractControl) {
    const sourceType = control.get('releaseSourceId');
    if (sourceType.dirty && sourceType.value === 7) {
      sourceType.setErrors({'releaseSourceNotReportedError': true});
      return {
          reportSourceError: {
            reportSourceError: true
          }

      };
    } else {
      sourceType.setErrors(null);
      return null;
    }

  }

  assessmentConfirmationCodeRequiredValidation(control: AbstractControl) {
    const confirmationCode = control.get('confirmationCode');

    if ((confirmationCode.dirty === true ) && (confirmationCode.value === '')) {
        confirmationCode.setErrors({'confirmationCode': true});
        return {
            confirmationCodeError: {
              confirmationCodeError: true
            }
        };
      } else {
        confirmationCode.setErrors(null);
        return null;

      }

  }

  assessmentReleaseCauseTypeRequiredValidation(control: AbstractControl) {
    const releaseCauseType = control.get('releaseCauseType');

    if ((releaseCauseType.dirty === true ) && (releaseCauseType.value === '')) {
      releaseCauseType.setErrors({'releaseCauseType': true});
        return {
          releaseCauseTypeError: {
            releaseCauseTypeError: true
            }
        };
      } else {
        releaseCauseType.setErrors(null);
        return null;

      }

  }

  assessmentReleaseSourceTypeRequiredValidation(control: AbstractControl) {
    const sourceType = control.get('sourceType');

    if ((sourceType.dirty === true ) && (sourceType.value === '')) {
      sourceType.setErrors({'sourceType': true});
        return {
          sourceTypeTypeError: {
            sourceTypeTypeError: true
            }
        };
      } else {
        sourceType.setErrors(null);
        return null;

      }

  }

  assessmentDiscoveryTypeRequiredValidation(control: AbstractControl) {
    const discoveryType = control.get('discoveryType');

    if ((discoveryType.dirty === true ) && (discoveryType.value === '')) {
      discoveryType.setErrors({'discoveryType': true});
        return {
          discoveryTypeError: {
            discoveryTypeError: true
            }
        };
      } else {
        discoveryType.setErrors(null);
        return null;

      }

  }


  private getMediaErrorMessage(): string {
    if (this.assessmentForm.controls.gwMediaInd.value || this.assessmentForm.controls.swMediaInd.value ||
      this.assessmentForm.controls.dwMediaInd.value || this.assessmentForm.controls.slMediaInd.value ||
      this.assessmentForm.controls.fvMediaInd.value || this.assessmentForm.controls.fpMediaInd.value
    ) { return null; } else {
      this.showMediaErrorMessage = true;
      return('Must select at least one Media.');
    }
  }

  private getContaminantErrorMessage(): string {
    if (this.assessmentForm.controls.hoContamInd.value || this.assessmentForm.controls.ugContamInd.value ||
      this.assessmentForm.controls.lgContamInd.value || this.assessmentForm.controls.mgContamInd.value ||
      this.assessmentForm.controls.dsContamInd.value || this.assessmentForm.controls.woContamInd.value ||
      this.assessmentForm.controls.lbContamInd.value || this.assessmentForm.controls.svContamInd.value ||
      this.assessmentForm.controls.opContamInd.value || this.assessmentForm.controls.chContamInd.value ||
      this.assessmentForm.controls.unContamInd.value || this.assessmentForm.controls.mtbeContamInd.value
    ) { return null; } else {
      this.showContaminantErrorMessage = true;
      return('Must select at least one Contaminant.');
    }
  }



  // dwSiteScore(control: AbstractControl) {
  //   const dwCalc = control.get('drinkingWater');
  //   if (dwCalc === 1)

  // }

  amountReleased() {

  }

  contaminants() {

  }


  save() {

  }

  close() {

  }

  OnScrollIntoView () {
    // Attempt to bring the Search Results into view
    const scrToView = document.querySelector('#topOfForm');
    // console.log(scrToView);
    if (scrToView) {
      scrToView.scrollIntoView();
    }
  }




  onCleanupChanged(event, item) {

    this.thermo();
  }


  thermoInit() {
    // const scoreLow = document.getElementById('siteScoreLow');
    // const scoreAverage = document.getElementById('siteScoreAverage');
    // const scoreHigh20 = document.getElementById('SiteScore');
    // const scoreHigh40 = document.getElementById('High40X');
    // const scoreHigh60 = document.getElementById('High60X');
    // const scoreHigh80 = document.getElementById('High80X');
    // const scoreHigh100 = document.getElementById('High100X');

    const scoreLow = document.getElementById('LOWX');
    const scoreAverage = document.getElementById('AVERAGEX');
    const scoreHigh20 = document.getElementById('HIGH20X');
    const scoreHigh40 = document.getElementById('HIGH40X');
    const scoreHigh60 = document.getElementById('HIGH60X');
    const scoreHigh80 = document.getElementById('HIGH80X');
    const scoreHigh100 = document.getElementById('HIGH100X');


    // scoreLow.style.backgroundColor = 'green';
    // scoreAverage.style.backgroundColor = 'green';
    // scoreHigh20.style.backgroundColor = 'green';
    // scoreHigh40.style.backgroundColor = 'green';
    // scoreHigh60.style.backgroundColor = 'green';
    // scoreHigh80.style.backgroundColor = 'green';
    // scoreHigh100.style.backgroundColor = 'green';
  }


  thermo() {
    console.log('update from thermo = ' + this.isUpdate);

    if (this.isUpdate) {

      const totalScore = document.getElementById('c1');
      const scoreLow = document.getElementById('LOWX');
      const scoreAverage = document.getElementById('AVERAGEX');
      const scoreHigh20 = document.getElementById('HIGH20X');
      const scoreHigh40 = document.getElementById('HIGH40X');
      const scoreHigh60 = document.getElementById('HIGH60X');
      const scoreHigh80 = document.getElementById('HIGH80X');
      const scoreHigh100 = document.getElementById('HIGH100X');


      scoreLow.classList.remove('green-background-color');
      scoreLow.classList.remove('red-background-color');
      scoreAverage.classList.remove('green-background-color');
      scoreAverage.classList.remove('red-background-color');
      scoreHigh20.classList.remove('green-background-color');
      scoreHigh20.classList.remove('red-background-color');
      scoreHigh40.classList.remove('green-background-color');
      scoreHigh40.classList.remove('red-background-color');
      scoreHigh60.classList.remove('green-background-color');
      scoreHigh60.classList.remove('red-background-color');
      scoreHigh80.classList.remove('green-background-color');
      scoreHigh80.classList.remove('red-background-color');
      scoreHigh100.classList.remove('green-background-color');
      scoreHigh100.classList.remove('red-background-color');

      scoreLow.classList.add('green-background-color');
      scoreAverage.classList.add('green-background-color');
      scoreHigh20.classList.add('green-background-color');
      scoreHigh40.classList.add('green-background-color');
      scoreHigh60.classList.add('green-background-color');
      scoreHigh80.classList.add('green-background-color');
      scoreHigh100.classList.add('green-background-color');


      // const scoreLowX = document.getElementById('siteScoreLow');
      // const scoreAverageX = document.getElementById('siteScoreAverage');
      // const scoreHigh20X = document.getElementById('High20');
      // const scoreHigh40X = document.getElementById('High40');
      // const scoreHigh60X = document.getElementById('High60');
      // const scoreHigh80X = document.getElementById('High80');
      // const scoreHigh100X = document.getElementById('High100');





      // scoreLow.style.backgroundColor = 'green';
      // scoreAverage.style.backgroundColor = 'green';
      // scoreHigh20.style.backgroundColor = 'green';
      // scoreHigh40.style.backgroundColor = 'green';
      // scoreHigh60.style.backgroundColor = 'green';
      // scoreHigh80.style.backgroundColor = 'green';
      // scoreHigh100.style.backgroundColor = 'green';




      // this.currentScore = 0;


      //   this.assessmentForm.controls.lowestScore.setValue('Lowest Score: ' + this.assessmentForm.controls.lowestScore);
      // this.assessmentForm.controls.avgScore.setValue('Avg Score: ' + this.assessmentForm.controls.avgScore);
      //   this.avgScoreProperty = 'Avg Score: ' + this.assessmentForm.controls.avgScore;
      //   this.assessmentForm.controls.highScore.setValue('High Score: ' + this.assessmentForm.controls.highScore);

      let scoreRangeText: string;
      scoreRangeText = this.scoreRange.trim();

      switch (scoreRangeText) {
        case 'LOW': {
        // scoreLowX.style.backgroundColor = 'red';
        scoreLow.classList.remove('green-background-color');
        scoreLow.classList.add('red-background-color');
          break;
        }
        case 'AVERAGE':
        // scoreLowX.style.backgroundColor = 'red';
        // scoreAverageX.style.backgroundColor = 'red';

        scoreLow.classList.remove('green-background-color');
        scoreLow.classList.add('red-background-color');
        scoreAverage.classList.remove('green-background-color');
        scoreAverage.classList.add('red-background-color');



          break;
        case 'HIGH20':
        // scoreLowX.style.backgroundColor = 'red';
        // scoreAverageX.style.backgroundColor = 'red';
        // scoreHigh20X.style.backgroundColor = 'red';

        scoreLow.classList.remove('green-background-color');
        scoreLow.classList.add('red-background-color');
        scoreAverage.classList.remove('green-background-color');
        scoreAverage.classList.add('red-background-color');
        scoreHigh20.classList.remove('green-background-color');
        scoreHigh20.classList.add('red-background-color');


          break;
        case 'HIGH40':
        // scoreLowX.style.backgroundColor = 'red';
        // scoreAverageX.style.backgroundColor = 'red';
        // scoreHigh20X.style.backgroundColor = 'green';
        // scoreHigh40X.style.backgroundColor = 'red';

        scoreLow.classList.remove('green-background-color');
        scoreLow.classList.add('red-background-color');
        scoreAverage.classList.remove('green-background-color');
        scoreAverage.classList.add('red-background-color');
        scoreHigh20.classList.remove('green-background-color');
        scoreHigh20.classList.add('red-background-color');
        scoreHigh40.classList.remove('green-background-color');
        scoreHigh40.classList.add('red-background-color');


          break;
        case 'HIGH60':
        // scoreLowX.style.backgroundColor = 'red';
        // scoreAverageX.style.backgroundColor = 'red';
        // scoreHigh20X.style.backgroundColor = 'green';
        // scoreHigh40X.style.backgroundColor = 'red';
        // scoreHigh60X.style.backgroundColor = 'red';

        scoreLow.classList.remove('green-background-color');
        scoreLow.classList.add('red-background-color');
        scoreAverage.classList.remove('green-background-color');
        scoreAverage.classList.add('red-background-color');
        scoreHigh20.classList.remove('green-background-color');
        scoreHigh20.classList.add('red-background-color');
        scoreHigh40.classList.remove('green-background-color');
        scoreHigh40.classList.add('red-background-color');
        scoreHigh60.classList.remove('green-background-color');
        scoreHigh60.classList.add('red-background-color');

          break;
        case 'HIGH80':
        // scoreLowX.style.backgroundColor = 'red';
        // scoreAverageX.style.backgroundColor = 'red';
        // scoreHigh20X.style.backgroundColor = 'green';
        // scoreHigh40X.style.backgroundColor = 'red';
        // scoreHigh60X.style.backgroundColor = 'red';
        // scoreHigh80X.style.backgroundColor = 'red';

        scoreLow.classList.remove('green-background-color');
        scoreLow.classList.add('red-background-color');
        scoreAverage.classList.remove('green-background-color');
        scoreAverage.classList.add('red-background-color');
        scoreHigh20.classList.remove('green-background-color');
        scoreHigh20.classList.add('red-background-color');
        scoreHigh40.classList.remove('green-background-color');
        scoreHigh40.classList.add('red-background-color');
        scoreHigh60.classList.remove('green-background-color');
        scoreHigh60.classList.add('red-background-color');
        scoreHigh80.classList.remove('green-background-color');
        scoreHigh80.classList.add('red-background-color');
          break;
        case 'HIGH100':

        // scoreLowX.style.backgroundColor = 'red';
        // scoreAverageX.style.backgroundColor = 'red';
        // scoreHigh20X.style.backgroundColor = 'green';
        // scoreHigh40X.style.backgroundColor = 'red';
        // scoreHigh60X.style.backgroundColor = 'red';
        // scoreHigh80X.style.backgroundColor = 'red';
        // scoreHigh100X.style.backgroundColor = 'red';


        scoreLow.classList.remove('green-background-color');
        scoreLow.classList.add('red-background-color');
        scoreAverage.classList.remove('green-background-color');
        scoreAverage.classList.add('red-background-color');
        scoreHigh20.classList.remove('green-background-color');
        scoreHigh20.classList.add('red-background-color');
        scoreHigh40.classList.remove('green-background-color');
        scoreHigh40.classList.add('red-background-color');
        scoreHigh60.classList.remove('green-background-color');
        scoreHigh60.classList.add('red-background-color');
        scoreHigh80.classList.remove('green-background-color');
        scoreHigh80.classList.add('red-background-color');
        scoreHigh100.classList.remove('green-background-color');
        scoreHigh100.classList.add('red-background-color');

          break;
        default:
          break;
      }
    }
  }

  checkLUSTId(): void {
    // const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    // if (lustIDKeyIdentifier.textContent === undefined || lustIDKeyIdentifier.textContent === '') {
    // console.log('Routing to Assessment using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    // if (this.lustId.toString() !== lustIDKeyIdentifier.textContent.toString()) {
    //   console.log('data missing');
    //   const lustMenu = document.getElementById('lustMenu');
    //   lustMenu.style.display = 'block';
    //   lustIDKeyIdentifier.textContent = this.lustId.toString();
    // }


    // }
  }

}
