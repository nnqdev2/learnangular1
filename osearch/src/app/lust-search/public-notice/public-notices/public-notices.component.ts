import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, SimpleChanges } from '@angular/core';
import { PublicNoticesResultDataSourceService } from './public-notices-result-data-source.service';
import { Subscription } from 'rxjs';
import { PublicNotice } from 'src/app/models/public-notice';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ApGetLogNumber } from 'src/app/models/apGetLogNumber';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';
import { AuthLevel, AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-public-notices',
  templateUrl: './public-notices.component.html',
  styleUrls: ['./public-notices.component.scss']
})
export class PublicNoticesComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {

  publicNoticeId: number;
  publicNoticeTypeId: number;
  description: string;
  publicNoticeDate: Date;
  meetingDate?: Date;

  private lustIdSub: any;
  private lustId: number;
  logNumber: string;
  siteName: string;
  publicNoticeDataSource: PublicNoticesResultDataSourceService;
  displayedColumns = ['publicNoticeId', 'description', 'publicNoticeDate', 'meetingDate', 'meetingRqstInd'
                    , 'lastChangeBy', 'lastChangeDate', 'comment'];
  private subscription: Subscription;
  private publicNotices: PublicNotice[];
  public totalRows = 0;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  exportToCsv = Constants.exportToCSV;
  authLevel: AuthLevel;
  showAdd: boolean;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
              , private confirmDeleteDialog: MatDialog, private excelService: ExcelService, private authService: AuthService) {
    this.publicNoticeDataSource = new PublicNoticesResultDataSourceService(this.lustDataService);
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
    this.publicNoticeDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.publicNoticeDataSource.publicNoticeResultReturned$.subscribe(
      publicNotices => {
        this.publicNotices = publicNotices;
        if (this.publicNotices !== undefined &&
          this.publicNotices.length > 0) {
            this.totalRows = this.publicNotices.length;
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

  onEdit(publicNotice: PublicNotice) {
    this.router.navigate(['../pn' , publicNotice.publicNoticeId], {relativeTo: this.route});
  }

  onDelete(publicNotice: PublicNotice) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete ' + publicNotice.description + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delPublicNotice(publicNotice.publicNoticeId).subscribe();
        this.loadResultPage();
        this.getSearchResults();
      }
    });
  }

  add() {
    this.router.navigate(['../pn'], {relativeTo: this.route});
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  genExcel() {
    this.excelService.exportJson(this.publicNotices, `${this.logNumber}PN`);
  }
}

