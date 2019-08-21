import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot,
         ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { HotcDecomm } from '../models/hotc-decomm';

@Injectable({
  providedIn: 'root'
})
export class HotcDecommResolver implements Resolve<Observable<HotcDecomm>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<HotcDecomm> {
    return this.lustDataService.getHotcDecomm(+route.paramMap.get('hotid'));
  }
}