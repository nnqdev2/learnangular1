import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustCris } from '../models/lust-cris';
import { LustDataService } from '../services/lust-data.service';

@Injectable({
  providedIn: 'root'
})
export class LustCrisResolver implements Resolve<Observable<LustCris>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustCris> {
    const lustId = +route.parent.params['lustid'];
    // if (isNaN(lustId)) {
    //   lustId = +route.pathFromRoot[2].params['lustid'];
    // }
    return this.lustDataService.getLustCris(+route.pathFromRoot[2].params['lustid']);
  }
}
