import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable} from 'rxjs';
import { OlprrSearchFilter } from '../models/olprr-search-filter';
import { DeqOffice } from '../models/deq-office';
import { IncidentStatus } from '../models/incident-status';
import { OlprrSearchResultStat } from '../models/olprr-search-result-stat';


import { Incident } from '../models/incident';
import { ConfirmationType } from '../models/confirmation-type';
import { County } from '../models/county';
import { DiscoveryType } from '../models/discovery-type';
import { Quadrant } from '../models/quadrant';
import { ReleaseCauseType } from '../models/release-cause-type';
import { SiteType } from '../models/site-type';
import { SourceType } from '../models/source-type';
import { State } from '../models/state';
import { StreetType } from '../models/street-type';
import { IncidentData } from '../models/incident-data';
import { FileStatus } from '../models/file-status';
import { TankStatus } from '../models/tank-status';
import { ProjectManager } from '../models/project-manager';
import { CleanupSiteType } from '../models/cleanup-site-type';
import { City } from '../models/city';
import { ZipCode } from '../models/zipcode';
import { Region } from '../models/region';
import { DateCompare } from '../models/date-compare';
import { LustSearchFilter } from '../models/lust-search-filter';
import { LustSearchResultStat } from '../models/lust-search-result-stat';
import { UstSearchFilter } from '../models/ust-search-filter';
import { UstSearchResultStat } from '../models/ust-search-result-stat';
import { PostalCountyVerification } from '../models/postal-county-verification';
import { LustIncidentInsertResult } from '../models/lust-incident-insert-result';
import { SiteAlias } from '../models/site-alias';
import { SitePhoto } from '../models/site-photo';
import { ContactSearchFilter } from '../models/contact-search-filter';
import { ContactSearchResultStat } from '../models/contact-search-result-stat';
import { PostalCountyLookup } from '../models/postal-county-lookup';
import { LustIncidentGet } from '../models/lust-incident-get';
import { Brownfield } from '../models/brownfield';
import { SiteType2 } from '../models/site-type2';
import { LustIncidentUpdateUpdate } from '../models/lust-incident-update-update';
import { LustIncidentUpdate } from '../models/lust-incident';
import { LustIncidentUpdateResult } from '../models/lust-incident-update-result';
import { ApGetLogNumber } from '../models/apGetLogNumber';
import { ContactAffilGet } from '../models/contact-affil-get';
import { ContactAffilPost } from '../models/contact-affil-post';
import { ContactAffilPostResult } from '../models/contact-affil-post-result';
import { ContactType } from '../models/contact-type';
import { SiteAliasPost } from '../models/site-alias-post';
import { AssessmentConfirmationType } from '../models/assessment-confirmation-type';
import { AssessmentDiscoveryType } from '../models/assessment-discovery-type';
import { AssessmentReleaseCauseType } from '../models/assessment-release-cause-type';
import { AssessmentReleaseSourceType } from '../models/assessment-release-source-type';
import { DrinkingWaterReplacementType } from '../models/drinking-water-replacement-type';
import { DrinkingWaterImpactType } from '../models/drinking-water-impact-type';
import { DrinkingWaterImpactLikelyType } from '../models/drinking-water-impact-likely-type';
import { VaporLevelType } from '../models/vapor-level-type';
import { PopulationExposedType } from '../models/population-exposed-type';
import { EnvironmentalType } from '../models/environmental-type';
import { EnvironmentalImpactLikelyType } from '../models/environmental-impact-likely-type';

import { NonDrinkingWaterSupplyType } from '../models/non-drinking-water-supply-type';
import { UtilityImpactType } from '../models/utility-impact-type';
import { RainfallAnnualType } from '../models/rainfall-annual-type';
import { SoilPermiabilityType } from '../models/soil-permiability-type';
import { AquiferDepthType } from '../models/aquifer-depth-type';
import { SurfaceWaterDistanceType } from '../models/surface-water-distance-type';

