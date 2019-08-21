import { Injectable } from '@angular/core';
import { CollectionViewer, DataSource } from '@angular/cdk/collections';
import { BehaviorSubject, of, Observable } from 'rxjs';
import { catchError, finalize, map } from 'rxjs/operators';
import { LustDataService } from '../../../services/lust-data.service';
import { LustSiteControlGet } from '../../../models/lust-site-control-get';

@Injectable({
  providedIn: 'root'
})
export class SiteControlsResultDataSourceService implements DataSource<LustSiteControlGet> {

  private resultsSubject = new BehaviorSubject<LustSiteControlGet[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private siteControls: LustSiteControlGet[];

  public siteControlsResultReturned$ = this.resultsSubject.asObservable();
  public siteControlsLoading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<LustSiteControlGet[]> {
      return this.siteControlsResultReturned$;
      // return this.resultsSubject.asObservable();
  }

  disconnect(collectionViewer: CollectionViewer): void {
      this.resultsSubject.complete();
      this.loadingSubject.complete();
  }

  loadResults(lustId: number) {
      console.log('in loadResults');
      console.log( JSON.stringify(lustId));

      this.loadingSubject.next(true);
      this.lustDataService.getLustSiteControls(lustId)
          .pipe(
              finalize(() => this.loadingSubject.next(false)),
          )
          .subscribe(
              data => {
                  this.siteControls = data;
                  this.resultsSubject.next(this.siteControls);
                  this.loadingSubject.next(false);
              }
          );
  }
}
