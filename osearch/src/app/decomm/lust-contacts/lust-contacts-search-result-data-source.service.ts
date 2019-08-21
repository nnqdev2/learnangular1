import { Injectable } from '@angular/core';
import { CollectionViewer, DataSource } from '@angular/cdk/collections';
import { BehaviorSubject, of, Observable } from 'rxjs';
import { catchError, finalize, map } from 'rxjs/operators';
import { HotcContact } from 'src/app/models/hotc-contact';
import { LustDataService } from 'src/app/services/lust-data.service';

@Injectable({
  providedIn: 'root'
})
export class LustContactsSearchResultDataSourceService implements DataSource<HotcContact> {

  private resultsSubject = new BehaviorSubject<HotcContact[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public lustContactsResultReturned$ = this.resultsSubject.asObservable();
  public lustContactsLoading$ = this.loadingSubject.asObservable();

  constructor(private lustDataService: LustDataService) {}

  connect(collectionViewer: CollectionViewer): Observable<HotcContact[]> {
      return this.lustContactsResultReturned$;
  }

  disconnect(collectionViewer: CollectionViewer): void {
      this.resultsSubject.complete();
      this.loadingSubject.complete();
  }

  loadResults(lustId: number) {
      this.loadingSubject.next(true);
      this.lustDataService.getLustHotcContacts(lustId)
          .pipe(
              finalize(() => this.loadingSubject.next(false)),
          )
          .subscribe(
              data => {
                  this.resultsSubject.next(data);
                  this.loadingSubject.next(false);
              }
          );
  }
}