import { AssessmentPost } from '../models/assessment-post';
import { AssessmentPostResult } from '../models/assessment-post-result';
import { LustAssessmentGet } from '../models/assessment-get';
import { LustScoringValuesGet } from '../models/lust-scoring-values-get';
import { LustScoringRangeGet } from '../models/lust-scoring-range-get';
import { LustGenericResult } from '../models/lust-generic-result';
import { ConsultantSearchFilter } from '../models/consultant-search-filter';
import { ConsultantSearchResultStat } from '../models/consultant-search-result-stat';
import { Consultant } from '../models/consultant';
import { ConsultantPostResult } from '../models/consultant-post-result';
import { WorkReported } from '../models/work-reported';
import { WorkReportedPost } from '../models/work-reported-post';
import { IdDescLookup } from '../models/id-desc-lookup';
import { SidDescLookup } from '../models/sid-desc-lookup';
import { SearchValue } from '../models/search-value';
import { PublicNotice } from '../models/public-notice';
import { PublicNoticePost } from '../models/public-notice-post';
import { Pcs } from '../models/pcs';
import { PcsPermit } from '../models/pcs-permit';
import { InspectionGet } from '../models/inspection-get';
import { ProjectManagerGet } from '../models/project-manager-get';
import { ProjectManagerHistIdGet } from '../models/project-manager-histid-get';
import { ProjectManagerPost } from '../models/project-manager-post';
import { ProjectManagerPostResult } from '../models/project-manager-post-result';
import { PcsPcsPermit } from '../models/pcs-pcs-permit';
import { HotcSearchResultStat } from '../models/hotc-search-result-stat';
import { HotcSearchFilter } from '../models/hotc-search-filter';
import { SitePhotoPost } from '../models/site-photo-post';
import { HotcContact } from '../models/hotc-contact';
import { LustHotcPost } from '../models/lust-hotc-post';
import { LustHotcGet } from '../models/lust-hotc-get';
import { ServiceProvider } from '../models/service-provider';
import { HotcDecomm } from '../models/hotc-decomm';
import { LustSiteControlGet } from '../models/lust-site-control-get';
import { SiteControlPostResult } from '../models/site-control-post-result';
import { LustSiteControlDescriptionEngineeringType } from '../models/lust-site-control-description-engineering-type';
import { LustSiteControlDescriptionInstitutionalType } from '../models/lust-site-control-description-institutional-type';
import { SiteControlType } from '../models/lust-site-control-type';
import { AppConfig } from '../app.config';
import { LustCris } from '../models/lust-cris';
import { PmActive } from '../models/pm-active';



@Injectable({
  providedIn: 'root'
})
export class LustDataService {


  constructor(private http: HttpClient)  { }

  getOlprrIncidents(olprrSearchFilter: OlprrSearchFilter): Observable<OlprrSearchResultStat[]> {
    const params = new HttpParams({
        fromString: `deqo=${olprrSearchFilter.deqOffice}&stat=${olprrSearchFilter.incidentStatus}`
        + `&st=${olprrSearchFilter.siteTypeCode}&id=${olprrSearchFilter.olprrId}`
        + `&sc=${olprrSearchFilter.sortColumn}&so=${olprrSearchFilter.sortOrder}`
        + `&pn=${olprrSearchFilter.pageNumber}&rpp=${olprrSearchFilter.rowsPerPage}`
    });
    return this.http.get<OlprrSearchResultStat[]>(AppConfig.olprrapi_review_search, { params: params });
  }

  getSiteTypes(): Observable<SiteType[]> {
    return this.http.get<SiteType[]>(AppConfig.olprrapi_sitetype);
  }

  getDeqOffices(): Observable<DeqOffice[]> {
    return this.http.get<DeqOffice[]>(AppConfig.olprrapi_deqoffice);
  }

  getIncidentStatuses(): Observable<IncidentStatus[]> {
    return this.http.get<IncidentStatus[]>(AppConfig.olprrapi_incidentstatus);
  }

  getConfirmationTypes(): Observable<ConfirmationType[]> {
    return this.http.get<ConfirmationType[]>(AppConfig.olprrapi_confirmationtype);
  }

  getCounties(): Observable<County[]> {
    return this.http.get<County[]>(AppConfig.olprrapi_county);
  }
  getDiscoveryTypes(): Observable<DiscoveryType[]> {
    return this.http.get<DiscoveryType[]>(AppConfig.olprrapi_discoverytype);
  }

