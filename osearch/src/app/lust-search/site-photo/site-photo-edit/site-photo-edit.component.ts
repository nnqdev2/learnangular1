import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators, FormControl } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, Subject, BehaviorSubject} from 'rxjs';
import { LustDataService } from '../../../services/lust-data.service';
import { MatDialogConfig, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { GuardDialogComponent } from '../../../common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from '../../../common/dialogs/submit-status-dialog.component';
import { SitePhoto } from '../../../models/site-photo';
import { SitePhotoPost } from '../../../models/site-photo-post';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { IncidentIdToNameService } from '../../../olprr-search/incident-id-to-name.service';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { validateConfig } from '@angular/router/src/config';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-site-photo-edit',
  templateUrl: './site-photo-edit.component.html',
  styleUrls: ['./site-photo-edit.component.scss']
})

export class SitePhotoEditComponent implements OnInit {
  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  private sitePhotoEditForm: FormGroup;
  private sitePhoto: SitePhoto;
  currentDate: Date = new Date(Date.now());
  errorMessage: string;
  private submitClicked = false;
  private resetFormClicked = false;
  private deleteClicked = false;
  private cancelClicked = false;
  private errors: any[];
  private lustId = 0;
  private pictureId = 0;
  private isUpdate = false;
  private returnPath: string;
  private logNumber: string;
  private siteName: string;
  private formTitle: string;
  private sitePhotoPost = new SitePhotoPost();
  private sitePhotoPostResult = new SitePhotoPost();
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  maxDate: Date;
  isClosed = true;
  authLevel: AuthLevel;
  viewOnly = false;
  returnToList = Constants.returnToList;


  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router
    , private canDeactivateDialog: MatDialog, private confirmDeleteDialog: MatDialog
    , private idToNameService: IncidentIdToNameService, private authService: AuthService
  ) {  }

  selectedFile: File = null;
  imageSrc = '';

  ngOnInit() {
    this.loadingSubject.next(true);
    this.setAuthLevel();
    this.setViewOnly();
    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.params.subscribe(params => {
      this.pictureId = +params['pictureid'];
    });
    const formTitle = 'Site Photo ';
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.logNumber = data.apGetLogNumber.logNumber;
      this.siteName = data.apGetLogNumber.siteName;
    });
    if (isNaN(this.pictureId)) {
      this.isUpdate = false;
      this.pictureId = 0;
      this.formTitle = 'Add ' + formTitle;
    } else {
      this.route.data.subscribe((data: {sitePhoto: SitePhoto}) => {
        this.sitePhoto = data.sitePhoto; this.logNumber = this.sitePhoto.logNumber; });
      this.isUpdate = true;
      this.formTitle = 'Update ' + formTitle;
    }
    this.formTitle = `${this.formTitle} ${this.logNumber} ${this.siteName}`;
    this.returnPath = 'lust/' + this.lustId + '/sitephotos';
    if (this.isUpdate) {
      this.sitePhotoEditForm = this.formBuilder.group({
        pictureDate: [this.sitePhoto.pictureDate, Validators.required],
        caption: [this.sitePhoto.caption, Validators.required],
        sitePictureId: [this.sitePhoto.sitePictureId, Validators.required],
        logNumber: [this.sitePhoto.logNumber, Validators.required],
        picture: [this.sitePhoto.picture, Validators.required],
        lastChangeBy: [{value: this.sitePhoto.lastChangeBy, disabled: true}],
        lastChangeDate:  [{value: this.sitePhoto.lastChangeDate, disabled: true}],
      },
      {validator: [] }
      );
    } else {
        this.sitePhotoEditForm = this.formBuilder.group({
          pictureDate: new FormControl(this.currentDate, [Validators.required]),
          caption:  new FormControl('', [Validators.required]),
          picture:  new FormControl('', [Validators.required]),
          sitePictureId: new FormControl(0),
          logNumber: new FormControl(this.logNumber),
          // lastChangeBy: [{value: this.sitePhoto.lastChangeBy, disabled: true}],
          // lastChangeDate:  [{value: this.sitePhoto.lastChangeDate, disabled: true}],
        },
        {validator: [] }
        );
    }
    this.disableForm();
    this.maxDate = new Date();
    this.maxDate.setDate( this.maxDate.getDate());
    this.loadingSubject.next(false);
    if (this.sitePhoto) {
      this.imageSrc = 'data:image/jpeg;base64,' + this.sitePhoto.picture;
    }
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
      this.sitePhotoEditForm.disable();
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
    if (this.sitePhotoEditForm.pristine  || this.isActionSelected() ) {
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
    for (const field of Object.keys(this.sitePhotoEditForm.controls)) {
        if (this.sitePhotoEditForm.controls[field].invalid) {
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


  // selectedFile: File = null;
  // imageSrc: string = '';
  onFileSelected(event) {
    console.log(event);
    this.selectedFile = event.target.files[0];
    const reader = new FileReader();
    reader.onload = e => {
      this.imageSrc = reader.result as string;
      const bytes = this.imageSrc.split(',')[1] as string;
      this.sitePhotoEditForm.controls.picture.setValue(bytes.trim());
    };
    reader.readAsDataURL(this.selectedFile);
  }

  onImageClick(event) {
    if (this.imageSrc) {
      const iframe = "<html><head><title>Image " + this.pictureId + "</title></head><body><img src='" + this.imageSrc + "'/></body></html>";
      const x = window.open();
      x.document.open();
      x.document.write(iframe);
      x.document.close();
    }
  }

  submitSitePhoto(): void {
    this.submitClicked = true;
    if (this.sitePhotoEditForm.dirty && this.sitePhotoEditForm.valid) {
      this.sitePhotoPost.lustId = this.lustId;
      this.sitePhotoPost.pictureId = this.pictureId;
      this.sitePhotoPost.sitePictureId = this.sitePhotoEditForm.controls.sitePictureId.value;
      this.sitePhotoPost.pictureDate = this.sitePhotoEditForm.controls.pictureDate.value;
      this.sitePhotoPost.caption = this.sitePhotoEditForm.controls.caption.value;
      this.sitePhotoPost.picture = this.sitePhotoEditForm.controls.picture.value;
      this.sitePhotoPost.lastChangeBy = this.authService.getUserIdWoDomain();
      this.sitePhotoPost.lastChangeDate = this.maxDate;
      this.sitePhotoPost.logNumber = this.sitePhotoEditForm.controls.logNumber.value;
      console.log(JSON.stringify(this.sitePhotoPost));
      this.lustDataService.insUpdSitePhoto(this.sitePhotoPost)
        .subscribe(
          (data ) => (
            this.sitePhotoPostResult = data,
            this.onInsUpdSitePhotoComplete()),
        );
    } else if (this.sitePhotoEditForm.invalid) {
        this.errors = this.findInvalidControls();
        this.isClosed = false;
        console.log('this.errors');
        console.log(this.errors);
    }
  }

  onInsUpdSitePhotoComplete(): void {
    this.router.navigate([this.returnPath]);
  }

  cancel() {
    this.cancelClicked = true;
    this.router.navigate([this.returnPath]);
  }

  delete() {
    this.deleteClicked = true;
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete this image?', // from ' + this.sitePhoto.pictureDate.toDateString + '?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delSitePhoto(this.sitePhoto.pictureId).subscribe();
        this.router.navigate([this.returnPath]);
      }
    });
  }

  resetForm() {
    this.resetFormClicked = true;
    this.sitePhotoEditForm.reset();
    this.sitePhotoEditForm.markAsPristine();
    if (this.isUpdate) {
      this.route.data.subscribe((data: {sitePhoto: SitePhoto}) => {
        this.sitePhoto = data.sitePhoto; this.logNumber = this.sitePhoto.logNumber;
        this.sitePhotoEditForm = this.formBuilder.group({
          picture: [this.sitePhoto.picture, Validators.required],
          caption: [this.sitePhoto.caption, Validators.required],
          pictureDate: [this.sitePhoto.pictureDate, Validators.required],
          sitePictureId: [this.sitePhoto.sitePictureId, Validators.required],
          logNumber: [this.sitePhoto.logNumber, Validators.required],
          lastChangeBy: [{value: this.sitePhoto.lastChangeBy, disabled: true}],
          lastChangeDate:  [{value: this.sitePhoto.lastChangeDate, disabled: true}],
        },
        {validator: [] }
        );
    });
    }
  }
}
