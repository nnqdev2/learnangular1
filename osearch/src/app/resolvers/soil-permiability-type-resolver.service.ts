import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { SoilPermiabilityType } from '../models/soil-permiability-type';

@Injectable({
  providedIn: 'root'
})

export class SoilPermiabilityResolver implements Resolve<Observable<SoilPermiabilityType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<SoilPermiabilityType[]> {
    return this.lustDataService.getSoilPermiabilityTypes();
  }
}
