import { Injectable } from '@angular/core';
import { DataSource } from '@angular/cdk/table';
import { ProjectManagerGet } from 'src/app/models/project-manager-get';
import { BehaviorSubject, Observable } from 'rxjs';
import { LustDataService } from 'src/app/services/lust-data.service';
import { CollectionViewer } from '@angular/cdk/collections';
import { finalize } from 'rxjs/operators';
import { stringify } from 'querystring';

@Injectable({
    providedIn: 'root'
  })

export class ProjectManagerResultDataSourceService implements DataSource<ProjectManagerGet> {
    private resultsSubject = new BehaviorSubject<ProjectManagerGet[]>([]);
    private loadingSubject = new BehaviorSubject<boolean>(false);

    public projectmanagerResultReturned$ = this.resultsSubject.asObservable();
    public projectmanagerLoading$ = this.loadingSubject.asObservable();

    x: string[];

    constructor(private lustDataService: LustDataService) {}

    connect(collectionViewer: CollectionViewer): Observable<ProjectManagerGet[]> {
        return this.projectmanagerResultReturned$;
    }

    disconnect(collectionViewer: CollectionViewer): void {
        this.resultsSubject.complete();
        this.loadingSubject.complete();
    }

    loadResults(lustId: number) {
        this.lustDataService.getProjectManagerByLustId(lustId)
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