  getQuadrants(): Observable<Quadrant[]> {
    return this.http.get<Quadrant[]>(AppConfig.olprrapi_quadrant);
  }

  getReleaseCauseTypes(): Observable<ReleaseCauseType[]> {
    return this.http.get<ReleaseCauseType[]>(AppConfig.olprrapi_releasecausetype);
  }

  getSourceTypes(): Observable<SourceType[]> {
    return this.http.get<SourceType[]>(AppConfig.olprrapi_sourcetype);
  }

  getStates(): Observable<State[]> {
    return this.http.get<State[]>(AppConfig.olprrapi_state);
  }

  getStreetTypes(): Observable<StreetType[]> {
    return this.http.get<StreetType[]>(AppConfig.olprrapi_streettype);
  }

  createIncident(incident: Incident): Observable<Incident> {
    return this.http.post<Incident>(AppConfig.olprrapi_incident, incident);
  }

  getIncidentData(olprrId: string): Observable<IncidentData | null> {
    return this.http.get<IncidentData>(AppConfig.olprrapi_review_incidentdatabyid + olprrId);
  }

  getFileStatuses(): Observable<FileStatus[]> {
    return this.http.get<FileStatus[]>(AppConfig.olprrapi_filestatus);
  }

  getTankStatuses(): Observable<TankStatus[]> {
    return this.http.get<TankStatus[]>(AppConfig.olprrapi_tankstatus);
  }

  getProjectManagers(): Observable<ProjectManager[]> {
    return this.http.get<ProjectManager[]>(AppConfig.olprrapi_projectmanager);
  }

  getCleanupSiteTypes(): Observable<CleanupSiteType[]> {
    return this.http.get<CleanupSiteType[]>(AppConfig.olprrapi_cleanupsitetype);
  }

  getCities(): Observable<City[]> {
    return this.http.get<City[]>(AppConfig.olprrapi_city);
  }

  getZipCodes(): Observable<ZipCode[]> {
    return this.http.get<ZipCode[]>(AppConfig.olprrapi_zipcode);
  }

  getRegions(): Observable<Region[]> {
    return this.http.get<Region[]>(AppConfig.olprrapi_region);
  }

  getBrownfields(): Observable<Brownfield[]> {
    return this.http.get<Brownfield[]>(AppConfig.olprrapi_brownfield);
  }

  getSiteType2s(): Observable<SiteType2[]> {
    return this.http.get<SiteType2[]>(AppConfig.olprrapi_sitetype2);
  }

  getContactTypes(): Observable<ContactType[]> {
    return this.http.get<ContactType[]>(AppConfig.olprrapi_contacttype);
  }

  getContactType2s(): Observable<ContactType[]> {
    return this.http.get<ContactType[]>(AppConfig.olprrapi_contacttype2);
  }

  getWorkTypes(): Observable<IdDescLookup[]> {
    return this.http.get<IdDescLookup[]>(AppConfig.olprrapi_worktypes);
  }

  getPublicNoticeTypes(): Observable<IdDescLookup[]> {
    return this.http.get<IdDescLookup[]>(AppConfig.olprrapi_publicnoticetypes);
  }

  getWorkReportedBys(): Observable<SidDescLookup[]> {
    return this.http.get<SidDescLookup[]>(AppConfig.olprrapi_workreportedbys);
  }

  getLandfillFacilities(): Observable<IdDescLookup[]> {
    return this.http.get<IdDescLookup[]>(AppConfig.olprrapi_landfillfacilities);
  }
  getTreatmentFacilities(): Observable<IdDescLookup[]> {
    return this.http.get<IdDescLookup[]>(AppConfig.olprrapi_treatmentfacilities);
  }
  getSoilStatuses(): Observable<IdDescLookup[]> {
    return this.http.get<IdDescLookup[]>(AppConfig.olprrapi_soilstatuses);
  }

  getProjectManagersByLustId(lustId: number): Observable<ProjectManager[]> {
    return this.http.get<ProjectManager[]>(AppConfig.olprrapi_lust_pm + '/' + lustId);
  }

