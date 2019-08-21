import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { Pcs } from '../models/pcs';

@Injectable({
  providedIn: 'root'
})
export class PcsResolver implements Resolve<Observable<Pcs>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<Pcs> {
    return this.lustDataService.getPcs(+route.paramMap.get('pcsid'));
  }
}