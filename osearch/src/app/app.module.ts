import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NgModule, ErrorHandler } from '@angular/core';
import { NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { MaterialModule } from './shared/material.module';
import { RequestCache, RequestCacheWithMap } from './services/request-cache.service';
import { APP_INITIALIZER } from '@angular/core';
import { AppErrorHandler } from './common/app-error-handler';
import { LogService } from './common/log.service';
import { OlprrSearchRoutingModule } from './olprr-search/olprr-search.routing';
import { LustSearchRoutingModule } from './lust-search/lust-search-routing.module';
import { UstSearchRoutingModule } from './ust-search/ust-search-routing.module';
import { OlprrSearchModule } from './olprr-search/olprr-search.module';
import { LustSearchModule } from './lust-search/lust-search.module';
import { UstSearchModule } from './ust-search/ust-search.module';
import { ShowAllMessagesModule } from './show-all-messages/show-all-messages.module';
import { ShowErrorsModule } from './show-errors/show-errors.module';
import { CanDeactivateGuard } from './guards/can-deactivate-guard.service';
import { GuardDialogComponent } from './common/dialogs/guard-dialog.component';
import { SubmitStatusDialogComponent } from './common/dialogs/submit-status-dialog.component';
import { httpInterceptorProviders } from './http-interceptors';
import { ErrorsModule } from './common/errors/errors.module';
import { ErrorsRoutingModule } from './common/errors/errors-routing.module';
import { ContactSearchModule } from './contact-search/contact-search.module';
import { ContactSearchRoutingModule } from './contact-search/contact-search-routing.module';
import { OlprrIncidentRoutingModule } from './olprr-incident/olprr-incident-routing.module';
import { OlprrIncidentModule } from './olprr-incident/olprr-incident.module';
import { LustSearch2Module } from './lust-search2/lust-search2.module';
import { LustSearch2RoutingModule } from './lust-search2/lust-search2-routing.module';
import { DecommRoutingModule } from './decomm/decomm-routing.module';
import { DecommModule } from './decomm/decomm.module';
import { DatePipe } from '@angular/common';
import { HeaderComponent } from './common/header/header.component';
import { AppConfig } from './app.config';
import { HttpModule } from '@angular/http';
import { AuthGuardService } from './guards/auth-guard.service';
import { AuthCallbackComponent } from './auth-callback/auth-callback.component';
import { UnauthorizedComponent } from './unauthorized/unauthorized.component';

@NgModule({
  imports: [

    BrowserModule,
    HttpModule,
    ReactiveFormsModule,
    HttpClientModule,
    NgbModule.forRoot(),
    BrowserAnimationsModule,
    MaterialModule,
    ShowAllMessagesModule,
    ShowErrorsModule,
    ErrorsModule,
    ErrorsRoutingModule,
    OlprrIncidentModule,
    ContactSearchModule,
    LustSearch2Module,
    UstSearchModule,
    OlprrSearchModule,
    DecommModule,
    OlprrIncidentRoutingModule,
    ContactSearchRoutingModule,
    UstSearchRoutingModule,
    LustSearch2RoutingModule,
    // LustSearchRoutingModule,
    OlprrSearchRoutingModule,
    DecommRoutingModule,
    AppRoutingModule,
  ],
  declarations: [
    AppComponent,
    GuardDialogComponent,
    SubmitStatusDialogComponent,
    HeaderComponent,
    AuthCallbackComponent,
    UnauthorizedComponent
    // LustSearchComponent
  ],
  providers: [
    AppConfig,
    { provide: APP_INITIALIZER,
      useFactory: (config: AppConfig) => () => config.load(),
      deps: [AppConfig], multi: true },
    LogService,
    {provide: ErrorHandler, useClass: AppErrorHandler},
    {provide: RequestCache, useClass: RequestCacheWithMap },
    CanDeactivateGuard,
    httpInterceptorProviders,
    DatePipe,
    AuthGuardService
  ],
  // exports: [],
  entryComponents: [GuardDialogComponent, SubmitStatusDialogComponent
 ],
  bootstrap: [AppComponent],
})
export class AppModule { }
