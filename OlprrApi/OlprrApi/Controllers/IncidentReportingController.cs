using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using OlprrApi.Models.Response;
using OlprrApi.Services;

namespace OlprrApi.Controllers
{
    //[EnableCors("AllowSpecificOrigin")]
    [EnableCors("AllowAllHeaders")]
    [Produces("application/json")]
    //[Route("api/OLPRR")]
    [Route("olprr")]
    public class IncidentReportingController : Controller
    {
        private readonly ILogger<IncidentReportingController> _logger;
        private readonly IIncidentReportingService _olprrService;

        public IncidentReportingController(ILogger<IncidentReportingController> logger, IIncidentReportingService incidentReportingService)
        {
            _logger = logger;
            _olprrService = incidentReportingService;
        }

        /// <summary>
        /// List of confirmation types 
        /// (apGetOLPRRLookupTables {ConfirmationType})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ConfirmationType>))]
        [Route("confirmationtype")]
        [HttpGet]
        public async Task<IActionResult> GetConfirmationTypes() => Ok(await _olprrService.GetConfirmationTypes());

        /// <summary>
        /// List of counties 
        /// (apGetOLPRRLookupTables {County})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<County>))]
        [Route("county")]
        [HttpGet]
        public async Task<IActionResult> GetCounties() => Ok(await _olprrService.GetCounties());

        /// <summary>
        /// List of discovery types
        /// (apGetOLPRRLookupTables {DiscoveryType})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<DiscoveryType>))]
        [Route("discoverytype")]
        [HttpGet]
        public async Task<IActionResult> GetDiscoveryTypes() => Ok(await _olprrService.GetDiscoveryTypes());

        /// <summary>
        /// List of quadrants
        /// (apGetOLPRRLookupTables {Quadrant})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<QuadrantT>))]
        [Route("quadrant")]
        [HttpGet]
        public async Task<IActionResult> GetQuadrants() => Ok(await _olprrService.GetQuadrants());

        /// <summary>
        /// List of Release Cause Types
        /// (apGetOLPRRLookupTables {ReleaseCauseTypes})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ReleaseCauseType>))]
        [Route("releasecausetype")]
        [HttpGet]
        public async Task<IActionResult> GetReleaseCauseTypes() => Ok(await _olprrService.GetReleaseCauseTypes());

        /// <summary>
        /// List of Site Types
        /// (apGetOLPRRLookupTables {SiteType})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<SiteTypeT>))]
        [Route("sitetype")]
        [HttpGet]
        public async Task<IActionResult> GetSiteTypes() => Ok(await _olprrService.GetSiteTypes());

        /// <summary>
        /// List of Source Types
        /// (apGetOLPRRLookupTables {SourceType})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<SourceType>))]
        [Route("sourcetype")]
        [HttpGet]
        public async Task<IActionResult> GetSourceTypes() => Ok(await _olprrService.GetSourceTypes());

        /// <summary>
        /// List of States
        /// (apGetOLPRRLookupTables {State})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<State>))]
        [Route("state")]
        [HttpGet]
        public async Task<IActionResult> GetStates() => Ok(await _olprrService.GetStates());

        /// <summary>
        /// List of States
        /// (apGetOLPRRLookupTables {State})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<State>))]
        [Route("streettype")]
        [HttpGet]
        public async Task<IActionResult> GetStreetTypes() => Ok(await _olprrService.GetStreetTypes());

        /// <summary>
        /// List of DEQ Offices
        /// (apGetOLPRRLookupTables {DeqOffice})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<DeqOfficeT>))]
        [Route("deqoffice")]
        [HttpGet]
        public async Task<IActionResult> GetDeqOffices() => Ok(await _olprrService.GetDeqOffices());

        /// <summary>
        /// List of Incident Statuses
        /// (apGetOLPRRLookupTables {IncidentStatus})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<IncidentStatusT>))]
        [Route("incidentstatus")]
        [HttpGet]
        public async Task<IActionResult> GetIncidentStatuses() => Ok(await _olprrService.GetIncidentStatuses());

