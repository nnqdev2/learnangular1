import { Component, OnInit, Output, EventEmitter, AfterViewInit, OnChanges, OnDestroy, SimpleChange, SimpleChanges } from '@angular/core';
import { ProjectManagerResultDataSourceService } from './project-managers-result-data-source.service';
import { ProjectManagerGet } from '../../../models/project-manager-get';
import {LustDataService} from '../../../services/lust-data.service';
import { ActivatedRoute, Router} from '@angular/router';
import { Subscription } from 'rxjs';
import { FormGroup, FormBuilder } from '@angular/forms';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { ApGetLogNumber } from '../../../models/apGetLogNumber';
import { ConfirmDeleteDialogComponent } from '../../confirm-delete-dialog/confirm-delete-dialog.component';
import { ExcelService } from 'src/app/common/excel.service';
import { AuthService, AuthLevel } from 'src/app/services/auth.service';
import { Constants } from 'src/app/constants';

@Component({
  selector: 'app-project-managers',
  templateUrl: './project-managers.component.html',
  styleUrls: ['./project-managers.component.scss']
})
export class ProjectManagersComponent implements OnInit {
  lustIdSub: any;
  lustId: number;
  lognumber: string;
  siteName: string;
  public totalRows = 0;
  private projMgrHistId: number;
  projectManagerDataSource: ProjectManagerResultDataSourceService;
  private projectManagerGets: ProjectManagerGet[];
  private subscription: Subscription;
  private confirmDeleteDialogRef: MatDialogRef<ConfirmDeleteDialogComponent, any>;
  displayedColumns = ['projMgrHistId', 'userName', 'assignedDate', 'endDate', 'lastChangeBy', 'lastChangeDate', 'lustId', 'logNumber'];
  exportToCsv = Constants.exportToCSV;
  authLevel: AuthLevel;
  showAdd: boolean;

  constructor(private lustDataService: LustDataService, private route: ActivatedRoute,
    private router: Router, private confirmDeleteDialog: MatDialog, private excelService: ExcelService
    , private authService: AuthService) {
    this.projectManagerDataSource = new ProjectManagerResultDataSourceService(this.lustDataService);
}

  ngOnInit() {
    this.setAuthLevel();
    this.setShowAdd();
    this.lustIdSub = this.route.parent.params.subscribe(params => {
      this.lustId = +params['lustid'];
      if (isNaN(this.lustId)) {
        this.lustId = +this.route.pathFromRoot[2].params['lustid'];
      }

    });
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.lognumber = data.apGetLogNumber.logNumber;
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

  loadResultPage() {
    this.projectManagerDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.projectManagerDataSource.projectmanagerResultReturned$.subscribe(
      projectManagerGets => {
        this.projectManagerGets = projectManagerGets;
        if (this.projectManagerGets !== undefined &&
          this.projectManagerGets.length > 0) {
            this.totalRows = this.projectManagerGets.length;
        } else {
          this.totalRows = 0;
        }
      }
    );
  }

  delete(projectManager: ProjectManagerGet) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
      title: 'Confirm Delete',
      message1: 'Are you sure you want to delete project manager ' + projectManager.userName + ' ?' ,
    };
    // console.log(dialogConfig.)
    dialogConfig.disableClose =  true;
    this.confirmDeleteDialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, dialogConfig);
    this.confirmDeleteDialogRef.afterClosed().subscribe(result => {
      if (result === 'confirm') {
        this.lustDataService.delProjectManager(projectManager.projMgrHistId).subscribe();
        this.loadResultPage();
        this.getSearchResults();
      }
    });
  }

  edit(projectManager: ProjectManagerGet) {
      this.router.navigate(['../projectmanager' , projectManager.projMgrHistId], {relativeTo: this.route});
  }

  add() {
    this.router.navigate(['../projectmanager'], {relativeTo: this.route});
  }

  refresh() {
    this.loadResultPage();
    this.getSearchResults();
  }

  genExcel() {
    this.excelService.exportJson(this.projectManagerGets, `${this.lognumber}PM`);
  }
}
