import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, Router, RouterStateSnapshot } from '@angular/router';
import { LustDataService } from '../services/lust-data.service';
import { Observable } from 'rxjs';
import { ProjectManagerGet } from '../models/project-manager-get';
import { stringify } from '@angular/core/src/util';

@Injectable({
  providedIn: 'root'
})
export class ProjectManagersByLustidResolver implements Resolve<Observable<ProjectManagerGet[]>> {
  constructor(private lustDataService: LustDataService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ProjectManagerGet[]> {
    let lustId = +route.parent.params['lustid'];
    if (isNaN(lustId)) {
      lustId = +route.pathFromRoot[2].params['lustid'];
    }
    console.log('^^^^^ProjectManagersByLustidResolver......');
    console.log(lustId);
    return this.lustDataService.getProjectManagerByLustId(lustId);
  }
}
