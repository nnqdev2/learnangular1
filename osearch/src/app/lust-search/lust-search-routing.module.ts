import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SiteTypesResolver } from '../resolvers/site-types-resolver.service';
import { FileStatusesResolver } from '../resolvers/file-statuses-resolver.service';
import { ZipCodesResolver } from '../resolvers/zipcodes-resolver.service';
import { CitiesResolver } from '../resolvers/cities-resolver.service';
import { CountiesResolver } from '../resolvers/counties-resolver.service';
import { ConfirmationTypesResolver } from '../resolvers/confirmation-types-resolver.service';
import { DiscoveryTypesResolver } from '../resolvers/discovery-types-resolver.service';
import { ReleaseCauseTypesResolver } from '../resolvers/release-cause-types-resolver.service';
import { SourceTypesResolver } from '../resolvers/source-types-resolver.service';
import { StatesResolver } from '../resolvers/states-resolver.service';
import { CanDeactivateGuard } from '../guards/can-deactivate-guard.service';
import { LustIncidentCreateComponent } from './lust-incident-create/lust-incident-create.component';
import { LustIncidentEditComponent } from './lust-incident-edit/lust-incident-edit.component';
import { BrownfieldsResolver } from '../resolvers/brownfields-resolver.service';
import { SiteType2sResolver } from '../resolvers/site-type2s-resolver.service';
import { LustIncidentGetResolver } from '../resolvers/lust-incident-get-resolver.service';
import { LustIncidentComponent } from './lust-incident/lust-incident.component';
import { AssessmentComponent } from './assessment/assessment.component';
import { LustAssessmentGetResolver } from '../resolvers/lust-assessment-get-resolver.service';
import { SiteAliasEditComponent } from './site-alias/site-alias-edit/site-alias-edit.component';
import { SiteAliasesComponent } from './site-alias/site-aliases/site-aliases.component';
import { LustSearchComponent } from './lust-search/lust-search.component';
import { SiteAliasBaseComponent } from './site-alias/site-alias-base/site-alias-base.component';
import { SiteAliasResolver } from '../resolvers/site-alias-resolver.service';
import { LogNumberResolver } from '../resolvers/log-number-resolver.service';
import { ContactsComponent } from './contact/contacts/contacts.component';
import { ContactBaseComponent } from './contact/contact-base/contact-base.component';
import { ContactEditComponent } from './contact/contact-edit/contact-edit.component';
import { ContactTypesResolver } from '../resolvers/contact-types-resolver.service';
import { ContactType2sResolver } from '../resolvers/contact-type2s-resolver.service';
import { ContactResolver } from '../resolvers/contact-resolver.service';
import { LustHotcDecommComponent } from './lust-hotc-decomm/lust-hotc-decomm.component';
import { HotcDecommComponent } from './hotc-decomm/hotc-decomm.component';
import { ProjectManagersComponent } from './project-manager/project-managers/project-managers.component';
import { ProjectManagerBaseComponent } from './project-manager/project-manager-base/project-manager-base.component';
import { ProjectManagerEditComponent } from './project-manager/project-manager-edit/project-manager-edit.component';
import { ProjectManagersResolver } from '../resolvers/project-managers-resolver.service';
import { WorkReportedsComponent } from './work-reported/work-reporteds/work-reporteds.component';
import { WorkReportedBaseComponent } from './work-reported/work-reported-base/work-reported-base.component';
import { WorkReportedEditComponent } from './work-reported/work-reported-edit/work-reported-edit.component';
import { PcssComponent } from './petroleum-contaminated-soil/pcss/pcss.component';
import { PcsBaseComponent } from './petroleum-contaminated-soil/pcs-base/pcs-base.component';
import { PcsEditComponent } from './petroleum-contaminated-soil/pcs-edit/pcs-edit.component';
import { SiteControlsComponent } from './site-control/site-controls/site-controls.component';
import { SiteControlBaseComponent } from './site-control/site-control-base/site-control-base.component';
import { SiteControlEditComponent } from './site-control/site-control-edit/site-control-edit.component';
import { PublicNoticesComponent } from './public-notice/public-notices/public-notices.component';
import { PublicNoticeBaseComponent } from './public-notice/public-notice-base/public-notice-base.component';
import { PublicNoticeEditComponent } from './public-notice/public-notice-edit/public-notice-edit.component';
import { SitePhotosComponent } from './site-photo/site-photos/site-photos.component';
import { SitePhotoBaseComponent } from './site-photo/site-photo-base/site-photo-base.component';
import { SitePhotoEditComponent } from './site-photo/site-photo-edit/site-photo-edit.component';
import { AssessmentConfirmationResolver } from '../resolvers/assessment-confirmation-type-resolver.service';
import { AssessmentDiscoveryResolver } from '../resolvers/assessment-discovery-type-resolver.service';
import { AssessmentReleaseCauseResolver } from '../resolvers/assessment-release-cause-type-resolver.service';
import { AquiferDepthResolver } from '../resolvers/aquifer-depth-type-resolver.service';
import { DrinkingWaterImpactResover } from '../resolvers/drinking-water-impact-type-resolver.service';
import { DrinkingWaterReplacementResolver } from '../resolvers/drinking-water-replacement-type-resolver.service';
import { DrinkingWaterImpactLikelyResolver } from '../resolvers/drinking-water-impact-likely-resolver.service';
import { VaportLevelResolver } from '../resolvers/vapor-level-type-resolver.service';
import { PopulationExposedResolver } from '../resolvers/population-exposed-type-resolver.service';
import { EnvironmentalResolver } from '../resolvers/environmental-type-resolver.services';
import { EnvironmentalImpactLikelyResolver } from '../resolvers/environmental-impact-likely-type-resolver.service';
import { NonDrinkingWaterSupplyResolver } from '../resolvers/non-drinking-water-supply-type-resolver.service';
import { UtilityImpactResolver } from '../resolvers/utility-impact-type-resolver.service';
import { RainfallAnnualResolver } from '../resolvers/rainfall-annual-type-resolver.service';
import { SoilPermiabilityResolver } from '../resolvers/soil-permiability-type-resolver.service';
import { SurfaceWaterDistanceResolver } from '../resolvers/surface-water-distance-type-resolver.service';
import { LustScoringValuesGetResolver } from '../resolvers/lust-scoring-values-get-resolver.service';
import { ConsultantSearchFilterComponent } from './consultant/consultant-search/consultant-search-filter.component';
import { ConsultantBaseComponent } from './consultant/consultant-base/consultant-base.component';
import { ConsultantEditComponent } from './consultant/consultant-edit/consultant-edit.component';
import { ConsultantResolver } from '../resolvers/consultant-resolver.service';
import { WorkReportedResolver } from '../resolvers/work-reported-resolver.service';
import { InspectionComponent } from './inspection/inspection.component';
import { WorkReportedBysResolver } from '../resolvers/work-reported-bys-resolver.service';
import { WorkTypesResolver } from '../resolvers/work-types-resolver.service';
import { ProjectManagersByHistIdResolver } from '../resolvers/project-managers-by-histid-resolver.service';
import { ProjectManagersByLustidResolver } from '../resolvers/project-managers-by-lustid-resolver.service';
import { PublicNoticeTypesResolver } from '../resolvers/public-notice-types-resolver.service';
import { PublicNoticeResolver } from '../resolvers/public-notice-resolver.service';
import { PcsResolver } from '../resolvers/pcs-resolver.service';
import { PcsPermitResolver } from '../resolvers/pcs-permit-resolver.service';
import { TreatmentFacilitiesResolver } from '../resolvers/treatment-facilities-resolver.service';
import { LandfillFacilitiesResolver } from '../resolvers/landfill-facilities-resolver.service';
import { SoilStatusesResolver } from '../resolvers/soil-statuses-resolver.service';
import { AssessmentReleaseSourceResolver } from '../resolvers/assessment-release-source-type-resolver.service';
import { LustScoringRangeGetResolver } from '../resolvers/lust-scoring-range-get-resolver.service';
import { PcsPcsPermitResolver } from '../resolvers/pcs-pcs-permit-resolver.service';
import { LustSiteControlGetResolver } from '../resolvers/lust-site-control-get-resolver.service';
import { SiteControlTypeResolver } from '../resolvers/site-control-type-resolver.service';
import { LustSiteControlDescriptionEngineeringResolver } from '../resolvers/lust-site-control-engineering-resolver.service';
import { LustSiteControlDescriptionInstitutionalResolver } from '../resolvers/lust-site-control-institutional-resolver.service';
import { SitePhotoResolver } from '../resolvers/site-photo-resolver.service';
import { AuthGuardService } from '../guards/auth-guard.service';
import { LustCrisResolver } from '../resolvers/lust-cris-resolver.service';
import { PmActivesResolver } from '../resolvers/pm-actives-resolver.service';

