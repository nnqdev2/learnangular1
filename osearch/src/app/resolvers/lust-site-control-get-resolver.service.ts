import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { LustSiteControlGet } from '../models/lust-site-control-get';

@Injectable({
  providedIn: 'root'
})
export class LustSiteControlGetResolver implements Resolve<Observable<LustSiteControlGet>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustSiteControlGet> {


  //   console.log(route.parent);
  //   // let siteControlId = +route.parent.params['siteControlId'];
  //   let siteId = +route.paramMap.get('siteControlId');
  //   console.log('Resolver - siteId = ' + siteId);
  //   if (isNaN(siteId)) {
  //     siteId = +route.pathFromRoot[2].params['siteControlId'];
  //   }
  //   return this.lustDataService.getLustSiteControl(siteId);
  // }
     return this.lustDataService.getLustSiteControl(+route.paramMap.get('scid'));
    // return this.lustDataService.getLustIncident(route.paramMap.get('lustid'));
  }
}
