import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { SidDescLookup } from '../models/sid-desc-lookup';

@Injectable({
  providedIn: 'root'
})
export class LustHotcSearchTypesResolver implements Resolve<Observable<SidDescLookup[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<SidDescLookup[]> {
    return this.lustDataService.getLustHotcSearchTypes();
  }
}
