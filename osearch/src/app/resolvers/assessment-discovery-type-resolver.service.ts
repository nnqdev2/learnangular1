import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { AssessmentDiscoveryType } from '../models/assessment-discovery-type';

@Injectable({
  providedIn: 'root'
})
export class AssessmentDiscoveryResolver implements Resolve<Observable<AssessmentDiscoveryType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<AssessmentDiscoveryType[]> {
    return this.lustDataService.getAssessmentDiscoveryTypes();
  }
}
