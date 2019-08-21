// import { Injectable } from '@angular/core';
// import { Router, Resolve, RouterStateSnapshot,
//          ActivatedRouteSnapshot } from '@angular/router';
// import { Observable, of } from 'rxjs';
// import { LustDataService } from '../services/lust-data.service';
// import { LustSiteScorePost } from '../models/lust-site-score-post';
// import { AssessmentPost } from '../models/assessment-post';

// @Injectable({
//   providedIn: 'root'
// })
// export class LustSiteScorePostResolver implements Resolve<Observable<LustSiteScorePost>> {
//   constructor(private lustDataService: LustDataService, private router: Router) {}
//   resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<LustSiteScorePost> {
//     // return this.lustDataService.updateSiteScore(+route.parent.paramMap.get('lustid'));
//     // return this.lustDataService.updateSiteScore(+LustSiteScorePost.prototype.lustId);
//     return this.lustDataService.updateSiteScore(AssessmentPost);

//     // return this.lustDataService.getLustIncident(route.paramMap.get('lustid'));
//   }
// }
