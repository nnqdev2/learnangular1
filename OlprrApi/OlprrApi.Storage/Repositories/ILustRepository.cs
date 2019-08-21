using System.Collections.Generic;
using System.Threading.Tasks;
using OlprrApi.Storage.Entities;

namespace OlprrApi.Storage.Repositories
{
    public interface ILustRepository
    {
        Task<IEnumerable<ApGetSiteAliasByLustId2>> ApGetSiteAliasByLustId(int lustId);
        Task<ApGetSiteAliasByLustId2> ApGetSiteAliasBySiteNameAliasIdData(int siteNameAliasId);
        Task<ApGenericResult> ApInsUpdSiteAlias(ApInsUpdSiteAlias apInsUpdSiteAlias);
        Task ApDltSiteNameAlias(int siteNameAliasId);
        Task<IEnumerable<ContactsStats>> ApGetPartyByFirstLastOrgName(string fname, string lname, string org, int sortColumn, int sortOrder, int pageNumber, int rowsPerPage);
        Task<ApGetCountyIdAndNameFromZP4Fips> ApGetCountyIdAndNameFromZP4Fips(int usPostalCountyCodeFips);
        Task<IEnumerable<LustIncident>> ApGetIncidentByIdData (int lustId);
        Task<IEnumerable<ProjectManagerIncident>> ApGetCurrentProjMgr(int lustId);
        Task<ApInsUpdIncidentDataResult> ApInsUpdIncidentData(ApInsUpdIncidentData apInsUpdIncidentData);
        Task<ApGetLogNumber> ApGetLogNumber(int lustId);
        Task<ApGetAffilById> ApGetAffilById(int affilId);
        Task<IEnumerable<ApGetAffilById>> ApGetPartyGridByLustIdData(int lustId);
        Task<ApInsUpdLustAffilPartyDataResult> ApInsUpdLustAffilPartyData(ApInsUpdLustAffilPartyData apInsUpdLustAffilPartyData);
        Task<ApGenericResult> ApDltLustContactByAffilId(int affilId, string ntId);
        Task ApDltIncidentByLustId(int lustId);
        Task<ApGetAssessmentSiteScoreValuesByLustId> ApGetAssessmentSiteScoreValuesByLustId(int lustId);
        Task<ApGetAssessmentSiteScoreValuesRangesByLustId> ApGetAssessmentSiteScoreValuesRangesByLustId(int lustId);
        Task<ApInsUpdAssessmentResult> ApInsUpdAssessmentData(ApInsUpdAssessmentData apInsUpdAssessmentData);
        Task<ApInsUpdAssessmentSiteScoreRangeResult> ApInsUpdAssessmentSiteScoreRangeData(ApInsUpdAssessmentSiteScoreRangeData apInsUpdAssessmentSiteScoreRangeData);
        Task<ApGetScoringRangeData> ApGetScoringRangeData(int lustId);
        Task<ApUpdateSiteScoreResult> ApUpdateSiteScore(int lustId);
        Task<ApGetScoringValuesByLustIdData> ApGetScoringValuesByLustIdData(int lustId);
        Task<IEnumerable<ApGetConsultantsDataStats>> ApGetConsultantsData(ConsultantSearchFilter consultantSearchFilter);
        Task<Consultant> ApGetConsultantById(int consultantId);
        Task<ApConsultantResult> ApInsUpdConsultantData(Consultant consultant);
        Task<ApConsultantResult> ApDltConsultantData(int consultantId);
        Task<ApGetWorkReportedByLustIdData> ApGetWorkReportedByWrIdData(int wrId);
        Task<IEnumerable<ApGetWorkReportedByLustIdData>> ApGetWorkReportedByLustIdData(int lustId);
        Task<ApGenericResult> ApInsUpdWorkReportedData(ApInsUpdWorkReportedData apInsUpdWorkReportedData);
        Task<ApGenericResult> ApDltWorkReportedData(int wrId);
        Task<ApGetImageByIdData> ApGetImageByIdData(int pictureId);
        Task<IEnumerable<ApGetImageByLustIdData>> ApGetImageByLustIdData(int lustId);
        Task<ApImageResult> ApDltPictureData(int pictureId);
        Task<ApImageResult> ApInsUpdPictureData(ApInsUpdPictureData apInsUpdPictureData);

        Task<ProjectManagerHistory> ApGetProjMgrHistoryByPmhIdData(int pmhId);
        Task<IEnumerable<ProjectManagerHistory>> ApGetProjMgrHistoryByLustIdData(int lustId);
        Task<ApGenericResult> ApInsUpdProjMgrHistoryData(ApInsUpdProjMgrHistoryData apInsUpdProjMgrHistoryData);
        Task<ApGenericResult> ApDltProjMgrHistoryData(int pmhId);

        Task<PublicNotice> ApGetPublicNoticeByPnIdData(int pnId);
        Task<IEnumerable<PublicNotice>> ApGetPublicNoticeByLustIdData(int lustId);
        Task<ApGenericResult> ApInsUpdPublicNoticeData(ApInsUpdPublicNoticeData apInsUpdPublicNoticeData);
        Task<ApGenericResult> ApDltPublicNoticeData(int pmhId);

        Task<Inspection> ApGetInspectionByInspectionIdData(int inspectionId);
        Task<IEnumerable<Inspection>> ApGetInspectionByLustIdData(int lustId);

        Task<IEnumerable<Pcs>> ApGetPcsByLustIdData(int lustId);
        Task<Pcs> ApGetPcsByPcsIdData(int pcsId);
        Task<PcsPermit> ApGetPcsPermitByPcsIdData(int pcsId);
        Task<PcsPcsPermit> ApGetPcsPcsPermitByPcsIdData(int pcsId);
        Task<ApGenericResult> ApInsUpdPcsData(Pcs pcs);
        Task<ApGenericResult> ApInsUpdPcsPermitData(PcsPermit pcsPermit);
        Task<ApGenericResult> ApDltPcsData(int pcsId);
        Task<ApGenericResult> ApDltPcsPermitData(int pcsPermitId);
        Task<ApGenericResult> ApInsUpdPcsPcsPermitData(PcsPcsPermit pcsPcsPermit);

        Task<IEnumerable<SiteControl>> ApGetSiteControlByLustIdData(int lustId);
        Task<SiteControl> ApGetSiteControlByScIdData(int scId);
        Task<ApGenericResult> ApInsUpdSiteControlData(SiteControl siteControl);
        Task<ApGenericResult> ApDltSiteControlData(int scId);
        Task<ApLustCris> ApGetCrisCheck(int lustId);
    }
}
