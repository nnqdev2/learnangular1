import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { FormGroup, FormBuilder, Validators, AbstractControl } from '@angular/forms';
import { environment } from '../../../../environments/environment';

import { GuardDialogComponent } from '../../../common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from '../../../common/dialogs/submit-status-dialog.component';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { ContactAffilPost } from '../../../models/contact-affil-post';
import { LustDataService } from '../../../services/lust-data.service';
import { IncidentIdToNameService } from '../../../olprr-search/incident-id-to-name.service';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { ContactAffilPostResult } from '../../../models/contact-affil-post-result';
import { ContactAffilGet } from '../../../models/contact-affil-get';
import { ContactType } from '../../../models/contact-type';
import { State } from '../../../models/state';
import { SearchDialogComponent } from '../../search-dialog/search-dialog.component';
import { ContactSearchResultStat } from '../../../models/contact-search-result-stat';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';
import { LustGenericResult } from 'src/app/models/lust-generic-result';
import { AddressCorrectDataService } from 'src/app/services/address-correct-data.service';
import { AddressCorrectStat } from 'src/app/models/address-correct-stat';
import { PostalCountyLookup } from 'src/app/models/postal-county-lookup';
import { map, flatMap } from 'rxjs/operators';
import { DatePipe } from '@angular/common';
import { LustCris } from 'src/app/models/lust-cris';

// const CRIS_INVOICE_CONTACT_TYPE = 'CRIS INVOICE CONTACT';
// const CRIS_INVOICE_AFFILTYPECD = 'INV';
// const CRIS_INVOICE_MSG = 'Invoice Contact data from CRIS system.  Information can\'t be changed from LUST system';

@Component({
  selector: 'app-contact-edit',
  templateUrl: './contact-edit.component.html',
  styleUrls: ['./contact-edit.component.scss']
})
export class ContactEditComponent implements OnInit {

  guardDialogRef: MatDialogRef<GuardDialogComponent, any>;
  submitStatusDialogRef: MatDialogRef<SubmitStatusDialogComponent, any>;
  confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  searchDialogRef: MatDialogRef<SearchDialogComponent, any>;
  private contactForm: FormGroup;
  private contactAffilGet: ContactAffilGet;
  currentDate: Date;
  errorMessage: string;
  private contactTypes: ContactType[];
  private contactType2s: ContactType[];
  private theRealContactTypes: ContactType[];
  private states: State[];
  private apGetLogNumber: ApGetLogNumber;
  private submitClicked = false;
  private resetFormClicked = false;
  private formUpdated = false;
  private deleteClicked = false;
  private cancelClicked = false;
  private errors: any[];
  private lustId = 0;
  private affilId = 0;
  private isUpdate = false;
  private success = false;
  private returnPath: string;
  private logNumber: string;
  private formTitle: string;
  private contactAffilPost = new ContactAffilPost();
  private contactAffilPostResult: ContactAffilPostResult;
  private delContactResult: LustGenericResult;
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  isClosed: boolean;
  private phoneNumbersOnly: string;
  public phonePlaceHolder = Constants.phone_place_holder;
  authLevel: AuthLevel;
  viewOnly = false;
  returnToList = Constants.returnToList;
  hideDelete = false;

  maxDate: Date;
  public isCrisInvoiceContact: boolean;
  public crisInvoiceContactExists: boolean;
  public cris_invoice_msg = Constants.cris_invoice_msg;
  private lastRefresh: string;
  addressCorrectStatLoaded = false;
  postalCountyLookup: PostalCountyLookup|null;
  countyFips: string;
  saAddressCorrectStat: AddressCorrectStat|null;
  showSaAddressCorrect = false;
  crisFound = 0;
  private lustCris: LustCris;

  constructor(private lustDataService: LustDataService, private formBuilder: FormBuilder
    , private route: ActivatedRoute, private router: Router, private searchDialog: MatDialog
    , private canDeactivateDialog: MatDialog, private submitStatusDialog: MatDialog
    , private idToNameService: IncidentIdToNameService, private authService: AuthService
    , private confirmDeleteDialog: MatDialog, private addressCorrectDataService: AddressCorrectDataService
    , private datePipe: DatePipe
  ) {  }

