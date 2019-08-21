import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { AssessmentConfirmationType } from '../models/assessment-confirmation-type';

@Injectable({
  providedIn: 'root'
})
export class AssessmentConfirmationResolver implements Resolve<Observable<AssessmentConfirmationType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<AssessmentConfirmationType[]> {
    return this.lustDataService.getAssessmentConfirmationTypes();
  }
}