  getDateCompares(): Observable<DateCompare[]> {
    return this.http.get<DateCompare[]>(AppConfig.olprrapi_datecompare);
  }

  getLustSearch(lustSearchFilter: LustSearchFilter): Observable<LustSearchResultStat[]> {
    return this.http.post<LustSearchResultStat[]>(AppConfig.olprrapi_lust_search, lustSearchFilter);
  }

  getUstSearch(ustSearchFilter: UstSearchFilter): Observable<UstSearchResultStat[]> {
    return this.http.post<UstSearchResultStat[]>(AppConfig.olprrapi_ust_search, ustSearchFilter);
  }

  getPostalCountyVerification(reportedCountyCode: number, usPostalCountyCodeFips: string ): Observable<PostalCountyVerification> {
    const params = new HttpParams({
        fromString: `reported=${reportedCountyCode}&usPostal=${usPostalCountyCodeFips}`
    });
    return this.http.get<PostalCountyVerification>(AppConfig.olprrapi_review_postalcounty, { params: params });
  }

  createLustIncident(incident: LustIncidentUpdate): Observable<LustIncidentInsertResult> {
    return this.http.post<LustIncidentInsertResult>(AppConfig.olprrapi_insert_lust, incident);
  }

  getSiteAliases(lustId: number): Observable<SiteAlias[]> {
    return this.http.get<SiteAlias[]>(AppConfig.olprrapi_lust_detail + '/' + lustId + '/sitealiases');  }

  getSiteAlias(siteNameAliasId: number): Observable<SiteAlias> {
    return this.http.get<SiteAlias>(AppConfig.olprrapi_sitealias + '/' +  siteNameAliasId);
  }

  insUpdSiteAlias(siteAliasPost: SiteAliasPost): Observable<LustGenericResult> {
    return this.http.post<LustGenericResult>(AppConfig.olprrapi_sitealias , siteAliasPost);
  }

  delSiteAlias(siteNameAliasId: number): Observable<any|null> {
    return this.http.delete(AppConfig.olprrapi_sitealias + '/' +  siteNameAliasId);
  }
  // todo: fix this path one we can use AppConfig.olprrapi_lust_detail...
  getSitePhotos(lustId: number): Observable<SitePhoto[]> {
    return this.http.get<SitePhoto[]>(AppConfig.olprrapi_lust_detail + '/' + lustId + '/images');  }

  getSitePhoto(pictureId: number): Observable<SitePhoto> {
    return this.http.get<SitePhoto>(AppConfig.olprrapi_sitephoto + '/' +  pictureId);
  }

  insUpdSitePhoto(sitePhotoPost: SitePhotoPost): Observable<SitePhotoPost> {
    return this.http.post<SitePhotoPost>(AppConfig.olprrapi_sitephoto , sitePhotoPost);
  }

  delSitePhoto(pictureId: number): Observable<any|null> {
    return this.http.delete(AppConfig.olprrapi_sitephoto + '/' +  pictureId);
  }

  getContacts(contactSearchFilter: ContactSearchFilter): Observable<ContactSearchResultStat[]> {
    const params = new HttpParams({
        fromString: `fname=${contactSearchFilter.firstName}&lname=${contactSearchFilter.lastName}`
        + `&org=${contactSearchFilter.organization}`
        + `&sc=${contactSearchFilter.sortColumn}&so=${contactSearchFilter.sortOrder}`
        + `&pn=${contactSearchFilter.pageNumber}&rpp=${contactSearchFilter.rowsPerPage}`
    });
    return this.http.get<ContactSearchResultStat[]>(AppConfig.olprrapi_contact, { params: params });
  }

  getPostalCountyLookup(usPostalCountyCodeFips: number ): Observable<PostalCountyLookup> {
    return this.http.get<PostalCountyLookup>(AppConfig.olprrapi_postalcounty_lookup + '/' +  usPostalCountyCodeFips);
  }

  getLustIncident(lustId: string ): Observable<LustIncidentGet> {
    return this.http.get<LustIncidentGet>(AppConfig.olprrapi_lust_incident_get + '/' + lustId);
  }

