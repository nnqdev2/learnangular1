import { Component, OnInit, Input, AfterViewInit, ViewChild, OnChanges, SimpleChanges, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router, ParamMap } from '@angular/router';

import { OlprrSearchResultsDataSource } from './olprr-search-results-data-source';
import { OlprrSearchFilter } from '../models/olprr-search-filter';
import { MatPaginator, MatSort, MatSortHeader } from '@angular/material';
import { tap, debounceTime, distinctUntilChanged } from 'rxjs/operators';
import { Subscription, fromEvent, merge } from 'rxjs';
import { OlprrSearchResultStat } from '../models/olprr-search-result-stat';
import { LustDataService } from '../services/lust-data.service';
import { ExcelService } from '../common/excel.service';
import { Constants } from '../constants';

@Component({
  selector: 'app-olprr-search-result',
  templateUrl: './olprr-search-result.component.html',
  styleUrls: ['./olprr-search-result.component.scss']
})
export class OlprrSearchResultComponent implements AfterViewInit, OnInit, OnChanges, OnDestroy {

  @Input() olprrSearchFilter: OlprrSearchFilter;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  dataSource: OlprrSearchResultsDataSource;
  displayedColumns = ['reqPageNumber', 'olprrId', 'siteStatus', 'releaseType', 'receiveDate', 'siteName'
                    , 'siteAddress', 'siteCounty', 'reportedBy', 'siteComment'];

  subscription: Subscription;
  olprrSearchResultStats: OlprrSearchResultStat[];
  totalRows = 0;
  exportToCsv = Constants.exportToCSV;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
    , private excelService: ExcelService) {
    this.dataSource = new OlprrSearchResultsDataSource(this.lustDataService);
  }

  ngOnChanges(changes: SimpleChanges) {
    this.loadIncidentsPage();
    this.getSearchResults();
  }

  ngOnInit() {
    this.getSearchResults();
  }

  ngAfterViewInit() {
    this.sort.sortChange.subscribe(() => this.paginator.pageIndex = 0);
    merge(this.sort.sortChange, this.paginator.page)
    .pipe(
        tap(() => this.loadIncidentsPage())
    )
    .subscribe();
  }

  loadIncidentsPage() {
    this.olprrSearchFilter.pageNumber = this.paginator.pageIndex + 1;
    this.olprrSearchFilter.rowsPerPage = ((this.paginator.pageSize === 0 || this.paginator.pageSize === undefined)
          ? 40 : this.paginator.pageSize);
    this.olprrSearchFilter.sortColumn = (this.sort.active === undefined ? 1 : this.getSortCol(this.sort.active));
    this.olprrSearchFilter.sortOrder = this.getSortOrder(this.sort.direction);
    this.dataSource.loadIncidents(this.olprrSearchFilter);
  }

  private getSortCol(colName: string): number {
    switch (colName) {
      case 'olprrId':
        return 1;
      case 'releaseType':
        return 2;
      case 'siteName':
        return 3;
      case 'siteAddress':
        return 4;
      case 'siteCity':
        return 5;
      case 'siteStatus':
        return 6;
      case 'reportedBy':
        return 7;
      case 'companyName':
        return 8;
      case 'siteCounty':
        return 9;
      case 'receiveDate':
        return 10;
      default:
        return 1;
    }
  }

  private getSortOrder(sortDirection: string): number {
    switch (sortDirection) {
      case 'asc':
        return 1;
      case 'desc':
        return -1;
      default:
        return -1;
    }
  }

  getSearchResults() {
    this.subscription = this.dataSource.searchResultReturned$.subscribe(
      olprrSearchResultStats => {
        this.olprrSearchResultStats = olprrSearchResultStats;
        if (this.olprrSearchResultStats !== undefined &&
          this.olprrSearchResultStats.length > 0) {
            this.totalRows = this.olprrSearchResultStats[0].totalRows;
        } else {
          this.totalRows = 0;
        }
      }
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  onRowClicked(olprrId: string) {
    this.router.navigate(['review/', +olprrId]);
  }

  genExcel() {
    this.excelService.exportJson(this.olprrSearchResultStats, `OlprrSR`);
  }

}


