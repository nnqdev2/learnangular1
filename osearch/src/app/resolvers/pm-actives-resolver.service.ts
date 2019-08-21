import { Injectable } from '@angular/core';
import { LustDataService } from '../services/lust-data.service';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { PmActive } from '../models/pm-active';

@Injectable({
  providedIn: 'root'
})
export class PmActivesResolver implements Resolve<Observable<PmActive[]>> {

  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<PmActive[]> {
    return this.lustDataService.getPmActives();
  }
}