  updateLustIncident(lustIncidentUpdate: LustIncidentUpdateUpdate): Observable<LustIncidentUpdateResult> {
    return this.http.post<LustIncidentUpdateResult>(AppConfig.olprrapi_lust_incident_update , lustIncidentUpdate);
  }

  getLogNumber(lustId: number): Observable<ApGetLogNumber> {
    return this.http.get<ApGetLogNumber>(AppConfig.olprrapi_lust_detail  + '/' + lustId + '/lognumber');  }

  getLustContact(affilId: number): Observable<ContactAffilGet> {
    return this.http.get<ContactAffilGet>(AppConfig.olprrapi_lust_contact  + '/' + affilId);  }

  getLustContacts(lustId: number): Observable<ContactAffilGet[]> {
    return this.http.get<ContactAffilGet[]>(AppConfig.olprrapi_lust_detail  + '/' + lustId + '/contact');  }

  updateLustContact(contactAffilPost: ContactAffilPost): Observable<ContactAffilPostResult> {
    return this.http.post<ContactAffilPostResult>(
      AppConfig.olprrapi_lust_detail  + '/' + contactAffilPost.lustId + '/contact' , contactAffilPost);
  }

  delLustIncident(lustId: number): Observable<any|null> {
    return this.http.delete(AppConfig.olprrapi_lust_incident_delete + lustId);
  }

  getDrinkingWaterReplacementTypes(): Observable<DrinkingWaterReplacementType[]> {
    return this.http.get<DrinkingWaterReplacementType[]>(AppConfig.olprrapi_drinkingwaterreplacementstype);
  }

  getDrinkingWaterImpactTypes(): Observable<DrinkingWaterImpactType[]> {
    return this.http.get<DrinkingWaterImpactType[]>(AppConfig.olprrapi_drinkingwaterimpacttype);
  }

  getDrinkingWaterImpactLikelyTypes(): Observable<DrinkingWaterImpactLikelyType[]> {
    return this.http.get<DrinkingWaterImpactLikelyType[]>(AppConfig.olprrapi_drinkingwaterimpactlikelytype);
  }

  getVaporLevelTypes(): Observable<VaporLevelType[]> {
    return this.http.get<VaporLevelType[]>(AppConfig.olprrapi_vaporleveltype);
  }

  getPopulationExposedTypes(): Observable<PopulationExposedType[]> {
    return this.http.get<PopulationExposedType[]>(AppConfig.olprrapi_populationexposedtype);
  }

  getEnvironmentalTypes(): Observable<EnvironmentalType[]> {
    return this.http.get<EnvironmentalType[]>(AppConfig.olprrapi_environmentaltype);
  }

  getEnvironmentalImpactLikelyTypes(): Observable<EnvironmentalImpactLikelyType[]> {
    return this.http.get<EnvironmentalImpactLikelyType[]>(AppConfig.olprrapi_environmentalimpacttype);
  }

  getNonDrinkingWaterSupplyTypes(): Observable<NonDrinkingWaterSupplyType[]> {
    return this.http.get<NonDrinkingWaterSupplyType[]>(AppConfig.olprrapi_nondrinkingwatersupplytype);
  }

  getUtilityImpactTypes(): Observable<UtilityImpactType[]> {
    return this.http.get<UtilityImpactType[]>(AppConfig.olprrapi_utilityimpacttype);
  }

  getRainfallAnnualTypes(): Observable<RainfallAnnualType[]> {
    return this.http.get<RainfallAnnualType[]>(AppConfig.olprrapi_rainfallannualtype);
  }

  getSoilPermiabilityTypes(): Observable<SoilPermiabilityType[]> {
    return this.http.get<SoilPermiabilityType[]>(AppConfig.olprrapi_soilpermiabilitytype);
  }

  getAquiferDepthTypes(): Observable<AquiferDepthType[]> {
    return this.http.get<AquiferDepthType[]>(AppConfig.olprrapi_aquiferdepthtype);
  }

  getSurfaceWaterDistanceTypes(): Observable<SurfaceWaterDistanceType[]> {
    return this.http.get<SurfaceWaterDistanceType[]>(AppConfig.olprrapi_surfacewaterdistancetype);
  }

