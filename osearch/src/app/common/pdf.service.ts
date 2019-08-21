import { Injectable } from '@angular/core';
import { ViewChild, ElementRef} from '@angular/core';
import * as jsPDF from 'jspdf';
import { DatePipe } from '@angular/common';

import { LustIncidentUpdate } from '../models/lust-incident';
import { LustIncidentInsertResult } from '../models/lust-incident-insert-result';
import { DecommissioningPrint } from '../models/lust-hotc-decommissioning.print';


@Injectable({
  providedIn: 'root'
})
export class PdfService {
  @ViewChild('container') container: ElementRef;
  pipe = new DatePipe('en-US');

  constructor() { }



  // prepareLustHotcLetter(decommPrint: DecommPrint) {
  //   console.log('in pdf.prepareLustHotcLetter');
  //   if (decommPrint.printType === 1 || decommPrint.printType === 3) {
  //     this.createLustHotcHomeOwnerLetter(decommPrint);
  //   } else {
  //     this.createLustHotcServiceProviderLetter(decommPrint);
  //   }
  // }

  formatLustHotcHomeOwnerLetter(decommPrint: DecommissioningPrint) {

    // printType 1 and 3
    // Type 1 = LUST Home Owner
    // Type 3 = HOTC Home Owner

    console.log('in formatLustHotcHomeOwnerLetter');
    const todaysDate = this.pipe.transform(Date.now(), 'mediumDate');
    // const doc = new jsPDF('portriat');
    let fmtLetter: string;
    let addressHeader: string;
    let companyName: string;
    let address: string;
    let reItem: string;
    let contactName: string;
    let contactDearName: string;
    let logNumber: string;

    if (decommPrint.printType === 1) {
    } else {
    }

    if (decommPrint.firstName.length === 0 || decommPrint.lastName.length === 0) {
      contactName = decommPrint.serviceProviderName;
      contactDearName = contactName;
    } else {
      if (decommPrint.serviceProviderName  && decommPrint.serviceProviderName.length > 0) {
        contactName = decommPrint.firstName + ' ' + decommPrint.lastName;
        contactDearName = decommPrint.firstName + ' ' + decommPrint.lastName;
        companyName = decommPrint.organization;
      } else {
        contactName = decommPrint.firstName + ' ' + decommPrint.lastName;
        contactDearName = contactName;
      }
    }


    addressHeader = contactName;
    // addressHeader.concat(decommPrint.address + ' ' + decommPrint.street + this.newLineBreak) ;
    // addressHeader.concat(decommPrint.city + ', ' + decommPrint.state + ' ' + decommPrint.zipcode + this.newLineBreak);

    reItem = ': ' + decommPrint.lustIncidentSiteName;
    logNumber = decommPrint.logCounty.toString() + '-' + decommPrint.logYear.toString() + '-' + decommPrint.logSeq.toString();
    console.log('log number = ' + logNumber);

    if (decommPrint.printType === 1) {
      address = decommPrint.lustIncidentSiteAddress;
    } else {
      if (decommPrint.hotStreetNbr.length === 0 || decommPrint.hotStreetNm.length === 0) {
        address = decommPrint.addressComment;
      } else {
        address = decommPrint.streetNbr;
        if (decommPrint.hotStreetQuad.length > 0) {
          address = address + ' ' + decommPrint.hotStreetQuad;
        }
        address = address + ' ' + decommPrint.hotStreetNm;
        if (decommPrint.hotStreetType.length > 0) {
          address = address + ' ' + decommPrint.hotStreetType;
        }
      }
    }



    // tslint:disable-next-line:max-line-length
    fmtLetter = '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' + todaysDate + '<br/><br/><br/><br/>';
    fmtLetter = fmtLetter + '&emsp; ' + addressHeader + '<br/>';
    if (companyName && companyName.length !== 0) {
      fmtLetter = fmtLetter + '&emsp; ' + companyName + '<br/>';
      fmtLetter = fmtLetter + '&emsp; ' + decommPrint.address + '&nbsp; ' + decommPrint.street + '<br/>';
      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; ' + decommPrint.city + ',&nbsp; ' + decommPrint.state + '&nbsp; ' + decommPrint.zipcode + '<br/><br/>';
    } else {
      fmtLetter = fmtLetter + '&emsp; ' + decommPrint.address + '&nbsp; ' + decommPrint.street + '<br/>';
      fmtLetter = fmtLetter + '&emsp; ' + decommPrint.city + ', ' + decommPrint.state + ' ' + decommPrint.zipcode + '<br/><br/>';
    }

    // tslint:disable-next-line:max-line-length
    fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Re' + reItem + '<br/>';
    // tslint:disable-next-line:max-line-length
    fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; File No: ' + logNumber + '<br/><br/>';
    fmtLetter = fmtLetter + '&emsp;Dear ' + [contactDearName] + ':<br/><br/>';
    fmtLetter = fmtLetter + '&emsp;The Department of Environmental Quality has received your report and certification concerning<br/>';

    if (decommPrint.printType === 1) {
      fmtLetter = fmtLetter + '&emsp; the heating oil underground storage tank (HOT) assessment and/or cleanup conducted at <br/>';
      fmtLetter = fmtLetter + '&emsp; ' + address + '.<br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; You have certified that the cleanup has met the Departments\'s requirements.  The Department has<br/>';
      fmtLetter = fmtLetter + '&emsp; registered this report and certification and closed its file on the project.<br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; The decision to register the report and certification and to close the Department\'s file will no<br/>';
      fmtLetter = fmtLetter + '&emsp; longer apply if new or undisclosed facts show that the project does not comply with the rules<br/>';
      fmtLetter = fmtLetter + '&emsp; governing heating oil tank cleanups.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; Please note that you are required by state law (ORS 105.464) to provide potential buyers a<br/>';
      fmtLetter = fmtLetter + '&emsp; disclosure statement that includes information regarding underground storage tanks, HOTs<br/>';
      fmtLetter = fmtLetter + '&emsp; and the enviornmental conditions on your property.<br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; Accordingly, we recommend that you keep a copy of this letter, the certification and any reports<br/>';
      fmtLetter = fmtLetter + '&emsp; of testing or corrective actions relating to your HOT with the permanent property records.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; Your effors to comply with Oregon\'s environmental rules and regulations to ensure that your<br/>';
      fmtLetter = fmtLetter + '&emsp; heating oil tank has been adequately addressed have been appreciated.  Proper decommissioning<br/>';
      fmtLetter = fmtLetter + '&emsp; and cleanup helps ensure protection of the environment from future heating oil tank leaks and<br/>';
      fmtLetter = fmtLetter + '&emsp; ensures that the heating oil does not adversely impact human health or the environment.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; If you have any questions, please feel free to contact the HOT Program at (503) 229-6170.<br/><br/>';

    } else {
      fmtLetter = fmtLetter + '&emsp; the heating oil underground storage tank (UST) decommissioning conducted at<br/>';
      fmtLetter = fmtLetter + '&emsp; ' + address + '.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; You have certified that the decommisisoning has met the Department\'s requirements.  The<br/>';
      fmtLetter = fmtLetter + '&emsp; Department has registered this report and certification.<br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; The decision to register the report and certification will no longer apply if new or undisclosed<br/>';
      fmtLetter = fmtLetter + '&emsp; facts show that the project does not comply with the rules governing heating oil tank<br/>';
      fmtLetter = fmtLetter + '&emsp; decommissioning.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; We recommend that a copy of this information be kept with the permanent property records.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; Your efforts to comply with the regulations to ensure that your heating oil tank has been<br/>';
      fmtLetter = fmtLetter + '&emsp; adequately cleaned up have been appreciated.  Proper decommissioning and cleanup helps ensure<br/>';
      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; protection of the environment from future heating oil tank leaks and ensures that the heating oil<br/>';
      fmtLetter = fmtLetter + '&emsp; does not adversely impact human health or the environment.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; If you have any questions, please feel free to contact the HOT Program at (503) 229-6170.<br/><br/>';
    }

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Sincerely,<br/><br/><br/><br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Michael H Kortenhof, Manager <br/>';
      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DEQ Heating Oil Tank Program <br/><br/><br/>';

      fmtLetter = fmtLetter + '&emsp; cc:     Contractor by email <br/>';

      this.printData(fmtLetter);


    // window.open(doc.output('datauri'));
    console.log('completed formatLustHotcHomeOwnerLetter');
  }


