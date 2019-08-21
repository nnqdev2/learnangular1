using OlprrApi.Models.Response;
using System.Collections.Generic;
using System.Threading.Tasks;
using RequestDto = OlprrApi.Models.Request;
using ResponseDto = OlprrApi.Models.Response;

namespace OlprrApi.Services
{
    public interface ILustService
    {
        Task<IEnumerable<ApGetSiteAliasByLustId2>> GetSiteAliases(int lustId);
        Task<ApGetSiteAliasByLustId2> GetSiteAlias(int siteNameAliasId);
        Task<ApGenericResult> InsUpdSiteAlias(RequestDto.ApInsUpdSiteAlias apInsUpdSiteAlias);
        Task ApDltSiteNameAlias(int siteNameAliasId);
        Task<IEnumerable<ResponseDto.ContactsStats>> GetContacts(string fname, string lname, string org, int sortColumn, int sortOrder, int pageNumber, int rowsPerPage);
        Task<ResponseDto.ApGetCountyIdAndNameFromZP4Fips> GetCountyIdAndNameFromZP4Fips(int usPostalCountyCodeFips);
        Task<ResponseDto.LustIncident> GetIncidentByIdData(int lustId);
        Task<IEnumerable<ResponseDto.ProjectManager>> GetCurrentProjMgr(int lustId);
        Task<ApInsUpdIncidentDataResult> InsUpdLustIncident(RequestDto.ApInsUpdIncidentData apInsUpdIncidentData);
        Task<ApGetLogNumber> GetLogNumber(int lustId);
        Task<ApGetAffilById> GetAffilById(int affilId);
        Task<IEnumerable<ApGetAffilById>> GetPartyGridByLustIdData(int lustId);
        Task<ApInsUpdLustAffilPartyDataResult> InsUpdLustAffilPartyData (RequestDto.ApInsUpdLustAffilPartyData apInsUpdLustAffilPartyData);
        Task ApDltIncidentByLustId(int lustId);
        Task<ApGenericResult> ApDltLustContactByAffilId(int affilId, string ntId);
        Task<ApGetAssessmentSiteScoreValuesByLustId> GetAssessmentSiteScoreValuesByLustId(int lustId);
        Task<ApGetAssessmentSiteScoreValuesRangesByLustId> GetAssessmentSiteScoreValuesRangesByLustId(int lustId);
        Task<ApInsUpdAssessmentResult> InsUpdAssessmentData(RequestDto.ApInsUpdAssessmentData apInsUpdAssessmentData);
        Task<ApInsUpdAssessmentSiteScoreRangeResult> InsUpdAssessmentSiteScoreRangeData(RequestDto.ApInsUpdAssessmentSiteScoreRangeData apInsUpdAssessmentSiteScoreRangeData);
        Task<ApGetScoringRangeData> GetScoringRangeData (int lustId);
        Task<ApUpdateSiteScoreResult> ApUpdateSiteScore(int lustId);
        Task<ApGetScoringValuesByLustIdData> GetScoringValuesByLustIdData(int lustId);
        Task<IEnumerable<ResponseDto.ApGetConsultantsDataStats>> Search(RequestDto.ConsultantSearchFilter consultantSearchFilter);
        Task<Consultant> GetConsultantByIdData(int consultantId);
        Task<ApConsultantResult> InsUpdConsultantData(RequestDto.Consultant consultant);
        Task<ApConsultantResult> DltConsultantData(int consultantId);
        Task<ApGetWorkReportedByLustIdData> GetWorkReportedByWrIdData(int wrId);
        Task<IEnumerable<ApGetWorkReportedByLustIdData>> GetWorkReportedByLustIdData(int lustId);
        Task<ApGenericResult> InsUpdWorkReportedData(RequestDto.ApInsUpdWorkReportedData apInsUpdWorkReportedData);
        Task<ApGenericResult> DltWorkReportedData(int wrId);
        Task<ApGetImageByIdData> GetImageByIdData(int pictureId);
        Task<IEnumerable<ApGetImageByLustIdData>> GetImageByLustIdData(int lustId);
        Task<ApImageResult> DltPictureData(int pictureId);
        Task<ApImageResult> InsUpdPictureData(RequestDto.ApInsUpdPictureData apInsUpdPictureData);
        Task<ProjectManagerHistory> GetProjMgrHistoryByPmhIdData(int pmhId);
        Task<IEnumerable<ProjectManagerHistory>> GetProjMgrHistoryByLustIdData(int lustId);
        Task<ApGenericResult> DltProjMgrHistoryData(int pmhId);
        Task<ApGenericResult> InsUpdProjMgrHistoryData(RequestDto.ApInsUpdProjMgrHistoryData apInsUpdProjMgrHistoryData);

        Task<PublicNotice> GetPulicNoticeByPnIdData(int pnId);
        Task<IEnumerable<PublicNotice>> GetPublicNoticeByLustIdData(int lustId);
        Task<ApGenericResult> DltPublicNoticeData(int pnId);
        Task<ApGenericResult> InsUpdPublicNoticeData(RequestDto.ApInsUpdPublicNoticeData apInsUpdPublicNoticeData);
        Task<Inspection> GetInspectionByInspectionIdData(int inspectionId);
        Task<IEnumerable<Inspection>> GetInspectionByLustIdData(int lustId);
        Task<IEnumerable<Pcs>> GetPcsByLustIdData(int lustId);
        Task<Pcs> GetPcsByPcsIdData(int pcsId);
        Task<PcsPermit> GetPcsPermitByPcsIdData(int pcsId);
        Task<PcsPcsPermit> GetPcsPcsPermitByPcsIdData(int pcsId);
        Task<ApGenericResult> InsUpdPcsPcsPermitData(RequestDto.PcsPcsPermit pcsPcsPermit);
        Task<ApGenericResult> DltPcsData(int pcsId);
        Task<ApGenericResult> DltPcsPermitData(int pcsPermitId);

        Task<IEnumerable<SiteControl>> GetSiteControlByLustIdData(int lustId);
        Task<SiteControl> GetSiteControlByScIdData(int scId);
        Task<ApGenericResult> InsUpdSiteControlData(RequestDto.SiteControl siteControl);
        Task<ApGenericResult> DltSiteControlData(int scId);
        Task<ApLustCris> GetCrisCheck(int lustId);

        //Task<ApGenericResult> DltPcsData(int pcsId);
        //Task<ApGenericResult> InsUpdPcsData(RequestDto.Pcs pcs);

        //Task<ApGenericResult> DltPcsPermitData(int pcsPermitId);
        //Task<ApGenericResult> InsUpdPcsPermitData(RequestDto.PcsPermit pcsPermit);

    }
}
