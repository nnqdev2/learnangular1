import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, SimpleChanges, Input, EventEmitter, Output } from '@angular/core';
import { Subscription } from 'rxjs';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { LustContactsSearchResultDataSourceService } from './lust-contacts-search-result-data-source.service';
import { HotcContact } from 'src/app/models/hotc-contact';
import { LustHotcGet } from 'src/app/models/lust-hotc-get';
import { FormGroup, FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-lust-contacts',
  templateUrl: './lust-contacts.component.html',
  styleUrls: ['./lust-contacts.component.scss']
})
export class LustContactsComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {

  private lustIdSub: any;
  private lustId: number;
  myForm: FormGroup;
  logNumber: string;
  lustContactDataSource: LustContactsSearchResultDataSourceService;
  displayedColumns = ['contactName', 'organization', 'address'];
  private subscription: Subscription;
  private hotcContacts: HotcContact[];
  private hotcContact = new HotcContact();
  totalRows = 0;
  selectedRowIndex = -1;
  selectedContact: HotcContact;
  displayContact = false;

  @Input() lustHotcGet: LustHotcGet;
  @Output() rowSelected = new EventEmitter<HotcContact>();

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
    , private formBuilder: FormBuilder) {
    this.lustContactDataSource = new LustContactsSearchResultDataSourceService(this.lustDataService);
  }

  ngOnInit() {
    this.lustIdSub = this.route.params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.lustId = this.lustHotcGet.lustIncidentLustId;
    this.myForm = this.formBuilder.group({
      logNumber: [{value: this.lustHotcGet.hotcHotManagementLogNumber, disabled: true}],
      siteAddress: [{value: this.lustHotcGet.lustIncidentSiteAddress, disabled: true}],
      siteCity: [{value: this.lustHotcGet.lustIncidentSiteCity, disabled: true}],
      siteZipCode: [{value: this.lustHotcGet.lustIncidentSiteZip, disabled: true}],
      firstName:  [{value: this.lustHotcGet.contactFirstName, disabled: true}],
      lastName:  [{value: this.lustHotcGet.contactLastName, disabled: true}],
      company:  [{value: this.lustHotcGet.contactOrganization, disabled: true}],
      street:   [{value: this.lustHotcGet.contactStreet, disabled: true}],
      city:  [{value: this.lustHotcGet.contactCity, disabled: true}],
      state:  [{value: this.lustHotcGet.contactState, disabled: true}],
      zip:  [{value: this.lustHotcGet.contactZip, disabled: true}],
    });

    this.hotcContact.firstName = this.lustHotcGet.contactFirstName;
    this.hotcContact.lastName = this.lustHotcGet.contactLastName;
    this.hotcContact.organization = this.lustHotcGet.contactOrganization;
    this.hotcContact.street = this.lustHotcGet.contactStreet;
    this.hotcContact.city = this.lustHotcGet.contactCity;
    this.hotcContact.state = this.lustHotcGet.contactState;
    this.hotcContact.affilId = this.lustHotcGet.contactAffilId;
    this.hotcContact.zipcode = this.lustHotcGet.contactZip;
    this.rowSelected.emit(this.hotcContact);

    this.loadResultPage();
    this.getSearchResults();
  }

  ngOnChanges(changes: SimpleChanges) {
    this.lustId = this.lustHotcGet.lustIncidentLustId;
    this.loadResultPage();
    this.getSearchResults();
  }

  ngAfterViewInit() {
  }

  loadResultPage() {
    this.lustContactDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.lustContactDataSource.lustContactsResultReturned$.subscribe(
      hotcContacts => {
        this.hotcContacts = hotcContacts;
        if (this.hotcContacts !== undefined &&
          this.hotcContacts.length > 0) {
            this.displayContact = true;
            this.totalRows = this.hotcContacts.length;
            if (this.hotcContacts.length === 1) {
              this.selectedContact = this.hotcContacts[0];
              this.showContact(this.selectedContact);
              this.selectedRowIndex = 0;
              this.rowSelected.emit(hotcContacts[0]);
            }
        } else {
          this.totalRows = 0;
          this.displayContact = false;
        }
      }
    );
  }

  onRowClicked(row: any) {
    this.displayContact = true;
    this.selectedContact = row;
    this.selectedRowIndex = row.contactName;
    this.showContact(this.selectedContact);
    this.rowSelected.emit(row);
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
    this.lustIdSub.unsubscribe();
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  private showContact(hotcContact: HotcContact) {
    this.myForm.controls.firstName.setValue(hotcContact.firstName);
    this.myForm.controls.lastName.setValue(hotcContact.lastName);
    this.myForm.controls.company.setValue(hotcContact.organization);
    this.myForm.controls.street.setValue(hotcContact.street);
    this.myForm.controls.city.setValue(hotcContact.city);
    this.myForm.controls.state.setValue(hotcContact.state);
    this.myForm.controls.zip.setValue(hotcContact.zipcode);
    this.myForm.controls.firstName.disable();
    this.myForm.controls.lastName.disable();
    this.myForm.controls.company.disable();
    this.myForm.controls.street.disable();
    this.myForm.controls.city.disable();
    this.myForm.controls.state.disable();
    this.myForm.controls.zip.disable();
  }
}
