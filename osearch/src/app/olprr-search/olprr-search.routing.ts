import { NgModule } from '@angular/core';
import { Routes, RouterModule, CanDeactivate } from '@angular/router';

import { OlprrSearchFilterComponent } from './olprr-search-filter.component';
import { OlprrSearchResultComponent } from './olprr-search-result.component';
import { OlprrReviewComponent } from './olprr-review.component';

import { SiteTypesResolver } from '../resolvers/site-types-resolver.service';
import { DeqOfficesResolver } from '../resolvers/deq-offices-resolver.service';
import { IncidentStatusesResolver } from '../resolvers/incident-statuses-resolver.service';
import { ConfirmationTypesResolver } from '../resolvers/confirmation-types-resolver.service';
import { CountiesResolver } from '../resolvers/counties-resolver.service';
import { DiscoveryTypesResolver } from '../resolvers/discovery-types-resolver.service';
import { QuadrantsResolver } from '../resolvers/quadrants-resolver.service';
import { ReleaseCauseTypesResolver } from '../resolvers/release-cause-types-resolver.service';
import { SourceTypesResolver } from '../resolvers/source-types-resolver.service';
import { StatesResolver } from '../resolvers/states-resolver.service';
import { StreetTypesResolver } from '../resolvers/street-types-resolver.service';
import { IncidentDataResolver } from '../resolvers/incident-resolver.service';
import { AcceptedDialogComponent } from './accepted-dialog.component';
import { CanDeactivateGuard } from '../guards/can-deactivate-guard.service';
import { AuthGuardService } from '../guards/auth-guard.service';

const routes: Routes = [
  { path: 'osearch', component: OlprrSearchFilterComponent,
    resolve: {
      deqOffices: DeqOfficesResolver,
      incidentStatuses: IncidentStatusesResolver,
      siteTypes: SiteTypesResolver,
    },
    canActivate: [AuthGuardService],
    runGuardsAndResolvers: 'always',
  },
  { path: 'review/:olprrid', component: OlprrReviewComponent,
      resolve: {
        incidentData: IncidentDataResolver,
        incidentStatuses: IncidentStatusesResolver,
        siteTypes: SiteTypesResolver,
        confirmationTypes: ConfirmationTypesResolver,
        counties: CountiesResolver,
        discoveryTypes: DiscoveryTypesResolver,
        quadrants: QuadrantsResolver,
        releaseCauseTypes: ReleaseCauseTypesResolver,
        sourceTypes: SourceTypesResolver,
        states: StatesResolver,
        streetTypes: StreetTypesResolver,
      },
      canDeactivate: [CanDeactivateGuard],
      canActivate: [AuthGuardService],
      runGuardsAndResolvers: 'always',
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class OlprrSearchRoutingModule { }
export const olprrSearchRoutingComponents = [OlprrSearchFilterComponent
  , OlprrSearchResultComponent, OlprrReviewComponent, AcceptedDialogComponent];