  getLustScoringValues(lustId: Number): Observable<LustScoringValuesGet> {
    return this.http.get<LustScoringValuesGet>(AppConfig.olprrapi_lust_scoringvalues + '/' + lustId + '/scoringvalues');
  }

  getLustScoringRange(lustId: Number): Observable<LustScoringRangeGet> {
    return this.http.get<LustScoringRangeGet>(AppConfig.olprrapi_lust_scoringrange + '/' + lustId + '/scoringrange');
  }


  getLustAssessment(lustId: number): Observable<LustAssessmentGet> {
    console.log('getting Assessment Data');
    return this.http.get<LustAssessmentGet>(AppConfig.olprrapi_lust_assessment  + '/' + lustId + '/assessmentssrv');  }


  insUpdAssessment(assessmentPost: AssessmentPost): Observable<AssessmentPostResult> {
    console.log('Writing Assessment Data');
    return this.http.post<AssessmentPostResult>(
      AppConfig.olprrapi_insert_assessment + '/' + assessmentPost.lustId + '/assessment', assessmentPost);
  }


  getConsultants(consultantSearchFilter: ConsultantSearchFilter): Observable<ConsultantSearchResultStat[]> {
    return this.http.post<ConsultantSearchResultStat[]>(AppConfig.olprrapi_consultants_search, consultantSearchFilter);
  }

  getConsultant(consultantId: number ): Observable<Consultant> {
    return this.http.get<Consultant>(AppConfig.olprrapi_consultants + '/' + consultantId);
  }

  insUpdConsultant(consultant: Consultant): Observable<ConsultantPostResult> {
    return this.http.post<ConsultantPostResult>(AppConfig.olprrapi_consultants , consultant);
  }

  delConsultant(consultantId: number): Observable<ConsultantPostResult> {
    return this.http.delete<ConsultantPostResult>(AppConfig.olprrapi_consultants + '/' + consultantId);
  }

  getWorkReporteds(lustId: number): Observable<WorkReported[]> {
    return this.http.get<WorkReported[]>(AppConfig.olprrapi_lust + lustId + '/workrpts');
  }

  getWorkReported(wrId: number): Observable<WorkReported> {
    return this.http.get<WorkReported>(AppConfig.olprrapi_lust + 'workrpts/' + wrId);
  }

  delWorkReported(wrId: number): Observable<LustGenericResult> {
    return this.http.delete<LustGenericResult>(AppConfig.olprrapi_lust  + 'workrpts/' + wrId);
  }

  insUpdWorkReported(workReportedPost: WorkReportedPost): Observable<LustGenericResult> {
    return this.http.post<LustGenericResult>(AppConfig.olprrapi_lust + 'workrpts', workReportedPost);
  }

  searchWorkReportedBys(text: string): Observable<SearchValue[]> {
    const params = new HttpParams({
      fromString: `search=${text}`
    });
    return this.http.get<SearchValue[]>(AppConfig.olprrapi + 'workreportedbysearch', { params: params } );
  }

  getPublicNotices(lustId: number): Observable<PublicNotice[]> {
    return this.http.get<PublicNotice[]>(AppConfig.olprrapi_lust + lustId + '/publicnotices');
  }

  getPublicNotice(wrId: number): Observable<PublicNotice> {
    return this.http.get<PublicNotice>(AppConfig.olprrapi_lust + 'publicnotices/' + wrId);
  }

  delPublicNotice(pnId: number): Observable<LustGenericResult> {
    return this.http.delete<LustGenericResult>(AppConfig.olprrapi_lust  + 'publicnotices/' + pnId);
  }

  insUpdPublicNotice(publicNoticePost: PublicNoticePost): Observable<LustGenericResult> {
    return this.http.post<LustGenericResult>(AppConfig.olprrapi_lust + 'publicnotices', publicNoticePost);
  }

  getPcss(lustId: number): Observable<Pcs[]> {
    return this.http.get<Pcs[]>(AppConfig.olprrapi_lust + lustId + '/pcss');
  }

  getPcs(pcsId: number): Observable<Pcs> {
    return this.http.get<Pcs>(AppConfig.olprrapi_lust + 'pcss/' + pcsId);
  }

