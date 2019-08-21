import { Component, OnInit, AfterViewInit, OnChanges, OnDestroy, SimpleChanges } from '@angular/core';
import { Subscription } from 'rxjs';
import { Pcs } from 'src/app/models/pcs';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ApGetLogNumber } from 'src/app/models/apGetLogNumber';
import { PcssResultDataSourceService } from './pcss-result-data-source.service';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';
import { AuthLevel, AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-pcss',
  templateUrl: './pcss.component.html',
  styleUrls: ['./pcss.component.scss']
})
export class PcssComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {

  pcsId: number;
  pcsTypeId: number;
  description: string;
  pcsDate: Date;
  meetingDate?: Date;

  private lustIdSub: any;
  private lustId: number;
  logNumber: string;
  siteName: string;
  pcsDataSource: PcssResultDataSourceService;
  displayedColumns = ['pcsId', 'disposalDate', 'landfillAmtYrds3', 'thermalAmtYrds3', 'onSiteAmtYrds3', 'offSiteAmtYrds3'
                    , 'onSiteDisposalInd', 'offSiteDispAddr', 'swlaPermitNbr'
                    , 'lastChangeBy', 'lastChangeDate', 'pcsComment'];
  private subscription: Subscription;
  private pcss: Pcs[];
  public totalRows = 0;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  exportToCsv = Constants.exportToCSV;
  authLevel: AuthLevel;
  showAdd: boolean;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
              , private confirmDeleteDialog: MatDialog, private excelService: ExcelService, private authService: AuthService) {
    this.pcsDataSource = new PcssResultDataSourceService(this.lustDataService);
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
    this.pcsDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.pcsDataSource.pcsResultReturned$.subscribe(
      pcss => {
        this.pcss = pcss;
        if (this.pcss !== undefined &&
          this.pcss.length > 0) {
            this.totalRows = this.pcss.length;
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

  onEdit(pcs: Pcs) {
    this.router.navigate(['../pcs' , pcs.pcsId], {relativeTo: this.route});
  }

  onDelete(pcs: Pcs) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete ' + pcs.lastChangeby + ' ?' ,
    };
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        // this.lustDataService.delPcs(pcs.pcsId).subscribe();
        this.loadResultPage();
        this.getSearchResults();
      }
    });
  }

  add() {
    this.router.navigate(['../pcs'], {relativeTo: this.route});
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  genExcel() {
    this.excelService.exportJson(this.pcss, `${this.logNumber}PCS`);
  }
}
