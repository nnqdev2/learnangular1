import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { IAppConfig } from './models/app-config';
import { environment } from '../environments/environment';


@Injectable()
export class AppConfig {

  static settings: IAppConfig;
  static olprrapi_base: string;
  static olprrapi: string;
  static olprr_review: string;
  static olprr_lust: string;
  static olprrapi_state: string;
  static olprrapi_sitetype: string;
  static olprrapi_confirmationtype: string;
  static olprrapi_county: string;
  static olprrapi_discoverytype: string;
  static olprrapi_quadrant: string;
  static olprrapi_releasecausetype: string;
  static olprrapi_sourcetype: string;
  static olprrapi_streettype: string;
  static olprrapi_deqoffice: string;
  static olprrapi_incidentstatus: string;
  static olprrapi_tankstatus: string;
  static olprrapi_filestatus: string;
  static olprrapi_region: string;
  static olprrapi_city: string;
  static olprrapi_zipcode: string;
  static olprrapi_datecompare: string;
  static olprrapi_contacttype: string;
  static olprrapi_contacttype2: string;
  static olprrapi_cleanupsitetype: string;
  static olprrapi_projectmanager: string;
  static olprrapi_worktypes: string;
  static olprrapi_publicnoticetypes: string;
  static olprrapi_workreportedbys: string;
  static olprrapi_landfillfacilities: string;
  static olprrapi_treatmentfacilities: string;
  static olprrapi_soilstatuses: string;
  static olprrapi_incident: string;
  static olprrapi_lust_search: string;
  static olprrapi_ust_search: string;
  static olprrapi_review_search: string;
  static olprrapi_review_incidentdatabyid: string;
  static address_correction: string;
  static olprrapi_review_postalcounty: string;
  static lit_site_setup: string;
  static ssrs: string;
  static olprrapi_insert_lust: string;
  static olprrapi_sitealias: string;
  static olprrapi_sitephoto: string;
  static olprrapi_contact: string;
  static olprrapi_postalcounty_lookup: string;
  static olprrapi_brownfield: string;
  static olprrapi_assessmentconfirmationtype: string;
  static olprrapi_assessmentdiscoverytype: string;
  static olprrapi_assessmentreleasecausetype: string;
  static olprrapi_assessmentreleasesourcetype: string;
  static olprrapi_drinkingwaterreplacementstype: string;
  static olprrapi_drinkingwaterimpacttype: string;
  static olprrapi_drinkingwaterimpactlikelytype: string;
  static olprrapi_vaporleveltype: string;
  static olprrapi_populationexposedtype: string;
  static olprrapi_environmentaltype: string;
  static olprrapi_environmentalimpacttype: string;
  static olprrapi_nondrinkingwatersupplytype: string;
  static olprrapi_utilityimpacttype: string;
  static olprrapi_rainfallannualtype: string;
  static olprrapi_soilpermiabilitytype: string;
  static olprrapi_aquiferdepthtype: string;
  static olprrapi_surfacewaterdistancetype: string;
  static olprrapi_insert_assessment: string;
  static olprrapi_lust_assessment: string;
  static olprrapi_lust_scoringvalues: string;
  static olprrapi_lust_scoringrange: string;
  static olprrapi_lust_sitescorepost: string;
  static olprrapi_sitetype2: string;
  static olprrapi_lust_sitecontrol: string;
  static olprrapi_lust_sitecontrol_delete: string;
  static olprrapi_sitecontroltype: string;
  static olprrapi_sitecontrolengineering: string;
  static olprrapi_sitecontrolinstitutional: string;
  static olprrapi_lust_incident_get: string;
  static olprrapi_lust_pm: string;
  static olprrapi_lust_incident_update: string;
  static olprrapi_lust_detail: string;
  static olprrapi_lust_contact: string;
  static olprrapi_lust_incident_delete: string;
  static olprrapi_consultants: string;
  static olprrapi_consultants_search: string;
  static olprrapi_lust: string;
  static olprrapi_inspections: string;
  static olprrapi_project_managers: string;
  static olprrapi_project_managers_pmhsid: string;
  static olprrapi_hotc: string;
  static olprrapi_lusthotcsearchtypes: string;
  static olprrapi_hotcdecommtypes: string;
  static olprrapi_hotcfeedefaults: string;
  static olprrapi_pmactive: string;
  static contractor_uid = 'CORIN';
  static contractor_pwd = 'SALNAVE';
  static cacheExpiryInMs: string;
  static authority: string;
  static urlSub: string;

  constructor(private http: HttpClient) {}

