import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { PublicNotice } from '../models/public-notice';

@Injectable({
  providedIn: 'root'
})
export class PublicNoticeResolver implements Resolve<Observable<PublicNotice>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<PublicNotice> {
    return this.lustDataService.getPublicNotice(+route.paramMap.get('pnid'));
  }
}