  formatLustHotcServiceProviderLetter(decommPrint: DecommissioningPrint) {


    // printType 2 and 4
    // Type 2 = LUST Service Provider
    // Type 4 = HOTC Service Provider

    console.log('in FormatLustHotcServiceProviderLetter');
    console.log('printType = ' + decommPrint.printType);
    const todaysDate = this.pipe.transform(Date.now(), 'mediumDate');
    let fmtLetter: string;
    let addressHeader: string;
    let companyName: string;
    let address: string;
    let reItem: string;
    let contactName: string;
    let contactDearName: string;
    let logNumber: string;
    let programName: string;


    if (decommPrint.printType === 2) {
      programName = '(HOT) assessment and/or ';
    } else {
      programName = '(UST) decommissioning';
    }

    if (decommPrint.firstName.length === 0 || decommPrint.lastName.length === 0) {
      contactName = decommPrint.serviceProviderName;
      contactDearName = contactName;
    } else {
      if (decommPrint.serviceProviderName && decommPrint.serviceProviderName.length > 0) {
        contactName = decommPrint.firstName + ' ' + decommPrint.lastName;
        contactDearName = decommPrint.firstName + ' ' + decommPrint.lastName;
        companyName = decommPrint.organization;
      } else {
        contactName = decommPrint.firstName + ' ' + decommPrint.lastName;
        contactDearName = contactName;
      }
    }



    addressHeader = contactName;
    reItem = ': ' + decommPrint.lustIncidentSiteName;
    logNumber = decommPrint.logCounty.toString() + '-' + decommPrint.logYear.toString() + '-' + decommPrint.logSeq.toString();
    console.log('log number = ' + logNumber);

    if (decommPrint.printType === 2) {
      address = decommPrint.lustIncidentSiteAddress;
      // address = decommPrint.address + ' ' + decommPrint.street + ', in ' + decommPrint.city + ', Oregon';
    } else {
      if (decommPrint.hotStreetNbr && (decommPrint.hotStreetNbr.length === 0 || decommPrint.hotStreetNm.length === 0)) {
        address = decommPrint.addressComment;
      } else {
        address = decommPrint.streetNbr;
        if (decommPrint.hotStreetQuad && decommPrint.hotStreetQuad.length > 0) {
          address = address + ' ' + decommPrint.hotStreetQuad;
        }
        address = address + ' ' + decommPrint.hotStreetNm;
        if (decommPrint.hotStreetType && decommPrint.hotStreetType.length > 0) {
          address = address + ' ' + decommPrint.hotStreetType;
        }
      }
    }


    // tslint:disable-next-line:max-line-length
    fmtLetter = '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' + todaysDate + '<br/><br/><br/><br/>';
    fmtLetter = fmtLetter + '&emsp;' + addressHeader + '<br/>';
    if (companyName && companyName.length !== 0) {
      fmtLetter = fmtLetter + '&emsp;' + companyName + '<br/>';
      fmtLetter = fmtLetter + '&emsp;' + decommPrint.address + '&nbsp;' + decommPrint.street + '<br/>';
      fmtLetter = fmtLetter + '&emsp;' + decommPrint.city + ',&nbsp;' + decommPrint.state + '&nbsp;' + decommPrint.zipcode + '<br/><br/>';
    } else {
      fmtLetter = fmtLetter + '&emsp;' + decommPrint.address + '&nbsp;' + decommPrint.street + '<br/>';
      fmtLetter = fmtLetter + '&emsp;' + decommPrint.city + ', ' + decommPrint.state + ' ' + decommPrint.zipcode + '<br/><br/>';
    }

    // tslint:disable-next-line:max-line-length
    fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' + 'Re:' + reItem + '<br/>';
    // tslint:disable-next-line:max-line-length
    fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' + 'File No: ' + logNumber + '<br/><br/>';

    fmtLetter = fmtLetter + '&emsp; Dear ' + contactDearName + ':<br/><br/>';

    fmtLetter = fmtLetter + '&emsp; The Department of Environmental Quality has received a report and ' + companyName + '<br/>';
    // tslint:disable-next-line:max-line-length
    fmtLetter = fmtLetter + '&emsp; certification concerning the heating oil underground storage tank ' + programName + '<br/>';
    fmtLetter = fmtLetter + '&emsp; conducted at ' + address + '<br/><br/>';
    if (decommPrint.printType === 2) {

      fmtLetter = fmtLetter + '&emsp; ' + companyName + ' was licensed to provide heating oil tank services and has certified that <br/>';
      fmtLetter = fmtLetter + '&emsp; the cleanup has met the Department\'s requirements.  The Department has registered this report <br/>';
      fmtLetter = fmtLetter + '&emsp; and certification and closed its file on the project. <br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; The decision to register the report and certification and to close the Department\'s file will no <br/>';
      fmtLetter = fmtLetter + '&emsp; longer apply if new or undisclosed facts show that the project does not comply with the rules <br/>';
      fmtLetter = fmtLetter + '&emsp; governing heating oil tank cleanups <br/><br/>';

      fmtLetter = fmtLetter + '&emsp; Please note that you are required by state law (ORS 105.464) to provide potential buyers a <br/>';
      fmtLetter = fmtLetter + '&emsp; disclosure statement that includes information regarding underground storage tanks, HOTs <br/>';
      fmtLetter = fmtLetter + '&emsp; and the environmental conditions on your property <br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; Accordingly, we recommend that you keep a copy of this letter, the certification and any reports <br/>';
      fmtLetter = fmtLetter + '&emsp; of testing or corrective actions relating to your HOT with the permanent property records.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; Your efforts to comply with Oregon\'s environmental rules and regulations to ensure that your <br/>';
      fmtLetter = fmtLetter + '&emsp; heating oil tank has been adequately addressed have been appreciated.  Proper decommissioning <br/>';
      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; and cleanup helps ensure protection of the environment from future heating oil tank leaks and <br/>';
      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; ensures that the heating oil does not adversely impact human health or the environment.  If you <br/>';
      fmtLetter = fmtLetter + '&emsp; have any questions, please feel free to contact the HOT Program at (503) 229-6170. <br/><br/>';


    }  else {

      fmtLetter = fmtLetter + '&emsp; ' + companyName + ' was licensed to provide heating oil tank services that<br/>';
      fmtLetter = fmtLetter + '&emsp; the decommissioning has met the Department\'s requirements.  The Department has registered<br/>';
      fmtLetter = fmtLetter + '&emsp; this report and certification.<br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp; The decision to register the report and certification will no longer apply if new or undisclosed<br/>';
      fmtLetter = fmtLetter + '&emsp; facts show that the project does not comply with the rules governing heating oil tank<br/>';
      fmtLetter = fmtLetter + '&emsp; decommissioning.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; We recommend that a copy of this letter and all information associated with the<br/>';
      fmtLetter = fmtLetter + '&emsp; decommissioning be kept with the permanent property records.<br/><br/>';

      fmtLetter = fmtLetter + '&emsp; Your effors to comply with Oregon\'s environmental rules and regulations to ensure that your<br/>';
      fmtLetter = fmtLetter + '&emsp; heating oil tank has been adequately addressed have been appreciated.  Proper decommissioning<br/>';
      fmtLetter = fmtLetter + '&emsp; helps ensure protection of the environment from future heating oil tank leaks.  If you have any<br/>';
      fmtLetter = fmtLetter + '&emsp; questions, please feel free to contact the HOT Program at (503) 229-6170.<br/><br>;';
    }

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Sincerely,<br/><br/><br/><br/><br/>';

      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Michael H Kortenhof, Manager <br/>';
      // tslint:disable-next-line:max-line-length
      fmtLetter = fmtLetter + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DEQ Heating Oil Tank Program <br/><br/><br/>';

      fmtLetter = fmtLetter + '&emsp; cc:     Contractor by email <br/>';


    this.printData(fmtLetter);

    console.log('completed FormatLustHotcServiceProviderLetter');
  }


