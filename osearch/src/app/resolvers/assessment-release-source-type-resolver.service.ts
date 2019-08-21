import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { AssessmentReleaseSourceType } from '../models/assessment-release-source-type';

@Injectable({
  providedIn: 'root'
})
export class AssessmentReleaseSourceResolver implements Resolve<Observable<AssessmentReleaseSourceType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<AssessmentReleaseSourceType[]> {
    return this.lustDataService.getAssessmentReleaseSourceTypes();
  }
}