const routes: Routes = [
  {
    path: '', component: LustSearchComponent,
    children: [
      {
        path: '', component: LustIncidentCreateComponent,
        resolve: {
          siteTypes: SiteTypesResolver,
          confirmationTypes: ConfirmationTypesResolver,
          counties: CountiesResolver,
          cities: CitiesResolver,
          discoveryTypes: DiscoveryTypesResolver,
          releaseCauseTypes: ReleaseCauseTypesResolver,
          sourceTypes: SourceTypesResolver,
          states: StatesResolver,
          zipCodes: ZipCodesResolver,
        },
        canDeactivate: [CanDeactivateGuard],
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
    ]
  },
  {
    path: ':lustid', component: LustIncidentComponent,
    children: [
      {
        path: '', component: LustIncidentEditComponent,
        resolve: {
          siteTypes: SiteTypesResolver,
          siteType2s: SiteType2sResolver,
          fileStatuses: FileStatusesResolver,
          brownfields: BrownfieldsResolver,
          counties: CountiesResolver,
          cities: CitiesResolver,
          zipCodes: ZipCodesResolver,
          lustIncidentGet: LustIncidentGetResolver,
          projectManagerGets: ProjectManagersByLustidResolver,
        },
        canDeactivate: [CanDeactivateGuard],
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'sitealiases', component: SiteAliasesComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'sitealias', component: SiteAliasBaseComponent,
        children:
          [
            {
              path: '', component: SiteAliasEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':sitenamealiasid', component: SiteAliasEditComponent,
              resolve: {
                siteAlias: SiteAliasResolver,
                apGetLogNumber: LogNumberResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
      {
        path: 'contacts', component: ContactsComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'contact', component: ContactBaseComponent,
        children:
          [
            {
              path: '', component: ContactEditComponent,
              resolve: {
                lustCris: LustCrisResolver,
                apGetLogNumber: LogNumberResolver,
                contactTypes: ContactTypesResolver,
                contactType2s: ContactType2sResolver,
                states: StatesResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':affilid', component: ContactEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                contactTypes: ContactTypesResolver,
                contactType2s: ContactType2sResolver,
                states: StatesResolver,
                contactAffilGet: ContactResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
      {
        path: 'assessment', component: AssessmentComponent,
        resolve: {
          discoveryTypes: DiscoveryTypesResolver,
          releaseCauseTypes: ReleaseCauseTypesResolver,
          sourceTypes: SourceTypesResolver,
          confirmationTypes: ConfirmationTypesResolver,
          dwReplacementTypes: DrinkingWaterReplacementResolver,
          dwImpactTypes: DrinkingWaterImpactResover,
          dwImpactLikelyTypes: DrinkingWaterImpactLikelyResolver,
          vaporLevelTypes: VaportLevelResolver,
          populationExposedTypes: PopulationExposedResolver,
          environmentTypes: EnvironmentalResolver,
          environmentImpactLikelyTypes: EnvironmentalImpactLikelyResolver,
          nonDwReplacementTypes: NonDrinkingWaterSupplyResolver,
          utilityImpactTypes: UtilityImpactResolver,
          rainFallAnnualTypes: RainfallAnnualResolver,
          soilPermiabilityTypes: SoilPermiabilityResolver,
          aquiferDepthTypes: AquiferDepthResolver,
          swDistanceTypes: SurfaceWaterDistanceResolver,
          lustAssessmentGet: LustAssessmentGetResolver,
          apGetLogNumber: LogNumberResolver,
          // lustScoringValues: LustScoringValuesGetResolver,
          // lustScoringRangeGet: LustScoringRangeGetResolver,
          assessmentConfirmationTypes: AssessmentConfirmationResolver,
          assessmentDiscoveryTypes: AssessmentDiscoveryResolver,
          assessmentReleaseCauseTypes: AssessmentReleaseCauseResolver,
          assessmentReleaseSourceTypes: AssessmentReleaseSourceResolver,

        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'inspections', component: InspectionComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'projectmanagers', component: ProjectManagersComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'projectmanager', component: ProjectManagerBaseComponent,
        children:
          [
            {
              path: '', component: ProjectManagerEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                pmActives: PmActivesResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':projMgrHistId', component: ProjectManagerEditComponent,
              resolve: {
                projectManagerHistIdGet: ProjectManagersByHistIdResolver,
                apGetLogNumber: LogNumberResolver,
                pmActives: PmActivesResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
      {
        path: 'wrs', component: WorkReportedsComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'wr', component: WorkReportedBaseComponent,
        children:
          [
            {
              path: '', component: WorkReportedEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                workTypes: WorkTypesResolver,
                workReportedBys: WorkReportedBysResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':wrid', component: WorkReportedEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                workTypes: WorkTypesResolver,
                workReportedBys: WorkReportedBysResolver,
                workReported: WorkReportedResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
      {
        path: 'pcss', component: PcssComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'pcs', component: PcsBaseComponent,
        children:
          [
            {
              path: '', component: PcsEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                treatmentFacilities: TreatmentFacilitiesResolver,
                landfillFacilities: LandfillFacilitiesResolver,
                soilStatuses: SoilStatusesResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':pcsid', component: PcsEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                pcsPcsPermit: PcsPcsPermitResolver,
                treatmentFacilities: TreatmentFacilitiesResolver,
                landfillFacilities: LandfillFacilitiesResolver,
                soilStatuses: SoilStatusesResolver
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
      {
        path: 'sitecontrols', component: SiteControlsComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
          siteControlTypes: SiteControlTypeResolver,
          projectManagers: ProjectManagersResolver,
          controlEngineeringTypes: LustSiteControlDescriptionEngineeringResolver,
          controlInstitutionalTypes: LustSiteControlDescriptionInstitutionalResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'sitecontrol', component: SiteControlBaseComponent,
        children:
          [
            {
              path: '', component: SiteControlEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                // lustSiteControlGet: LustSiteControlGetResolver,
                siteControlTypes: SiteControlTypeResolver,
                projectManagers: ProjectManagersResolver,
                controlEngineeringTypes: LustSiteControlDescriptionEngineeringResolver,
                controlInstitutionalTypes: LustSiteControlDescriptionInstitutionalResolver,
                pmActives: PmActivesResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':scid', component: SiteControlEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                lustSiteControlGet: LustSiteControlGetResolver,
                siteControlTypes: SiteControlTypeResolver,
                projectManagers: ProjectManagersResolver,
                controlEngineeringTypes: LustSiteControlDescriptionEngineeringResolver,
                controlInstitutionalTypes: LustSiteControlDescriptionInstitutionalResolver,
                pmActives: PmActivesResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },

      {
        path: 'pns', component: PublicNoticesComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'pn', component: PublicNoticeBaseComponent,
        children:
          [
            {
              path: '', component: PublicNoticeEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
                publicNoticeTypes: PublicNoticeTypesResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':pnid', component: PublicNoticeEditComponent,
              resolve: {
                publicNoticeTypes: PublicNoticeTypesResolver,
                publicNotice: PublicNoticeResolver,
                apGetLogNumber: LogNumberResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
      {
        path: 'sitephotos', component: SitePhotosComponent,
        resolve: {
          apGetLogNumber: LogNumberResolver,
        },
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'sitephoto', component: SitePhotoBaseComponent,
        children:
          [
            {
              path: '', component: SitePhotoEditComponent,
              resolve: {
                apGetLogNumber: LogNumberResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':pictureid', component: SitePhotoEditComponent,
              resolve: {
                sitePhoto: SitePhotoResolver,
                apGetLogNumber: LogNumberResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
      { path: 'inspections', component: InspectionComponent,
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      { path: 'cssearch', component: ConsultantSearchFilterComponent,
        canActivate: [AuthGuardService],
        runGuardsAndResolvers: 'always',
      },
      {
        path: 'consultant', component: ConsultantBaseComponent,
        children:
          [
            {
              path: '', component: ConsultantEditComponent,
              resolve: {
                states: StatesResolver,
                apGetLogNumber: LogNumberResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
            {
              path: ':consultantid', component: ConsultantEditComponent,
              resolve: {
                states: StatesResolver,
                consultant: ConsultantResolver,
                apGetLogNumber: LogNumberResolver,
              },
              canDeactivate: [CanDeactivateGuard],
              canActivate: [AuthGuardService],
              runGuardsAndResolvers: 'always',
            },
          ]
      },
    ]
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LustSearchRoutingModule { }
