import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { UtilityImpactType } from '../models/utility-impact-type';

@Injectable({
  providedIn: 'root'
})

export class UtilityImpactResolver implements Resolve<Observable<UtilityImpactType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<UtilityImpactType[]> {
    return this.lustDataService.getUtilityImpactTypes();
  }
}
