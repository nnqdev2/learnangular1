import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { SiteAlias } from '../models/site-alias';
import { LustDataService } from '../services/lust-data.service';

@Injectable({
  providedIn: 'root'
})
export class SiteAliasResolver implements Resolve<Observable<SiteAlias>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<SiteAlias> {
    return this.lustDataService.getSiteAlias(+route.paramMap.get('sitenamealiasid'));
  }
}

