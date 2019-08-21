import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { EnvironmentalImpactLikelyType } from '../models/environmental-impact-likely-type';

@Injectable({
  providedIn: 'root'
})
export class EnvironmentalImpactLikelyResolver implements Resolve<Observable<EnvironmentalImpactLikelyType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<EnvironmentalImpactLikelyType[]> {
    return this.lustDataService.getEnvironmentalImpactLikelyTypes();
  }
}
