using System.Threading.Tasks;
using AutoMapper;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using OlprrApi.Storage.Repositories;
using RequestDto = OlprrApi.Models.Request;
using ResponseDto = OlprrApi.Models.Response;
using EntityDto = OlprrApi.Storage.Entities;
using System.Text;
using OlprrApi.Models.Response;

namespace OlprrApi.Services
{
    public class LustService : ILustService
    {
        private ILogger<LustService> _logger;
        private ILustRepository _lustRepository;
        private readonly IMapper _mapper;
        public LustService(ILogger<LustService> logger, ILustRepository lustRepository, IMapper mapper)
        {
            _logger = logger;
            _lustRepository = lustRepository;
            _mapper = mapper;
        }
        public async Task<IEnumerable<ResponseDto.ApGetSiteAliasByLustId2>> GetSiteAliases(int lustId)
        {
            var resultList = new List<ResponseDto.ApGetSiteAliasByLustId2>();
            foreach (var result in await _lustRepository.ApGetSiteAliasByLustId(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.ApGetSiteAliasByLustId2, ResponseDto.ApGetSiteAliasByLustId2>(result));
            }
            return resultList;
        }
        public async Task<ResponseDto.ApGetSiteAliasByLustId2> GetSiteAlias(int siteNameAliasId)
        {
            var result = await _lustRepository.ApGetSiteAliasBySiteNameAliasIdData(siteNameAliasId);
            return _mapper.Map<EntityDto.ApGetSiteAliasByLustId2, ResponseDto.ApGetSiteAliasByLustId2>(result);
        }
        public async Task<ApGenericResult> InsUpdSiteAlias(RequestDto.ApInsUpdSiteAlias apInsUpdSiteAlias)
        {
            var siteAliasData = _mapper.Map<RequestDto.ApInsUpdSiteAlias, EntityDto.ApInsUpdSiteAlias>(apInsUpdSiteAlias);
            var result = await _lustRepository.ApInsUpdSiteAlias(siteAliasData);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }
        public async Task ApDltSiteNameAlias(int siteNameAliasId)
        {
            await _lustRepository.ApDltSiteNameAlias(siteNameAliasId);
        }
        public async Task<IEnumerable<ResponseDto.ContactsStats>> GetContacts(string fname, string lname, string org, int sortColumn, int sortOrder, int pageNumber, int rowsPerPage)
        {
            if (fname != null && fname == "null") fname = null;
            if (lname != null && lname == "null") lname = null;
            if (org != null && org == "null") org = null;
            var resultList = new List<ResponseDto.ContactsStats>();
            foreach (var result in await _lustRepository.ApGetPartyByFirstLastOrgName(fname, lname, org, sortColumn, sortOrder, pageNumber, rowsPerPage))
            {
                resultList.Add(_mapper.Map<EntityDto.ContactsStats, ResponseDto.ContactsStats>(result));
            }
            return resultList;
        }

        public async Task<ResponseDto.ApGetCountyIdAndNameFromZP4Fips> GetCountyIdAndNameFromZP4Fips(int usPostalCountyCodeFips)
        {
            var result = await _lustRepository.ApGetCountyIdAndNameFromZP4Fips((usPostalCountyCodeFips));
            return (_mapper.Map<EntityDto.ApGetCountyIdAndNameFromZP4Fips, ResponseDto.ApGetCountyIdAndNameFromZP4Fips>(result));
        }
        public async Task<ResponseDto.LustIncident> GetIncidentByIdData(int lustId)
        {
            foreach (var result in await _lustRepository.ApGetIncidentByIdData(lustId))
            {
                return (_mapper.Map<EntityDto.LustIncident, ResponseDto.LustIncident>(result));
            }
            return null;
        }
        public async Task<IEnumerable<ResponseDto.ProjectManager>> GetCurrentProjMgr(int lustId)
        {
            var resultList = new List<ResponseDto.ProjectManager>();
            foreach (var result in await _lustRepository.ApGetCurrentProjMgr(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.ProjectManagerIncident, ResponseDto.ProjectManager>(result));
            }
            return resultList;
        }

