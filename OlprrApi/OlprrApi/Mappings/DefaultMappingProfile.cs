using AutoMapper;

namespace OlprrApi.Mappings
{
    public class DefaultMappingProfile : Profile
    {
        public DefaultMappingProfile()
        {
            CreateMap<Storage.Entities.ConfirmationType, Models.Response.ConfirmationType>();
            CreateMap<Storage.Entities.County, Models.Response.County>();
            CreateMap<Storage.Entities.DiscoveryType, Models.Response.DiscoveryType>();
            CreateMap<Storage.Entities.QuadrantT, Models.Response.QuadrantT>();
            CreateMap<Storage.Entities.ReleaseCauseType, Models.Response.ReleaseCauseType>();
            CreateMap<Storage.Entities.SiteTypeT, Models.Response.SiteTypeT>();
            CreateMap<Storage.Entities.SourceType, Models.Response.SourceType>();
            CreateMap<Storage.Entities.State, Models.Response.State>();
            CreateMap<Storage.Entities.SiteTypeT, Models.Response.SiteTypeT>();
            CreateMap<Storage.Entities.StreetTypeT, Models.Response.StreetTypeT>();
            CreateMap<Storage.Entities.DeqOfficeT, Models.Response.DeqOfficeT>();
            CreateMap<Storage.Entities.IncidentStatusT, Models.Response.IncidentStatusT>();

            CreateMap<Storage.Entities.FileStatus, Models.Response.FileStatus>();
            CreateMap<Storage.Entities.TankStatus, Models.Response.TankStatus>();
            CreateMap<Storage.Entities.CleanupSiteType, Models.Response.CleanupSiteType>();
            CreateMap<Storage.Entities.Region, Models.Response.Region>();
            CreateMap<Storage.Entities.ZipCode, Models.Response.ZipCode>();
            CreateMap<Storage.Entities.City, Models.Response.City>();
            CreateMap<Storage.Entities.DateCompare, Models.Response.DateCompare>();
            CreateMap<Storage.Entities.ProjectManageIncident, Models.Response.ProjectManager>();
            CreateMap<Storage.Entities.SiteType2, Models.Response.SiteType2>();
            CreateMap<Storage.Entities.Brownfield, Models.Response.Brownfield>();
            CreateMap<Storage.Entities.ContactType, Models.Response.ContactType>();
            CreateMap<Storage.Entities.LookUp, Models.Response.LookUp>();
            CreateMap<Storage.Entities.ApGetLookupTablesByType, Models.Response.ApGetLookupTablesByType>();
            CreateMap<Storage.Entities.ApGetLookupTablesByType2, Models.Response.ApGetLookupTablesByType2>();
            CreateMap<Storage.Entities.ActiveProjectManager, Models.Response.ActiveProjectManager>();

            CreateMap<Models.Request.ApOLPRRInsertIncident, Storage.Entities.ApOlprrInsertIncident>();
            CreateMap<Models.Request.LustSiteAddressSearch, Storage.Entities.LustSiteAddressSearch>();
            CreateMap<Storage.Entities.ApOlprrGetLustLookup, Models.Response.LustSiteAddressSearch>();
            CreateMap<Storage.Entities.ApOlprrGetIncidentById, Models.Response.IncidentById>();
            CreateMap<Storage.Entities.ApGetLustSearchDataStats, Models.Response.ApGetLustSearch>();
            CreateMap<Storage.Entities.ApOLPRRGetContactByIdByContactType, Models.Response.ApOLPRRGetContactByIdByContactType>();
            CreateMap<Storage.Entities.ApOlprrGetIncidents, Models.Response.ApOlprrGetIncidents>();
            CreateMap<Storage.Entities.ApOlprrGetIncidentsWithStats, Models.Response.ApOlprrGetIncidentsWithStats>();
            CreateMap<Storage.Entities.ApOlprrGetIncidentsStats, Models.Response.ApOlprrGetIncidentsStats>();
            CreateMap<Storage.Entities.ApOlprrGetIncidentDataById, Models.Response.IncidentDataById>();
            CreateMap<Models.Request.LustSearchFilter, Storage.Entities.LustSearchFilter>();
            CreateMap<Storage.Entities.ApGetLustSearchDataStats, Models.Response.ApGetLustSearchDataStats>();
            CreateMap<Models.Request.UstSearchFilter, Storage.Entities.UstSearchFilter>();
            CreateMap<Storage.Entities.ApOlprrGetUstLookupDataStats, Models.Response.ApOlprrGetUstLookupDataStats>();
            CreateMap<Storage.Entities.ApOlprrCheckPostalCounty, Models.Response.ApOlprrCheckPostalCounty>();

            CreateMap<Models.Request.OlprrReviewIncident, Storage.Entities.OlprrReviewIncident>();
            CreateMap<Storage.Entities.OlprrReviewIncidentResult, Models.Response.OlprrReviewIncidentResult>();

            CreateMap<Storage.Entities.ApGetSiteAliasByLustId, Models.Response.ApGetSiteAliasByLustId>();
            CreateMap<Storage.Entities.ApGetSiteAliasByLustId2, Models.Response.ApGetSiteAliasByLustId2>();
            CreateMap<Models.Request.ApInsUpdSiteAlias, Storage.Entities.ApInsUpdSiteAlias>();

            CreateMap<Storage.Entities.Contact, Models.Response.Contact>();
            CreateMap<Storage.Entities.ContactsStats, Models.Response.ContactsStats>();
            CreateMap<Storage.Entities.ApGetCountyIdAndNameFromZP4Fips, Models.Response.ApGetCountyIdAndNameFromZP4Fips>();
            CreateMap<Storage.Entities.LustIncident, Models.Response.LustIncident>();
            CreateMap<Storage.Entities.ProjectManagerIncident, Models.Response.ProjectManager>();
            CreateMap<Models.Request.ApInsUpdIncidentData, Storage.Entities.ApInsUpdIncidentData>();
            CreateMap<Storage.Entities.ApInsUpdIncidentDataResult, Models.Response.ApInsUpdIncidentDataResult>();
            CreateMap<Storage.Entities.ApGetLogNumber, Models.Response.ApGetLogNumber>();
            CreateMap<Storage.Entities.ApGetAffilById, Models.Response.ApGetAffilById>();
            CreateMap<Models.Request.ApInsUpdLustAffilPartyData, Storage.Entities.ApInsUpdLustAffilPartyData>();
            CreateMap<Storage.Entities.ApInsUpdLustAffilPartyDataResult, Models.Response.ApInsUpdLustAffilPartyDataResult>();
            CreateMap<Storage.Entities.ApGetAssessmentSiteScoreValuesByLustId, Models.Response.ApGetAssessmentSiteScoreValuesByLustId>();
            CreateMap<Models.Request.ApInsUpdAssessmentData, Storage.Entities.ApInsUpdAssessmentData>();
            CreateMap<Storage.Entities.ApInsUpdAssessmentResult, Models.Response.ApInsUpdAssessmentResult>();
            CreateMap<Storage.Entities.ApGetScoringRangeData, Models.Response.ApGetScoringRangeData>();
            CreateMap<Storage.Entities.ApGetScoringValuesByLustIdData, Models.Response.ApGetScoringValuesByLustIdData>();
            CreateMap<Models.Request.ConsultantSearchFilter, Storage.Entities.ConsultantSearchFilter>();
            CreateMap<Storage.Entities.Consultant, Models.Response.Consultant>();
            CreateMap<Storage.Entities.ApGetConsultantsDataStats, Models.Response.ApGetConsultantsDataStats>();
            CreateMap<Storage.Entities.ApConsultantResult, Models.Response.ApConsultantResult>();
            CreateMap<Models.Request.Consultant, Storage.Entities.Consultant>();
            CreateMap<Storage.Entities.ApUpdateSiteScoreResult, Models.Response.ApUpdateSiteScoreResult>();
            CreateMap<Storage.Entities.ApGetImageByLustIdData, Models.Response.ApGetImageByLustIdData>();
            CreateMap<Storage.Entities.ApGetImageByIdData, Models.Response.ApGetImageByIdData>();
            CreateMap<Models.Request.ApInsUpdPictureData, Storage.Entities.ApInsUpdPictureData>();
            CreateMap<Storage.Entities.ApImageResult, Models.Response.ApImageResult>();
            CreateMap<Storage.Entities.ApGetWorkReportedByLustIdData, Models.Response.ApGetWorkReportedByLustIdData>();
            CreateMap<Storage.Entities.ApGenericResult, Models.Response.ApGenericResult>();
            CreateMap<Models.Request.ApInsUpdWorkReportedData, Storage.Entities.ApInsUpdWorkReportedData>();
            CreateMap<Storage.Entities.ApGetWorkReportedByLustIdData, Models.Response.ApGetWorkReportedByLustIdData>();
            CreateMap<Storage.Entities.ProjectManagerHistory, Models.Response.ProjectManagerHistory>();
            CreateMap<Storage.Entities.PublicNotice, Models.Response.PublicNotice>();
            CreateMap<Models.Request.ApInsUpdPublicNoticeData, Storage.Entities.ApInsUpdPublicNoticeData>();
            CreateMap<Storage.Entities.Inspection, Models.Response.Inspection>();
            CreateMap<Storage.Entities.SearchValue, Models.Response.SearchValue>();
            CreateMap<Storage.Entities.PcsPcsPermit, Models.Response.PcsPcsPermit>();
            CreateMap<Models.Request.PcsPcsPermit, Storage.Entities.PcsPcsPermit>();
            CreateMap<Storage.Entities.PcsPermit, Models.Response.PcsPermit>();
            CreateMap<Storage.Entities.Pcs, Models.Response.Pcs>();
            CreateMap<Models.Request.PcsPermit, Storage.Entities.PcsPermit>();
            CreateMap<Models.Request.Pcs, Storage.Entities.Pcs>();
            CreateMap<Storage.Entities.ApGetAssessmentSiteScoreValuesRangesByLustId, Models.Response.ApGetAssessmentSiteScoreValuesRangesByLustId>();
            CreateMap<Models.Request.ApInsUpdAssessmentSiteScoreRangeData, Storage.Entities.ApInsUpdAssessmentSiteScoreRangeData>();
            CreateMap<Storage.Entities.ApInsUpdAssessmentSiteScoreRangeResult, Models.Response.ApInsUpdAssessmentSiteScoreRangeResult>();
            CreateMap<Models.Request.ApInsUpdProjMgrHistoryData, Storage.Entities.ApInsUpdProjMgrHistoryData>();
            CreateMap<Storage.Entities.SiteControl, Models.Response.SiteControl>();
            CreateMap<Models.Request.SiteControl, Storage.Entities.SiteControl>();


            CreateMap<Models.Request.HotcSearchFilter, Storage.Entities.HotcSearchFilter>();
            CreateMap<Storage.Entities.HotcSearchFilterResultStats, Models.Response.HotcSearchFilterResultStats>();
            CreateMap<Storage.Entities.HotcContact, Models.Response.HotcContact>();
            CreateMap<Storage.Entities.ApValidateLogNumberAndManagementData, Models.Response.ApValidateLogNumberAndManagementData>();
            CreateMap<Models.Request.ApInsUpdHotcLustData, Storage.Entities.ApInsUpdHotcLustData>();

            CreateMap<Storage.Entities.ApGetCleanDecommByHotIdData, Models.Response.ApGetCleanDecommByHotIdData>();
            CreateMap<Models.Request.ApGetCleanDecommByHotIdData, Storage.Entities.ApGetCleanDecommByHotIdData>();
            CreateMap<Storage.Entities.ServiceProvider, Models.Response.ServiceProvider>();
            CreateMap<Storage.Entities.ApLustCris, Models.Response.ApLustCris>();
        }
    }
}

