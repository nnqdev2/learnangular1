import { Component, Input } from '@angular/core';
import { AbstractControlDirective, AbstractControl } from '@angular/forms';

@Component({
  selector: 'app-show-errors',
  templateUrl: './show-errors.component.html',
  styleUrls: ['./show-errors.component.css']
})
export class ShowErrorsComponent {

  private static readonly errorMessages = {
    'required': () => 'Required.',
    'email': () => 'Valid Email required.',
    'minlength': (params) => 'The min number of characters is ' + params.requiredLength,
    'maxlength': (params) => 'The max allowed number of characters is ' + params.requiredLength,
    'pattern': (params) => 'The required pattern is: ' + params.requiredPattern,
    'years': (params) => params.message,
    'countryCity': (params) => params.message,
    'uniqueName': (params) => params.message,
    'telephoneNumbers': (params) => params.message,
    'telephoneNumber': (params) => params.message,
    'selectOneOrMoreMedias': 'Must select one or more Medias.',
    'selectOneOrMoreContaminants': 'Must select one or more Contaminants.',
    'matDatepickerParse': () => 'Required. ' ,
    'noValidAddress': () => 'No Valid Address and Site Address cannot both contain values',
    'receivedDateAfterCloseDate' : () => 'Received Date cannot be after all dates',
    'siteNoValidAddressMissing' : () => 'A Street, City, County, and Zip Code is necessary - or No Valid Address must be checked.',
    'orgNameNameMissing' : () => 'First/Last Name OR Organization Name is required',
    'releaseSourceNotReportedError' : () => 'NOT REPORTED is not accepted to Create or Update a record. Please select a different value.',
    'releaseCauseeNotReportedError' : () => 'NOT REPORTED is not accepted to Create or Update a record. Please select a different value.',
    'unSignedNumberError' : () => 'Must be an unsigned number.',
    'pcsSoilStatusError' : () => 'Disposal amount -or- a NO PCS MANAGED Soil Status is required.',
    'landfillFacilityError' : () => 'Landfill facility is required if landfill amount is specified.',
    'landfillAmountCrossCheckError': () => 'Landfill amount is required if landfill facility is specified.',
    'treatmentFacilityError' : () => 'Treatment facility is required if treatment amount is specified.',
    'treatmentAmountError': () => 'Treatment amount is required if treatment facility is specified.',
    'onSiteDisposalIndError': () => 'OnSite disposal indicator should be set to true if onsite amount is specified.',
    'onSiteAmountError': () => 'Onsite amount is required if onsite disposal indicator is set to true.',
    'offSiteDispAddrError': () => 'Offsite disposal address is required if offsite amount is specified.',
    'offSiteAmountError': () => 'Offsite amount is required if offsite disposal address is specified.',
    'issueDateError': () => 'Issue Date must be greater than or equal to Appl Received date.',
    'expirationDateError': () => 'Expiration Date must be greater than or equal to Issue Date.',
    'permitExtensionDateError': () => 'Permit Extention Date must be greater than or equal to Issue Date.',
    'swlaPermitNbrError': () => 'Required.',
    'hotAddressError': () => 'HOT Street Nbr and Street - OR - HOT Other Address must be entered.',
    'hotRpAddressError': () => 'RP Street Nbr and Street - OR - RP Other Address must be entered.',
    'hotRpNameError': () => 'RP First and Last Name - OR - RP Company must be entered.',
    'hotCheckReceivedDateError': () => 'Check Received Date Must be >= Decommission Date.',
    'SiteControlDateBeginAfterEnd': () => 'Control Begin Date can\'t be greater than Control End Date.',
    'SiteControlDateBeginAfterLastReview': () => 'Begin Date can\'t be greater than Last Reviewed date.',
    'matDatepickerMax': (params) => 'Must be less than or equal to today\'s date',
    'matDatepickerMin': (params) => 'Must be greater than or equal to today\'s date',
    'validOregonZipRequired': () => 'Required valid Oregon zipcode.',
    'dateReceivedGreaterDateDiscovered': () => 'Date Received must be the same or greater than Discovered Date.',
    'cleanupStartDateError': () => 'A Cleanup Start Date must exist for a Final Invoice Request Date.',
    'finalInvoiceRequestDateError': () => 'Final Invoice Request Date cannot be before Cleanup Start Date.',
    'finalInvcRqstDateError': () => 'Final Invoice Request Date cannot be before Cleanup Start Date.',
    'PhoneNumberFormatInvalid' : () => 'Phone Number Format is Invalid',
    'ContactPhoneNumberFormatInvalid' : () => 'Phone Number Format is Invalid',
    'discoveryDateError' : () => 'Discovery Date must be less than or equal to Received Date.',
    'finalInvcRqstDateGreaterClosedDateError': () => 'Final Invoice Request Date cannot be after Closed Date.',
    'finalInvcRqstDateClosedDateError': () => 'Final Invoice Request Date cannot be after Closed Date.',
    'finalInvcRqstDateRequiredError': () => 'Final Invoice Request Date required with a Closed Date.',
    'meetingDateError': () => 'Meeting Date must be the same or after the Notice Date.',
    'publicNoticeDateError': () => 'Notice Date must be the same or before the Meeting Date.',

  };

  @Input()
  private control: AbstractControlDirective | AbstractControl;
  @Input()
  private submitClicked: boolean;

  shouldShowErrors(): boolean {
    return this.control &&
      this.control.errors &&
      (this.control.dirty || this.control.touched || this.submitClicked);
  }

  listOfErrors(): string[] {
    return Object.keys(this.control.errors)
      .map(
        field =>  this.getMessage(field, this.control.errors[field])
      );
  }

  private getMessage(type: string, params: any) {
    if ((ShowErrorsComponent.errorMessages[type](params)) === 'The required pattern is: ^([+-]?[1-9]\\d*|0)$') {
      return 'Please enter numeric values only';
      } else if ((ShowErrorsComponent.errorMessages[type](params))
          === 'The required pattern is: ^\\(?([0-9]{3})\\)?[ -.â—]?([0-9]{3})[-.â—]?([0-9]{4})$') {
        return 'Please enter a valid phone number';
      } else if ((ShowErrorsComponent.errorMessages[type](params)) === 'The required pattern is: ^\\d{5}(?:[-s]\\d{4})?$') {
        return 'Please enter a zip code';
      } else if ((ShowErrorsComponent.errorMessages[type](params)) === 'The required pattern is: ^\\d{5}(?:[-\\s]\\d{4})?$') {
        return 'Please enter a zip code';
      } else if ((ShowErrorsComponent.errorMessages[type](params)) === 'Phone Number Format is Invalid') {
          return 'Please enter a valid phone number';
      } else if ((ShowErrorsComponent.errorMessages[type](params)) === 'The required pattern is: /^\\d{4}$/') {
        return 'Please enter numbers';
      }{
        return ShowErrorsComponent.errorMessages[type](params);
        }
  }
}