        public async Task<ResponseDto.ApInsUpdIncidentDataResult> InsUpdLustIncident(RequestDto.ApInsUpdIncidentData apInsUpdIncidentData)
        {
            var lustData = _mapper.Map<RequestDto.ApInsUpdIncidentData, EntityDto.ApInsUpdIncidentData>(apInsUpdIncidentData);
            var result = await _lustRepository.ApInsUpdIncidentData(lustData);
            return (_mapper.Map<EntityDto.ApInsUpdIncidentDataResult, ResponseDto.ApInsUpdIncidentDataResult>(result));
        }

        public async Task<ResponseDto.ApGetLogNumber> GetLogNumber(int lustId)
        {
            var result = await _lustRepository.ApGetLogNumber(lustId);
            return (_mapper.Map<EntityDto.ApGetLogNumber, ResponseDto.ApGetLogNumber>(result));
        }

        public async Task<ResponseDto.ApGetAffilById> GetAffilById(int affilId)
        {
            var result = await _lustRepository.ApGetAffilById(affilId);
            return (_mapper.Map<EntityDto.ApGetAffilById, ResponseDto.ApGetAffilById>(result));
        }

        public async Task<ResponseDto.ApInsUpdLustAffilPartyDataResult> InsUpdLustAffilPartyData(RequestDto.ApInsUpdLustAffilPartyData apInsUpdLustAffilPartyData)
        {
            var lustData = _mapper.Map<RequestDto.ApInsUpdLustAffilPartyData, EntityDto.ApInsUpdLustAffilPartyData>(apInsUpdLustAffilPartyData);
            var result = await _lustRepository.ApInsUpdLustAffilPartyData(lustData);
            return (_mapper.Map<EntityDto.ApInsUpdLustAffilPartyDataResult, ResponseDto.ApInsUpdLustAffilPartyDataResult>(result));

        }

