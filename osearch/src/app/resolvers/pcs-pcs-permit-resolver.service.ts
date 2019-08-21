import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { PcsPcsPermit } from '../models/pcs-pcs-permit';
import { LustDataService } from '../services/lust-data.service';

@Injectable({
  providedIn: 'root'
})

export class PcsPcsPermitResolver implements Resolve<Observable<PcsPcsPermit>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<PcsPcsPermit> {
    return this.lustDataService.getPcsPcsPermit(+route.paramMap.get('pcsid'));
  }
}
