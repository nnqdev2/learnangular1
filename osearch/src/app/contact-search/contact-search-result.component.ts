import { Component, Input, AfterViewInit, ViewChild, OnChanges, SimpleChanges, OnDestroy, EventEmitter, Output, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { MatPaginator, MatSort } from '@angular/material';
import { tap } from 'rxjs/operators';
import { Subscription, merge } from 'rxjs';
import { ContactSearchFilter } from '../models/contact-search-filter';
import { ContactSearchResultDataSourceService } from './contact-search-result-data-source.service';
import { ContactSearchResultStat } from '../models/contact-search-result-stat';
import { LustDataService } from '../services/lust-data.service';
import { ExcelService } from '../common/excel.service';


@Component({
  selector: 'app-contact-search-result',
  templateUrl: './contact-search-result.component.html',
  styleUrls: ['./contact-search-result.component.scss']
})
export class ContactSearchResultComponent implements AfterViewInit, OnChanges, OnDestroy, OnInit {

  @Input() contactSearchFilter: ContactSearchFilter;
  @Input('showSelectButton') showSelectButton: boolean;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  dataSource: ContactSearchResultDataSourceService;
  displayedColumns = ['reqPageNumber', 'partyId', 'organization', 'subOrganization', 'personName', 'phone', 'address', 'email'];
 
  subscription: Subscription;
  contactSearchResultStats: ContactSearchResultStat[];
  totalRows = 0;
  columnDefinitions = [];


  @Output() rowSelected = new EventEmitter<ContactSearchResultStat>();

  constructor(private lustDataService: LustDataService, private excelService: ExcelService) {
    this.dataSource = new ContactSearchResultDataSourceService(this.lustDataService);
  }

  ngOnInit() {
    this.columnDefinitions = [
      { def: 'reqPageNumber', showColumn: this.showSelectButton },
      { def: 'partyId', showColumn: true },
      { def: 'organization', showColumn: true },
      { def: 'subOrganization', showColumn: true },
      { def: 'personName', showColumn: true },
      { def: 'phone', showColumn: true },
      { def: 'address', showColumn: true },
      { def: 'email', showColumn: true },
    ];
  }

  getDisplayedColumns(): string[] {
    return this.columnDefinitions
      .filter(cd => cd.showColumn)
      .map(cd => cd.def);
  }

  ngOnChanges(changes: SimpleChanges) {
    this.loadResultPage();
    this.getSearchResults();
  }

  ngAfterViewInit() {
    this.sort.sortChange.subscribe(() => this.paginator.pageIndex = 0);
    merge(this.sort.sortChange, this.paginator.page)
    .pipe(
        tap(() => this.loadResultPage())
    )
    .subscribe();
  }

  loadResultPage() {
    this.contactSearchFilter.pageNumber = this.paginator.pageIndex + 1;
    this.contactSearchFilter.rowsPerPage = ((this.paginator.pageSize === 0 || this.paginator.pageSize === undefined)
          ? 40 : this.paginator.pageSize);
    this.contactSearchFilter.sortColumn = (this.sort.active === undefined ? 1 : this.getSortCol(this.sort.active));
    this.contactSearchFilter.sortOrder = this.getSortOrder(this.sort.direction);
    this.dataSource.loadResults(this.contactSearchFilter);
  }

  private getSortCol(colName: string): number {
    switch (colName) {
      case 'firstName':
        return 0;
      case 'lastName':
        return 1;
      case 'organization':
        return 2;
      case 'street':
        return 3;
      case 'city':
        return 4;
      case 'state':
        return 5;
      case 'zipcode':
      return 5;
      default:
        return 0;
    }
  }

  private getSortOrder(sortDirection: string): number {
    switch (sortDirection) {
      case 'asc':
        return 1;
      case 'desc':
        return -1;
      default:
        return 1;
    }
  }

  getSearchResults() {
    this.subscription = this.dataSource.searchResultReturned$.subscribe(
      contactSearchResultStats => {
        this.contactSearchResultStats = contactSearchResultStats;
        if (this.contactSearchResultStats !== undefined &&
        this.contactSearchResultStats.length > 0) {
          this.totalRows = this.contactSearchResultStats[0].totalRows;
        } else {
          this.totalRows = 0;
        }
    });
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  onRowClicked(contactSearchResultStat: ContactSearchResultStat) {
    this.rowSelected.emit(contactSearchResultStat);
  }

  genExcel() {
    this.excelService.exportJson(this.contactSearchResultStats, 'ContactSR');
  }
}
