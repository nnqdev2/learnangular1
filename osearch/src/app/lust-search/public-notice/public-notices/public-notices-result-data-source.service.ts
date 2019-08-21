import { Injectable } from '@angular/core';
import { CollectionViewer, DataSource } from '@angular/cdk/collections';
import { BehaviorSubject, of, Observable } from 'rxjs';
import { catchError, finalize, map } from 'rxjs/operators';
import { LustDataService } from '../../../services/lust-data.service';
import { PublicNotice } from '../../../models/public-notice';

@Injectable({
  providedIn: 'root'
})
export class PublicNoticesResultDataSourceService implements DataSource<PublicNotice> {

  private resultsSubject = new BehaviorSubject<PublicNotice[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private publicNotices: PublicNotice[];

  public publicNoticeResultReturned$ = this.resultsSubject.asObservable();
  public publicNoticeLoading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<PublicNotice[]> {
      return this.publicNoticeResultReturned$;
      // return this.resultsSubject.asObservable();
  }

  disconnect(collectionViewer: CollectionViewer): void {
      this.resultsSubject.complete();
      this.loadingSubject.complete();
  }

  loadResults(lustId: number) {
      console.log( JSON.stringify(lustId));
      this.loadingSubject.next(true);
      this.lustDataService.getPublicNotices(lustId)
          .pipe(
              finalize(() => this.loadingSubject.next(false)),
          )
          .subscribe(
              data => {
                  this.publicNotices = data;
                  this.resultsSubject.next(this.publicNotices);
                  this.loadingSubject.next(false);
              }
          );
  }
}