        /// <summary>
        /// List of Tank Statuses
        /// (apGetOLPRRLookupTables {TankStatus})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<TankStatus>))]
        [Route("tankstatus")]
        [HttpGet]
        public async Task<IActionResult> GetTankStatuses() => Ok(await _olprrService.GetTankStatuses());

        /// <summary>
        /// List of File Statuses
        /// (apGetOLPRRLookupTables {FileStatus})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<FileStatus>))]
        [Route("filestatus")]
        [HttpGet]
        public async Task<IActionResult> GetFileStatuses() => Ok(await _olprrService.GetFileStatuses());

        /// <summary>
        /// List of ZipCodes
        /// (apGetOLPRRLookupTables {ZipCode})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ZipCode>))]
        [Route("zipcode")]
        [HttpGet]
        public async Task<IActionResult> GetZipCodes() => Ok(await _olprrService.GetZipCodes());

        /// <summary>
        /// List of Date Compares
        /// (apGetOLPRRLookupTables {DateCompare})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<DateCompare>))]
        [Route("datecompare")]
        [HttpGet]
        public async Task<IActionResult> GetDateCompares() => Ok(await _olprrService.GetDateCompares());

        /// <summary>
        /// List of Regions
        /// (apGetOLPRRLookupTables {Region})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<Region>))]
        [Route("region")]
        [HttpGet]
        public async Task<IActionResult> GetRegions() => Ok(await _olprrService.GetRegions());

        /// <summary>
        /// List of Cities
        /// (apGetOLPRRLookupTables {City})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<City>))]
        [Route("city")]
        [HttpGet]
        public async Task<IActionResult> GetCities() => Ok(await _olprrService.GetCities());

        /// <summary>
        /// List of Cleanup Site Types
        /// (apGetOLPRRLookupTables {CleanupSiteType})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<CleanupSiteType>))]
        [Route("cleanupsitetype")]
        [HttpGet]
        public async Task<IActionResult> GetCleanupSiteTypes() => Ok(await _olprrService.GetCleanupSiteTypes());

        /// <summary>
        /// List of ProjectManagers
        /// (apGetOLPRRLookupTables {ProjectManager})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ProjectManager>))]
        [Route("projectmanager")]
        [HttpGet]
        public async Task<IActionResult> GetProjectManagers() => Ok(await _olprrService.GetProjectManagers());

        /// <summary>
        /// List of Site Types 
        /// (apGetLookupTablesByType {SiteType})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<SiteType2>))]
        [Route("sitetype2")]
        [HttpGet]
        public async Task<IActionResult> GetSiteType2s() => Ok(await _olprrService.GetSiteType2s());

        /// <summary>
        /// List of Brownfields 
        /// (apGetLookupTablesByType {Brownfield})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<Brownfield>))]
        [Route("brownfield")]
        [HttpGet]
        public async Task<IActionResult> GetBrownfields() => Ok(await _olprrService.GetBrownfields());

        /// <summary>
        /// List of Contact Types 
        /// (apGetLookupTablesByType {ContactTypes})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ContactType>))]
        [Route("contacttype")]
        [HttpGet]
        public async Task<IActionResult> GetContactTypes() => Ok(await _olprrService.GetContactTypes());

