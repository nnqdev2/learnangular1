import { Injectable } from '@angular/core';
import { DataSource } from '@angular/cdk/table';
import { InspectionGet } from '../../models/inspection-Get';
import { BehaviorSubject, Observable } from 'rxjs';
import { LustDataService } from '../../services/lust-data.service';
import { CollectionViewer } from '@angular/cdk/collections';
import { finalize } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})

export class InspectionsResultDataSourceService implements DataSource<InspectionGet> {
    private resultsSubject = new BehaviorSubject<InspectionGet[]>([]);
    private loadingSubject = new BehaviorSubject<boolean>(false);

    public inspectionResultReturned$ = this.resultsSubject.asObservable();
    public inspectLoading$ = this.loadingSubject.asObservable();

    constructor(private lustDataService: LustDataService) {}

    connect(collectionViewer: CollectionViewer): Observable<InspectionGet[]> {
        return this.inspectionResultReturned$;
    }

    disconnect(collectionViewer: CollectionViewer): void {
        this.resultsSubject.complete();
        this.loadingSubject.complete();
    }

    loadResults(lustId: number) {
        this.lustDataService.getLustInspection(lustId)
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
