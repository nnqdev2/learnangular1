import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, SimpleChanges } from '@angular/core';
import { Subscription } from 'rxjs';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';

import { ContactsResultDataSourceService } from '../../contact/contacts/contacts-result-data-source.service';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { LustDataService } from '../../../services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { ContactAffilGet } from '../../../models/contact-affil-get';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';

@Component({
  selector: 'app-contacts',
  templateUrl: './contacts.component.html',
  styleUrls: ['./contacts.component.scss']
})
export class ContactsComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {
  private lustIdSub: any;
  private lustId: number;
  logNumber: string;
  siteName: string;
  contactDataSource: ContactsResultDataSourceService;
  displayedColumns = ['affilId', 'affilTypeDesc', 'startDt', 'endDt', 'organization', 'subOrganization', 'jobtitle'
                       , 'firstName', 'lastName', 'zp4Checked', 'affilComments', 'lastUpdBy', 'lastUpdDttm'];
  private subscription: Subscription;
  private contactAffilGets: ContactAffilGet[];
  public totalRows = 0;
  exportToCsv = Constants.exportToCSV;
  authLevel: AuthLevel;
  showAdd: boolean;
  crisFound = -1;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
              , private confirmDeleteDialog: MatDialog, private excelService: ExcelService, private authService: AuthService) {
    this.contactDataSource = new ContactsResultDataSourceService(this.lustDataService);
  }

  ngOnInit() {
    this.setAuthLevel();
    this.setShowAdd();
    this.lustIdSub = this.route.parent.params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.logNumber = data.apGetLogNumber.logNumber;
      this.siteName = data.apGetLogNumber.siteName;
    });
    this.loadResultPage();
    this.getSearchResults();
  }

  setAuthLevel() {
    this.authLevel = this.authService.getAuthLevel();
  }

  setShowAdd() {
    this.showAdd = true;
    if (this.authLevel < AuthLevel.PM) {
      this.showAdd = false;
    }
  }

  ngOnChanges(changes: SimpleChanges) {
    this.loadResultPage();
    this.getSearchResults();
  }

  ngAfterViewInit() {
  }

  loadResultPage() {
    this.contactDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.contactDataSource.contactResultReturned$.subscribe(
      contactAffilGets => {
        this.contactAffilGets = contactAffilGets;
        if (this.contactAffilGets !== undefined &&
          this.contactAffilGets.length > 0) {
            this.totalRows = this.contactAffilGets.length;
        } else {
          this.totalRows = 0;
        }
        this.crisFound = this.contactAffilGets.findIndex((x) => x.crisCheck > 0);
      }
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
    this.lustIdSub.unsubscribe();
  }

  edit(contact: ContactAffilGet) {
    this.router.navigate(['../contact' , contact.affilId], {relativeTo: this.route});
    // this.router.navigateByUrl(`/lust/${this.lustId}/contact/${contact.affilId}`, { state: { data: this.crisFound } });
  }

  add() {
    this.router.navigate(['../contact'], {relativeTo: this.route});
    // this.router.navigateByUrl(`/lust/${this.lustId}/contact`, { state: { data: this.crisFound } });
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  genExcel() {
    this.excelService.exportJson(this.contactAffilGets, `${this.logNumber}C`);
  }

  getLabel(contactAffilGet: ContactAffilGet): string {
    if (contactAffilGet.affilTypeDesc.toUpperCase() === Constants.cris_invoice_contact_type
        || this.authLevel < AuthLevel.PM
        || (this.crisFound > -1 && contactAffilGet.affilTypeCd === 'INV')
        // || (contactAffilGet.crisCheck > 0 && contactAffilGet.affilTypeCd === 'INV')
        ) {
      return 'View';
    }
    if (this.authLevel > AuthLevel.PM) {
          return 'Edit';
    } else {
      if (contactAffilGet.affilTypeCd.match(/^(INV|RPT|RP)$/)) {
        return 'View';
      } else { return 'Edit'; }
    }
  }
}