        /// <summary>
        /// List of Contact Types with no Invoice
        /// (apGetLookupTablesByType {ContactTypesNoINV})
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ContactType>))]
        [Route("contacttype2")]
        [HttpGet]
        public async Task<IActionResult> GetContactType2s() => Ok(await _olprrService.GetContactType2s());

        /// <summary>
        /// List of Assessment drop down values
        /// (apGetLookupTablesAssesementTabData)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ContactType>))]
        [Route("assessment/lookups")]
        [HttpGet]
        public async Task<IActionResult> GetAssessmentLookup() => Ok(await _olprrService.GetAssessmentLookUp());

        /// <summary>
        /// List of work reported by values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType2>))]
        [Route("workreportedbys")]
        [HttpGet]
        public async Task<IActionResult> GetWorkReportedBys() => Ok(await _olprrService.GetLookupTablesByType2("WorkReportedBy"));

        /// <summary>
        /// search work reported by 
        /// (ApWorkReportedBySearch)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType2>))]
        [Route("workreportedbysearch")]
        [HttpGet]
        public async Task<IActionResult> SearchWorkReportedBys([FromQuery] string search)
        {
            return Ok(await _olprrService.SearchWorkReportedBys(search));
        }

        /// <summary>
        /// List of work type values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("worktypes")]
        [HttpGet]
        public async Task<IActionResult> GetWorkTypes() => Ok(await _olprrService.GetLookupTablesByType("WorkType"));

        /// <summary>
        /// List of DrinkingWaterReplacement values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("drinkingwaterreplacements")]
        [HttpGet]
        public async Task<IActionResult> GetDrinkingWaterReplacements() => Ok(await _olprrService.GetLookupTablesByType("DrinkingWaterReplacement"));

        /// <summary>
        /// List of DrinkingWaterImpact values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("drinkingwaterimpacts")]
        [HttpGet]
        public async Task<IActionResult> GetDrinkingWaterImpacts() => Ok(await _olprrService.GetLookupTablesByType("DrinkingWaterImpact"));

        /// <summary>
        /// List of DrinkingWaterImpactLikely values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("drinkingwaterimpactlikelys")]
        [HttpGet]
        public async Task<IActionResult> GetDrinkingWaterImpactLikelys() => Ok(await _olprrService.GetLookupTablesByType("DrinkingWaterImpactLikely"));

        /// <summary>
        /// List of VaporLevel values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("vaporlevels")]
        [HttpGet]
        public async Task<IActionResult> GetVaporLevels() => Ok(await _olprrService.GetLookupTablesByType("VaporLevel"));

        /// <summary>
        /// List of PopulationSizeEffected values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("populationsizeeffecteds")]
        [HttpGet]
        public async Task<IActionResult> GetPopulationSizeEffecteds() => Ok(await _olprrService.GetLookupTablesByType("PopulationSizeEffected"));

        /// <summary>
        /// List of EnvironmentType values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("environmenttypes")]
        [HttpGet]
        public async Task<IActionResult> GetEnvironmentTypes() => Ok(await _olprrService.GetLookupTablesByType("EnvironmentType"));


        /// <summary>
        /// List of EnvironmentImpactLikely values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("environmentimpactlikely")]
        [HttpGet]
        public async Task<IActionResult> GetEnvironmentImpactLikelys() => Ok(await _olprrService.GetLookupTablesByType("EnvironmentImpactLikely"));

        /// <summary>
        /// List of NonDrinkingWaterSupply values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("nondrinkingwatersupplies")]
        [HttpGet]
        public async Task<IActionResult> GetNonDrinkingWaterSupplies() => Ok(await _olprrService.GetLookupTablesByType("NonDrinkingWaterSupply"));

        /// <summary>
        /// List of UtilityImpacted values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("utilityimpacteds")]
        [HttpGet]
        public async Task<IActionResult> GetUtilityImpacteds() => Ok(await _olprrService.GetLookupTablesByType("UtilityImpacted"));


        /// <summary>
        /// List of AnnualRainfall values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("annualrainfalls")]
        [HttpGet]
        public async Task<IActionResult> GetAnnualRainfalls() => Ok(await _olprrService.GetLookupTablesByType("AnnualRainfall"));

        /// <summary>
        /// List of SoilPermiability values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("soilpermiabilities")]
        [HttpGet]
        public async Task<IActionResult> GetSoilPermiabilities() => Ok(await _olprrService.GetLookupTablesByType("SoilPermiability"));

        /// <summary>
        /// List of AquiferDepth values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("aquiferdepths")]
        [HttpGet]
        public async Task<IActionResult> GetAquiferDepths() => Ok(await _olprrService.GetLookupTablesByType("AquiferDepth"));

        /// <summary>
        /// List of Surface Water Distance values
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("surfacewaterdistances")]
        [HttpGet]
        public async Task<IActionResult> GetSurfaceWaterDistances() => Ok(await _olprrService.GetLookupTablesByType("SurfaceWaterDistance"));

        /// <summary>
        /// List of Landfill Facilities 
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("landfillfacilities")]
        [HttpGet]
        public async Task<IActionResult> GetLandfillFacilities() => Ok(await _olprrService.GetLookupTablesByType("LandfillFacilities"));

        /// <summary>
        /// List of Treatment Facilities 
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("treatmentfacilities")]
        [HttpGet]
        public async Task<IActionResult> GetTreatmentFacilities() => Ok(await _olprrService.GetLookupTablesByType("TreatmentFacilities"));

        /// <summary>
        /// List of Soil Statuses
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("soilstatuses")]
        [HttpGet]
        public async Task<IActionResult> GetSoilStatuses() => Ok(await _olprrService.GetLookupTablesByType("SoilStatus"));

        /// <summary>
        /// List of Assessment Discoveries
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("assessmentdiscoveries")]
        [HttpGet]
        public async Task<IActionResult> GetAssessmentDiscoveries() => Ok(await _olprrService.GetLookupTablesByType("AssessmentDiscovery"));

        /// <summary>
        /// List of Assessment Confirmations
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("assessmentconfirmations")]
        [HttpGet]
        public async Task<IActionResult> GetAssessmentConfirmations() => Ok(await _olprrService.GetLookupTablesByType("AssessmentConfirmation"));

        /// <summary>
        /// List of Assessment Release Causes
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("assessmentreleasecauses")]
        [HttpGet]
        public async Task<IActionResult> GetAssessmentReleaseCauses() => Ok(await _olprrService.GetLookupTablesByType("AssessmentReleaseCause"));

        /// <summary>
        /// List of Assessment Release Sources
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("assessmentreleasesources")]
        [HttpGet]
        public async Task<IActionResult> GetAssessmentReleaseSources() => Ok(await _olprrService.GetLookupTablesByType("AssessmentReleaseSource:"));

        /// <summary>
        /// List of Public Notices
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("publicnoticetypes")]
        [HttpGet]
        public async Task<IActionResult> GetPublicNotice() => Ok(await _olprrService.GetLookupTablesByType("PublicNotice"));

        /// <summary>
        /// List of description engineering
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("descriptionengineering")]
        [HttpGet]
        public async Task<IActionResult> GetDescriptionEngineering() => Ok(await _olprrService.GetLookupTablesByType("DescriptionEngineering"));

        /// <summary>
        /// List of Description Institutional
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("descriptioninstitutional")]
        [HttpGet]
        public async Task<IActionResult> GetDescriptionInstitutional() => Ok(await _olprrService.GetLookupTablesByType("DescriptionInstitutional"));

        /// <summary>
        /// List of Site Control Type
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType>))]
        [Route("sitecontroltype")]
        [HttpGet]
        public async Task<IActionResult> GetSiteControlType() => Ok(await _olprrService.GetLookupTablesByType("ControlType2"));

        /// <summary>
        /// List of LUST HOTC Searh types
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType2>))]
        [Route("lusthotcsearchtypes")]
        [HttpGet]
        public async Task<IActionResult> GetLustHotcSearchTypes() => Ok(await _olprrService.GetLookupTablesByType2("LustHotcSearchType"));

        /// <summary>
        /// List of HOTC Decomm types
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType2>))]
        [Route("hotcdecommtypes")]
        [HttpGet]
        public async Task<IActionResult> GetHotcDecommTypes() => Ok(await _olprrService.GetLookupTablesByType2("HotcDecommType"));

        /// <summary>
        /// List of HOTC Decomm fee defaults
        /// (ApGetLookupTablesByType)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetLookupTablesByType2>))]
        [Route("hotcfeedefaults")]
        [HttpGet]
        public async Task<IActionResult> GetHotcFeeDefaults() => Ok(await _olprrService.GetLookupTablesByType2("HotcFeeDefault"));

        /// <summary>
        /// List of ActiveProjectManager drop down values
        /// (apGetProjectManagerData)
        /// </summary>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ActiveProjectManager>))]
        [Route("pmactive")]
        [HttpGet]
        public async Task<IActionResult> GetActiveProjectManager() => Ok(await _olprrService.GetActiveProjectManagers());



        /// <summary>
        /// Insert an OLPRR Incident
        /// (apOLPRRInsertIncident)
        /// </summary>
        /// <param name="apOLPRRInsertIncident">OLPRR data to insert</param>
        [ProducesResponseType(201, Type = typeof(int))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("incident")]
        [HttpPost]
        public async Task<IActionResult> PostIncident([FromBody] Models.Request.ApOLPRRInsertIncident apOLPRRInsertIncident)
        {
            var x = await _olprrService.InsertOLPRRIncidentRecord(apOLPRRInsertIncident);
            return Created("olprr/incident", apOLPRRInsertIncident);
        }
    }
}










