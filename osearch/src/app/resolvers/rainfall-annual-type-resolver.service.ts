import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { RainfallAnnualType } from '../models/rainfall-annual-type';

@Injectable({
  providedIn: 'root'
})

export class RainfallAnnualResolver implements Resolve<Observable<RainfallAnnualType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<RainfallAnnualType[]> {
    return this.lustDataService.getRainfallAnnualTypes();
  }
}
