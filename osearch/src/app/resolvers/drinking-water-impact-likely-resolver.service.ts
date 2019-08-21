import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { DrinkingWaterImpactLikelyType } from '../models/drinking-water-impact-likely-type';

@Injectable({
  providedIn: 'root'
})
export class DrinkingWaterImpactLikelyResolver implements Resolve<Observable<DrinkingWaterImpactLikelyType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<DrinkingWaterImpactLikelyType[]> {
    return this.lustDataService.getDrinkingWaterImpactLikelyTypes();
  }
}
