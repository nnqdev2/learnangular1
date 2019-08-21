import { Component, Input, AfterViewInit, ViewChild, OnChanges, SimpleChanges, OnDestroy, OnInit, ElementRef } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { MatPaginator, MatSort } from '@angular/material';
import { tap } from 'rxjs/operators';
import { Subscription, merge } from 'rxjs';

import { LustSearchResultDataSourceService } from './lust-search-result-data-source.service';
import { LustSearchFilter } from '../../models/lust-search-filter';
import { LustSearchResultStat } from '../../models/lust-search-result-stat';
import { LustDataService } from '../../services/lust-data.service';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-lust-search-result',
  templateUrl: './lust-search-result.component.html',
  styleUrls: ['./lust-search-result.component.scss']
})
export class LustSearchResultComponent implements AfterViewInit, OnChanges, OnDestroy, OnInit {

  @Input() lustSearchFilter: LustSearchFilter;
  @Input() isSearchOnly: boolean;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  private scrToView: any;

  dataSource: LustSearchResultDataSourceService;
  displayedColumns = [ 'reqPageNumber', 'logNumber', 'siteName', 'siteAddress', 'firDt', 'closedDt'
                    , 'facilityId', 'siteScore'];

  subscription: Subscription;
  lustSearchResultStats: LustSearchResultStat[];
  totalRows = 0;
  exportToCsv = Constants.exportToCSV;

  constructor(private lustDataService: LustDataService, private router: Router, private excelService: ExcelService) {
    this.dataSource = new LustSearchResultDataSourceService(this.lustDataService);
  }

  ngOnInit() {
    this.OnScrollIntoView();
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
    this.OnScrollIntoView();
  }

  OnScrollIntoView () {
    // Attempt to bring the Search Results into view
    scroll(0, 0);
    this.scrToView = document.getElementById('topOfForm');
    // console.log(this.scrToView);
    if (this.scrToView) {
      // console.log('topOfForm found');
      this.scrToView.scrollIntoView();
    }
  }


  loadResultPage() {
    this.lustSearchFilter.pageNumber = this.paginator.pageIndex + 1;
    this.lustSearchFilter.rowsPerPage = ((this.paginator.pageSize === 0 || this.paginator.pageSize === undefined)
          ? 40 : this.paginator.pageSize);
    this.lustSearchFilter.sortColumn = (this.sort.active === undefined ? 2 : this.getSortCol(this.sort.active));
    this.lustSearchFilter.sortOrder = this.getSortOrder(this.sort.direction);
    this.dataSource.loadResults(this.lustSearchFilter);
  }

  private getSortCol(colName: string): number {
    switch (colName) {
      case 'lustId':
        return 2;
      case 'logNumber':
        return 2;
      case 'siteName':
        return 3;
      case 'siteAddress':
        return 4;
      case 'firDt':
        return 5;
      case 'closedDt':
        return 6;
      case 'facilityId':
        return 7;
      case 'siteScore':
        return 8;
      default:
        return 2;
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
      lustSearchResultStats => {
        this.lustSearchResultStats = lustSearchResultStats;
        if (this.lustSearchResultStats !== undefined &&
          this.lustSearchResultStats.length > 0) {
            this.totalRows = this.lustSearchResultStats[0].totalRows;
            if (this.totalRows < 2 && !this.isSearchOnly) {
              // this.router.navigate(['lust', this.lustSearchResultStats[0].lustId]);
              this.router.navigateByUrl(`/lust/${this.lustSearchResultStats[0].lustId}`, { state: { data: this.lustSearchFilter } });
            }
        } else {
          this.totalRows = 0;
        }
      }
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  onRowClicked(lustSearchResultStat: LustSearchResultStat) {
    if (!this.isSearchOnly) {
      // this.router.navigate(['lust', lustSearchResultStat.lustId]);
      this.router.navigateByUrl(`/lust/${lustSearchResultStat.lustId}`, { state: { data: this.lustSearchFilter } });
    }
  }

  genExcel() {
    this.excelService.exportJson(this.lustSearchResultStats, 'LustSR');
  }
}