        public async Task<IEnumerable<ResponseDto.ApGetAffilById>> GetPartyGridByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.ApGetAffilById>();
            foreach (var result in await _lustRepository.ApGetPartyGridByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.ApGetAffilById, ResponseDto.ApGetAffilById>(result));
            }
            return resultList;
        }

        public async Task ApDltIncidentByLustId(int lustId)
        {
            await _lustRepository.ApDltIncidentByLustId(lustId);
        }

        public async Task<ApGenericResult> ApDltLustContactByAffilId(int affilId, string ntId)
        {
           var result = await _lustRepository.ApDltLustContactByAffilId(affilId, ntId);
            return (_mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result));
        }

        public async Task<ApGetAssessmentSiteScoreValuesByLustId> GetAssessmentSiteScoreValuesByLustId(int lustId)
        {
            var result = await _lustRepository.ApGetAssessmentSiteScoreValuesByLustId(lustId);
            return (_mapper.Map<EntityDto.ApGetAssessmentSiteScoreValuesByLustId, ResponseDto.ApGetAssessmentSiteScoreValuesByLustId>(result));
        }
        public async Task<ApGetAssessmentSiteScoreValuesRangesByLustId> GetAssessmentSiteScoreValuesRangesByLustId(int lustId)
        {
            var result = await _lustRepository.ApGetAssessmentSiteScoreValuesRangesByLustId(lustId);
            return (_mapper.Map<EntityDto.ApGetAssessmentSiteScoreValuesRangesByLustId, ResponseDto.ApGetAssessmentSiteScoreValuesRangesByLustId>(result));
        }
        public async Task<ApInsUpdAssessmentResult> InsUpdAssessmentData(RequestDto.ApInsUpdAssessmentData apInsUpdAssessmentData)
        {
            var data = _mapper.Map<RequestDto.ApInsUpdAssessmentData, EntityDto.ApInsUpdAssessmentData>(apInsUpdAssessmentData);
            var result = await _lustRepository.ApInsUpdAssessmentData(data);
            return (_mapper.Map<EntityDto.ApInsUpdAssessmentResult, ResponseDto.ApInsUpdAssessmentResult>(result));
        }
        public async Task<ApInsUpdAssessmentSiteScoreRangeResult> InsUpdAssessmentSiteScoreRangeData(RequestDto.ApInsUpdAssessmentSiteScoreRangeData apInsUpdAssessmentSiteScoreRangeData)
        {
            var data = _mapper.Map<RequestDto.ApInsUpdAssessmentSiteScoreRangeData, EntityDto.ApInsUpdAssessmentSiteScoreRangeData>(apInsUpdAssessmentSiteScoreRangeData);
            var result = await _lustRepository.ApInsUpdAssessmentSiteScoreRangeData(data);
            return (_mapper.Map<EntityDto.ApInsUpdAssessmentSiteScoreRangeResult, ResponseDto.ApInsUpdAssessmentSiteScoreRangeResult>(result));
        }
        public async Task<ApGetScoringRangeData> GetScoringRangeData(int lustId)
        {
            var result = await _lustRepository.ApGetScoringRangeData(lustId);
            return (_mapper.Map<EntityDto.ApGetScoringRangeData, ResponseDto.ApGetScoringRangeData>(result));

        }
        public async Task<ApGetScoringValuesByLustIdData> GetScoringValuesByLustIdData(int lustId)
        {
            var result = await _lustRepository.ApGetScoringValuesByLustIdData(lustId);
            return (_mapper.Map<EntityDto.ApGetScoringValuesByLustIdData, ResponseDto.ApGetScoringValuesByLustIdData>(result));

        }
        public async Task<ApUpdateSiteScoreResult> ApUpdateSiteScore(int lustId)
        {
            var result = await _lustRepository.ApUpdateSiteScore(lustId);
            return (_mapper.Map<EntityDto.ApUpdateSiteScoreResult, ResponseDto.ApUpdateSiteScoreResult>(result));
        }

        public async Task<IEnumerable<ApGetConsultantsDataStats>> Search(RequestDto.ConsultantSearchFilter consultantSearchFilter)
        {
            var searchFilters = _mapper.Map<RequestDto.ConsultantSearchFilter, EntityDto.ConsultantSearchFilter>(consultantSearchFilter);
            var resultList = new List<ResponseDto.ApGetConsultantsDataStats>();
            foreach (var result in await _lustRepository.ApGetConsultantsData(searchFilters))
            {
                resultList.Add(_mapper.Map<EntityDto.ApGetConsultantsDataStats, ResponseDto.ApGetConsultantsDataStats>(result));
            }
            return resultList;
        }

        public async Task<Consultant> GetConsultantByIdData(int consultantId)
        {
            var result = await _lustRepository.ApGetConsultantById(consultantId);
            return (_mapper.Map<EntityDto.Consultant, ResponseDto.Consultant>(result));
        }

        public async Task<ApConsultantResult> InsUpdConsultantData(RequestDto.Consultant consultant)
        {
            var data = _mapper.Map<RequestDto.Consultant, EntityDto.Consultant>(consultant);
            var result = await _lustRepository.ApInsUpdConsultantData(data);
            return (_mapper.Map<EntityDto.ApConsultantResult, ResponseDto.ApConsultantResult>(result));
        }

        public async Task<ApConsultantResult> DltConsultantData(int consultantId)
        {
            var result = await _lustRepository.ApDltConsultantData(consultantId);
            return _mapper.Map<EntityDto.ApConsultantResult, ResponseDto.ApConsultantResult>(result);
        }

        public async Task<IEnumerable<ApGetWorkReportedByLustIdData>> GetWorkReportedByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.ApGetWorkReportedByLustIdData>();
            foreach (var result in await _lustRepository.ApGetWorkReportedByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.ApGetWorkReportedByLustIdData, ResponseDto.ApGetWorkReportedByLustIdData>(result));
            }
            return resultList;
        }
        public async Task<ApGetWorkReportedByLustIdData> GetWorkReportedByWrIdData(int wrId)
        {
            var result = await _lustRepository.ApGetWorkReportedByWrIdData(wrId);
            return _mapper.Map<EntityDto.ApGetWorkReportedByLustIdData, ResponseDto.ApGetWorkReportedByLustIdData>(result);
        }
        public async Task<ApGenericResult> InsUpdWorkReportedData(RequestDto.ApInsUpdWorkReportedData apInsUpdWorkReportedData)
        {
            var data = _mapper.Map<RequestDto.ApInsUpdWorkReportedData, EntityDto.ApInsUpdWorkReportedData>(apInsUpdWorkReportedData);
            var result = await _lustRepository.ApInsUpdWorkReportedData(data);
            return (_mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result));

        }

        public async Task<ApGenericResult> DltWorkReportedData(int wrId)
        {
            var result = await _lustRepository.ApDltWorkReportedData(wrId);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);

        }

        public async Task<ApGetImageByIdData> GetImageByIdData(int pictureId)
        {
            var result = await _lustRepository.ApGetImageByIdData(pictureId);
            return (_mapper.Map<EntityDto.ApGetImageByIdData, ResponseDto.ApGetImageByIdData>(result));
        }

        public async Task<IEnumerable<ApGetImageByLustIdData>> GetImageByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.ApGetImageByLustIdData>();
            foreach (var result in await _lustRepository.ApGetImageByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.ApGetImageByLustIdData, ResponseDto.ApGetImageByLustIdData>(result));
            }
            return resultList;
        }

        public async Task<ApImageResult> DltPictureData(int pictureId)
        {
            var result = await _lustRepository.ApDltPictureData(pictureId);
            return _mapper.Map<EntityDto.ApImageResult, ResponseDto.ApImageResult>(result);
        }

        public async Task<ApImageResult> InsUpdPictureData(RequestDto.ApInsUpdPictureData apInsUpdPictureData)
        {
            var data = _mapper.Map<RequestDto.ApInsUpdPictureData, EntityDto.ApInsUpdPictureData>(apInsUpdPictureData);
            var result = await _lustRepository.ApInsUpdPictureData(data);
            return _mapper.Map<EntityDto.ApImageResult, ResponseDto.ApImageResult>(result);
        }

        public async Task<ProjectManagerHistory> GetProjMgrHistoryByPmhIdData(int pmhId)
        {
            var result = await _lustRepository.ApGetProjMgrHistoryByPmhIdData(pmhId);
            return (_mapper.Map<EntityDto.ProjectManagerHistory, ResponseDto.ProjectManagerHistory>(result));
        }

        public async Task<IEnumerable<ProjectManagerHistory>> GetProjMgrHistoryByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.ProjectManagerHistory>();
            foreach (var result in await _lustRepository.ApGetProjMgrHistoryByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.ProjectManagerHistory, ResponseDto.ProjectManagerHistory>(result));
            }
            return resultList;
        }

        public async Task<ApGenericResult> DltProjMgrHistoryData(int pmhId)
        {
            var result = await _lustRepository.ApDltProjMgrHistoryData(pmhId);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ApGenericResult> InsUpdProjMgrHistoryData(RequestDto.ApInsUpdProjMgrHistoryData apInsUpdProjMgrHistoryData)
        {
            var data = _mapper.Map<RequestDto.ApInsUpdProjMgrHistoryData, EntityDto.ApInsUpdProjMgrHistoryData>(apInsUpdProjMgrHistoryData);
            var result = await _lustRepository.ApInsUpdProjMgrHistoryData(data);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<PublicNotice> GetPulicNoticeByPnIdData(int pnId)
        {
            var result = await _lustRepository.ApGetPublicNoticeByPnIdData(pnId);
            return (_mapper.Map<EntityDto.PublicNotice, ResponseDto.PublicNotice>(result));

        }

        public async Task<IEnumerable<PublicNotice>> GetPublicNoticeByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.PublicNotice>();
            foreach (var result in await _lustRepository.ApGetPublicNoticeByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.PublicNotice, ResponseDto.PublicNotice>(result));
            }
            return resultList;
        }

        public async Task<ApGenericResult> DltPublicNoticeData(int pnId)
        {
            var result = await _lustRepository.ApDltPublicNoticeData(pnId);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ApGenericResult> InsUpdPublicNoticeData(RequestDto.ApInsUpdPublicNoticeData apInsUpdPublicNoticeData)
        {
            var data = _mapper.Map<RequestDto.ApInsUpdPublicNoticeData, EntityDto.ApInsUpdPublicNoticeData>(apInsUpdPublicNoticeData);
            var result = await _lustRepository.ApInsUpdPublicNoticeData(data);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<Inspection> GetInspectionByInspectionIdData(int inspectionId)
        {
            var result = await _lustRepository.ApGetInspectionByInspectionIdData(inspectionId);
            return (_mapper.Map<EntityDto.Inspection, ResponseDto.Inspection>(result));
        }

        public async Task<IEnumerable<Inspection>> GetInspectionByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.Inspection>();
            foreach (var result in await _lustRepository.ApGetInspectionByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.Inspection, ResponseDto.Inspection>(result));
            }
            return resultList;
        }

        public async Task<IEnumerable<Pcs>> GetPcsByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.Pcs>();
            foreach (var result in await _lustRepository.ApGetPcsByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.Pcs, ResponseDto.Pcs>(result));
            }
            return resultList;
        }

        public async Task<Pcs> GetPcsByPcsIdData(int pcsId)
        {
            var result = await _lustRepository.ApGetPcsByPcsIdData(pcsId);
            return (_mapper.Map<EntityDto.Pcs, ResponseDto.Pcs>(result));
        }

        public async Task<PcsPermit> GetPcsPermitByPcsIdData(int pcsId)
        {
            var result = await _lustRepository.ApGetPcsPermitByPcsIdData(pcsId);
            return (_mapper.Map<EntityDto.PcsPermit, ResponseDto.PcsPermit>(result));
        }

        public async Task<PcsPcsPermit> GetPcsPcsPermitByPcsIdData(int pcsId)
        {
            var result = await _lustRepository.ApGetPcsPcsPermitByPcsIdData(pcsId);
            return (_mapper.Map<EntityDto.PcsPcsPermit, ResponseDto.PcsPcsPermit>(result));
        }

        public async Task<ApGenericResult> InsUpdPcsPcsPermitData(RequestDto.PcsPcsPermit pcsPcsPermit)
        {
            var data = _mapper.Map<RequestDto.PcsPcsPermit, EntityDto.PcsPcsPermit>(pcsPcsPermit);
            var result = await _lustRepository.ApInsUpdPcsPcsPermitData(data);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ApGenericResult> DltPcsData(int pcsId)
        {
            var result = await _lustRepository.ApDltPcsData(pcsId);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ApGenericResult> DltPcsPermitData(int pcsPermitId)
        {
            var result = await _lustRepository.ApDltPcsPermitData(pcsPermitId);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<IEnumerable<SiteControl>> GetSiteControlByLustIdData(int lustId)
        {
            var resultList = new List<ResponseDto.SiteControl>();
            foreach (var result in await _lustRepository.ApGetSiteControlByLustIdData(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.SiteControl, ResponseDto.SiteControl>(result));
            }
            return resultList;
        }

        public async Task<SiteControl> GetSiteControlByScIdData(int scId)
        {
            var result = await _lustRepository.ApGetSiteControlByScIdData(scId);
            return (_mapper.Map<EntityDto.SiteControl, ResponseDto.SiteControl>(result));
        }

        public async Task<ApGenericResult> InsUpdSiteControlData(RequestDto.SiteControl siteControl)
        {
            var data = _mapper.Map<RequestDto.SiteControl, EntityDto.SiteControl>(siteControl);
            var result = await _lustRepository.ApInsUpdSiteControlData(data);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ApGenericResult> DltSiteControlData(int scId)
        {
            var result = await _lustRepository.ApDltSiteControlData(scId);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ApLustCris> GetCrisCheck(int lustId)
        {
            var result = await _lustRepository.ApGetCrisCheck(lustId);
            return _mapper.Map<EntityDto.ApLustCris, ResponseDto.ApLustCris>(result);
        }
    }
}
