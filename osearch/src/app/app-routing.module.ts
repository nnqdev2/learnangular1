import { NgModule } from '@angular/core';
import { Routes, RouterModule, PreloadAllModules } from '@angular/router';
import { AuthCallbackComponent } from './auth-callback/auth-callback.component';
import { UnauthorizedComponent } from './unauthorized/unauthorized.component';
const routes: Routes = [
  {
    path: 'lust', loadChildren: './lust-search/lust-search.module#LustSearchModule'
    // path: 'lust', loadChildren: () => LustSearchModule
  },
  {
    path: 'incident', loadChildren: './olprr-incident/olprr-incident.module#OlprrIncidentModule'
  },
  {
    path: 'osearch', loadChildren: './olprr-search/olprr-search.module#OlprrSearchModule'
  },
  {
    path: 'csearch', loadChildren: './contact-search/contact-search.module#ContactSearchModule'
  },
  {
    path: 'usearch', loadChildren: './ust-search/ust-search.module#UstSearchModule'
  },
  {
    path: 'dsearch', loadChildren: './decomm/decomm.module#DecommModule'
  },
  {
    path: 'unauthorized',
    component: UnauthorizedComponent,
  },
  {
    path: 'auth-callback',
    component: AuthCallbackComponent,
  },
  { path: '', redirectTo: 'lsearch', pathMatch: 'full' }
,
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    preloadingStrategy: PreloadAllModules
    , onSameUrlNavigation: 'reload'
  //     , enableTracing: true
  })],
  exports: [RouterModule]
})
export class AppRoutingModule { }