  createOlprrPdfIncident(lustIncident: LustIncidentUpdate, lustIncidentResult: LustIncidentInsertResult) {

    const SaveFileName: string = lustIncidentResult.logNumberTemp;
    let LogNumber: string;
    LogNumber = lustIncident.countyId.toString();
    while (LogNumber.length < 2) { LogNumber = '0' + LogNumber; }
    let LogOlprrId: string;
    LogOlprrId = lustIncident.olprrId.toString();
    while (LogOlprrId.length < 4) { LogOlprrId = '0' + LogOlprrId; }
    const topTemplate = new Image();
    const bottomTemplate = new Image();
    const todaysDate = this.pipe.transform(Date.now(), 'mediumDate');
    topTemplate.src = './assets/images/NWRTemplateTop3.JPG';
    bottomTemplate.src = './assets/images/NWRXTemplateBottom3.JPG';

    const doc = new jsPDF('portrait');
    doc.setDrawColor('Black');
    doc.setFont('Times New Roman');
    doc.setFontSize(12);
    doc.text([todaysDate], 105, 18);
    doc.text([lustIncident.rpFirstName.toUpperCase()] + ' ' + [lustIncident.rpLastName.toUpperCase()], 20, 33);
    doc.text([lustIncident.rpAddress], 20, 38);
    doc.text([lustIncident.rpCity] + ' ' + [lustIncident.rpState] + ', ' + [lustIncident.rpZipcode] , 20, 43);
    doc.text('RE: ' + [lustIncident.siteName], 120, 48);
    // doc.text('File No: ' + LogNumber + '-' + LogYearStr.toString() + '-' + LogOlprrId, 120, 45);
    doc.text('File No: ' + lustIncidentResult.logNumberTemp, 120, 53);
    doc.text('A release was reported from an underground heating oil tank (HOT) system located at ', 20, 63);
    doc.text([lustIncident.rpAddress] + ', in ' + [lustIncident.rpCity.toUpperCase()] + ', ' + [lustIncident.rpState] +
     '.  As the responsible party for the property, ', 20, 68);
    doc.text('you are required to clean up the heating oil release according to Oregon Administration Rules', 20, 73);
    doc.text('(OAR) OAR 340-177-0001 through OAR 340-177-0095.  These rules require cleaning up the', 20, 78);
    doc.text('soil, groundwater, surface water, soil vapor, and any other media contaminated by heating', 20, 83);
    doc.text('oil to the appropriate standards or demonstrating that the contamination does not pose a risk', 20, 88);
    doc.text('to human health or the environment.', 20, 93);
    doc.addImage(topTemplate.src, 'JPEG', 15, 98, 180, 130);
    doc.addPage();
    doc.text('Page 2', 2, 2);
    doc.addImage(bottomTemplate.src, 'JPEG', 15, 10, 180, 230);
    doc.save(SaveFileName + '-NWR.PDF');
    // doc.output(environment.olprr_PDF_output_location);

}



