import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, Input, ViewChild
  , Output, EventEmitter, SimpleChanges } from '@angular/core';
import { HotcSearchFilter } from 'src/app/models/hotc-search-filter';
import { MatPaginator, MatSort, MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { DecommSearchResultDataSourceService } from './decomm-search-result-data-source.service';
import { Subscription, merge } from 'rxjs';
import { HotcSearchResultStat } from 'src/app/models/hotc-search-result-stat';
import { ConfirmDeleteDialogComponent } from 'src/app/lust-search/confirm-delete-dialog/confirm-delete-dialog.component';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { tap } from 'rxjs/operators';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-decomm-search-result',
  templateUrl: './decomm-search-result.component.html',
  styleUrls: ['./decomm-search-result.component.scss']
})
export class DecommSearchResultComponent implements AfterViewInit, OnChanges, OnDestroy {

  @Input() hotcSearchFilter: HotcSearchFilter;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  dataSource: DecommSearchResultDataSourceService;
  displayedColumns = ['reqPageNumber', 'searchType', 'logNumber', 'finalInvRqstDate', 'closedDate', 'hotAddress'
  , 'city', 'zipCode', 'county', 'year'];

  subscription: Subscription;
  hotcSearchResultStats: HotcSearchResultStat[];
  totalRows = 0;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  exportToCsv = Constants.exportToCSV;


  @Output() rowSelected = new EventEmitter<HotcSearchResultStat>();

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
    , private confirmDeleteDialog: MatDialog, private excelService: ExcelService) {
    this.dataSource = new DecommSearchResultDataSourceService(this.lustDataService);
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
    this.hotcSearchFilter.pageNumber = this.paginator.pageIndex + 1;
    this.hotcSearchFilter.rowsPerPage = ((this.paginator.pageSize === 0 || this.paginator.pageSize === undefined)
          ? 40 : this.paginator.pageSize);
    this.hotcSearchFilter.sortColumn = (this.sort.active === undefined ? 1 : this.getSortCol(this.sort.active));
    this.hotcSearchFilter.sortOrder = this.getSortOrder(this.sort.direction);
    this.dataSource.loadResults(this.hotcSearchFilter);
  }

  private getSortCol(colName: string): number {
    switch (colName) {
      case 'searchType':
        return 1;
      case 'id':
        return 2;
      case 'finalInvRqstDate':
        return 3;
      case 'closedDate':
        return 4;
      case 'otherAddr':
        return 5;
      case 'city':
        return 6;
      case 'zipCode':
        return 7;
      case 'county':
        return 8;
      case 'year':
        return 9;
      default:
        return 2;
    }
  }


  private getSortColOrig(colName: string): number {
    switch (colName) {
      case 'searchType':
        return 0;
      case 'id':
        return 1;
      case 'finalInvRqstDate':
        return 2;
      case 'closedDate':
        return 3;
      case 'otherAddr':
        return 4;
      case 'city':
        return 5;
      case 'zipCode':
        return 6;
      case 'county':
        return 7;
      case 'year':
        return 8;
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
      hotcSearchResultStats => {
        this.hotcSearchResultStats = hotcSearchResultStats;
        if (this.hotcSearchResultStats !== undefined &&
        this.hotcSearchResultStats.length > 0) {
          this.totalRows = this.hotcSearchResultStats[0].totalRows;
          if (this.totalRows === 1) {
            this.onEdit(this.hotcSearchResultStats[0]);
          }
        } else {
          this.totalRows = 0;
        }
    });
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  onRowClicked(hotcSearchResultStat: HotcSearchResultStat) {
    this.rowSelected.emit(hotcSearchResultStat);
  }

  onEdit(hotcSearchResultStat: HotcSearchResultStat) {
    if (hotcSearchResultStat.searchType === 'LUST') {
      // this.router.navigate(['../dlust' , hotcSearchResultStat.id], {relativeTo: this.route});
      this.router.navigate(['../dlust' , hotcSearchResultStat.id], {relativeTo: this.route});
    } else {
      this.router.navigate(['../dhot' , hotcSearchResultStat.id], {relativeTo: this.route});
    }
  }

  genExcel() {
    this.excelService.exportJson(this.hotcSearchResultStats, 'HotcDecommSR');
  }
}
