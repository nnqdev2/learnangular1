import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { DrinkingWaterImpactType } from '../models/drinking-water-impact-type';

@Injectable({
  providedIn: 'root'
})
export class DrinkingWaterImpactResover implements Resolve<Observable<DrinkingWaterImpactType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<DrinkingWaterImpactType[]> {
    return this.lustDataService.getDrinkingWaterImpactTypes();
  }
}
