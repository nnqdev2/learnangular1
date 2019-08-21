import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { IdDescLookup } from '../models/id-desc-lookup';

@Injectable({
  providedIn: 'root'
})
export class LandfillFacilitiesResolver implements Resolve<Observable<IdDescLookup[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<IdDescLookup[]> {
    return this.lustDataService.getLandfillFacilities();
  }
}
