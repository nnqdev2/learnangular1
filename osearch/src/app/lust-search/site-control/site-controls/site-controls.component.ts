import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, Input, SimpleChanges } from '@angular/core';
import { Subscription } from 'rxjs';
import { MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material';
import { LustDataService } from '../../../services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { SiteControlsResultDataSourceService } from './site-control-result-data-source.service';
import { LustSiteControlGet } from 'src/app/models/lust-site-control-get';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';
import { AuthLevel, AuthService } from 'src/app/services/auth.service';



@Component({
  selector: 'app-site-controls',
  templateUrl: './site-controls.component.html',
  styleUrls: ['./site-controls.component.scss']
})
export class SiteControlsComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy  {


  private lustIdSub: any;
  private lustId: number;
  logNumber: string;
  siteName: string;
  siteControlDataSource: SiteControlsResultDataSourceService;
  displayedColumns = ['siteControlId', 'controlDescription', 'frequencyOfReview', 'lastReviewDate', 'controlEndDate'];
  private subscription: Subscription;
  private siteControls: LustSiteControlGet[];
  public totalRows = 0;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  private editSiteControlNumber: number;
  exportToCsv = Constants.exportToCSV;
  authLevel: AuthLevel;
  showAdd: boolean;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
    , private confirmDeleteDialog: MatDialog, private excelService: ExcelService, private authService: AuthService) {
      this.siteControlDataSource = new SiteControlsResultDataSourceService(this.lustDataService);
  }

  ngOnInit() {
    this.setAuthLevel();
    this.setShowAdd();
    this.lustIdSub = this.route.parent.params.subscribe(params => {
      this.lustId = +params['lustid'];
    });

    // console.log('lustId = ' + this.lustId);
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
    console.log('loadResultPage called');
    this.siteControlDataSource.loadResults(this.lustId);
    console.log('loadResultPage completed');
  }

  getSearchResults() {
    console.log('getSearchResults started');
    this.subscription = this.siteControlDataSource.siteControlsResultReturned$.subscribe(
      siteControls => {

        this.siteControls = siteControls;
        // console.log('in getSearchResults - siteControls = ' + this.siteControls);
        if (this.siteControls !== undefined &&
          this.siteControls.length > 0) {
            this.totalRows = this.siteControls.length;
        } else {
          this.totalRows = 0;
        }
      }
    );
    console.log('getSearchResults ended');
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
    this.lustIdSub.unsubscribe();
  }

  onEdit(siteControl: LustSiteControlGet) {
    // console.log('editing ' + siteControl.siteControlId);
    // console.log(siteControl);
    this.editSiteControlNumber = siteControl.siteControlId;
    // console.log('editSiteControlNumber = ' + this.editSiteControlNumber);
    // this.router.navigate(['../sitecontrol', +this.editSiteControlNumber], {relativeTo: this.route});
    this.router.navigate(['../sitecontrol', siteControl.siteControlId], {relativeTo: this.route});
  }

  onDelete(siteControl: LustSiteControlGet) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete site control ' + siteControl.siteControlId + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delLustSiteControl(siteControl.siteControlId).subscribe();
        this.loadResultPage();
        this.getSearchResults();
      }
    });
  }

  add() {
    this.router.navigate(['../sitecontrol'], {relativeTo: this.route});
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  genExcel() {
    this.excelService.exportJson(this.siteControls, `${this.logNumber}SC`);
  }
}
