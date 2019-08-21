import { Injectable } from '@angular/core';
import { DataSource } from '@angular/cdk/table';
import { HotcSearchResultStat } from 'src/app/models/hotc-search-result-stat';
import { BehaviorSubject, Observable } from 'rxjs';
import { LustDataService } from 'src/app/services/lust-data.service';
import { CollectionViewer } from '@angular/cdk/collections';
import { HotcSearchFilter } from 'src/app/models/hotc-search-filter';
import { finalize } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class DecommSearchResultDataSourceService  implements DataSource<HotcSearchResultStat> {

  private resultsSubject = new BehaviorSubject<HotcSearchResultStat[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private hotcSearchResultStats: HotcSearchResultStat[];

  public searchResultReturned$ = this.resultsSubject.asObservable();
  public loading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<HotcSearchResultStat[]> {
    return this.searchResultReturned$;
  }

  disconnect(collectionViewer: CollectionViewer): void {
    this.resultsSubject.complete();
    this.loadingSubject.complete();
  }

  loadResults(hotcSearchFilter: HotcSearchFilter) {
    this.loadingSubject.next(true);
    this.lustDataService.getHotcSearch(hotcSearchFilter)
      .pipe(
          finalize(() => this.loadingSubject.next(false)),
    )
    .subscribe(
        data => {
            this.hotcSearchResultStats = data;
            this.resultsSubject.next(this.hotcSearchResultStats);
            this.loadingSubject.next(false);
        }
    );
  }

}
