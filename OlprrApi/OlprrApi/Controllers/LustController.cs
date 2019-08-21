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
    //[Route("api/lust")]
    [Route("lust")]
    public class LustController : Controller
    {
        private readonly ILogger<LustController> _logger;
        private readonly ILustService _lustService;
        public LustController(ILogger<LustController> logger, ILustService lustService)
        {
            _logger = logger;
            _lustService = lustService;
        }

        /// <summary>
        /// List of all site aliases for a lust id
        /// (ApGetSiteAliasByLustIdData)
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetSiteAliasByLustId2>))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("lustid/{lustId}/sitealiases")]
        [HttpGet]
        public async Task<IActionResult> GetSiteAliases(int lustId)
        {
            return Ok(await _lustService.GetSiteAliases(lustId));
        }

        /// <summary>
        /// Site Alias by site alias id
        /// (ApGetSiteAliasBySiteNameAliasIdData)
        /// </summary>
        /// <param name="siteNameAliasId">LUST incident site alias id</param>
        [ProducesResponseType(200, Type = typeof(ApGetSiteAliasByLustId2))]
        [Route("sitealias/{siteNameAliasId}")]
        [HttpGet]
        public async Task<IActionResult> GetSiteAlias(int siteNameAliasId)
        {
            return Ok(await _lustService.GetSiteAlias(siteNameAliasId));
        }

        /// <summary>
        /// Insert/Update site alias data for a lust incident
        /// (ApInsUpdSiteAliasData)
        /// </summary>
        /// <param name="apInsUpdSiteAlias">Site alias data to insert or update</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        //[ProducesResponseType(204, Type = typeof(void))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("sitealias")]
        [HttpPost]
        public async Task<IActionResult> InsUpdSiteAlias([FromBody] Models.Request.ApInsUpdSiteAlias apInsUpdSiteAlias)
        {
            //var siteAliasId = await _lustService.InsUpdSiteAlias(apInsUpdSiteAlias);
            //if (apInsUpdSiteAlias.SiteNameAliasIdIn == 0)
            //{
            //    apInsUpdSiteAlias.SiteNameAliasIdIn = siteAliasId;
            //    return CreatedAtAction("InsUpdSiteAlias", new { sitenamealiasid = siteAliasId }, apInsUpdSiteAlias);
            //}
            //return NoContent();
            return Ok(await _lustService.InsUpdSiteAlias(apInsUpdSiteAlias));
        }

        /// <summary>
        /// Delete site alias data for a lust incident
        /// (ApDltSiteNameAlias)
        /// </summary>
        /// <param name="siteNameAliasId">site alias id</param>
        [ProducesResponseType(204, Type = typeof(void))]
        [Route("sitealias/{siteNameAliasId}")]
        [HttpDelete]
        public async Task<IActionResult> DeleteSiteAlias(int siteNameAliasId)
        {
            await _lustService.ApDltSiteNameAlias(siteNameAliasId);
            return NoContent();
        }

        /// <summary>
        /// List of all contacts 
        /// (ApGetPartyByFirstLastOrgNameData)
        /// </summary>
        /// <param name="fname">First name</param>
        /// <param name="lname">Last name</param>
        /// <param name="org">Organization</param>
        /// <param name="sc">Sort column</param>
        /// <param name="so">Sort order</param>
        /// <param name="pn">Page number</param>
        /// <param name="rpp">Rows per page</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ContactsStats>))]
        [Route("contact")]
        [HttpGet]
        public async Task<IActionResult> GetContacts([FromQuery] string fname, [FromQuery] string lname, [FromQuery] string org, [FromQuery] int sc, [FromQuery] int so, [FromQuery] int pn, [FromQuery] int rpp)
        {
            return Ok(await _lustService.GetContacts(fname, lname, org, sc, so, pn, rpp));
        }

        /// <summary>
        /// GetCountyIdAndNameFromZP4Fips 
        /// (ApGetCountyIdAndNameFromZP4Fips) 
        /// </summary>
        /// <param name="county">County code</param>
        [ProducesResponseType(200, Type = typeof(ApGetCountyIdAndNameFromZP4Fips))]
        [Route("postalcounty/{county}")]
        [HttpGet]
        public async Task<IActionResult> GetCountyIdAndNameFromZP4Fips(int county)
        {
            return Ok(await _lustService.GetCountyIdAndNameFromZP4Fips(county));
        }

        /// <summary>
        /// Get LUST incident 
        /// (ApGetIncidentByIdData) 
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(LustIncident))]
        [Route("incident/{lustId}")]
        [HttpGet]
        public async Task<IActionResult> GetIncidentByIdData(int lustId)
        {
            return Ok(await _lustService.GetIncidentByIdData(lustId));
        }

        /// <summary>
        /// Get list of current project managers
        /// (ApGetCurrentProjMgr)
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ProjectManager>))]
        [Route("pm/{lustId}")]
        [HttpGet]
        public async Task<IActionResult> GetCurrentProjMgr(int lustId)
        {
            return Ok(await _lustService.GetCurrentProjMgr(lustId));
        }

        /// <summary>
        /// Update LUST incident
        /// (ApUpdIncidentData)
        /// </summary>
        /// <param name="apInsUpdIncidentData">LUST incident data</param>
        [ProducesResponseType(200, Type = typeof(ApInsUpdIncidentDataResult))]
        [Route("incident")]
        [HttpPost]
        public async Task<IActionResult> UpdIncidentData([FromBody] Models.Request.ApInsUpdIncidentData apInsUpdIncidentData)
        {
            return Ok(await _lustService.InsUpdLustIncident(apInsUpdIncidentData));
        }

        /// <summary>
        /// Update LUST incident
        /// (ApGetLogNumber)  
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(ApGetLogNumber))]
        [Route("lustid/{lustId}/lognumber")]
        [HttpGet]
        public async Task<IActionResult> GetLogNumber(int lustId)
        {
            return Ok(await _lustService.GetLogNumber(lustId));
        }

        /// <summary>
        /// Get a contact id for lust incident
        /// (ApGetAffilByIdData) 
        /// </summary>
        /// <param name="affilId">LUST incident affiliate id</param>
        [ProducesResponseType(200, Type = typeof(ApGetAffilById))]
        [Route("contact/{affilId}")]
        [HttpGet]
        public async Task<IActionResult> GetAffilById(int affilId)
        {
            return Ok(await _lustService.GetAffilById(affilId));
        }

        [Route("contact/{affilId}")]
        [HttpDelete]
        public async Task<IActionResult> DeleteLustContactByAffilId(int affilId, [FromQuery] string ntId)
        {
           return Ok( await _lustService.ApDltLustContactByAffilId(affilId, ntId));
        }

        /// <summary>
        /// Get all contacts for lust incident
        /// (ApGetPartyGridByLustIdData) 
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetAffilById>))]
        [Route("lustid/{lustId}/contact")]
        [HttpGet]
        public async Task<IActionResult> GetPartyGridByLustIdData(int lustId)
        {
            return Ok(await _lustService.GetPartyGridByLustIdData(lustId));
        }

        /// <summary>
        /// Insert/Update Contact for a LUST incident
        /// (ApInsUpdLustAffilPartyData) 
        /// </summary>
        /// <param name="apInsUpdLustAffilPartyData">Contact data for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApInsUpdLustAffilPartyDataResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("lustid/{lustId}/contact")]
        [HttpPost]
        public async Task<IActionResult> InsUpdLustAffilPartyData([FromBody] Models.Request.ApInsUpdLustAffilPartyData apInsUpdLustAffilPartyData)
        {
            return Ok(await _lustService.InsUpdLustAffilPartyData(apInsUpdLustAffilPartyData));
        }

        /// <summary>
        /// Delete a lust incident
        /// (ApDltIncidentByLustId)
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(204, Type = typeof(void))]
        [Route("lustid/{lustId}")]
        [HttpDelete]
        public async Task<IActionResult> DeleteLustIncident(int lustId)
        {
            await _lustService.ApDltIncidentByLustId(lustId);
            return NoContent();
        }

        /// <summary>
        /// Get Assessment Site Score Values for lust incident
        /// (ApGetAssessmentSiteScoreValuesByLustId) 
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(ApGetAssessmentSiteScoreValuesByLustId))]
        [Route("{lustId}/assessment")]
        [HttpGet]
        public async Task<IActionResult> GetAssessmentSiteScoreValuesByLustId(int lustId)
        {
            return Ok(await _lustService.GetAssessmentSiteScoreValuesByLustId(lustId));
        }
        /// <summary>
        /// Get Assessment Site Score and Range Values for lust incident
        /// (ApGetAssessmentSiteScoreValuesRangesByLustId) (ApGetAssessmentAllByLustId)
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(ApGetAssessmentSiteScoreValuesRangesByLustId))]
        [Route("{lustId}/assessmentssrv")]
        [HttpGet]
        public async Task<IActionResult> GetAssessmentSiteScoreValuesRangesByLustId(int lustId)
        {
            return Ok(await _lustService.GetAssessmentSiteScoreValuesRangesByLustId(lustId));
        }
        /// <summary>
        /// Insert/Update Assessment for a LUST incident
        /// (ApInsUpdAssessmentData) 
        /// </summary>
        /// <param name="apInsUpdAssessmentData">Assessment data for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApInsUpdAssessmentResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("{lustId}/assessment")]
        [HttpPost]
        public async Task<IActionResult> InsUpdAssessmentData([FromBody] Models.Request.ApInsUpdAssessmentData apInsUpdAssessmentData)
        {
            return Ok(await _lustService.InsUpdAssessmentData(apInsUpdAssessmentData));
        }
        /// <summary>
        /// Insert/Update all Assessment data for a LUST incident
        /// (ApInsUpdAssessmentSiteScoreRangeData) 
        /// </summary>
        /// <param name="apInsUpdAssessmentSiteScoreRangeData">All Assessment data for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApInsUpdAssessmentSiteScoreRangeResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("{lustId}/assessmentssrv")]
        [HttpPost]
        public async Task<IActionResult> InsUpdAssessmentSiteScoreRangeData([FromBody] Models.Request.ApInsUpdAssessmentSiteScoreRangeData apInsUpdAssessmentSiteScoreRangeData)
        {
            return Ok(await _lustService.InsUpdAssessmentSiteScoreRangeData(apInsUpdAssessmentSiteScoreRangeData));
        }
        /// <summary>
        /// Get scoring values for lust incident
        /// (ApGetScoringValuesByLustIdData) 
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(ApGetScoringValuesByLustIdData))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("{lustId}/scoringvalues")]
        [HttpGet]
        public async Task<IActionResult> GetScoringValues(int lustId)
        {
            return Ok(await _lustService.GetScoringValuesByLustIdData(lustId));
        }

        /// <summary>
        /// Get scoring range for lust incident
        /// (ApGetScoringRangeData) 
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(ApGetScoringRangeData))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("{lustId}/scoringrange")]
        [HttpGet]
        public async Task<IActionResult> GetScoringRangeData(int lustId)
        {
            return Ok(await _lustService.GetScoringRangeData(lustId));
        }
        /// <summary>
        /// Get site score for a LUST incident
        /// (ApUpdateSiteScore) 
        /// </summary>
        /// <param name="lustId">LUST incident id</param>
        [ProducesResponseType(200, Type = typeof(ApUpdateSiteScoreResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("{lustId}/sitescore")]
        [HttpGet]
        public async Task<IActionResult> GetSiteScore(int lustId)
        {
            return Ok(await _lustService.ApUpdateSiteScore(lustId));
        }

        /// <summary>
        /// Get image by image id
        /// (ApGetImageByIdData) 
        /// </summary>
        /// <param name="pictureId">picture id</param>
        [ProducesResponseType(200, Type = typeof(ApGetImageByIdData))]
        [Route("images/{pictureId}")]
        [HttpGet]
        public async Task<IActionResult> GetImage(int pictureId)
        {
            return Ok(await _lustService.GetImageByIdData(pictureId));
        }
        /// <summary>
        /// Get all image metadata for Lust id
        /// (ApGetImageByLustIdData) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetImageByLustIdData>))]
        [Route("lustid/{lustId}/images")]
        [HttpGet]
        public async Task<IActionResult> GetImageByLustIdData(int lustId)
        {
            return Ok(await _lustService.GetImageByLustIdData(lustId));
        }
        /// <summary>
        /// Delete a photo
        /// (ApDltPictureData) 
        /// </summary>
        /// <param name="pictureId">picture id</param>
        [ProducesResponseType(200, Type = typeof(ApImageResult))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("images/{pictureId}")]
        [HttpDelete]
        public async Task<IActionResult> DltPictureData(int pictureId)
        {
            return Ok(await _lustService.DltPictureData(pictureId));
        }


        /// <summary>
        /// Insert/Update an image for a LUST incident
        /// (ApInsUpdPictureData) 
        /// </summary>
        /// <param name="apInsUpdPictureData">photo data for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApImageResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("images")]
        [HttpPost]
        public async Task<IActionResult> InsUpdPictureData([FromBody] Models.Request.ApInsUpdPictureData apInsUpdPictureData)
        {
            return Ok(await _lustService.InsUpdPictureData(apInsUpdPictureData));
        }

                          
        /// <summary>
        /// Get work reported by work report id
        /// (ApGetWorkReportedByWrIdData) 
        /// </summary>
        /// <param name="wrId">work reported id</param>
        [ProducesResponseType(200, Type = typeof(ApGetWorkReportedByLustIdData))]
        [Route("workrpts/{wrId}")]
        [HttpGet]
        public async Task<IActionResult> GetWorkReported(int wrId)
        {
            return Ok(await _lustService.GetWorkReportedByWrIdData(wrId));
        }
        /// <summary>
        /// Get work reporteds by lust id
        /// (ApGetWorkReportedByLustIdData) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetWorkReportedByLustIdData>))]
        [Route("{lustId}/workrpts")]
        [HttpGet]
        public async Task<IActionResult> GetWorkReporteds(int lustId)
        {
            return Ok(await _lustService.GetWorkReportedByLustIdData(lustId));
        }
        /// <summary>
        /// Delete a work reported for a lust id
        /// (ApDltWorkReportedData) 
        /// </summary>
        /// <param name="wrId">work report id</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("workrpts/{wrId}")]
        [HttpDelete]
        public async Task<IActionResult> DltWorkReportedData(int wrId)
        {
            return Ok(await _lustService.DltWorkReportedData(wrId));
        }


        /// <summary>
        /// Insert/Update a work reported for a LUST incident
        /// (ApInsUpdWorkReportedData) 
        /// </summary>
        /// <param name="apInsUpdWorkReportedData">work reported for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("workrpts")]
        [HttpPost]
        public async Task<IActionResult> InsUpdWorkReportedData([FromBody] Models.Request.ApInsUpdWorkReportedData apInsUpdWorkReportedData)
        {
            return Ok(await _lustService.InsUpdWorkReportedData(apInsUpdWorkReportedData));
        }


        /// <summary>
        /// Get public notice by public notice id
        /// (ApGetPublicNoticeByPnIdData) 
        /// </summary>
        /// <param name="pnId">public notice id</param>
        [ProducesResponseType(200, Type = typeof(PublicNotice))]
        [Route("publicnotices/{pnId}")]
        [HttpGet]
        public async Task<IActionResult> GetPublictNotice(int pnId)
        {
            return Ok(await _lustService.GetPulicNoticeByPnIdData(pnId));
        }
        /// <summary>
        /// Get public notices by lust id
        /// (ApGetPublicNoticeByLustIdData) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<PublicNotice>))]
        [Route("{lustId}/publicnotices")]
        [HttpGet]
        public async Task<IActionResult> GetPublicNotices(int lustId)
        {
            return Ok(await _lustService.GetPublicNoticeByLustIdData(lustId));
        }
        /// <summary>
        /// Delete a public notice by public notice id
        /// (ApDltPublicNoticeData) 
        /// </summary>
        /// <param name="pnId">public notice id</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("publicnotices/{pnId}")]
        [HttpDelete]
        public async Task<IActionResult> DltPublicNoticeData(int pnId)
        {
            return Ok(await _lustService.DltPublicNoticeData(pnId));
        }


        /// <summary>
        /// Insert/Update a public notice for a LUST incident
        /// (ApInsUpdPublicNoticeData) 
        /// </summary>
        /// <param name="apInsUpdPublicNoticeData">public notice for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("publicnotices")]
        [HttpPost]
        public async Task<IActionResult> InsUpdPublicNoticeData([FromBody] Models.Request.ApInsUpdPublicNoticeData apInsUpdPublicNoticeData)
        {
            return Ok(await _lustService.InsUpdPublicNoticeData(apInsUpdPublicNoticeData));
        }


        /// <summary>
        /// Get a lust project manager history for a project manager history id
        /// (ApGetProjMgrHistoryByPMHIDData) 
        /// </summary>
        /// <param name="pmhId">project manager history id</param>
        [ProducesResponseType(200, Type = typeof(ProjectManagerHistory))]
        [Route("pmhs/{pmhId}")]
        [HttpGet]
        public async Task<IActionResult> GetProjectManagerHistory(int pmhId)
        {
            return Ok(await _lustService.GetProjMgrHistoryByPmhIdData(pmhId));
        }
        /// <summary>
        ///  Get all lust project manager history for a lust id
        /// (ApGetProjMgrHistoryByLustIdData) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ProjectManagerHistory>))]
        [Route("{lustId}/pmhs")]
        [HttpGet]
        public async Task<IActionResult> GetProjectManagerHistories(int lustId)
        {
            return Ok(await _lustService.GetProjMgrHistoryByLustIdData(lustId));
        }


        /// <summary>
        /// Delete a project manager history by project manager history id
        /// (ApDltProjMgrHistoryData) 
        /// </summary>
        /// <param name="pmhId">pproject manager history id</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("pmhs/{pmhId}")]
        [HttpDelete]
        public async Task<IActionResult> DltProjMgrHistoryData(int pmhId)
        {
            return Ok(await _lustService.DltProjMgrHistoryData(pmhId));
        }


        /// <summary>
        /// Insert/Update project manager history rec for a LUST incident
        /// (ApInsUpdProjMgrHistoryData) 
        /// </summary>
        /// <param name="apInsUpdProjMgrHistoryData">project manager for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("pmhs")]
        [HttpPost]
        public async Task<IActionResult> InsUpdProjMgrHistoryData([FromBody] Models.Request.ApInsUpdProjMgrHistoryData apInsUpdProjMgrHistoryData)
        {
            return Ok(await _lustService.InsUpdProjMgrHistoryData(apInsUpdProjMgrHistoryData));
        }

        /// <summary>
        /// Get inspections for a lust id
        /// (ApGetInspectionByInspectionIdData) 
        /// </summary>
        /// <param name="inspectionId">inspection id</param>
        [ProducesResponseType(200, Type = typeof(Inspection))]
        [Route("inspections/{inspectionId}")]
        [HttpGet]
        public async Task<IActionResult> GetInpection(int inspectionId)
        {
            return Ok(await _lustService.GetInspectionByInspectionIdData(inspectionId));
        }
        /// <summary>
        ///  Get all inspections for a lust id
        /// (ApGetInspectionByLustIdData) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<Inspection>))]
        [Route("{lustId}/inspections")]
        [HttpGet]
        public async Task<IActionResult> GetInspections(int lustId)
        {
            return Ok(await _lustService.GetInspectionByLustIdData(lustId));
        }

        /// <summary>
        ///  Get PCS for a lust id
        /// (PcsPcsPermit) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<Pcs>))]
        [Route("{lustId}/pcss")]
        [HttpGet]
        public async Task<IActionResult> GetPcss(int lustId)
        {
            return Ok(await _lustService.GetPcsByLustIdData(lustId));
        }

        /// <summary>
        ///  Get PCS for a pcs id
        /// (ApGetPcsBypcsIdData) 
        /// </summary>
        /// <param name="pcsId">pcs id</param>
        [ProducesResponseType(200, Type = typeof(Pcs))]
        [Route("pcss/{pcsId}")]
        [HttpGet]
        public async Task<IActionResult> GetPcsByPcsID(int pcsId)
        {
            return Ok(await _lustService.GetPcsByPcsIdData(pcsId));
        }
        /// <summary>
        ///  Get PCS permit for a pcs id
        /// (ApGetPcsPermitBypcsIdData) 
        /// </summary>
        /// <param name="pcsId">pcs id</param>
        [ProducesResponseType(200, Type = typeof(PcsPermit))]
        [Route("pcsspermit/{pcsId}")]
        [HttpGet]
        public async Task<IActionResult> GetPcsPermitByPcsID(int pcsId)
        {
            return Ok(await _lustService.GetPcsPermitByPcsIdData(pcsId));
        }

        /// <summary>
        ///  Get PCS and PCS permit for a pcs id
        /// (ApGetPcsPcsPermitBypcsIdData) 
        /// </summary>
        /// <param name="pcsId">pcs id</param>
        [ProducesResponseType(200, Type = typeof(PcsPcsPermit))]
        [Route("pcspcspermit/{pcsId}")]
        [HttpGet]
        public async Task<IActionResult> GetPcsPcsPermitByPcsID(int pcsId)
        {
            return Ok(await _lustService.GetPcsPcsPermitByPcsIdData(pcsId));
        }

        /// <summary>
        /// Insert/Update Pcs and PcsPermit data for a LUST incident
        /// (ApInsUpdPcsAndPcsPermitData) 
        /// </summary>
        /// <param name="pcsPcsPermit">project manager for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("pcss/pcspcspermit")]
        [HttpPost]
        public async Task<IActionResult> InsUpdPcsPcsPermitData([FromBody] Models.Request.PcsPcsPermit pcsPcsPermit)
        {
            return Ok(await _lustService.InsUpdPcsPcsPermitData(pcsPcsPermit));
        }

        /// <summary>
        /// Delete a pcs id including permit
        /// (apDltAllPCSData) 
        /// </summary>
        /// <param name="pcsId">pcs id</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("pcss/{pcsId}")]
        [HttpDelete]
        public async Task<IActionResult> DltPcsData(int pcsId)
        {
            return Ok(await _lustService.DltPcsData(pcsId));
        }

        /// <summary>
        /// Delete a pcs permit id
        /// (ApDltPcsPermitData) 
        /// </summary>
        /// <param name="pcsPermitId">pcs permit id</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("pcss/pcspermit/{pcsPermitId}")]
        [HttpDelete]
        public async Task<IActionResult> DltPcsPermitData(int pcsPermitId)
        {
            return Ok(await _lustService.DltPcsPermitData(pcsPermitId));
        }

        /// <summary>
        ///  Get Site Controls for a lust id
        /// (ApGetSiteControlByLustIdData) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<SiteControl>))]
        [Route("{lustId}/scs")]
        [HttpGet]
        public async Task<IActionResult> GetSiteControls(int lustId)
        {
            return Ok(await _lustService.GetSiteControlByLustIdData(lustId));
        }

        /// <summary>
        ///  Get Site Control for a site control id
        /// (ApGetSiteControlByScIdData) 
        /// </summary>
        /// <param name="scId">pcs id</param>
        [ProducesResponseType(200, Type = typeof(SiteControl))]
        [Route("scs/{scId}")]
        [HttpGet]
        public async Task<IActionResult> GetSiteControlByScId(int scId)
        {
            return Ok(await _lustService.GetSiteControlByScIdData(scId));
        }

        /// <summary>
        /// Insert/Update Pcs and PcsPermit data for a LUST incident
        /// (ApInsUpdPcsAndPcsPermitData) 
        /// </summary>
        /// <param name="pcsPcsPermit">project manager for a LUST incident</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("scs")]
        [HttpPost]
        public async Task<IActionResult> InsUpSiteControlData([FromBody] Models.Request.SiteControl siteControl)
        {
            return Ok(await _lustService.InsUpdSiteControlData(siteControl));
        }

        /// <summary>
        /// Delete a site control
        /// (apDltSiteControlData) 
        /// </summary>
        /// <param name="scId">sc id</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("scs/{scId}")]
        [HttpDelete]
        public async Task<IActionResult> DltSiteControlData(int scId)
        {
            return Ok(await _lustService.DltSiteControlData(scId));
        }

        /// <summary>
        ///  Get Cris Check for a lust id
        /// (ApGetCrisCheckByLustIdData) 
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(ApLustCris))]
        [Route("{lustId}/crischeck")]
        [HttpGet]
        public async Task<IActionResult> GetCrisCheck(int lustId)
        {
            return Ok(await _lustService.GetCrisCheck(lustId));
        }
    }
}