import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { LustScoringRangeGet } from '../models/lust-scoring-range-get';

@Injectable({
  providedIn: 'root'
})
export class LustScoringRangeGetResolver implements Resolve<Observable<LustScoringRangeGet>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustScoringRangeGet> {
    return this.lustDataService.getLustScoringRange(+route.parent.paramMap.get('lustid'));

    // return this.lustDataService.getLustIncident(route.paramMap.get('lustid'));
  }
}
