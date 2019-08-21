import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { SitePhoto } from '../models/site-photo';
import { LustDataService } from '../services/lust-data.service';

@Injectable({
  providedIn: 'root'
})
export class SitePhotoResolver implements Resolve<Observable<SitePhoto>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<SitePhoto> {
    // console.log('SitePhotoResolver() +route.parent.paramMap.get');
    // console.log(+route.parent.paramMap.get('pictureid'));
    // console.log(+route.paramMap.get('pictureid'));
    return this.lustDataService.getSitePhoto(+route.paramMap.get('pictureid'));
  }
}
