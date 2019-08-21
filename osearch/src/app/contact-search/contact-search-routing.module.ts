import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ContactSearchFilterComponent } from './contact-search-filter.component';
import { ContactSearchResultComponent } from './contact-search-result.component';
import { AuthGuardService } from '../guards/auth-guard.service';
const routes: Routes = [
  { path: 'csearch', component: ContactSearchFilterComponent,
    resolve: { },
    canActivate: [AuthGuardService],
    runGuardsAndResolvers: 'always',
  },
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ContactSearchRoutingModule { }
export const contactSearchRoutingComponents = [ContactSearchFilterComponent, ContactSearchResultComponent];
