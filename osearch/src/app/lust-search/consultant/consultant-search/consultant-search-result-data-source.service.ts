import { Injectable } from '@angular/core';
import { DataSource } from '@angular/cdk/table';
import { ConsultantSearchResultStat } from '../../../models/consultant-search-result-stat';
import { BehaviorSubject, Observable } from 'rxjs';
import { LustDataService } from 'src/app/services/lust-data.service';
import { CollectionViewer } from '@angular/cdk/collections';
import { ContactSearchFilter } from '../../../models/contact-search-filter';
import { finalize } from 'rxjs/operators';
import { ConsultantSearchFilter } from 'src/app/models/consultant-search-filter';

@Injectable({
  providedIn: 'root'
})

export class ConsultantSearchResultDataSourceService  implements DataSource<ConsultantSearchResultStat> {

  private resultsSubject = new BehaviorSubject<ConsultantSearchResultStat[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private consultantSearchResultStats: ConsultantSearchResultStat[];

  public searchResultReturned$ = this.resultsSubject.asObservable();
  public loading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<ConsultantSearchResultStat[]> {
      return this.searchResultReturned$;
      // return this.resultsSubject.asObservable();
  }

  disconnect(collectionViewer: CollectionViewer): void {
      this.resultsSubject.complete();
      this.loadingSubject.complete();
  }

  loadResults(consultantSearchFilter: ConsultantSearchFilter) {
      console.log('loadResults....');
      this.loadingSubject.next(true);
      this.lustDataService.getConsultants(consultantSearchFilter)
          .pipe(
              finalize(() => this.loadingSubject.next(false)),
          )
          .subscribe(
              data => {
                  this.consultantSearchResultStats = data;
                  this.resultsSubject.next(this.consultantSearchResultStats);
                  this.loadingSubject.next(false);
              }
          );
  }

}
