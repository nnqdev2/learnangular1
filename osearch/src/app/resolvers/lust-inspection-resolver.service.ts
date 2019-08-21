import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { InspectionGet } from '../models/inspection-get';
import { stringify } from '@angular/core/src/util';

@Injectable({
  providedIn: 'root'
})

export class LustInspectionResolver implements Resolve<Observable<InspectionGet>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<InspectionGet> {
    let lustId = +route.parent.params['lustid'];
    if (isNaN(lustId)) {
      lustId = +route.pathFromRoot[2].params['lustid'];
    }
    return;
}
}
