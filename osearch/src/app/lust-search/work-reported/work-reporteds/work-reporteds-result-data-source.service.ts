import { Injectable } from '@angular/core';
import { CollectionViewer, DataSource } from '@angular/cdk/collections';
import { BehaviorSubject, of, Observable } from 'rxjs';
import { catchError, finalize, map } from 'rxjs/operators';
import { LustDataService } from '../../../services/lust-data.service';
import { WorkReported } from '../../../models/work-reported';

@Injectable({
  providedIn: 'root'
})
export class WorkReportedsResultDataSourceService implements DataSource<WorkReported> {

  private resultsSubject = new BehaviorSubject<WorkReported[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private workReporteds: WorkReported[];

  public workReportedResultReturned$ = this.resultsSubject.asObservable();
  public workReportedLoading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<WorkReported[]> {
      return this.workReportedResultReturned$;
      // return this.resultsSubject.asObservable();
  }

  disconnect(collectionViewer: CollectionViewer): void {
      this.resultsSubject.complete();
      this.loadingSubject.complete();
  }

  loadResults(lustId: number) {
      console.log( JSON.stringify(lustId));
      this.loadingSubject.next(true);
      this.lustDataService.getWorkReporteds(lustId)
          .pipe(
              finalize(() => this.loadingSubject.next(false)),
          )
          .subscribe(
              data => {
                  this.workReporteds = data;
                  this.resultsSubject.next(this.workReporteds);
                  this.loadingSubject.next(false);
              }
          );
  }
}
