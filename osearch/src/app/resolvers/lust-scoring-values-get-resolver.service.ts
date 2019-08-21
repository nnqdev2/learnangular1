import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { LustScoringValuesGet } from '../models/lust-scoring-values-get';

@Injectable({
  providedIn: 'root'
})
export class LustScoringValuesGetResolver implements Resolve<Observable<LustScoringValuesGet>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustScoringValuesGet> {
    return this.lustDataService.getLustScoringValues(+route.parent.paramMap.get('lustid'));

    // return this.lustDataService.getLustIncident(route.paramMap.get('lustid'));
  }
}
