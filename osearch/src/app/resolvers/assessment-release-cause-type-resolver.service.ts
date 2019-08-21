import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { AssessmentReleaseCauseType } from '../models/assessment-release-cause-type';

@Injectable({
  providedIn: 'root'
})
export class AssessmentReleaseCauseResolver implements Resolve<Observable<AssessmentReleaseCauseType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<AssessmentReleaseCauseType[]> {
    return this.lustDataService.getAssessmentReleaseCauseTypes();
  }
}