  ngOnInit() {
    this.loadingSubject.next(true);
    this.route.data.subscribe((data: {contactTypes: ContactType[]}) => {this.contactTypes = data.contactTypes; });
    this.route.data.subscribe((data: {contactType2s: ContactType[]}) => {this.contactType2s = data.contactType2s; });
    this.route.data.subscribe((data: {states: State[]}) => {this.states = data.states; });
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {this.apGetLogNumber = data.apGetLogNumber;
      this.logNumber = this.apGetLogNumber.logNumber; });
    this.setAuthLevel();
    this.setViewOnly();
    this.isClosed = true;
    this.route.pathFromRoot[2].params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.params.subscribe(params => {
      this.affilId = +params['affilid'];
    });
    if (isNaN(this.affilId)) {
      this.route.data.subscribe((data: {lustCris: LustCris}) => {this.lustCris = data.lustCris;
        this.crisFound = this.lustCris.crisExists; });
      this.isUpdate = false;
      this.affilId = 0;
      this.formTitle = 'Add New Contact ';
      this.isCrisInvoiceContact = false;
      this.setContactTypes(this.apGetLogNumber.releaseType);
      this.buildAddForm();
      this.disableForm();
    } else {
      this.route.data.subscribe((data: {contactAffilGet: ContactAffilGet}) => {
        this.contactAffilGet = data.contactAffilGet;
        this.isUpdate = true;
        this.setIsCrisInvoiceContact();
        if (!this.isCrisInvoiceContact) {
          this.logNumber = this.contactAffilGet.logNumber;
        }
        this.formTitle = 'Update Contact Details ';
        this.setContactTypes(this.contactAffilGet.releaseType);
        this.buildUpdateForm();
        this.disableForm();
      });
    }
    this.formTitle = `${this.formTitle} ${this.apGetLogNumber.logNumber} ${this.apGetLogNumber.siteName}`;
    this.returnPath = 'lust/' + this.lustId + '/contacts';
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
    if (this.authLevel === AuthLevel.PM) {
      this.hideDelete = true;
    }
  }

  private disableForm()  {
    if ( (this.viewOnly)
      ||  (this.isUpdate && this.contactAffilGet.affilTypeCd.match(/^(RP|RPT|INV)$/)
      && this.authLevel === AuthLevel.PM)
      ||  (this.isUpdate && this.contactAffilGet.affilTypeCd.match(/^(INV)$/)
      && this.contactAffilGet.crisCheck > 0)
      ) {
      this.viewOnly = true;
      this.contactForm.disable();
    }
  }

  private setContactTypes(releaseType: string) {
    if (releaseType === 'H' || this.authLevel === AuthLevel.PM
      || (this.crisFound > 0 && this.isUpdate === false) ) {
      // || (this.isUpdate && this.contactAffilGet.crisCheck > 0)) {
      this.theRealContactTypes = this.contactType2s;
    } else {
      this.theRealContactTypes = this.contactTypes;
    }
  }

  private buildUpdateForm() {
    if ((!this.isCrisInvoiceContact)
          || (this.contactAffilGet.affilTypeCd !== 'INV'
              && this.contactAffilGet.crisCheck === 0) ) {
      this.contactForm = this.formBuilder.group({
        affilTypeCd: [this.contactAffilGet.affilTypeCd, Validators.required],
        // affilTypeCd: [{value: this.contactAffilGet.affilTypeCd,  disabled: true}],
        startDt: [this.contactAffilGet.startDt, Validators.required],
        endDt:   [this.contactAffilGet.endDt],
        firstName: [this.contactAffilGet.firstName, Validators.compose([Validators.maxLength(40)])],
        lastName: [this.contactAffilGet.lastName, Validators.compose([Validators.maxLength(40)])],
        organization:   [this.contactAffilGet.organization, Validators.compose([Validators.maxLength(40)])],
        subOrganization:   [this.contactAffilGet.subOrganization, Validators.compose([Validators.maxLength(40)])],
        jobTitle: [this.contactAffilGet.jobTitle, Validators.compose([Validators.maxLength(40)])],
        street: [this.contactAffilGet.street, Validators.compose([Validators.required, Validators.maxLength(56)])],
        city:   [this.contactAffilGet.city,  Validators.compose([Validators.required, Validators.maxLength(25)])],
        state: [this.contactAffilGet.state, Validators.compose([Validators.required, Validators.maxLength(2)])],
        zip: [this.contactAffilGet.zip
          , Validators.compose([Validators.required, Validators.maxLength(10), Validators.pattern(Constants.zip_format)])],
        phone:   [this.contactAffilGet.phone, Validators.compose([Validators.maxLength(40)])],
        email:   [this.contactAffilGet.email, Validators.compose([Validators.email])],
        country:   [this.contactAffilGet.country,  Validators.compose([Validators.maxLength(25)])],
        affilComments:   [this.contactAffilGet.affilComments],
        saAddressCorrectAddress: [{value: '', disabled: true}],
        saAddressCorrectCounty:  [{value: '', disabled: true}],
        saAddressCorrectCity:    [{value: '', disabled: true}],
        saAddressCorrectZipcode: [{value: '', disabled: true}],
        saAddressCorrectState:   [{value: '', disabled: true}],
      },
      {validator: [ this.contactPhoneNumberValidation.bind(this),
        this.OrgNameFirstLastNameValidator.bind(this) ] }
      );
    } else {
      this.contactForm = this.formBuilder.group({
        affilTypeCd: [{value: this.contactAffilGet.affilTypeCd, disabled: true}],
        startDt: [{value: this.contactAffilGet.startDt, disabled: true}],
        endDt:   [{value: this.contactAffilGet.endDt, disabled: true}],
        firstName: [{value: this.contactAffilGet.firstName, disabled: true}],
        lastName: [{value: this.contactAffilGet.lastName, disabled: true}],
        organization:   [{value: this.contactAffilGet.organization, disabled: true}],
        subOrganization:   [{value: this.contactAffilGet.subOrganization, disabled: true}],
        jobTitle: [{value: this.contactAffilGet.jobTitle, disabled: true}],
        street: [{value: this.contactAffilGet.street, disabled: true}],
        city:   [{value: this.contactAffilGet.city, disabled: true}],
        state: [{value: this.contactAffilGet.state, disabled: true}],
        zip: [{value: this.contactAffilGet.zip, disabled: true}],
        phone:   [{value: this.contactAffilGet.phone, disabled: true}],
        email:   [{value: this.contactAffilGet.email, disabled: true}],
        country:   [{value: this.contactAffilGet.country, disabled: true}],
        affilComments:   [{value: this.contactAffilGet.affilComments, disabled: true}],
      },
      {validator: [ this.contactPhoneNumberValidation.bind(this),
        this.OrgNameFirstLastNameValidator.bind(this) ] }
      );
    }
  }

  private buildAddForm() {
    this.contactForm = this.formBuilder.group({
      affilTypeCd: ['', Validators.required],
      startDt: ['', Validators.required],
      endDt:   [''],
      firstName: ['', Validators.compose([Validators.maxLength(40)])],
      lastName: ['', Validators.compose([Validators.maxLength(40)])],
      organization:   ['', Validators.compose([Validators.maxLength(40)])],
      subOrganization:   ['', Validators.compose([Validators.maxLength(40)])],
      jobTitle: ['', Validators.compose([Validators.maxLength(40)])],
      street: ['', Validators.compose([Validators.required, Validators.maxLength(56)])],
      city:   ['', Validators.compose([Validators.required, Validators.maxLength(25)])],
      state: ['', Validators.compose([Validators.required, Validators.maxLength(2)])],
      // zip: ['', Validators.compose([Validators.required, Validators.maxLength(10), Validators.pattern('^\\d{5}(?:[-\\s]\\d{4})?')])],
      zip: ['', Validators.compose([Validators.required, Validators.maxLength(10), Validators.pattern(Constants.zip_format)])],
      phone:   ['', Validators.compose([Validators.maxLength(40)])],
      email:   ['', Validators.compose([Validators.email, Validators.maxLength(40)])],
      country:   ['', Validators.compose([Validators.maxLength(25)])],
      affilComments:   [''],
      saAddressCorrectAddress: [{value: '', disabled: true}],
      saAddressCorrectCounty:  [{value: '', disabled: true}],
      saAddressCorrectCity:    [{value: '', disabled: true}],
      saAddressCorrectZipcode: [{value: '', disabled: true}],
      saAddressCorrectState:   [{value: '', disabled: true}],

    },
    {validator: [ this.contactPhoneNumberValidation.bind(this),
      this.OrgNameFirstLastNameValidator.bind(this)] }
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
      (this.contactForm.pristine  && !this.formUpdated)
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
    for (const field of Object.keys(this.contactForm.controls)) {
        if (this.contactForm.controls[field].invalid) {
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
    if (this.contactForm.dirty && this.contactForm.valid) {
      this.setModelToFormData();
      this.lustDataService.updateLustContact(this.contactAffilPost)
        .subscribe(
          (data ) => (
            this.contactAffilPostResult = data
            , this.showSubmitStatusDialog()),
        );
    } else if (this.contactForm.invalid) {
        this.errors = this.findInvalidControls();
        this.isClosed = false;
        console.log('this.errors');
        console.log(this.errors);
    }
  }

  private showSubmitStatusDialog() {
    let message1 = '';
    let title = '';
    const button1 = 'Close';
    if (this.contactAffilPostResult.errMsg !== undefined &&
      this.contactAffilPostResult.errMsg !== null &&
      this.contactAffilPostResult.errMsg.length > 0 ) {
      title = 'Failed to save due to ' + this.contactAffilPostResult.errMsg ;
      message1 = this.contactAffilPostResult.errMsg;
      this.success = false;
    } else {
      title = 'Successfully saved '
       + ((this.contactAffilPostResult.affilId > 0) ? this.contactAffilPostResult.affilId : this.contactAffilPostResult.affilIdIn) ;
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
    this.contactAffilPost.affilType = this.contactForm.controls.affilTypeCd.value;
    this.contactAffilPost.startDt = this.contactForm.controls.startDt.value;
    this.contactAffilPost.endDt = this.contactForm.controls.endDt.value;
    this.contactAffilPost.firstName = this.contactForm.controls.firstName.value;
    this.contactAffilPost.lastName = this.contactForm.controls.lastName.value;
    this.contactAffilPost.street = this.contactForm.controls.street.value;
    this.contactAffilPost.organization = this.contactForm.controls.organization.value;
    this.contactAffilPost.subOrg = this.contactForm.controls.subOrganization.value;
    this.contactAffilPost.jobTitle = this.contactForm.controls.jobTitle.value;
    this.contactAffilPost.city = this.contactForm.controls.city.value;
    this.contactAffilPost.phone = this.contactForm.controls.phone.value;
    this.contactAffilPost.email = this.contactForm.controls.email.value;
    this.contactAffilPost.lustId = this.lustId;
    this.contactAffilPost.affilId = this.affilId;
    this.contactAffilPost.zip = this.contactForm.controls.zip.value;
    this.contactAffilPost.country = this.contactForm.controls.country.value;
    this.contactAffilPost.state = this.contactForm.controls.state.value;
    this.contactAffilPost.lastChangedBy = this.authService.getUserIdWoDomain();
    this.contactAffilPost.affilComments = this.contactForm.controls.affilComments.value;
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
      message1: 'Are you sure you want to delete Contact ' + this.contactAffilGet.firstName + ' '
      + this.contactAffilGet.lastName + ' ' + this.contactAffilGet.organization + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delContact(this.contactAffilGet.affilId, this.authService.getUserIdWoDomain()).subscribe(
          (data ) => (
            this.delContactResult = data
            , this.logError(data)
            // , this.showSubmitStatusDialog()),
          )
        );
        this.router.navigate([this.returnPath]);
      }
    });
  }

  logError(result: LustGenericResult) {
    if (result.errorMessageHandler !== null) {
      console.log('*****Deleting Contact AffilId ' + result.id + ' failed due to ' + result.errorMessageHandler);
    }
  }

  resetForm() {
    this.resetFormClicked = true;
    this.contactForm.reset();
    this.contactForm.markAsPristine();
    if (this.isUpdate) {
      this.route.data.subscribe((data: {contactAffilGet: ContactAffilGet}) => {
        this.contactAffilGet = data.contactAffilGet;
        this.buildUpdateForm();
    });
    }
  }


  private openContactSearch() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    // dialogConfig.disableClose =  true;
    dialogConfig.data = {
      searchType: 'Contact',
    };
    this.searchDialogRef = this.searchDialog.open(SearchDialogComponent, dialogConfig);
    this.searchDialogRef.afterClosed().subscribe(result => {
      if (result !== undefined) {
        this.updateContact(result);
      }
    });
  }

  private updateContact(contactSearchResultStat: ContactSearchResultStat) {
    this.contactForm.controls.street.setValue(contactSearchResultStat.street);
    this.contactForm.controls.city.setValue(contactSearchResultStat.city);
    this.contactForm.controls.state.setValue(contactSearchResultStat.state);
    this.contactForm.controls.firstName.setValue(contactSearchResultStat.firstName);
    this.contactForm.controls.lastName.setValue(contactSearchResultStat.lastName);
    this.contactForm.controls.organization.setValue(contactSearchResultStat.organization);
    this.contactForm.controls.country.setValue(contactSearchResultStat.country);
    this.contactForm.controls.phone.setValue(contactSearchResultStat.phone);
    this.contactForm.controls.email.setValue(contactSearchResultStat.email);
    this.contactForm.controls.zip.setValue(contactSearchResultStat.zipcode);
    this.contactForm.controls.subOrganization.setValue(contactSearchResultStat.subOrganization);
    this.formUpdated = true;
  }


  private setIsCrisInvoiceContact() {
    if (this.contactAffilGet.affilTypeCd === Constants.cris_invoice_affiltypecd
      && this.contactAffilGet.affilTypeDesc === Constants.cris_invoice_contact_type) {
        this.isCrisInvoiceContact = true;
    } else {
      this.isCrisInvoiceContact = false;
    }
  }

  private setCrisInvoiceContactExists() {
    if (this.contactAffilGet.crisCheck > 0) {
        this.crisInvoiceContactExists = true;
    } else {
      this.crisInvoiceContactExists = false;
    }
  }

  contactPhoneNumberValidation(control: AbstractControl) {
    const phoneNumberControl = control.get('phone');
    const phoneNumberString = phoneNumberControl.value.toString();
    this.phoneNumbersOnly = '';
    this.phoneNumbersOnly = phoneNumberString.replace(/\D/g, '');
    if (this.phoneNumbersOnly.length > 8) {
      if (this.phoneNumbersOnly.length < 10) {
        phoneNumberControl.setErrors({'ContactPhoneNumberFormatInvalid': true});
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

  OrgNameFirstLastNameValidator(group: FormGroup) {
    const firstNamefd = group.get('firstName');
    const lastNamefd = group.get('lastName');
    const organizationfd = group.get('organization');
    firstNamefd.setErrors(null);
    lastNamefd.setErrors(null);
    organizationfd.setErrors(null);

    // if (group.controls.organization.untouched === false && group.controls.firstName.untouched === false
    //    && group.controls.lastName.untouched === false) {
      if (group.controls.organization.value === ''
        && (group.controls.firstName.value === '' && group.controls.lastName.value === '')) {
          lastNamefd.setErrors({'orgNameNameMissing': true});
          return { organizationNameFirstLastNameError: true };
      // }
    }
  }

  private addressCorrectNotFound(): boolean {
    if ((this.saAddressCorrectStat !== undefined)
    && (this.saAddressCorrectStat.Records[0].PostalCode.length < 5)) {
      return true;
    }
    return false;
  }

  runSaAddressCorrect() {
    if (this.contactForm.controls.street !== undefined
      && this.contactForm.controls.street.value.length > 0 ) {
      this.showSaAddressCorrect = true;
    }
    this.addressCorrectDataService.getAddressCorrectStat(this.contactForm.controls.street.value
      , this.contactForm.controls.city.value, this.contactForm.controls.state.value)
      .pipe(
        map(addressCorrectData => {
          this.saAddressCorrectStat = addressCorrectData;
          this.countyFips = addressCorrectData.Records[0].CountyFIPS.substring(2);
        }),
        flatMap(() => this.lustDataService.getPostalCountyLookup(+this.countyFips)
        ),
    )
    .subscribe(
      (data => {
        this.refreshSaAddressCorrect(data);
      } )
    );
  }

  private refreshSaAddressCorrect(postalCountyLookup: PostalCountyLookup) {
    this.postalCountyLookup = postalCountyLookup;
    this.contactForm.controls.saAddressCorrectAddress.setValue(this.saAddressCorrectStat.Records[0].AddressLine1);
    this.contactForm.controls.saAddressCorrectCity.setValue(this.saAddressCorrectStat.Records[0].City);
    this.contactForm.controls.saAddressCorrectState.setValue(this.saAddressCorrectStat.Records[0].State);
    this.contactForm.controls.saAddressCorrectZipcode.setValue(this.saAddressCorrectStat.Records[0].PostalCode);
    this.contactForm.controls.saAddressCorrectCounty.setValue(this.postalCountyLookup.countyCode);
    // this.incidentForm.controls.updateSaWithAddressCorrect.setValue(false);
    this.lastRefresh = ' - Last Update [' + this.datePipe.transform(Date.now(), 'mediumTime') + ']';
  }

}
