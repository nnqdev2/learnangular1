import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { NonDrinkingWaterSupplyType } from '../models/non-drinking-water-supply-type';

@Injectable({
  providedIn: 'root'
})

export class NonDrinkingWaterSupplyResolver implements Resolve<Observable<NonDrinkingWaterSupplyType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<NonDrinkingWaterSupplyType[]> {
    return this.lustDataService.getNonDrinkingWaterSupplyTypes();
  }
}
