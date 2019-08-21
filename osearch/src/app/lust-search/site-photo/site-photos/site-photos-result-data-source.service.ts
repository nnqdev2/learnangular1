import { Injectable } from '@angular/core';
import { CollectionViewer, DataSource } from '@angular/cdk/collections';
import { BehaviorSubject, of, Observable } from 'rxjs';
import { catchError, finalize, map } from 'rxjs/operators';
import { LustDataService } from '../../../services/lust-data.service';
import { SitePhoto } from '../../../models/site-photo';

@Injectable({
  providedIn: 'root'
})
export class SitePhotosResultDataSourceService implements DataSource<SitePhoto> {

  private resultsSubject = new BehaviorSubject<SitePhoto[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private sitePhotos: SitePhoto[];

  public sitePhotoResultReturned$ = this.resultsSubject.asObservable();
  public sitePhotoLoading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<SitePhoto[]> {
     return this.sitePhotoResultReturned$;
      // return this.resultsSubject.asObservable();
  }

  disconnect(collectionViewer: CollectionViewer): void {
      this.resultsSubject.complete();
      this.loadingSubject.complete();
  }

  loadResults(lustId: number) {
      console.log( JSON.stringify(lustId));
      this.loadingSubject.next(true);
      this.lustDataService.getSitePhotos(lustId)
          .pipe(
              finalize(() => this.loadingSubject.next(false)),
          )
          .subscribe(
              data => {
                  this.sitePhotos = data;
                  this.resultsSubject.next(this.sitePhotos);
                  this.loadingSubject.next(false);
              }
          );
  }
}
