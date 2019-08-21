import { Component, Input, AfterViewInit, ViewChild, OnChanges, SimpleChanges, OnDestroy, EventEmitter, Output, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { MatPaginator, MatSort, MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material';
import { tap } from 'rxjs/operators';
import { Subscription, merge } from 'rxjs';
import { ConsultantSearchResultStat } from '../../../models/consultant-search-result-stat';
import { LustDataService } from '../../../services/lust-data.service';
import { ConsultantSearchResultDataSourceService } from './consultant-search-result-data-source.service';
import { ConsultantSearchFilter } from 'src/app/models/consultant-search-filter';
import { SiteAlias } from 'src/app/models/site-alias';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { ExcelService } from 'src/app/common/excel.service';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';


@Component({
  selector: 'app-consultant-search-result',
  templateUrl: './consultant-search-result.component.html',
  styleUrls: ['./consultant-search-result.component.scss']
})
export class ConsultantSearchResultComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {


  @Input() consultantSearchFilter: ConsultantSearchFilter;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  dataSource: ConsultantSearchResultDataSourceService;
  displayedColumns = ['consultantId', 'companyName', 'address', 'city', 'state', 'zipCode', 'phone'
  , 'fax', 'email', 'lastChangeBy', 'lastChangeDate'];

  subscription: Subscription;
  consultantSearchResultStats: ConsultantSearchResultStat[];
  totalRows = 0;
  authLevel: AuthLevel;
  showAdd = false;
  exportToCsv = Constants.exportToCSV;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;


  @Output() rowSelected = new EventEmitter<ConsultantSearchResultStat>();

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
    , private confirmDeleteDialog: MatDialog, private excelService: ExcelService, private authService: AuthService) {
    this.dataSource = new ConsultantSearchResultDataSourceService(this.lustDataService);
  }

  ngOnInit(): void {
    this.setAuthLevel();
    this.setShowAdd();
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
    this.sort.sortChange.subscribe(() => this.paginator.pageIndex = 0);
    merge(this.sort.sortChange, this.paginator.page)
    .pipe(
        tap(() => this.loadResultPage())
    )
    .subscribe();
  }

  loadResultPage() {
    this.consultantSearchFilter.pageNumber = this.paginator.pageIndex + 1;
    this.consultantSearchFilter.rowsPerPage = ((this.paginator.pageSize === 0 || this.paginator.pageSize === undefined)
          ? 40 : this.paginator.pageSize);
    this.consultantSearchFilter.sortColumn = (this.sort.active === undefined ? 1 : this.getSortCol(this.sort.active));
    this.consultantSearchFilter.sortOrder = this.getSortOrder(this.sort.direction);
    this.dataSource.loadResults(this.consultantSearchFilter);
  }

  private getSortCol(colName: string): number {
    switch (colName) {
      case 'companyName':
        return 0;
      case 'address':
        return 1;
      case 'city':
        return 2;
      case 'state':
        return 3;
      case 'zipCode':
        return 4;
      case 'phone':
        return 5;
      case 'fax':
        return 6;
      case 'email':
        return 7;
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
      consultantSearchResultStats => {
        this.consultantSearchResultStats = consultantSearchResultStats;
        if (this.consultantSearchResultStats !== undefined &&
        this.consultantSearchResultStats.length > 0) {
          this.totalRows = this.consultantSearchResultStats[0].totalRows;
        } else {
          this.totalRows = 0;
        }
    });
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  onRowClicked(consultantSearchResultStat: ConsultantSearchResultStat) {
    this.rowSelected.emit(consultantSearchResultStat);
  }

  onEdit(consultantSearchResultStat: ConsultantSearchResultStat) {
    this.router.navigate(['../consultant' , consultantSearchResultStat.consultantId], {relativeTo: this.route});
  }

  onDelete(consultantSearchResultStat: ConsultantSearchResultStat) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete  ' + consultantSearchResultStat.companyName + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delConsultant(consultantSearchResultStat.consultantId).subscribe(

        );
        this.loadResultPage();
        this.getSearchResults();
      }
    });
  }

  genExcel() {
    this.excelService.exportJson(this.consultantSearchResultStats, 'ConsultantSR');
  }
}
