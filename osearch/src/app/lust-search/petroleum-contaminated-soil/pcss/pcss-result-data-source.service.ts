import { Injectable } from '@angular/core';
import { CollectionViewer, DataSource } from '@angular/cdk/collections';
import { BehaviorSubject, of, Observable } from 'rxjs';
import { catchError, finalize, map } from 'rxjs/operators';
import { LustDataService } from '../../../services/lust-data.service';
import { Pcs } from '../../../models/pcs';

@Injectable({
  providedIn: 'root'
})
export class PcssResultDataSourceService implements DataSource<Pcs> {

  private resultsSubject = new BehaviorSubject<Pcs[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private pcss: Pcs[];

  public pcsResultReturned$ = this.resultsSubject.asObservable();
  public pcsLoading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<Pcs[]> {
      return this.pcsResultReturned$;
  }

  disconnect(collectionViewer: CollectionViewer): void {
      this.resultsSubject.complete();
      this.loadingSubject.complete();
  }

  loadResults(lustId: number) {
      console.log( JSON.stringify(lustId));
      this.loadingSubject.next(true);
      this.lustDataService.getPcss(lustId)
          .pipe(
              finalize(() => this.loadingSubject.next(false)),
          )
          .subscribe(
              data => {
                  this.pcss = data;
                  this.resultsSubject.next(this.pcss);
                  this.loadingSubject.next(false);
              }
          );
  }
}