  createOlprrPdfIncidentSAVE(lustIncident: LustIncidentUpdate, lustIncidentResult: LustIncidentInsertResult) {

      const SaveFileName: string = lustIncidentResult.logNumberTemp;
      let LogNumber: string;
      LogNumber = lustIncident.countyId.toString();
      while (LogNumber.length < 2) { LogNumber = '0' + LogNumber; }
      let LogOlprrId: string;
      LogOlprrId = lustIncident.olprrId.toString();
      while (LogOlprrId.length < 4) { LogOlprrId = '0' + LogOlprrId; }
      const topTemplate = new Image();
      const bottomTemplate = new Image();
      const todaysDate = this.pipe.transform(Date.now(), 'mediumDate');
      topTemplate.src = './assets/images/NWRTemplateTop3.JPG';
      bottomTemplate.src = './assets/images/NWRXTemplateBottom.JPG';

      const doc = new jsPDF('landscape');
      doc.setFontSize(10);
      doc.setDrawColor('Black');
      doc.setFont('Courier');
      doc.text([todaysDate], 105, 10);
      doc.text([lustIncident.rpFirstName.toUpperCase()] + ' ' + [lustIncident.rpLastName.toUpperCase()], 20, 25);
      doc.text([lustIncident.rpAddress], 20, 30);
      doc.text([lustIncident.rpCity] + ' ' + [lustIncident.rpState] + ', ' + [lustIncident.rpZipcode] , 20, 35);
      doc.text('RE: ' + [lustIncident.siteName], 120, 40);
      // doc.text('File No: ' + LogNumber + '-' + LogYearStr.toString() + '-' + LogOlprrId, 120, 45);
      doc.text('File No: ' + lustIncidentResult.logNumberTemp, 120, 45);
      doc.text('A release was reported from an underground heating oil tank (HOT) system located at '
              + [lustIncident.rpAddress] + ', in', 20, 55);
      doc.text([lustIncident.rpCity.toUpperCase()] + ', '
              + [lustIncident.rpState] + '.  As the responsible party for the property, you are required to clean', 20, 60);
      doc.text('up the heating oil release according to Oregon Administration Rules (OAR) OAR 340-177-0001', 20, 65);
      doc.text('through OAR 340-177-0095.  These rules require cleaning up the soil, groundwater, surface', 20, 75);
      doc.text('water, soil vapor, and any other media contaminated by heating oil to the appropriate standards or', 20, 80);
      doc.text('demonstrating that the contamination does not pose a risk to human health or the environment', 20, 85);
      doc.addImage(topTemplate.src, 'JPEG', 15, 90, 250, 120);
      doc.addPage();
      doc.text('Page 2', 2, 2);
      doc.addImage(bottomTemplate.src, 'JPEG', 15, 10, 260, 120);
      doc.save(SaveFileName + '-NWR.PDF');
      // doc.output(environment.olprr_PDF_output_location);

  }

  printFromPDF(): void  {
      const doc = new jsPDF();
      // tslint:disable-next-line:no-unused-expression
      document.readyState;
      const myElement = document.getElementById('print-section');
      doc.fromHTML(myElement, 20, 20, { 'width': 500});
      doc.save(' hello ');
  }

  printData(formattedLetter: string) {
    let printContents, popupWin;
    printContents = formattedLetter;

    popupWin = window.open('', '_blank', 'top=0,left=0,height=100%,width=auto');
    popupWin.document.open();
    popupWin.document.write(`
    <html>
      <body onload="window.print();window.close()">${printContents}</body>
    </html>`
    );
    popupWin.document.close();
}



}
