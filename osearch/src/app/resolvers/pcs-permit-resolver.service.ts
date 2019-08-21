import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { PcsPermit } from '../models/pcs-permit';

@Injectable({
  providedIn: 'root'
})
export class PcsPermitResolver implements Resolve<Observable<PcsPermit>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<PcsPermit> {
    return this.lustDataService.getPcsPermit(+route.paramMap.get('pcsid'));
  }
}
