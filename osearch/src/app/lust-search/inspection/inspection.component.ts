import { Component, OnInit, Output, EventEmitter, AfterViewInit, OnChanges, OnDestroy, SimpleChange, SimpleChanges } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
import { ActivatedRoute, Router} from '@angular/router';
import { InspectionGet } from '../../models/inspection-get';
import { Subscription } from 'rxjs';
import { MatDialogRef, MatDialog, MatDialogConfig } from '@angular/material';
import { InspectionsResultDataSourceService } from '../../lust-search/inspection/inspections-result-data-source.service';
import { LustDataService } from 'src/app/services/lust-data.service';
import { ApGetLogNumber } from '../../models/apGetLogNumber';
import { ExcelService } from 'src/app/common/excel.service';
import { Constants } from 'src/app/constants';



@Component({
  selector: 'app-inspection',
  templateUrl: './inspection.component.html',
  styleUrls: ['./inspection.component.scss']
})
export class InspectionComponent implements OnInit, OnDestroy {
  lustIdSub: any;
  lustId: number;
  public lognumber: string;
  siteName: string;
  public totalRows = 0;
  exportToCsv = Constants.exportToCSV;
  inspectionDataSource: InspectionsResultDataSourceService;
  displayedColumns = ['inspectionId', 'inspectionDate', 'inspector', 'inspectionType', 'comment', 'lastChangeBy',
                                        'lastChangeDate', 'lustid', 'lognumber'];

  private subscription: Subscription;
  private inspectionGets: InspectionGet[];
  constructor(private lustDataService: LustDataService, private route: ActivatedRoute, private router: Router
    , private excelService: ExcelService) {
          this.inspectionDataSource = new InspectionsResultDataSourceService(this.lustDataService);
  }

  ngOnInit() {
    this.lustIdSub = this.route.parent.params.subscribe(params => {
      this.lustId = +params['lustid'];
    });
    this.route.data.subscribe((data: {apGetLogNumber: ApGetLogNumber}) => {
      this.lognumber = data.apGetLogNumber.logNumber;
      this.siteName = data.apGetLogNumber.siteName;
    });
    this.loadResultPage();
    this.getSearchResults();
  }

  loadResultPage() {
    this.inspectionDataSource.loadResults(this.lustId);
  }

  getSearchResults() {
    this.subscription = this.inspectionDataSource.inspectionResultReturned$.subscribe(
      contactAffilGets => {
        this.inspectionGets = this.inspectionGets;
        if (this.inspectionGets !== undefined &&
          this.inspectionGets.length > 0) {
            this.totalRows = this.inspectionGets.length;
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

  genExcel() {
    this.excelService.exportJson(this.inspectionGets, `${this.lognumber}I`);
  }

}
