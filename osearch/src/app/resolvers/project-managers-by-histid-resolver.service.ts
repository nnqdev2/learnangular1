import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { ProjectManagerHistIdGet} from '../models/project-manager-histid-get';

@Injectable({
  providedIn: 'root'
})

export class ProjectManagersByHistIdResolver implements Resolve<Observable<ProjectManagerHistIdGet>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ProjectManagerHistIdGet> {

   if (!isNaN(+route.paramMap.get('projMgrHistId'))) {
    return this.lustDataService.getProjectManagerByPmhsId(+route.paramMap.get('projMgrHistId'));
  }

  }
}
