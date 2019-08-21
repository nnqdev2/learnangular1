import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { EnvironmentalType } from '../models/environmental-type';

@Injectable({
  providedIn: 'root'
})
export class EnvironmentalResolver implements Resolve<Observable<EnvironmentalType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<EnvironmentalType[]> {
    return this.lustDataService.getEnvironmentalTypes();
  }
}
