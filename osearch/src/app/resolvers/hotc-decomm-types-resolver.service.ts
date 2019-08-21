import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { SidDescLookup } from '../models/sid-desc-lookup';

@Injectable({
  providedIn: 'root'
})

export class HotcDecommTypesResolver implements Resolve<Observable<SidDescLookup[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<SidDescLookup[]> {
    return this.lustDataService.getHotcDecommTypes();
  }
}
