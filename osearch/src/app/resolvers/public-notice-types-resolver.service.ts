import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { IdDescLookup } from '../models/id-desc-lookup';

@Injectable({
  providedIn: 'root'
})

export class PublicNoticeTypesResolver implements Resolve<Observable<IdDescLookup[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<IdDescLookup[]> {
    return this.lustDataService.getPublicNoticeTypes();
  }
}