  getPcsPermit(pcsId: number): Observable<PcsPermit> {
    return this.http.get<PcsPermit>(AppConfig.olprrapi_lust + 'pcsspermit/' + pcsId);
  }
  getPcsPcsPermit(pcsId: number): Observable<PcsPcsPermit> {
    return this.http.get<PcsPcsPermit>(AppConfig.olprrapi_lust + 'pcspcspermit/' + pcsId);
  }

  insUpdPcsPcsPermit(pcsPcsPermit: PcsPcsPermit): Observable<LustGenericResult> {
    return this.http.post<LustGenericResult>(AppConfig.olprrapi_lust + 'pcss/pcspcspermit', pcsPcsPermit);
  }

  delPcsPermit(pcsPermitId: number): Observable<LustGenericResult> {
    return this.http.delete<LustGenericResult>(AppConfig.olprrapi_lust  + 'pcss/pcspermit/' + pcsPermitId);
  }

  delPcsPcsPermit(pcsId: number): Observable<LustGenericResult> {
    return this.http.delete<LustGenericResult>(AppConfig.olprrapi_lust  + 'pcss/' + pcsId);
  }

  getLustInspection(lustId: number): Observable<InspectionGet[]> {
    return this.http.get<InspectionGet[]>(AppConfig.olprrapi_inspections  + '/' + lustId + '/inspections');
  }
  getProjectManagerByLustId(lustId: number): Observable<ProjectManagerGet[]> {
    return this.http.get<ProjectManagerGet[]>(AppConfig.olprrapi_project_managers + '/' + lustId + '/pmhs');
  }
  getProjectManagerByPmhsId(pmhsId: number): Observable<ProjectManagerHistIdGet> {
    return this.http.get<ProjectManagerHistIdGet>(AppConfig.olprrapi_project_managers_pmhsid + '/' + pmhsId );
  }
  updateLustProjectManager(projectManagerPost: ProjectManagerPost ): Observable<ProjectManagerPostResult> {
    return this.http.post<ProjectManagerPostResult>(
      AppConfig.olprrapi_project_managers_pmhsid, projectManagerPost);
  }
  delProjectManager(id: number): Observable<any|null> {
    return this.http.delete(AppConfig.olprrapi_project_managers_pmhsid + '/' +  id);
  }
  getHotcSearch(hotcSearchFilter: HotcSearchFilter): Observable<HotcSearchResultStat[]> {
    return this.http.post<HotcSearchResultStat[]>(AppConfig.olprrapi_hotc + 'search', hotcSearchFilter);
  }

  getLustHotcSearchTypes(): Observable<SidDescLookup[]> {
    return this.http.get<SidDescLookup[]>(AppConfig.olprrapi_lusthotcsearchtypes);
  }


  getAssessmentConfirmationTypes(): Observable<AssessmentConfirmationType[]> {
    return this.http.get<AssessmentConfirmationType[]>(AppConfig.olprrapi_assessmentconfirmationtype);
  }

  getAssessmentDiscoveryTypes(): Observable<AssessmentDiscoveryType[]> {
    return this.http.get<AssessmentDiscoveryType[]>(AppConfig.olprrapi_assessmentdiscoverytype);
  }

  getAssessmentReleaseCauseTypes(): Observable<AssessmentReleaseCauseType[]> {
    return this.http.get<AssessmentReleaseCauseType[]>(AppConfig.olprrapi_assessmentreleasecausetype);
  }

  getAssessmentReleaseSourceTypes(): Observable<AssessmentReleaseSourceType[]> {
    return this.http.get<AssessmentReleaseSourceType[]>(AppConfig.olprrapi_assessmentreleasesourcetype);
  }

  updateLustAssessment(assessmentPost: AssessmentPost): Observable<AssessmentPostResult> {
    return this.http.post<AssessmentPostResult>(
      AppConfig.olprrapi_lust_assessment  + '/' + assessmentPost.lustId + '/assessmentssrv' , assessmentPost);
  }

  // updateSiteScore(Assessment: LustSiteScorePost): Observable<LustSiteScorePostResult> {
  //   return this.http.post<LustSiteScorePostResult>(
  //     AppConfig.olprrapi_lust_sitescorepost  + '/' + lustSiteScorePost.lustId + '/sitescore' , lustSiteScorePost);
  // }