//namespace TodoApi.Controllers
//{
//    [EnableCors("AllowSpecificOrigin")]
//    //[EnableCors("AllowAllHeaders")]
//    [Produces("application/json")]
//    //[Route("api/OLPRR")]
//    [Route("olprr")]
//    public class IncidentReportingController : Controller
//    {
//        private readonly ILogger<IncidentReportingController> _logger;
//        private readonly IIncidentReportingService _olprrService;

//        public IncidentReportingController(ILogger<IncidentReportingController> logger, IIncidentReportingService incidentReportingService)
//        {
//            _logger = logger;
//            _olprrService = incidentReportingService;
//        }

//        [Route("confirmationtype")]
//        [HttpGet]
//        public async Task<IActionResult> GetConfirmationTypes()
//        {
//            return Ok(await _olprrService.GetConfirmationTypes());
//        }
//        [Route("county")]
//        [HttpGet]
//        public async Task<IActionResult> GetCounties()
//        {
//            return Ok(await _olprrService.GetCounties());
//        }
//        [Route("discoverytype")]
//        [HttpGet]
//        public async Task<IActionResult> GetDiscoveryTypes()
//        {
//            return Ok(await _olprrService.GetDiscoveryTypes());
//        }
//        [Route("quadrant")]
//        [HttpGet]
//        public async Task<IActionResult> GetQuadrants()
//        {
//            return Ok(await _olprrService.GetQuadrants());
//        }
//        [Route("releasecausetype")]
//        [HttpGet]
//        public async Task<IActionResult> GetReleaseCauseTypes()
//        {
//            return Ok(await _olprrService.GetReleaseCauseTypes());
//        }
//        [Route("sitetype")]
//        [HttpGet]
//        public async Task<IActionResult> GetSiteTypes()
//        {
//            return Ok(await _olprrService.GetSiteTypes());
//        }
//        [Route("sourcetype")]
//        [HttpGet]
//        public async Task<IActionResult> GetSourceTypes()
//        {
//            return Ok(await _olprrService.GetSourceTypes());
//        }
//        [Route("state")]
//        [HttpGet]
//        public async Task<IActionResult> GetStates()
//        {
//            return Ok(await _olprrService.GetStates());
//        }
//        [Route("streettype")]
//        [HttpGet]
//        public async Task<IActionResult> GetStreetTypes()
//        {
//            return Ok(await _olprrService.GetStreetTypes());
//        }


//        [Route("incident")]
//        [HttpPost]
//        public async Task<IActionResult> PostIncident([FromBody] Models.Request.ApOlprrInsertIncident apOLPRRInsertIncident)
//        {
//            var x = await _olprrService.InsertOLPRRIncidentRecord(apOLPRRInsertIncident);
//            return Created("olprr/incident", apOLPRRInsertIncident);
//        }

//    }
//}