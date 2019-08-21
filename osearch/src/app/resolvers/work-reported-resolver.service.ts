import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { LustDataService } from '../services/lust-data.service';
import { WorkReported } from '../models/work-reported';

@Injectable({
  providedIn: 'root'
})
export class WorkReportedResolver implements Resolve<Observable<WorkReported>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<WorkReported> {
    return this.lustDataService.getWorkReported(+route.paramMap.get('wrid'));
  }
}
