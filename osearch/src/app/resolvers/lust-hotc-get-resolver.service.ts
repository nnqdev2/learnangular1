import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { LustHotcGet } from '../models/lust-hotc-get';

@Injectable({
  providedIn: 'root'
})
export class LustHotcGetResolver implements Resolve<Observable<LustHotcGet>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustHotcGet> {
    return this.lustDataService.getLustHotc(+route.paramMap.get('lustid'));
  }
}
