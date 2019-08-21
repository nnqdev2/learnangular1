import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { LustSiteControlDescriptionEngineeringType } from '../models/lust-site-control-description-engineering-type';

@Injectable({
  providedIn: 'root'
})
export class LustSiteControlDescriptionEngineeringResolver implements Resolve<Observable<LustSiteControlDescriptionEngineeringType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustSiteControlDescriptionEngineeringType[]> {
    return this.lustDataService.getLustSiteControlDescriptionEngineering();

    // return this.lustDataService.getLustIncident(route.paramMap.get('lustid'));
  }
}
