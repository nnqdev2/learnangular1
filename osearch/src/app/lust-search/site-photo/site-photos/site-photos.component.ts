import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, Input, SimpleChanges } from '@angular/core';
import { Subscription } from 'rxjs';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material';

import { SitePhoto } from '../../../models/site-photo';
import { LustDataService } from '../../../services/lust-data.service';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { SitePhotosResultDataSourceService } from './site-photos-result-data-source.service';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';
import { AuthLevel, AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-site-photos',
  templateUrl: './site-photos.component.html',
  styleUrls: ['./site-photos.component.scss']
})
export class SitePhotosComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {

  private lustIdSub: any;
  private lustId: number;
  logNumber: string;
  siteName: string;
  sitePhotoDataSource: SitePhotosResultDataSourceService;
  displayedColumns = ['pictureId', 'pictureDate', 'caption', 'lastChangeBy', 'lastChangeDate'];
  private subscription: Subscription;
  private sitePhotos: SitePhoto[];
  public totalRows = 0;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  exportToCsv = Constants.exportToCSV;
  authLevel: AuthLevel;
  showAdd: boolean;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
              , private confirmDeleteDialog: MatDialog, private excelService: ExcelService, private authService: AuthService) {
    this.sitePhotoDataSource = new SitePhotosResultDataSourceService(this.lustDataService);
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
    this.sitePhotoDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.sitePhotoDataSource.sitePhotoResultReturned$.subscribe(
      sitePhotos => {
        this.sitePhotos = sitePhotos;
        if (this.sitePhotos !== undefined &&
          this.sitePhotos.length > 0) {
            this.totalRows = this.sitePhotos.length;
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

  onEdit(sitePhoto: SitePhoto) {
    this.router.navigate(['../sitephoto' , sitePhoto.pictureId], {relativeTo: this.route});
  }

  onDelete(sitePhoto: SitePhoto) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete this image?', // from ' + sitePhoto.pictureDate.toDateString + '?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delSitePhoto(sitePhoto.pictureId).subscribe();
        this.loadResultPage();
        this.getSearchResults();
      }
    });
  }

  add() {
    this.router.navigate(['../sitephoto'], {relativeTo: this.route});
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  genExcel() {
    this.excelService.exportJson(this.sitePhotos, `${this.logNumber}SP`);
  }
}
