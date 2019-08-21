import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { AquiferDepthType } from '../models/aquifer-depth-type';

@Injectable({
  providedIn: 'root'
})
export class AquiferDepthResolver implements Resolve<Observable<AquiferDepthType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<AquiferDepthType[]> {
    return this.lustDataService.getAquiferDepthTypes();
  }
}
