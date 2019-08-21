import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { LustSiteControlDescriptionInstitutionalType } from '../models/lust-site-control-description-institutional-type';

@Injectable({
  providedIn: 'root'
})
export class LustSiteControlDescriptionInstitutionalResolver implements Resolve<Observable<LustSiteControlDescriptionInstitutionalType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustSiteControlDescriptionInstitutionalType[]> {
    return this.lustDataService.getLustSiteControlDescriptionInstitutional();

    // return this.lustDataService.getLustIncident(route.paramMap.get('lustid'));
  }
}
