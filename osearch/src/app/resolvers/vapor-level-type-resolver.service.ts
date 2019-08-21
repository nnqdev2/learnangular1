import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { VaporLevelType } from '../models/vapor-level-type';

@Injectable({
  providedIn: 'root'
})

export class VaportLevelResolver implements Resolve<Observable<VaporLevelType[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<VaporLevelType[]> {
    return this.lustDataService.getVaporLevelTypes();
  }
}