  getLustHotcContacts(lustId: number): Observable<HotcContact[]> {
    return this.http.get<HotcContact[]>(AppConfig.olprrapi_hotc + 'lust/' + lustId + '/contacts');
  }

  getLustHotc(lustId: number): Observable<LustHotcGet> {
    return this.http.get<LustHotcGet>(AppConfig.olprrapi_hotc + 'lusthotc/' + lustId );
  }

  getHotcDecommTypes(): Observable<SidDescLookup[]> {
    return this.http.get<SidDescLookup[]>(AppConfig.olprrapi_hotcdecommtypes);
  }

  getHotcFeeDefaults(): Observable<SidDescLookup[]> {
    return this.http.get<SidDescLookup[]>(AppConfig.olprrapi_hotcfeedefaults);
  }

  insUpdLustHotc(lustHotcPost: LustHotcPost): Observable<LustGenericResult> {
    return this.http.post<LustGenericResult>(AppConfig.olprrapi_hotc + 'lusthotc', lustHotcPost);
  }

  getHotServiceProvider(licenseNbr: number): Observable<ServiceProvider> {
    return this.http.get<ServiceProvider>(AppConfig.olprrapi_hotc + 'serviceprovider/' + licenseNbr );
  }

  getHotcDecomm(hotcId: number): Observable<HotcDecomm> {
    return this.http.get<HotcDecomm>(AppConfig.olprrapi_hotc + hotcId );
  }

  insUpdHotcDecomm(hotcDecomm: HotcDecomm): Observable<LustGenericResult> {
    return this.http.post<LustGenericResult>(AppConfig.olprrapi_hotc, hotcDecomm);
  }

  delSiteControl(siteControlId: number): Observable<any|null> {
      return this.http.delete(AppConfig.olprrapi_lust + 'scs/' + siteControlId);
    }

  delLustSiteControl(siteControlId: number): Observable<any|null> {
      return this.http.delete(AppConfig.olprrapi_lust_sitecontrol_delete + '/' +  siteControlId);
    }

  updateLustSiteControl(siteControlPost: LustSiteControlGet): Observable<SiteControlPostResult> {
      return this.http.post<SiteControlPostResult>(
        AppConfig.olprrapi_lust_sitecontrol, siteControlPost);
    }

  getLustSiteControls(lustId: number): Observable<LustSiteControlGet[]> {
    return this.http.get<LustSiteControlGet[]>(AppConfig.olprrapi_lust + lustId + '/scs');
    }

  getLustSiteControlDescriptionEngineering(): Observable<LustSiteControlDescriptionEngineeringType[]> {
      return this.http.get<LustSiteControlDescriptionEngineeringType[]>(AppConfig.olprrapi_sitecontrolengineering);
    }


  getLustSiteControl(siteControlId: number): Observable<LustSiteControlGet> {
    return this.http.get<LustSiteControlGet>(AppConfig.olprrapi_lust_sitecontrol + siteControlId);
    }

  getLustSiteControlDescriptionInstitutional(): Observable<LustSiteControlDescriptionInstitutionalType[]> {
      return this.http.get<LustSiteControlDescriptionInstitutionalType[]>(AppConfig.olprrapi_sitecontrolinstitutional);
    }

  getSiteControlTypes(): Observable<SiteControlType[]> {
      return this.http.get<SiteControlType[]>(AppConfig.olprrapi_sitecontroltype);
    }

  delContact(affilId: number, ntId: string): Observable<LustGenericResult> {
    const params = new HttpParams({
        fromString: `ntId=${ntId}`
    });
    return this.http.delete<LustGenericResult>(AppConfig.olprrapi_contact + '/' + affilId, { params: params });
  }

  getLustCris(lustId: number): Observable<LustCris> {
    return this.http.get<LustCris>(AppConfig.olprrapi_lust + lustId + '/crischeck');
  }

  getPmActives(): Observable<PmActive[]> {
    return this.http.get<PmActive[]>(AppConfig.olprrapi_pmactive);
  }
}