  public load() {
    const jsonFile = `assets/config/config.${environment.name}.json`;
    return new Promise<void>((resolve, reject) => {
        this.http.get(jsonFile).toPromise().then((response: IAppConfig) => {
        AppConfig.settings = <IAppConfig>response;
        AppConfig.cacheExpiryInMs =  AppConfig.settings.caching.cacheExpiryInMs;
        AppConfig.urlSub = AppConfig.settings.env.urlSub;
        AppConfig.authority =  AppConfig.settings.sts.authority;
        AppConfig.olprrapi_base =  AppConfig.settings.apiServer.hol;
        AppConfig.olprrapi = AppConfig.settings.apiServer.hol + 'olprr/';
        AppConfig.olprr_review = AppConfig.settings.apiServer.hol + 'review/';
        AppConfig.olprr_lust = AppConfig.settings.apiServer.hol + 'lust/';
        AppConfig.olprrapi_state = AppConfig.olprrapi + 'state';
        AppConfig.olprrapi_sitetype = AppConfig.olprrapi + 'sitetype';
        AppConfig.olprrapi_confirmationtype = AppConfig.olprrapi + 'confirmationtype';
        AppConfig.olprrapi_county = AppConfig.olprrapi + 'county';
        AppConfig.olprrapi_discoverytype = AppConfig.olprrapi + 'discoverytype';
        AppConfig.olprrapi_quadrant = AppConfig.olprrapi + 'quadrant';
        AppConfig.olprrapi_releasecausetype = AppConfig.olprrapi + 'releasecausetype';
        AppConfig.olprrapi_sourcetype = AppConfig.olprrapi + 'sourcetype';
        AppConfig.olprrapi_streettype = AppConfig.olprrapi + 'streettype';
        AppConfig.olprrapi_deqoffice = AppConfig.olprrapi + 'deqoffice';
        AppConfig.olprrapi_incidentstatus = AppConfig.olprrapi + 'incidentstatus';
        AppConfig.olprrapi_tankstatus = AppConfig.olprrapi + 'tankstatus';
        AppConfig.olprrapi_filestatus = AppConfig.olprrapi + 'filestatus';
        AppConfig.olprrapi_region = AppConfig.olprrapi + 'region';
        AppConfig.olprrapi_city = AppConfig.olprrapi + 'city';
        AppConfig.olprrapi_zipcode = AppConfig.olprrapi + 'zipcode';
        AppConfig.olprrapi_datecompare = AppConfig.olprrapi + 'datecompare';
        AppConfig.olprrapi_contacttype = AppConfig.olprrapi + 'contacttype';
        AppConfig.olprrapi_contacttype2 = AppConfig.olprrapi + 'contacttype2';
        AppConfig.olprrapi_cleanupsitetype = AppConfig.olprrapi + 'cleanupsitetype';
        AppConfig.olprrapi_projectmanager = AppConfig.olprrapi + 'projectmanager';
        AppConfig.olprrapi_worktypes = AppConfig.olprrapi + 'worktypes';
        AppConfig.olprrapi_publicnoticetypes = AppConfig.olprrapi + 'publicnoticetypes';
        AppConfig.olprrapi_workreportedbys = AppConfig.olprrapi + 'workreportedbys';
        AppConfig.olprrapi_landfillfacilities = AppConfig.olprrapi + 'landfillfacilities';
        AppConfig.olprrapi_treatmentfacilities = AppConfig.olprrapi + 'treatmentfacilities';
        AppConfig.olprrapi_soilstatuses = AppConfig.olprrapi + '/soilstatuses';
        AppConfig.olprrapi_incident = AppConfig.olprrapi + 'incident';
        AppConfig.olprrapi_lust_search = AppConfig.olprr_review + 'lustsite';
        AppConfig.olprrapi_ust_search = AppConfig.olprr_review + 'ustsite';
        AppConfig.olprrapi_review_search = AppConfig.olprr_review;
        AppConfig.olprrapi_review_incidentdatabyid = AppConfig.olprr_review + 'incidentdatabyid/';
        AppConfig.address_correction = AppConfig.settings.apiServer.addressContactVerify;
        AppConfig.olprrapi_review_postalcounty = AppConfig.olprr_review + 'postalcounty';
        AppConfig.lit_site_setup = AppConfig.settings.apiServer.lit;
        AppConfig.ssrs = AppConfig.settings.apiServer.ssrs;
        AppConfig.olprrapi_insert_lust = AppConfig.olprr_review + 'lustincident';
        AppConfig.olprrapi_sitealias = AppConfig.olprr_lust + 'sitealias';
        AppConfig.olprrapi_sitephoto = AppConfig.olprr_lust + 'images';
        AppConfig.olprrapi_contact = AppConfig.olprr_lust + 'contact';
        AppConfig.olprrapi_postalcounty_lookup = AppConfig.olprr_lust + 'postalcounty';
        AppConfig.olprrapi_brownfield = AppConfig.olprrapi + 'brownfield';
        AppConfig.olprrapi_assessmentconfirmationtype = AppConfig.olprrapi + 'assessmentconfirmations';
        AppConfig.olprrapi_assessmentdiscoverytype = AppConfig.olprrapi + 'assessmentdiscoveries';
        AppConfig.olprrapi_assessmentreleasecausetype = AppConfig.olprrapi + 'assessmentreleasecauses';
        AppConfig.olprrapi_assessmentreleasesourcetype = AppConfig.olprrapi + 'assessmentreleasesources';
        AppConfig.olprrapi_drinkingwaterreplacementstype = AppConfig.olprrapi + 'drinkingwaterreplacements';
        AppConfig.olprrapi_drinkingwaterimpacttype = AppConfig.olprrapi + 'drinkingwaterimpacts';
        AppConfig.olprrapi_drinkingwaterimpactlikelytype = AppConfig.olprrapi + 'drinkingwaterimpactlikelys';
        AppConfig.olprrapi_vaporleveltype = AppConfig.olprrapi + 'vaporlevels';
        AppConfig.olprrapi_populationexposedtype = AppConfig.olprrapi + 'populationsizeeffecteds';
        AppConfig.olprrapi_environmentaltype = AppConfig.olprrapi + 'environmenttypes';
        AppConfig.olprrapi_environmentalimpacttype = AppConfig.olprrapi + 'environmentimpactlikely';
        AppConfig.olprrapi_nondrinkingwatersupplytype = AppConfig.olprrapi + 'nondrinkingwatersupplies';
        AppConfig.olprrapi_utilityimpacttype = AppConfig.olprrapi + 'utilityimpacteds';
        AppConfig.olprrapi_rainfallannualtype = AppConfig.olprrapi + 'annualrainfalls';
        AppConfig.olprrapi_soilpermiabilitytype = AppConfig.olprrapi + 'soilpermiabilities';
        AppConfig.olprrapi_aquiferdepthtype = AppConfig.olprrapi + 'aquiferdepths';
        AppConfig.olprrapi_surfacewaterdistancetype = AppConfig.olprrapi + 'surfacewaterdistances';
        AppConfig.olprrapi_insert_assessment = AppConfig.olprr_lust + 'assessment';
        AppConfig.olprrapi_lust_assessment = AppConfig.olprr_lust;
        AppConfig.olprrapi_lust_scoringvalues = AppConfig.olprr_lust;
        AppConfig.olprrapi_lust_scoringrange =  AppConfig.olprr_lust;
        AppConfig.olprrapi_lust_sitescorepost = AppConfig.olprr_lust;
        AppConfig.olprrapi_sitetype2 = AppConfig.olprrapi + 'sitetype2';
        AppConfig.olprrapi_pmactive = AppConfig.olprrapi + 'pmactive';
        AppConfig.olprrapi_lust_sitecontrol = AppConfig.olprr_lust + 'scs/';
        AppConfig.olprrapi_lust_sitecontrol_delete = AppConfig.olprr_lust + 'scs/';
        AppConfig.olprrapi_sitecontroltype = AppConfig.olprrapi + 'sitecontroltype';
        AppConfig.olprrapi_sitecontrolengineering = AppConfig.olprrapi + 'descriptionengineering';
        AppConfig.olprrapi_sitecontrolinstitutional = AppConfig.olprrapi + 'descriptioninstitutional';
        AppConfig.olprrapi_lust_incident_get = AppConfig.olprr_lust + 'incident';
        AppConfig.olprrapi_lust_pm = AppConfig.olprr_lust + 'pm';
        AppConfig.olprrapi_lust_incident_update = AppConfig.olprr_lust + 'incident';
        AppConfig.olprrapi_lust_detail = AppConfig.olprr_lust + 'lustid';
        AppConfig.olprrapi_lust_contact = AppConfig.olprr_lust + 'contact';
        AppConfig.olprrapi_lust_incident_delete = AppConfig.olprr_lust + 'lustid/';
        AppConfig.olprrapi_consultants = AppConfig.settings.apiServer.hol + 'consultants';
        AppConfig.olprrapi_consultants_search = AppConfig.olprrapi_base + 'consultants/search';
        AppConfig.olprrapi_lust = AppConfig.olprr_lust + '';
        AppConfig.olprrapi_inspections = AppConfig.olprrapi_base + 'lust';
        AppConfig.olprrapi_project_managers = AppConfig.olprrapi_base + 'lust';
        AppConfig.olprrapi_project_managers_pmhsid = AppConfig.olprr_lust + 'pmhs';
        AppConfig.olprrapi_hotc = AppConfig.olprrapi_base + 'hotc/';
        AppConfig.olprrapi_lusthotcsearchtypes = AppConfig.olprrapi + 'lusthotcsearchtypes';
        AppConfig.olprrapi_hotcdecommtypes = AppConfig.olprrapi + 'hotcdecommtypes';
        AppConfig.olprrapi_hotcfeedefaults = AppConfig.olprrapi + 'hotcfeedefaults';
        resolve();
      }).catch((response: any) => {
        reject(`Could not load file '${jsonFile}': ${JSON.stringify(response)}`);
      });
    });
  }
}
