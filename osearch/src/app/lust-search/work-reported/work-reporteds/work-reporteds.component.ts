import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, Input, SimpleChanges } from '@angular/core';
import { Subscription } from 'rxjs';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material';
import { LustDataService } from '../../../services/lust-data.service';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { WorkReportedsResultDataSourceService } from './work-reporteds-result-data-source.service';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { WorkReported } from 'src/app/models/work-reported';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';
import { AuthLevel, AuthService } from 'src/app/services/auth.service';



@Component({
  selector: 'app-work-reporteds',
  templateUrl: './work-reporteds.component.html',
  styleUrls: ['./work-reporteds.component.scss']
})
export class WorkReportedsComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {

  private lustIdSub: any;
  private lustId: number;
  logNumber: string;
  siteName: string;
  workReportedDataSource: WorkReportedsResultDataSourceService;
  displayedColumns = ['wrId', 'wrkDate', 'wrkDesc', 'wrkBy', 'lastChangeBy', 'lastChangeDate', 'comment'];
  private subscription: Subscription;
  private workReportedes: WorkReported[];
  public totalRows = 0;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  exportToCsv = Constants.exportToCSV;
  authLevel: AuthLevel;
  showAdd: boolean;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
              , private confirmDeleteDialog: MatDialog, private excelService: ExcelService, private authService: AuthService) {
    this.workReportedDataSource = new WorkReportedsResultDataSourceService(this.lustDataService);
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
    this.workReportedDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.workReportedDataSource.workReportedResultReturned$.subscribe(
      workReportedes => {
        this.workReportedes = workReportedes;
        if (this.workReportedes !== undefined &&
          this.workReportedes.length > 0) {
            this.totalRows = this.workReportedes.length;
        } else {
          this.totalRows = 0;
        }
      }
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
    this.lustIdSub.unsubscribe();
  }

  onEdit(workReported: WorkReported) {
    this.router.navigate(['../wr' , workReported.wrId], {relativeTo: this.route});
  }

  onDelete(workReported: WorkReported) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete ' + workReported.workBy + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delWorkReported(workReported.wrId).subscribe();
        this.loadResultPage();
        this.getSearchResults();
      }
    });
  }

  add() {
    this.router.navigate(['../wr'], {relativeTo: this.route});
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  genExcel() {
    this.excelService.exportJson(this.workReportedes, `${this.logNumber}WR`);
  }
}
