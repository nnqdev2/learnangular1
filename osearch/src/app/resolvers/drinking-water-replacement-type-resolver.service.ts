import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable, of } from 'rxjs';
import { DrinkingWaterReplacementType } from '../models/drinking-water-replacement-type';

@Injectable({
  providedIn: 'root'
})
export class DrinkingWaterReplacementResolver implements Resolve<Observable<DrinkingWaterReplacementType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<DrinkingWaterReplacementType[]> {
    return this.lustDataService.getDrinkingWaterReplacementTypes();
  }
}
