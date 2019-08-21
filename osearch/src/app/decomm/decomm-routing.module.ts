import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DecommSearchFilterComponent } from './decomm-search-filter/decomm-search-filter.component';
import { CanDeactivateGuard } from '../guards/can-deactivate-guard.service';
import { LustHotDecommComponent } from './lust-hot-decomm/lust-hot-decomm.component';
import { HotCleanDecommComponent } from './hot-clean-decomm/hot-clean-decomm.component';
import { CountiesResolver } from '../resolvers/counties-resolver.service';
import { QuadrantsResolver } from '../resolvers/quadrants-resolver.service';
import { StreetTypesResolver } from '../resolvers/street-types-resolver.service';
import { ZipCodesResolver } from '../resolvers/zipcodes-resolver.service';
import { LustHotcSearchTypesResolver } from '../resolvers/lust-hotc-search-types-resolver-service';
import { LustHotcGetResolver } from '../resolvers/lust-hotc-get-resolver.service';
import { HotcDecommTypesResolver } from '../resolvers/hotc-decomm-types-resolver.service';
import { HotcFeeDefaultsResolver } from '../resolvers/hotc-fee-defaults-resolver.service';
import { HotcDecommResolver } from '../resolvers/hotc-decomm-resolver.service';
import { StatesResolver } from '../resolvers/states-resolver.service';
import { AuthGuardService } from '../guards/auth-guard.service';

const routes: Routes = [
  { path: 'dsearch', component: DecommSearchFilterComponent,
    resolve: {
      counties: CountiesResolver,
      quadrants: QuadrantsResolver,
      streetTypes: StreetTypesResolver,
      zipCodes: ZipCodesResolver,
      lustHotcSearchTypes: LustHotcSearchTypesResolver,
    },
    canActivate: [AuthGuardService],
    runGuardsAndResolvers: 'always',
  },
  { path: 'dlust', component: LustHotDecommComponent,
    resolve: {
    },
    canDeactivate: [CanDeactivateGuard],
    canActivate: [AuthGuardService],
    runGuardsAndResolvers: 'always',
  },
  { path: 'dlust/:lustid', component: LustHotDecommComponent,
    resolve: {
      lustHotcGet: LustHotcGetResolver,
      hotcDecommTypes: HotcDecommTypesResolver,
      hotcFeeDefaults: HotcFeeDefaultsResolver,
    },
    canDeactivate: [CanDeactivateGuard],
    canActivate: [AuthGuardService],
    runGuardsAndResolvers: 'always',
  },
  { path: 'dhot', component: HotCleanDecommComponent,
    resolve: {
      states: StatesResolver,
      quadrants: QuadrantsResolver,
      streetTypes: StreetTypesResolver,
      hotcDecommTypes: HotcDecommTypesResolver,
      hotcFeeDefaults: HotcFeeDefaultsResolver,
    },
    canDeactivate: [CanDeactivateGuard],
    canActivate: [AuthGuardService],
    runGuardsAndResolvers: 'always',
  },
  { path: 'dhot/:hotid', component: HotCleanDecommComponent,
    resolve: {
      hotcDecomm: HotcDecommResolver,
      states: StatesResolver,
      quadrants: QuadrantsResolver,
      streetTypes: StreetTypesResolver,
      hotcDecommTypes: HotcDecommTypesResolver,
      hotcFeeDefaults: HotcFeeDefaultsResolver,
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
export class DecommRoutingModule { }
