import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { PopulationExposedType } from '../models/population-exposed-type';

@Injectable({
  providedIn: 'root'
})

export class PopulationExposedResolver implements Resolve<Observable<PopulationExposedType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<PopulationExposedType[]> {
    return this.lustDataService.getPopulationExposedTypes();
  }
}
