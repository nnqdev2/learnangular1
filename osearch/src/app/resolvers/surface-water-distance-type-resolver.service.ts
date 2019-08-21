import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { SurfaceWaterDistanceType } from '../models/surface-water-distance-type';

@Injectable({
  providedIn: 'root'
})

export class SurfaceWaterDistanceResolver implements Resolve<Observable<SurfaceWaterDistanceType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<SurfaceWaterDistanceType[]> {
    return this.lustDataService.getSurfaceWaterDistanceTypes();
  }
}
