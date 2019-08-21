import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { LustAssessmentGet } from '../models/assessment-get';

@Injectable({
  providedIn: 'root'
})
export class LustAssessmentGetResolver implements Resolve<Observable<LustAssessmentGet>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustAssessmentGet> {
    return this.lustDataService.getLustAssessment(+route.parent.paramMap.get('lustid'));

    // return this.lustDataService.getLustIncident(route.paramMap.get('lustid'));
  }
}
