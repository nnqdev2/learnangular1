import { Injectable } from '@angular/core';
import { DatePipe, TitleCasePipe, UpperCasePipe } from '@angular/common';
import { DecommissioningPrint, DecommPrintType } from '../../models/lust-hotc-decommissioning.print';

@Injectable({
  providedIn: 'root'
})

export class DecommPrintHelperService {
    pipe = new DatePipe('en-US');
    todaysDate = this.pipe.transform(Date.now(), 'mediumDate');

    constructor(private titleCasePipe: TitleCasePipe, private upperCasePipe: UpperCasePipe ) { }

    private getHeaderFileNo(decommPrint: DecommissioningPrint): string {
      let text = '';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
        case DecommPrintType.LustServiceProvider:
          text = decommPrint.logNumber ;
          break;
        case DecommPrintType.HotcHomeOwner:
        case DecommPrintType.HotcServiceProvider:
          text = 'HOTD-' + decommPrint.hotId;
          break;
        default:
          break;
      }
      return text;
    }

    private getAddress(decommPrint: DecommissioningPrint): string {
      let address = '';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
        case DecommPrintType.LustServiceProvider:
          address = this.trim(decommPrint.lustIncidentSiteAddress) + ', in '
                    + this.titleCasePipe.transform(this.trim(decommPrint.lustIncidentSiteCity)) + ', Oregon.';
          break;
        case DecommPrintType.HotcHomeOwner:
        case DecommPrintType.HotcServiceProvider:
          address = this.getHotcAddress(decommPrint);
          break;
        default:
            break;
      }
      return address;
    }

    private getHotcAddress(decommPrint: DecommissioningPrint): string {
      let address = '';
      if (decommPrint.hotStreetNbr && (decommPrint.hotStreetNbr.length === 0 || decommPrint.hotStreetNm.length === 0)) {
        address = this.trim(decommPrint.hotAddrCmnt);
      } else {
        address = decommPrint.streetNbr;
        if (decommPrint.hotStreetQuad && decommPrint.hotStreetQuad.length > 0) {
          address = address + ' ' + this.trim(decommPrint.hotStreetQuad);
        }
        address = address + ' ' + decommPrint.hotStreetNm;
        if (decommPrint.hotStreetType && decommPrint.hotStreetType.length > 0) {
          address = address + ' ' + decommPrint.hotStreetType;
        }
      }
      address = (address) + ', in ' + (this.trim(decommPrint.hotCity)) + ', Oregon.';
      return address;
    }

    private getHotcContactAddress(decommPrint: DecommissioningPrint): string {
      let address = '';
      if (!this.fieldHasValue(decommPrint.hotStreetNbr) || !this.fieldHasValue(decommPrint.hotStreetNm)) {
        address = this.trim(decommPrint.addressComment);
      } else {
        address = this.trim(decommPrint.streetNbr);
        if (this.fieldHasValue(this.trim(decommPrint.quadrant))) {
          address = address + ' ' + this.trim(decommPrint.quadrant);
        }
        address = address + ' ' + this.trim(decommPrint.streetName);
        if (this.fieldHasValue(this.trim(decommPrint.streetType))) {
          address = address + ' ' + this.trim(decommPrint.streetType);
        }
      }
      address = address + '<br>' + this.trim(decommPrint.city) + ', ' + this.trim(decommPrint.state) + ' ' + this.trim(decommPrint.zipcode);
      return address;
    }

    private getCompanyName(decommPrint: DecommissioningPrint): string {
      let text = '';
      if (decommPrint.serviceProviderName !== undefined) {
        text = this.trim(decommPrint.serviceProviderName);
      }
      return text;
    }

    private trim(text: string): string {
      if (this.fieldHasValue(text)) {
        return text.trim();
      }
      return '';
    }

    private getHeaderHotcReItem(decommPrint: DecommissioningPrint): string {
      let text = '';
      if (this.trim(decommPrint.firstName) || this.trim(decommPrint.lastName)) {
        text = this.titleCasePipe.transform(this.trim(decommPrint.lastName) + ', ' + this.trim(decommPrint.firstName));
      } else {
        text = this.trim(decommPrint.organization);
      }
      return text;
    }

    private getHeaderDearName(decommPrint: DecommissioningPrint): string {
      let text = '';
      if (this.trim(decommPrint.firstName) || this.trim(decommPrint.lastName)) {
        text = this.titleCasePipe.transform(this.trim(decommPrint.firstName) + ' ' + this.trim(decommPrint.lastName));
      } else {
        text = this.trim(decommPrint.organization);
      }
      return text;
    }

    private fieldHasValue(field: string): boolean {
      if (field) {
        return true;
      }
      return false;
    }

    private getHeaderAddress(decommPrint: DecommissioningPrint): string {
      let text = '';
      // fname lname company
      if (!this.fieldHasValue(decommPrint.firstName) || !this.fieldHasValue(decommPrint.firstName)) {
        switch (decommPrint.printType) {
          case DecommPrintType.LustHomeOwner:
          case DecommPrintType.LustServiceProvider:
            text = this.titleCasePipe.transform(this.trim(decommPrint.organization));
            break;
          case DecommPrintType.HotcHomeOwner:
          case DecommPrintType.HotcServiceProvider:
            text = this.upperCasePipe.transform(this.trim(decommPrint.organization));
            break;
          default:
              break;
        }
      } else if (this.fieldHasValue(decommPrint.organization)) {
        text = (this.trim(decommPrint.firstName) + ' ' + this.trim(decommPrint.lastName) + '<br>' +  this.trim(decommPrint.organization));
        switch (decommPrint.printType) {
          case DecommPrintType.LustHomeOwner:
          case DecommPrintType.LustServiceProvider:
            text = this.titleCasePipe.transform(text);
            break;
          case DecommPrintType.HotcHomeOwner:
          case DecommPrintType.HotcServiceProvider:
            text = this.upperCasePipe.transform(text);
            break;
          default:
              break;
        }
      } else {
        text = (this.trim(decommPrint.firstName) + ' ' + this.trim(decommPrint.lastName) );
        switch (decommPrint.printType) {
          case DecommPrintType.LustHomeOwner:
          case DecommPrintType.LustServiceProvider:
            text = this.titleCasePipe.transform(text);
            break;
          case DecommPrintType.HotcHomeOwner:
          case DecommPrintType.HotcServiceProvider:
            text = this.upperCasePipe.transform(text);
            break;
          default:
              break;
        }
      }

      // address
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
        case DecommPrintType.LustServiceProvider:
          text = text + '<br>' + this.trim(decommPrint.address)
          + '<br>' + this.titleCasePipe.transform(this.trim(decommPrint.city))
          + ', ' + this.trim(decommPrint.state)
          + ' ' + this.trim(decommPrint.zipcode)
          + '<br>';
          break;
        case DecommPrintType.HotcHomeOwner:
        case DecommPrintType.HotcServiceProvider:
          text = text + '<br>' + this.getHotcContactAddress(decommPrint);
          text = this.titleCasePipe.transform(text);
          break;
        default:
            break;
      }
      return this.upperCasePipe.transform(text) + '<br>';
    }

    private getHeaderReItem(decommPrint: DecommissioningPrint): string {
      let text = '';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
        case DecommPrintType.LustServiceProvider:
          text = this.titleCasePipe.transform(this.trim(decommPrint.lustIncidentSiteName));
          break;
        case DecommPrintType.HotcHomeOwner:
        case DecommPrintType.HotcServiceProvider:
          text = this.getHeaderHotcReItem(decommPrint);
          break;
        default:
            break;
      }
      return text;
    }

    private buildHeaderDate() {
      // tslint:disable-next-line:max-line-length
      return '<br><br><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' + this.todaysDate + '<br><br>';
    }

    private buildHeaderAddress(decommPrint: DecommissioningPrint): string {
      let line = '';
      line = this.getHeaderAddress(decommPrint);
      return line;
    }

    private buildHeaderReItem(decommPrint: DecommissioningPrint): string {
      let line = '';
      // tslint:disable-next-line:max-line-length
      line = '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Re: ' + this.getHeaderReItem(decommPrint) + '<br>';
      return line;
    }

    private buildHeaderFileNo(decommPrint: DecommissioningPrint): string {
      let line = '';
      // tslint:disable-next-line:max-line-length
      line = '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; File No: ' + this.getHeaderFileNo(decommPrint) + '<br><br>';
      return line;
    }

    private buildHeaderDearName(decommPrint: DecommissioningPrint): string {
      let line = '';
      line = 'Dear ' + this.getHeaderDearName(decommPrint) + ': <br><br>';
      return line;
    }

    private buildBodyLine1(decommPrint: DecommissioningPrint): string {
      let line = '';
      const t1 = 'The Department of Environmental Quality has received a report';
      const t2 = 'certification concerning the heating oil underground storage tank ';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
          line = t1 + ' and ' + t2 ;
          line = line + '(HOT) assessment and/or cleanup conducted at ';
          line = line + this.getAddress(decommPrint);
          break;
        case DecommPrintType.HotcHomeOwner:
          line = t1 + ' and ' + t2 ;
          line = line + 'decommissioning conducted at ';
          line = line + this.getAddress(decommPrint);
          break;
        case DecommPrintType.LustServiceProvider:
          line = t1 + ' and ' + this.getCompanyName(decommPrint) + ' ' + t2 ;
          line = line + '(HOT) assessment and/or cleanup conducted at ';
          line = line + this.getAddress(decommPrint);
          break;
        case DecommPrintType.HotcServiceProvider:
          line = t1 + ' along with ' + this.getCompanyName(decommPrint) + ' ' + t2 ;
          line = line + '(UST) assessment and/or cleanup conducted at ';
          line = line + this.getAddress(decommPrint);
          break;
        default:
          break;
      }
      return line + '<br><br>';
    }

    private buildBodyLine2(decommPrint: DecommissioningPrint): string {
      let line = '';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
          // tslint:disable-next-line:max-line-length
          line = 'You have certified that the cleanup has met the Department’s requirements.  The Department has registered this report and certification and closed its file on the project.' ;
          break;
        case DecommPrintType.HotcHomeOwner:
          // tslint:disable-next-line:max-line-length
          line = 'You have certified that the decommissioning has met the Department’s requirements.  The Department has registered this report and certification.' ;
          break;
        case DecommPrintType.LustServiceProvider:
          // tslint:disable-next-line:max-line-length
          line = this.getCompanyName(decommPrint) + ' was licensed to provide heating oil tank services and has certified that the cleanup has met the Department’s requirements.  The Department has registered this report and certification and closed its file on the project.' ;
          break;
        case DecommPrintType.HotcServiceProvider:
          // tslint:disable-next-line:max-line-length
          line = this.getCompanyName(decommPrint) + ' was licensed to provide heating oil tank services and has certified that the decommissioning has met the Department’s requirements.  The Department has registered this report and certification.';
          break;
        default:
            break;
      }
      return line + '<br><br>';
    }

    private buildBodyLine3(decommPrint: DecommissioningPrint): string {
      let line = '';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
          // tslint:disable-next-line:max-line-length
          line = 'The decision to register the report and certification and to close the Department’s file will no longer apply if new or undisclosed facts show that the project does not comply with the rules governing heating oil tank cleanups.' ;
          break;
        case DecommPrintType.HotcHomeOwner:
          // tslint:disable-next-line:max-line-length
          line = 'The decision to register the report and certification will no longer apply if new or undisclosed facts show that the project does not comply with the rules governing heating oil tank decommissioning.' ;
          break;
        case DecommPrintType.LustServiceProvider:
          // tslint:disable-next-line:max-line-length
          line = 'The decision to register the report and certification and to close the Department’s file will no longer apply if new or undisclosed facts show that the project does not comply with the rules governing heating oil tank cleanups.';
          break;
        case DecommPrintType.HotcServiceProvider:
          // tslint:disable-next-line:max-line-length
          line = 'The decision to register the report and certification will no longer apply if new or undisclosed facts show that the project does not comply with the rules governing heating oil tank decommissioning. ';
          break;
        default:
            break;
      }
      return line + '<br><br>';
    }

    private buildBodyLine4ThruEnd(decommPrint: DecommissioningPrint): string {
      let line = '';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
          // tslint:disable-next-line:max-line-length
          line = 'Please note that you are required by state law (ORS 105.464) to provide potential buyers a disclosure statement that includes information regarding underground storage tanks, HOTs and the environmental conditions on your property. ';
          line = line + '<br><br>';
          // tslint:disable-next-line:max-line-length
          line = line + 'Accordingly, we recommend that you keep a copy of this letter, the certification and any reports of testing or corrective actions relating to your HOT with the permanent property records.';
          line = line + '<br><br>';
          // tslint:disable-next-line:max-line-length
          line = line + 'Your efforts to comply with Oregon’s environmental rules and regulations to ensure that your heating oil tank has been adequately addressed have been appreciated.  Proper decommissioning and cleanup helps ensure protection of the environment from future heating oil tank leaks and ensures that the heating oil does not adversely impact human health or the environment.';
          line = line + '<br><br>';
          line = line + 'If you have any questions, please feel free to contact the HOT Program at (503) 229-6170.';
          break;
        case DecommPrintType.HotcHomeOwner:
          line = 'We recommend that a copy of this information be kept with the permanent property records.' ;
          line = line + '<br><br>';
          // tslint:disable-next-line:max-line-length
          line = line + 'Your efforts to comply with the regulations to ensure that your heating oil tank has been adequately cleaned up have been appreciated.  Proper decommissioning and cleanup helps ensure protection of the environment from future heating oil tank leaks and ensures that the heating oil does not adversely impact human health or the environment.';
          line = line + '<br><br>';
          line = line + 'If you have any questions, please feel free to contact the HOT Program at (503) 229-6170.' ;
          break;
        case DecommPrintType.LustServiceProvider:
          // tslint:disable-next-line:max-line-length
          line = 'Please note that you are required by state law (ORS 105.464) to provide potential buyers a disclosure statement that includes information regarding underground storage tanks, HOTs and the environmental conditions on your property.';
          line = line + '<br><br>';
          // tslint:disable-next-line:max-line-length
          line = line + 'Accordingly, we recommend that you keep a copy of this letter, the certification and any reports of testing or corrective actions relating to your HOT with the permanent property records.';
          line = line + '<br><br>';
          // tslint:disable-next-line:max-line-length
          line = line + 'Your efforts to comply with Oregon’s environmental rules and regulations to ensure that your heating oil tank has been adequately addressed have been appreciated.  Proper decommissioning and cleanup helps ensure protection of the environment from future heating oil tank leaks and ensures that the heating oil does not adversely impact human health or the environment.<br><br>  If you have any questions, please feel free to contact the HOT Program at (503) 229-6170.' ;
          break;
        case DecommPrintType.HotcServiceProvider:
          // tslint:disable-next-line:max-line-length
          line = 'We recommend that a copy of this letter and all information associated with the decommissioning be kept with the permanent property records.';
          line = line + '<br><br>';
          // tslint:disable-next-line:max-line-length
          line = line + 'Your efforts to comply with Oregon’s environmental rules and regulations to ensure that your heating oil tank has been adequately addressed have been appreciated.  Proper decommissioning and cleanup helps ensure protection of the environment from future heating oil tank leaks and ensures that the heating oil does not adversely impact human health or the environment.<br><br>  If you have any questions, please feel free to contact the HOT Program at (503) 229-6170.' ;
          break;
        default:
          break;
      }
      return line + '<br><br>';
    }

    private buildClosing(decommPrint: DecommissioningPrint): string {
      // tslint:disable-next-line:max-line-length
      let line = '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Sincerely,<br/><br/><br/><br/><br/>';
      // tslint:disable-next-line:max-line-length
      line = line + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Michael H Kortenhof, Manager <br/>';
      // tslint:disable-next-line:max-line-length
      line = line + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DEQ Heating Oil Tank Program <br/><br/><br/>';
      switch (decommPrint.printType) {
        case DecommPrintType.LustHomeOwner:
        case DecommPrintType.HotcHomeOwner:
          break;
        case DecommPrintType.LustServiceProvider:
        case DecommPrintType.HotcServiceProvider:
          line = line + 'cc: Contractor by email';
          break;
        default:
            break;
      }
      return line + '<br>';
    }

    formatLetter(decommPrint: DecommissioningPrint): string {
      return  this.buildHeaderDate()
            + this.buildHeaderAddress(decommPrint)
            + this.buildHeaderReItem(decommPrint)
            + this.buildHeaderFileNo(decommPrint)
            + this.buildHeaderDearName(decommPrint)
            + this.buildBodyLine1(decommPrint)
            + this.buildBodyLine2(decommPrint)
            + this.buildBodyLine3(decommPrint)
            + this.buildBodyLine4ThruEnd(decommPrint)
            + this.buildClosing(decommPrint);
    }

}
