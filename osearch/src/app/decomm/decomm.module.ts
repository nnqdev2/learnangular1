import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DecommRoutingModule } from './decomm-routing.module';
import { DecommSearchFilterComponent } from './decomm-search-filter/decomm-search-filter.component';
import { DecommSearchResultComponent } from './decomm-search-result/decomm-search-result.component';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { MaterialModule } from '../shared/material.module';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ShowErrorsModule } from '../show-errors/show-errors.module';
import { ShowAllMessagesModule } from '../show-all-messages/show-all-messages.module';
import { LustHotDecommComponent } from './lust-hot-decomm/lust-hot-decomm.component';
import { HotCleanDecommComponent } from './hot-clean-decomm/hot-clean-decomm.component';
import { LustContactsComponent } from './lust-contacts/lust-contacts.component';

import { TitleCasePipe, UpperCasePipe } from '@angular/common';

@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    HttpClientModule,
    MaterialModule,
    NgbModule.forRoot(),
    ShowErrorsModule,
    ShowAllMessagesModule,
    DecommRoutingModule
  ],
  declarations: [DecommSearchFilterComponent, DecommSearchResultComponent, LustHotDecommComponent
    , HotCleanDecommComponent, LustContactsComponent],
  exports: [DecommSearchFilterComponent, DecommSearchResultComponent],
  providers:    [ TitleCasePipe, UpperCasePipe ],
  entryComponents: []
})
export class DecommModule { }
