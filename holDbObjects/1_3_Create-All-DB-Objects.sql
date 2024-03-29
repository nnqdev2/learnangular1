USE [LUST]
GO
/****** Object:  StoredProcedure [dbo].[apWorkReportedBySearch]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apWorkReportedBySearch', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apWorkReportedBySearch]
GO
/****** Object:  StoredProcedure [dbo].[apUpdLUSTAffilPartyData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apUpdLUSTAffilPartyData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apUpdLUSTAffilPartyData]
GO
/****** Object:  StoredProcedure [dbo].[apUpdIncidentData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apUpdIncidentData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apUpdIncidentData]
GO
/****** Object:  StoredProcedure [dbo].[apUpdateSiteScoreData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apUpdateSiteScoreData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apUpdateSiteScoreData]
GO
/****** Object:  StoredProcedure [dbo].[apUpdAssessmentDiscoverDate]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apUpdAssessmentDiscoverDate', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apUpdAssessmentDiscoverDate]
GO
/****** Object:  StoredProcedure [dbo].[apRetrieveGeoLocIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apRetrieveGeoLocIDData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apRetrieveGeoLocIDData]
GO
/****** Object:  StoredProcedure [dbo].[apReportLUSTStatus]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apReportLUSTStatus', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apReportLUSTStatus]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRInsertIncident]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apOLPRRInsertIncident', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apOLPRRInsertIncident]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetUstLookupData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apOLPRRGetUstLookupData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apOLPRRGetUstLookupData]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetLustLookupData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apOLPRRGetLustLookupData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apOLPRRGetLustLookupData]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetIncidents]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apOLPRRGetIncidents', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apOLPRRGetIncidents]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetIncidentDataByID]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apOLPRRGetIncidentDataByID', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apOLPRRGetIncidentDataByID]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRCheckPostalCountyData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apOLPRRCheckPostalCountyData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apOLPRRCheckPostalCountyData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdWorkReportedData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdWorkReportedData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdWorkReportedData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdSiteControlData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdSiteControlData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdSiteControlData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdSiteAliasData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdSiteAliasData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdSiteAliasData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPublicNoticeData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdPublicNoticeData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdPublicNoticeData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdProjMgrHistoryData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdProjMgrHistoryData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdProjMgrHistoryData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPictureData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdPictureData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdPictureData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPCSPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdPCSPermitData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdPCSPermitData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPcsPcsPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdPcsPcsPermitData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdPcsPcsPermitData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPCSData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdPCSData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdPCSData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPCSAndPCSPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdPCSAndPCSPermitData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdPCSAndPCSPermitData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdManagementData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdManagementData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdManagementData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdLUSTAffilPartyData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdLUSTAffilPartyData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdLUSTAffilPartyData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdIncidentData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdIncidentData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdIncidentData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdConsultantData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdConsultantData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdConsultantData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdAssessmentSiteScoreRangeData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdAssessmentSiteScoreRangeData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdAssessmentSiteScoreRangeData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdAssessmentData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsUpdAssessmentData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdAssessmentData]
GO
/****** Object:  StoredProcedure [dbo].[apInsLUSTAffilPartyData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsLUSTAffilPartyData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsLUSTAffilPartyData]
GO
/****** Object:  StoredProcedure [dbo].[apInsertOLPRRDownloadData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apInsertOLPRRDownloadData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsertOLPRRDownloadData]
GO
/****** Object:  StoredProcedure [dbo].[apGetWorkReportedByWrIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetWorkReportedByWrIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetWorkReportedByWrIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetWorkReportedByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetWorkReportedByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetWorkReportedByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteControlsByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetSiteControlsByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetSiteControlsByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteControlBySCIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetSiteControlBySCIDData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetSiteControlBySCIDData]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteAliasBySiteNameAliasIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetSiteAliasBySiteNameAliasIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetSiteAliasBySiteNameAliasIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteAliasByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetSiteAliasByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetSiteAliasByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetScoringValuesByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetScoringValuesByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetScoringValuesByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetScoringRangeData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetScoringRangeData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetScoringRangeData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPublicNoticeByPNIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPublicNoticeByPNIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPublicNoticeByPNIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPublicNoticeByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPublicNoticeByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPublicNoticeByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetProjMgrHistoryByPMHIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetProjMgrHistoryByPMHIDData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetProjMgrHistoryByPMHIDData]
GO
/****** Object:  StoredProcedure [dbo].[apGetProjMgrHistoryByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetProjMgrHistoryByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetProjMgrHistoryByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSPermitByPCSIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPCSPermitByPCSIDData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPCSPermitByPCSIDData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPcsPcsPermitByPcsIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPcsPcsPermitByPcsIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPcsPcsPermitByPcsIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSByPCSIDDataCombined]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPCSByPCSIDDataCombined', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPCSByPCSIDDataCombined]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSByPCSIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPCSByPCSIDData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPCSByPCSIDData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPCSByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPCSByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPartyGridByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPartyGridByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPartyGridByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetPartyByFirstLastOrgNameData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetPartyByFirstLastOrgNameData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetPartyByFirstLastOrgNameData]
GO
/****** Object:  StoredProcedure [dbo].[apGetOLPRRLookupTables]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetOLPRRLookupTables', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetOLPRRLookupTables]
GO
/****** Object:  StoredProcedure [dbo].[apGetLustSearchData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLustSearchData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLustSearchData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesWorkReported]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesWorkReported', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesWorkReported]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesSiteControlData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesSiteControlData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesSiteControlData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesPublicNoticeData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesPublicNoticeData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesPublicNoticeData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesPCS]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesPCS', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesPCS]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesNewIncidentData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesNewIncidentData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesNewIncidentData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesIncidentTabData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesIncidentTabData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesIncidentTabData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesContactsTabData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesContactsTabData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesContactsTabData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesConsultants]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesConsultants', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesConsultants]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesByTypeData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesByTypeData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesByTypeData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesByType]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesByType', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesByType]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesAssesementTabData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLookupTablesAssesementTabData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLookupTablesAssesementTabData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLogNumber]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetLogNumber', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLogNumber]
GO
/****** Object:  StoredProcedure [dbo].[apGetInspectionByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetInspectionByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetInspectionByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetInspectionByInspectionIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetInspectionByInspectionIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetInspectionByInspectionIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetIncidentByIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetIncidentByIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetIncidentByIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetImageByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetImageByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetImageByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetImageByIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetImageByIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetImageByIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetImageAllByLustID]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetImageAllByLustID', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetImageAllByLustID]
GO
/****** Object:  StoredProcedure [dbo].[apGetCountyIdAndNameFromZP4Fips]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetCountyIdAndNameFromZP4Fips', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetCountyIdAndNameFromZP4Fips]
GO
/****** Object:  StoredProcedure [dbo].[apGetConsultantsData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetConsultantsData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetConsultantsData]
GO
/****** Object:  StoredProcedure [dbo].[apGetConsultantByIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetConsultantByIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetConsultantByIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentSiteScoreValuesRangesByLustId]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetAssessmentSiteScoreValuesRangesByLustId', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetAssessmentSiteScoreValuesRangesByLustId]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentSiteScoreValuesByLustId]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetAssessmentSiteScoreValuesByLustId', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetAssessmentSiteScoreValuesByLustId]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetAssessmentByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetAssessmentByLustIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentAllByLustId]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetAssessmentAllByLustId', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetAssessmentAllByLustId]
GO
/****** Object:  StoredProcedure [dbo].[apGetAffilByIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apGetAffilByIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetAffilByIdData]
GO
/****** Object:  StoredProcedure [dbo].[apDltWorkReportedData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltWorkReportedData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltWorkReportedData]
GO
/****** Object:  StoredProcedure [dbo].[apDltSiteScoreData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltSiteScoreData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltSiteScoreData]
GO
/****** Object:  StoredProcedure [dbo].[apDltSiteControlData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltSiteControlData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltSiteControlData]
GO
/****** Object:  StoredProcedure [dbo].[apDltPublicNoticeData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltPublicNoticeData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltPublicNoticeData]
GO
/****** Object:  StoredProcedure [dbo].[apDltProjMgrHistoryData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltProjMgrHistoryData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltProjMgrHistoryData]
GO
/****** Object:  StoredProcedure [dbo].[apDltPictureData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltPictureData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltPictureData]
GO
/****** Object:  StoredProcedure [dbo].[apDltPCSPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltPCSPermitData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltPCSPermitData]
GO
/****** Object:  StoredProcedure [dbo].[apDltPCSData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltPCSData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltPCSData]
GO
/****** Object:  StoredProcedure [dbo].[apDltConsultantData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltConsultantData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltConsultantData]
GO
/****** Object:  StoredProcedure [dbo].[apDltAllPCSData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltAllPCSData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltAllPCSData]
GO
/****** Object:  StoredProcedure [dbo].[apCreateIncidentData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apCreateIncidentData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apCreateIncidentData]
GO
/****** Object:  StoredProcedure [dbo].[apChkLITProcessStatus]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apChkLITProcessStatus', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apChkLITProcessStatus]
GO

/****** Object:  StoredProcedure [dbo].[apDltLUSTContactByAffilIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
IF OBJECT_ID('apDltLUSTContactByAffilIDData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apDltLUSTContactByAffilIDData]
GO

/****** Object:  StoredProcedure [dbo].[apGetCrisCheckByLustIdData]    Script Date: 7/11/2019 1:34:36 PM ******/
IF OBJECT_ID('apGetCrisCheckByLustIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].apGetCrisCheckByLustIdData
GO

/****** Object:  StoredProcedure [dbo].[apGetProjectManagerData]    Script Date: 7/11/2019 4:23:57 PM ******/
IF OBJECT_ID('apGetProjectManagerData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetProjectManagerData]
GO

/****** Object:  StoredProcedure [dbo].[apReportIncidentCleanUpCntData]    Script Date: 7/23/2019 1:12:15 PM ******/
IF OBJECT_ID('apReportIncidentCleanUpCntData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apReportIncidentCleanUpCntData]
GO

/****** Object:  StoredProcedure [dbo].[apReportIncidentFinalInvcRqstCntData]    Script Date: 7/23/2019 1:19:20 PM ******/
IF OBJECT_ID('apReportIncidentFinalInvcRqstCntData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apReportIncidentFinalInvcRqstCntData]
GO





IF OBJECT_ID('vwCRISPartyData', 'V') IS NOT NULL
DROP VIEW [dbo].[vwCRISPartyData]
GO





/*

		RECREATE LUST USER
*/

/****** Object:  User [LUSTUser]    Script Date: 4/10/2019 12:44:28 PM ******/
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'LUSTUser')
	DROP USER [LUSTUser]
GO
/****** Object:  User [LUSTUser]    Script Date: 4/10/2019 12:44:28 PM ******/
CREATE USER [LUSTUser] FOR LOGIN [lustuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [LUSTUser]
GO



/*

	Views create starts
*/

USE [LUST]
GO

/****** Object:  View [dbo].[vwCRISPartyData]    Script Date: 7/16/2019 11:50:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create  VIEW [dbo].[vwCRISPartyData]
AS

/************************************************************************************
***	Name:    vwCRISParty
***	Author:  Lewis Lo	Date: 03/14/2005
********************************* DESCRIPTION ***************************************
***     
***	1.	CRIS Affiliation/Party View.
***	2.	This view is copied from ADDR Database(ADDR.dbo.vCRISAffilParty).
***                                                     	  	    
***    	Modification:
***    	Date	   Initials	Details
***    	--------   --------	-----------------------------------------------------
***	03/16/05   llo		Add new columns in CRIS.dbo.ResponsibleParty.
***	03/21/05   llo		Remove output field (TaxID).
***	05/02/05   llo		Remove LegalNm and Add SubOrg;
***				Remove ISNULL() function.
***	05/17/05   llo		Add AffilID.
************************************************************************************/

SELECT  ProjectID			= Affil.fkPgmRefID,
	AffilID				= Affil.AffilID,
	AffilType			= Affil.fkAffilType,
	PartyID				= cntct.fkPartyID,
	ResponsiblePartyID		= cris.ResponsiblePartyID,
	Organization			= CASE org.IsIndv WHEN 0 THEN org.OrgNm
					  ELSE '' END, 
	FirstName			= cp.FName, 
	MI				= cp.MI,
	LastName			= cp.LName, 
	SubOrg				= cp.SubOrg,
	Phone				= cp.PhoneNbr1, 
	Phone2				= cp.PhoneNbr2, 
	Email				= cp.eMailAddr,
	Street				= ma.Address1,
	City				= ma.City, 
	ZIP				= ma.ZIP, 
        State				= ma.State, 
	Country				= ma.Country,
	AffilStartDate			= Affil.StartDt,
	AffilEndDate			= Affil.EndDt,
	AffilComments			= Affil.Comments,
	GenerateLiquidatedInvoices	= cris.GenerateLiquidatedInvoices,
	GeneratePastDueNotices		= cris.GeneratePastDueNotices,
	GenerateAssessments		= cris.GenerateAssessments,
	ToDateReceivableCutOffDate	= cris.ToDateReceivableCutoffDate,
	ToDateExpenditureAmount		= cris.ToDateExpenditureAmount,
	ToDateInvoicedExpenditureAmount	= cris.ToDateInvoicedExpenditureAmount,
	ToDateAssessmentsAmount		= cris.ToDateAssessmentsAmount,
	TransactionAppliedAmount	= cris.TransactionAppliedAmount,
	FixedInvoicePercent		= cris.FixedInvoicePercent,
	GracePeriod			= cris.GracePeriod,
	AssessmentInterestRate		= cris.AssessmentInterestRate,
	LustId						= CRIS.dbo.Project.LustId,
	LogNumber					= LUST.dbo.Incident.LogNumber
FROM    ADDR.dbo.CRISAffilCntcts cntct
INNER JOIN AGENCY.dbo.Affiliation affil
	ON cntct.fkAffilID = Affil.AffilID 
INNER JOIN ADDR.dbo.AffilContacts agcnt
        ON agcnt.fkPgmRefID = cntct.fkPartyID 
       AND agcnt.fkCntctCd  = 'R' 
INNER JOIN ADDR.dbo.ContactPerson cp
	ON agcnt.fkCntctPerID = cp.CntctPerID 
LEFT OUTER JOIN ADDR.dbo.MailAddress ma
	ON agcnt.fkAddrID = ma.AddrID 
INNER JOIN ADDR.dbo.Organization org
	ON cp.fkOrgID = org.OrgID
INNER JOIN CRIS.dbo.ResponsibleParty cris
	ON affil.AffilID = cris.fkAffilID
INNER JOIN CRIS.dbo.Project 
	ON affil.fkPgmRefID = CRIS.dbo.Project.ProjectID
INNER JOIN LUST.dbo.Incident 
	ON CRIS.dbo.Project.ProjectId = Lust.dbo.Incident.LustId 



GO

GRANT SELECT ON LUST.dbo.vwCRISPartyData TO LUSTUSER; 




/*

	Stored Procedure create starts

*/

USE [LUST]
GO

/****** Object:  StoredProcedure [dbo].[apReportIncidentFinalInvcRqstCntData]    Script Date: 7/23/2019 1:20:08 PM ******/

/*
** ObjectName: [dbo].[apReportIncidentFinalInvcRqstCntData] 
**
** Company Name: DEQ. A.Patra
**
** Description:	
** Notes:IDEA: 
** 
**
** Revision History:
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  Date        	Name        			Description
**  07/22/2019		aguedea					Created
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  
*/


-------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[apReportIncidentFinalInvcRqstCntData]
	 @Region  AS VARCHAR(254) = 'ALL',
	 @RegulatedTank AS INTEGER = 0,
	 @FinalInvcRqstBeginDate AS VARCHAR(254)= '',
     @FinalInvcRqstEndingDate AS VARCHAR(254)= ''
AS


--------------------------------



SELECT DISTINCT c.REGION, c.COUNTY_NAME, COUNT(i.LustId) AS CountyCount
FROM dbo.incident i
LEFT JOIN lust.dbo.management m ON i.LustId = m.LustId
JOIN agency.dbo.Counties c ON i.LogNbrCounty = 
	   CASE WHEN LEN(CAST(c.COUNTY_CODE AS VARCHAR)) = 1 THEN
		'0' + CAST(c.COUNTY_CODE AS VARCHAR)
	   ELSE 
		CAST(c.COUNTY_CODE AS VARCHAR)
	   END 


WHERE ( c.Region NOT IN ( '???') 
AND (@Region = 'ALL') OR ((ISNULL(c.REGION,'') = @Region)  AND @Region != 'ALL')
AND   ((@FinalInvcRqstBeginDate = '') OR (m.FinalInvcRqstDate >= CAST(@FinalInvcRqstBeginDate AS DATETIME)) AND (@FinalInvcRqstBeginDate != '')) 	
AND   ((@FinalInvcRqstEndingDate = '') OR (m.FinalInvcRqstDate  <= CAST(@FinalInvcRqstEndingDate AS DATETIME)) AND (@FinalInvcRqstEndingDate != ''))
		AND i.lustid not in (select x.lustid from lust.dbo.incident x where x.FileStatusId = 3 )
AND (@RegulatedTank = 1 AND i.RegulatedTankInd = 1
	OR @RegulatedTank = 0))

GROUP BY c.REGION, c.COUNTY_NAME ORDER BY c.REGION, c.COUNTY_NAME   

GO


GRANT EXECUTE ON [dbo].[apReportIncidentFinalInvcRqstCntData]TO [LUSTUser] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[apReportIncidentFinalInvcRqstCntData]TO [access1] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[apReportIncidentFinalInvcRqstCntData]TO [ZSQL Developers] AS [dbo]
GO





/****** Object:  StoredProcedure [dbo].[apReportIncidentCleanUpCntData]    Script Date: 7/23/2019 1:12:54 PM ******/
/*
** ObjectName: [dbo].[dbo.apReportIncidentCleanUpCntData] 
**
** Company Name: DEQ. aguedea
**
** Description:	
** Notes:IDEA: 
** 
**
** Revision History:
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  Date        	Name        			Description
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  07/18/2019	    aguedea        		        Initial Creation

exec apReportIncidentCleanUpCntData 'ER', 0, '01/01/1990', '07/18/2019'

*/

---------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[apReportIncidentCleanUpCntData]
	 @Region  AS VARCHAR(254) = 'ALL',
	 @RegulatedTank AS INTEGER = 0,
	 @CleanupStartBeginDate AS VARCHAR(254) = '',
     @CleanupStartEndingDate AS VARCHAR(254) = ''
AS

--------------------------------

SELECT DISTINCT
	       c.REGION,
	       c.COUNTY_NAME,
		   count(i.LustId) as CountyCount
from dbo.incident i
left join lust.dbo.management m
on i.LustId = m.LustId
join agency.dbo.Counties c
on i.LogNbrCounty = 
case 
when len(cast(c.COUNTY_CODE as varchar)) = 1 THEN
	'0' + cast(c.COUNTY_CODE as varchar)
else 
	cast(c.COUNTY_CODE as varchar)
end 
WHERE ( c.Region NOT IN ( '???') 
AND (@Region = 'ALL') OR ((ISNULL(c.REGION,'') = @Region)  AND @Region != 'ALL')
AND    (@CleanupStartBeginDate = '' OR (m.CleanupStartDate >= CAST( @CleanupStartBeginDate AS DATETIME)) 
AND (@CleanupStartBeginDate  != ''))
AND    (@CleanupStartEndingDate = '' OR (m.CleanupStartDate <= CAST(@CleanupStartEndingDate AS DATETIME)) 
AND (@CleanupStartEndingDate != ''))
AND (@RegulatedTank = 1 AND i.RegulatedTankInd = 1
	OR @RegulatedTank = 0)
AND i.lustid NOT IN (SELECT x.lustid FROM lust.dbo.incident x WHERE x.FileStatusId = 3 )
)
GROUP BY c.REGION, c.COUNTY_NAME ORDER BY c.REGION, c.COUNTY_NAME  

GO

GRANT EXECUTE ON [dbo].[apReportIncidentCleanUpCntData] TO [LUSTUser] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[apReportIncidentCleanUpCntData] TO [access1] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[apReportIncidentCleanUpCntData] TO [ZSQL Developers] AS [dbo]
GO



/****** Object:  StoredProcedure [dbo].[apGetProjectManagerData]    Script Date: 7/11/2019 4:23:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
apGetProjectManagerData

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
  7/11/2019		aguedea			Created
 -----------------------------------------------------------------------------------------------------------

 exec apGetProjectManagerData
  -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetProjectManagerData] 

AS
	BEGIN

		SELECT PmLogin, PmName FROM ProjectManager
		
	END

GO

GRANT EXECUTE ON [dbo].[apGetProjectManagerData] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apGetCrisCheckByLustIdData]    Script Date: 7/11/2019 2:13:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
 -----------------------------------------------------------------------------------------------------------
apGetCrisCheckByLustIdData


 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
  7/11/2019		aguedea			Created
 -----------------------------------------------------------------------------------------------------------

 exec [dbo].[apGetCrisCheckByLustIdData] 28382
  exec [dbo].[apGetCrisCheckByLustIdData] 2395

  exec [dbo].[apGetCrisCheckByLustIdData] 2396
  exec [dbo].[apGetCrisCheckByLustIdData] 2394
  exec [dbo].[apGetCrisCheckByLustIdData] 2393

  28382
 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetCrisCheckByLustIdData]
	@LustId  int 
AS



IF EXISTS(SELECT  *
	
FROM    ADDR.dbo.CRISAffilCntcts cntct
INNER JOIN AGENCY.dbo.Affiliation affil
	ON cntct.fkAffilID = Affil.AffilID 
INNER JOIN CRIS.dbo.Project 
	ON affil.fkPgmRefID = CRIS.dbo.Project.ProjectID
INNER JOIN LUST.dbo.Incident 
	ON CRIS.dbo.Project.ProjectId = Lust.dbo.Incident.LustId 
WHERE Project.LustId = @LustId)

SELECT @LustId as LustId, 1 AS CrisExists
ELSE 
SELECT @LustId as LustId, 0 AS CrisExists
GO

GRANT EXECUTE ON [dbo].[apGetCrisCheckByLustIdData] TO [LUSTUser] AS [dbo]
GO





/****** Object:  StoredProcedure [dbo].[apDltLUSTContactByAffilIDData]    Script Date: 6/5/2019 6:03:01 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[apDltLUSTContactByAffilIDData](
		@AffilID				Integer		= 0,
		@LastChangeBy			VARCHAR(64),
		@ErrorMessageHandler	VarChar(1024)	= '' OUTPUT,
		@Result					Bit				= 0  OUTPUT
)
AS 
/*************************************************************************************
***	Name:    apDltLUSTContactByAffilID  		   
***	Author:  Lewis Lo	Date: 09/28/2004        	   
*********************************** DESCRIPTION **************************************
***                                                     		    
***	1.	Delete an existing LUST Affiliation record by specifying an
***		Affiliation ID.
***	2.	Corresponding Party record(s) may be deleted too if it is only 
***		referenced by the being deleted Affiliation.
***	3.	Corresponging Contact Person / Mailing Address / Organization 
***		record(s) may also be deleted if they are only referenced by 
***		the specified Affiliation.
***	4.	The following tables are updated:
***		-	AGENCY.dbo.Affiliation
***		-	ADDR.dbo.LUSTAffilCntcts
***		-	ADDR.dbo.AffilParty
***		-	ADDR.dbo.AffilContacts                                                     		    
***		-	ADDR.dbo.ContactPerson
***		-	ADDR.dbo.MailAddress                               		    
***		-	ADDR.dbo.Organization
***	5.	This stored procedure is modified from the following:
***		-	SWIFT.dbo.apDelAffilByAffil                     		    
***
***	Input:	@AffilID
***		
***	Output:	@ErrMsg
***		@Result	 (1 = Success;	0 = Failure)
***				
***					    
***	Modification:
***	Date	   Initials	Details
***	--------   --------	----------------------------------------------------
***

Find AffilID  == >
SELECT  i.LogNumber, af.fkPgmRefId AS LustId, af.AffilId, af.fkAffilType, af.fkPgmInt, cp.*
FROM    ADDR.dbo.LUSTAffilCntcts uaf
INNER JOIN AGENCY.dbo.Affiliation Af
	ON uaf.fkAffilID = Af.AffilID 
INNER JOIN AGENCY.dbo.AffilTypes aft
	ON Af.fkPgmInt    = aft.fkPgmInt
       AND Af.fkAffilType = aft.AffilTypeCd
INNER JOIN ADDR.dbo.AffilContacts ac
        ON ac.fkPgmRefID = uaf.fkPartyID 
       AND ac.fkCntctCd  = 'R' 
INNER JOIN ADDR.dbo.ContactPerson cp
	ON ac.fkCntctPerID = cp.CntctPerID 
LEFT JOIN LUST.dbo.Incident i ON i.LustId = af.fkPgmRefId
WHERE cp.Lname = 'Test'							---- <<<<< FILTER ON contactperson.lname and fname



DECLARE @AffilID INT, @LastChangeBy VARCHAR(64), @ErrorMessageHandler VARCHAR(1024), @Result BIT
SET @AffilID = 453368
SET @LastChangeBy = 'aguedea'


EXEC [apDltLUSTContactByAffilIDData] @AffilID, @LastChangeBy, @ErrorMessageHandler OUTPUT, @Result OUTPUT
SELECT @ErrorMessageHandler, @Result


************************************************************************************/

BEGIN
	SET NOCOUNT ON

	DECLARE @ErrNum 	Integer, 
		@RowNum 	Integer,
		@SysErr		Integer,
		@PgmRef		VarChar(10),
		@AffilTypeDesc	VarChar(15),
		@PartyID	Integer,
		@PartyUsg	Integer,
		@AffilCntctID 	Integer,
		@OrgID 	 	Integer,
		@CntctPerID	Integer,
		@MailAddrID	Integer,
		@ReqDelParty	Bit,
 		@ReqDelCntctPer Bit,
		@ReqDelMailAddr Bit,
		@ReqDelOrg	Bit,
		@StaffID	Integer,
		@Dummy		Integer,
		@LUST		VarChar(4),
		@RESPARTY	Char(1),
		@NOW		DateTime,
		@TRUE		Bit,
		@FALSE		Bit
	SELECT  @ErrNum 	= 0, 
		@RowNum 	= 0,
		@SysErr		= 0,
		@PgmRef		= '',
		@AffilTypeDesc	= '',
		@PartyID	= 0,
		@PartyUsg	= 0,
		@AffilCntctID 	= 0,
		@OrgID 	 	= 0,
		@CntctPerID	= 0,
		@MailAddrID	= 0,
		@ReqDelParty	= 0,
 		@ReqDelCntctPer = 0,
		@ReqDelMailAddr = 0,
		@ReqDelOrg	= 0,
		@StaffID	= 0,
		@Dummy		= 0,
		@Result		= 0,
		@LUST		= 'LUST',
		@RESPARTY	= 'R',
		@NOW		= GETDATE(),
		@TRUE		= 1,
		@FALSE		= 0

--   	1.	Validates input parameters...
--	1(a).	If Affiliation Type is invalid, don't need to continue...

	IF (@AffilID IS NULL) OR (@AffilID = 0)
	BEGIN
		SET @ErrorMessageHandler = 'Affiliation ID is missing.'
		GOTO ExitRtn
	END

--	1(c).	If Affiliation not found, don't continue...

	SELECT 	@PartyID	= B.fkPartyID
	FROM AGENCY.dbo.Affiliation A
	LEFT OUTER JOIN ADDR.dbo.LUSTAffilCntcts B
		ON A.AffilID = B.fkAffilID
	WHERE A.AffilID     = @AffilID
	  AND A.fkPgmInt    = @LUST
	SELECT @ErrNum = @@ERROR, @RowNum = @@ROWCOUNT
	IF @ErrNum <> 0
		GOTO ExitRtn

	IF @RowNum = 0
	BEGIN
		SET @ErrorMessageHandler = 'Affiliation record ('
			       + CAST(@AffilID AS VarChar(8))
			       + ') is not found.'
		GOTO ExitRtn
	END

--	2.	Count Party record usage and determine whether the
--		Agency-wide Responsible Party record should be deleted...

	IF @PartyID IS NULL
		GOTO FindEmpIDRtn

	SELECT  @PartyUsg = COUNT(fkAffilID)
	FROM ADDR.dbo.LUSTAffilCntcts 
	WHERE fkPartyID =  @PartyID
	  AND fkAffilID <> @AffilID
	SELECT @ErrNum = @@ERROR
	IF @ErrNum <> 0
		GOTO ExitRtn

	IF @PartyUsg > 0
		GOTO DelRecRtn

	EXEC @ErrNum = ADDR.dbo.bpChkDelPartyRec  @AffilID,
						  @PartyID,
						  @ReqDelParty OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
		SELECT @ErrNum = @SysErr

	IF @ErrNum <> 0
		GOTO ExitRtn
	
--	3.	If Party record need to be deleted, require to check whether
--		Organization / Contact Person / Mailing Address record(s) is
--		required to delete too...

	IF @ReqDelParty = @FALSE
		GOTO DelRecRtn

	EXEC @ErrNum = ADDR.dbo.bpChkDelCntctRec @LUST,
						 @PartyID,
						 @RESPARTY,
						 @AffilCntctID 	 OUTPUT,
						 @OrgID 	 OUTPUT,
						 @CntctPerID	 OUTPUT,
						 @MailAddrID	 OUTPUT,
				 		 @ReqDelCntctPer OUTPUT,
						 @ReqDelMailAddr OUTPUT,
						 @ReqDelOrg	 OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @ErrNum = 0
		GOTO FindEmpIDRtn

	IF @ErrNum = 58001
		SET @ErrorMessageHandler = 'Affiliation Contact record for Party ID#'
			       + CAST(@PartyID AS VarChar(8)) + ' not found.'
	GOTO ExitRtn

--	4.	Find StaffID of login user...

FindEmpIDRtn:
	-- EXEC @ErrNum = AGENCY.dbo.apGetUserEmpID @StaffID OUTPUT
	SELECT @StaffID = EMP_ID
	FROM HRIS.dbo.vActiveEmpTbl
	WHERE NT_LOGIN = @LastChangeBy

	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	--SET @ErrorMessageHandler = @LastChangeBy + ' ' + Convert(varchar, @Staffid)
	--GOTO ExitRtn

	IF ISNULL(@StaffID, 0) != 0 
		GOTO DelRecRtn
	
	SET @ErrorMessageHandler = 'Employee ID not found with NT Login ID.'
	GOTO ExitRtn

--	5.	Everything looks good, delete record(s) from the databases...
--	5(a).	Delete ASB Affiliation Contacts record...

DelRecRtn:
	BEGIN TRAN
		IF @PartyID IS NULL
			GOTO DelAffilRtn

		EXEC @ErrNum = ADDR.dbo.bpDelLUSTAffilCntcts @AffilID,
							    @PartyID,
							    @Dummy OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn

--	5(b).	Delete Affiliation record...

DelAffilRtn:
		EXEC @ErrNum = AGENCY.dbo.bpDelAffil @AffilID,
						     @Dummy OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn

--	5(c).	If Party record is only referenced by the deleted Affiliation,
--		delete Party record and Facility Contact record...

		IF @ReqDelParty = @FALSE
			GOTO SaveDBRtn

		EXEC @ErrNum = ADDR.dbo.bpDelAffilParty @PartyID,
							@StaffID,
							@Dummy OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn

--	5(d).	If Party is deleted, delete Facility Contact record as well...
	
		EXEC @ErrNum = ADDR.dbo.bpDelCntctRec 	@AffilCntctID,
							@OrgID,
							@CntctPerID,
							@MailAddrID,
							@ReqDelCntctPer,
							@ReqDelMailAddr,
							@ReqDelOrg,
							@StaffID
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn
SaveDBRtn:
	COMMIT TRAN
	SELECT @Result = @TRUE
	GOTO ExitRtn

RollbackRtn:
	ROLLBACK TRAN
ExitRtn:
	
	RETURN (@ErrNum)
END

GO

GRANT EXECUTE ON [dbo].[apDltLUSTContactByAffilIDData] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apChkLITProcessStatus]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** ObjectName: apChkLITProcessStatus
**
** Description: The following procedure returns LIT Status code and GeoLoc ID to indicate 
**				LIT process status.
**
**				LIT Tool defines the interactions between LUST and LIT by 2 process modes:
**				-	CREATE for new LUST Site; 
**				-	MOVE for update an existing LUST Site GeoLoc record
**
** Assumption:	Only one active session per @appid is allowed at any time.
**
** Input Parameters:	@AppId			-	Program + UserID
**						@GeoLocID		-	CREATE  = 0 for New LUST Site
**											MOVE	= Non-zero GeoLoc ID of an existing 
**													  LUST Site currently associated with.
**											
**
** Output Parameters:	@IsSuccess		-	1 (or TRUE)
**										- CREATE mode record is found by @appid
**										- MOVE mode record is found by @appid and @GeoLocID
**										-	0 (or FALSE)
**										- CREATE mode record is not found by @appid
**										- MOVE mode record is found by @appid and @GeoLocID
**						@RevGeoLocID	-	Zero - when @IsSuccess is FALSE
**											Non-Zero - LIT generated/found GeoLoc ID after LIT Tool 
**											process
**
** Revision History:
** ---------------------------------------------------------------------------------------------
**  Date        	Name  		Description
** ---------------------------------------------------------------------------------------------
**  10/13/2011		llo			Initial Creation
**  11/10/2011		llo			Switched to call local LIT procedure.
**
*/

CREATE PROCEDURE [dbo].[apChkLITProcessStatus]
    (
      @Appid VARCHAR(25)
    , @GeoLocID INT
    , @IsSuccess BIT OUTPUT
    , @RevGeoLocID INT OUTPUT
    )
AS 
    BEGIN
        DECLARE @ErrNum INT
 
        EXEC @ErrNum = LIT.dbo.apGetLITProcessStatus @appid, @GeoLocID,
            @IsSuccess OUTPUT, @RevGeoLocID OUTPUT
 
        RETURN @ErrNum
    END



GO
GRANT EXECUTE ON [dbo].[apChkLITProcessStatus] TO [LUSTUser] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[apChkLITProcessStatus] TO [public] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apUpdAssessmentDiscoverDate]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdAssessment
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apUpdAssessmentDiscoverDate]
      @AssessmentId  INT
	 ,@LustId		 INT
     ,@DiscoverDate  DATETIME  -- todo bdyer 11 april 2007
AS
DECLARE @Result INT
SELECT @Result = 0


-- Business Rules Validation ---------------------------------------------------------

-- Do not run this code without a pre-existing LUST ID.
IF NOT (@LustId > 0) 
       BEGIN
		RaisError('An Assessment record can''t be created without a LUST Incident.', 11,1)
		SET @Result = @@Error
		GOTO ABORT
       END


 -- todo bdyer 11 april 2007
	UPDATE [dbo].[Assessment] 
        SET
          DiscoverDate = @DiscoverDate            -- todo bdyer 11 april 2007

       WHERE    [AssessmentId] = @AssessmentId --Primary Key
 
       SELECT @Result  = @@ERROR
       IF     @Result  <> 0
              BEGIN
              GOTO ABORT
              END

       SELECT @Result  = @@ERROR
       IF     @Result  <> 0
              BEGIN
              GOTO ABORT
              END

       RETURN @Result
       

/* Or, in case of failure... */
ABORT:
      RETURN @Result






GO
GRANT EXECUTE ON [dbo].[apUpdAssessmentDiscoverDate] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apInsUpdIncidentData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdIncident
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


declare @LogNumberOUT VARCHAR(10) ,@LustIdOUT INT, @ErrorMessageHandler  Varchar(1000), @ResultSP INT


EXEC [dbo].[apInsUpdIncidentData]
9913
,8541
,24
,'1997-10-27 00:00:00.000'
,'Reasonable Richards(former'

,'120 SW HWY 22 (PREVIOUSLY 115 MAIN ST)'
,'IDANHA'
,'97350'
,'(503) 854-3621'
,0 

,1
,4
,1
,0
,0

,0
,1
,0
,0
,0

,0
,'(5/11/2017 cjb) Conditional NFA approved in 2015, waiting for new property owners (Northwest Investments) to pay off DEQ cost recovery charges before issuing NFA letter. *** SEQUENT LUST COMMENTS : ORIGINALLY REPORTED AS 115 MAIN ST; CITY CHANGED ADDRESS TO 120 SW HWY 22 (AT MAIN ST)...GAD 4/4/06. *** CR Agreement 2/24/06.  Pjt Mgr = CPJ.  Originally reported as 115 Main St; city changed address to 120 SW Hwy 22 (at Main St)...gad 4/4/06.'
,''
,'The property was used as a fuel service station and part of a lumber mill operation. Petroleum contamination was identified in October 1997 when the property owner removed one 10,000-gallon gasoline and an 8,000-gallon diesel tank. Two pump islands and most of the product lines were apparently decommissioned iwith the tanks. Following tank removal, 10 cubic yards of petroleum contaminated soil was stockpiled onsite. In March 1998, a sample from the stockpiled soil had diesel at 7,500 ppm, so it was taken to a landfill for disposal. The property owner collected a soil sample in July 1999 from 3 feet below the former diesel fuel dispenser. Diesel was 12,600 ppm and heavy oil was 23,300 ppm. Assessment in 2000 found diesel at 8,700 ppm and heavy oil at 2,550 ppm. In 2005, contractors collected four soil samples to assess diesel  contamination. At the dispensers, diesel was 58.7 ppm and heavy oil was 217 ppm, but no BTEX was detected. Contractors investigated further in 2006 and excavated soil at the tanks that did not exhibit signs of contamination. Analysis showed no petroleum, but lead (1.86 ppm) and chromium (9.98 ppm) were present. Clean soil was returned to the excavation. A detached product line was found 1-ft below surface at the west edge of the tank cavity. The line was removed and contamination in soil was not evident, but 11.3 cy PCS was removed based on previous testing. petroleum staining and odors in soil at 6 feet bgs. Excavating 35.7 cy of PCS to 14 feet bgs, groundwater was encountered. A soil and water sample  were obtained from the dispenser island excavation. Soil contained gasoline (243 ppm), diesel (5,370 ppm), and PAHs (anthracene at 0.259 ppm and phenanthrene at 0.813 ppm). Chromium (14.7 ppm) and lead (1.97 ppm) were also detected. No VOCs were in soil but the groundwater sample had gasoline at 1,240 ppb, diesel at 1,100,000 ppb, anthracene at 5.76 ppb, and phenanthrene at 14.1 ppb. There was no documentation in the report that contractors had purged the pit before collecting the water sample. In 2010 and 2012, contractors completed additional investigation attempting to confirm soil and groundwater contamination. Results found some petroleum remaining in soil, though groundwater was not encountered in borings. DEQ asked for follow-up testing in 2013 due to inconsistent sample data. Based on likely future use of the site, DEQ agreed to conditional closure, requiring certain precautions for occupants or construction workers.'
,23784

,0
,'1997-10-27 00:00:00.000'
,7788
,'1997-10-25 00:00:00.000'
,'1997-10-25 00:00:00.000'

,NULL 
,NULL 
,'2006-02-24 00:00:00.000' 
,'CRA signed by Marvin Walker 2/24/2006 3333'
'aguedea'
,@LogNumberOUT OUTPUT

,@LustIdOUT OUTPUT
,@ErrorMessageHandler  OUTPUT
,@ResultSP OUTPUT

SELECT @LogNumberOut, @LustIdOut, @ErrorMessageHandler, @ResultSp



 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apInsUpdIncidentData]
	 @LustIdIN INTEGER 
	,@FacilityId INTEGER = NULL
	,@CountyId INTEGER
	,@ReceivedDate DATETIME
	,@SiteName VARCHAR(40)

	,@SiteAddress VARCHAR(40)
	,@SiteCity VARCHAR(20)
	,@SiteZip VARCHAR(5)
	,@SitePhone VARCHAR(25)
	,@NoValidAddress BIT

	,@SiteTypeId INTEGER
	,@FileStatusId INTEGER
	,@RegTankInd BIT
	,@HotInd BIT
	,@NonRegTankInd BIT

	,@BrownfieldCodeId INTEGER
	,@PropertyTranPendingInd BIT
    ,@ProgramTransferInd BIT
	,@HotAuditRejectInd BIT
    ,@ActiveReleaseInd BIT

    ,@OptionLetterSentInd BIT
    ,@SiteComment VARCHAR(8000)
	,@SeeAlsoComment VARCHAR(8000)
    ,@PublicSummaryComment VARCHAR(2500)
	,@GeolocId INTEGER

	,@OlprrId INTEGER
	,@DiscoverDate DATETIME
	--,@ManagementIdIn  int   
	--,@CleanupStartDt datetime 
	--,@ReleaseStopDt datetime = NULL 

	--,@FinalInvcRqstDt datetime = NULL 
	--,@ClosedDt datetime = NULL 
	--,@LetterOfAgreementDt datetime = NULL 
	--,@LetterOfAgreementComment varchar(8000) = NULL 
	,@LastChangeBy VARCHAR(64)
	,@LogNumberOUT VARCHAR(10) OUTPUT
	,@LustIdOUT INTEGER OUTPUT

	,@ErrorMessageHandler VARCHAR(1024) OUTPUT
	,@ResultSP INT OUTPUT



	

AS

SET XACT_ABORT ON


DECLARE @_Result INTEGER
       ,@_FacilityIdCheck INTEGER
       ,@_PreviousSiteCounty VARCHAR(2)
       ,@_PreviousReceivedDateYear VARCHAR(4)
       ,@_SiteCounty VARCHAR(2)           --<< use this value for table LogNbrCounty inserts.
       ,@_strLogNumber VARCHAR(10)
       ,@_SystemChar2DigitYear VARCHAR(2)
       ,@_InputChar2DigitYear VARCHAR(2)  --<< use this value for table LogNbrYear inserts.      
       ,@_NewLogNumberSeq INTEGER
       ,@_NewLogNumberSeqChar VARCHAR(4)  --<< use this value for table LogNbrSeq inserts.
       ,@_LogNbrYearHasChanged BIT
	   ,@AssessmentID INT
	   ,@ManagementIdOut INT

-- initialize working variables
SELECT @_Result = 0
      ,@_FacilityIdCheck = 0 
      ,@_PreviousSiteCounty = ''
      ,@_PreviousReceivedDateYear = '' 
      ,@_strLogNumber = ''
      ,@_SystemChar2DigitYear = ''
      ,@_InputChar2DigitYear = ''
      ,@_NewLogNumberSeq = 0
      ,@_NewLogNumberSeqChar = ''
      ,@_LogNbrYearHasChanged = 0
	  ,@ManagementIdOut = 0
-- ---------------------------------------------------------------------------------
-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @ReceivedDate = CAST(CONVERT(varchar(8), @ReceivedDate, 112) as datetime)

SELECT @_Result = @@ERROR
IF @_Result <> 0
   BEGIN
   GOTO ABORT
   END 


-- ---------------------------------------------------------------------------------
-- TURN INCOMING COUNTY VALUE INTO A CHAR, AND FRONT-PAD WITH A ZERO WHEN NECESSARY
SELECT @_SiteCounty = CAST(@CountyId AS varchar(2))
IF LEN(@_SiteCounty) = 1
   BEGIN
   SELECT @_SiteCounty = '0' +  @_SiteCounty
   END

SELECT @_Result  = @@ERROR
IF @_Result  <> 0
   BEGIN
   GOTO ABORT
   END


-- ---------------------------------------------------------------------------------
-- 21 March 2005 B.Dyer
-- Business Rules Validation 
/*
        '1. Cant DELETE Received date.
        '2. Received date not > today.
        '3. Can't DELETE the SiteName.

        todo bdyer 18 apr 2006: disable this check.
        '4. If Regulated Tank is checked, there must be a -valid- Facility ID.

        '5. Can't set County to zero
        '6. There must be a Street, and a City, and a County, and a Zip value,
        '   -or- the No Valid Address must be checked.
        '
        '7. RegulatedTankInd OR HotInd OR NonRegTankInd must be checked... one of them.
*/


--Received Date can't be null
IF (@ReceivedDate IS NULL)
    BEGIN
    SET @ErrorMessageHandler = 'Can''t DELETE Received Date.'
    SET @_Result = @@Error
    GOTO ABORT
    END 

--Received Date can't be > today
IF (@ReceivedDate > getdate())
    BEGIN
    SET @ErrorMessageHandler = 'Received Date cannot be greater than today.'
    SET @_Result = @@Error
    GOTO ABORT
    END 

--Site Name can't be null
IF (LEN(RTRIM(@SiteName)) = 0)
    BEGIN
    SET @ErrorMessageHandler = 'cannot DELETE Site Name.'
    SET @_Result = @@Error
    GOTO ABORT
    END 

--  todo bdyer 18 apr 2006: disable this check.
--If Regulated Tank is selected, there must be a  Facility ID
/*
IF ((@RegTankInd = 1) AND (@FacilityId IS NULL))
     BEGIN
     RAISERROR('If regulated Tank, must have a Facility Id.', 11,1) 
     SET @_Result = @@Error
     GOTO ABORT
     END 
*/

-- In-Coming FACILITY ID must exist in the UST database.
/*SELECT @_FacilityIdCheck = (SELECT COUNT(*) FROM UST.dbo.Facility where FacilityId = @FacilityId)
IF   @_FacilityIdCheck = 0
     BEGIN
     RAISERROR('Entered Facility Id does not exist in the UST database.', 11,1) 
     SET @_Result = @@Error
     GOTO ABORT
     END */


-- If Regulated Tank is selected, there must be a Facility ID value, and it must be valid 
-- in the UST database.


-- todo bdyer 28 dec 2006
-- remove this requirement.
-- a Reg Tank w/o a Facility Id is now acceptable.

-- IF ((@RegTankInd = 1) AND (@FacilityId IS NOT NULL)) <-- original
IF ((@RegTankInd = 1) AND ((@FacilityId IS NOT NULL) AND (@FacilityId > 0) ))

   BEGIN
   SELECT @_FacilityIdCheck = (SELECT COUNT(*) FROM UST.dbo.Facility where FacilityId = @FacilityId)
   IF   @_FacilityIdCheck = 0
        BEGIN
        --RaisError('Entered Facility Id does not exist in the UST database.', 11, 1)
		SET @ErrorMessageHandler = 'Entered Facility Id does not exist in the UST database.'
        SET @_Result = @@Error
		SET @ResultSP = -1
        GOTO ABORT
        END 
   END

--County can't be null
IF   @CountyId IS NULL
     BEGIN
     SET @ErrorMessageHandler = 'County must be selected.'
     SET @_Result = @@Error
     GOTO ABORT
     END 

-- Must be an Address-City-County-Zip combination, or No Valid Address must be checked.
IF ((LEN(RTRIM(@SiteAddress)) = 0)OR
   (@SiteCity IS NULL) OR
   (@SiteZip IS NULL) OR
   (@CountyId IS NULL))AND
   (@NoValidAddress <> 1)
     
    BEGIN
    SET @ErrorMessageHandler = 'Address, City, County, and Zip - or - No Valid Address, must be selected.'
    SET @_Result = @@Error
    GOTO ABORT 
    END 


--  RegulatedTankInd OR HotInd OR NonRegTankInd must be checked... one of them.

IF ((@RegTankInd <> 1) AND (@HotInd <> 1) AND (@NonRegTankInd <> 1))
    BEGIN
    SET @ErrorMessageHandler = 'Regulated, Non-Regulated, or Heating Oil Tank must be selected.'
    SET @_Result = @@Error
    GOTO ABORT 
    END 


---  END VALIDATION--------------------------------------------------------------------------------







---------------------------------------------------------------------------------------------------
/*
  LOG NUMBER CREATE -or- UPDATE SECTION

  THE FOLLOWING CODE BLOCK DOES THE FOLLOWING:

  1. Create a Log Number value for a new (INSERT) Lust Incident,
     based upon the input County and input ReceivedDate YEAR value.
  2. Update an existing Incident's Log Number value if the County value changes.
     This affects dbo.Incident.LogNumber
                  dbo.Incident.LogNbrCounty
  3. Update an existing Incident's Log Number value if the ReceivedDate YEAR value changes.
     This affects dbo.Incident.LogNumber
                  dbo.Incident.LogNbrYear
                  dbo.Incident.LogNbrSeq
*/

---------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------
-- CREATE NEW LOG NUMBER

IF @LustIdIN  = 0 

   BEGIN 
   -- Get system year, converted to char and chopped to last 2 positions.
   SELECT @_SystemChar2DigitYear = SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR(4)),3,2)
   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END


	  


   -- Get Input year, converted to char and chopped to last 2 positions.
   SELECT @_InputChar2DigitYear = SUBSTRING(CAST(DATEPART(YEAR, @ReceivedDate) AS VARCHAR(4)),3,2)
   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END




   -- System Year and Received Date Year the same or different?
   -- Same Year: INSERT into Sequence Nbr table, retrieve new Identity Seed value.
   -- Different Year: Get max Sequence Nbr for that year, and add one to it.
   IF @_InputChar2DigitYear = @_SystemChar2DigitYear

      --PRINT 'INSERT CHECK 1 SAME YEAR'

      BEGIN
		INSERT INTO LUST.dbo.LogNbrSequence (HoldingTank) VALUES ('X')
		SELECT @_Result = @@ERROR
		IF @_Result <> 0
			 BEGIN
				GOTO ABORT
			END

		SELECT @_NewLogNumberSeq = SCOPE_IDENTITY()



	         
		SELECT @_Result = @@ERROR
		IF @_Result <> 0
			BEGIN
				GOTO ABORT
			 END
     END

   ELSE
      -- OTHER YEAR THAN CURRENT. GET MAX VALUE, AND ADD ONE TO IT.
      BEGIN



      SELECT @_NewLogNumberSeq = (SELECT MAX(CONVERT(INT, LogNbrSeq )) 
                                 FROM LUST.dbo.INCIDENT 
                                 WHERE LogNbrYear = @_InputChar2DigitYear)
      SELECT @_Result = @@ERROR
      IF @_Result <> 0
	 BEGIN
	 GOTO ABORT
         END

      SELECT @_NewLogNumberSeq = (@_NewLogNumberSeq + 1)
      SELECT @_Result = @@ERROR
      IF @_Result <> 0
	 BEGIN
	 GOTO ABORT
	 END

 

      END
   END 
-- END OF "CREATE NEW LOG NUMBER"

---------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------
-- UPDATE EXISTING LOG NUMBER
-- WHEN COUNTY OR YEAR VALUES ARE MODIFIED.

IF @LustIdIN  > 0 

BEGIN

-- UPDATE COUNTY CHECK
   SELECT @_PreviousSiteCounty = (SELECT LogNbrCounty FROM dbo.Incident WHERE LustId = @LustIdIN)
   SELECT @_strLogNumber = (SELECT LogNumber FROM dbo.Incident WHERE LustId = @LustIdIN)

   IF (@_PreviousSiteCounty <> @_SiteCounty) -- I NEED TO UPDATE THE LOG NUMBER.
       BEGIN

       UPDATE [dbo].[Incident] 
       SET LogNumber = @_SiteCounty + SUBSTRING(@_strLogNumber, 3,8),
           LogNbrCounty = @_SiteCounty
       WHERE LustId = @LustIdIN  
 
       SELECT @_strLogNumber = (SELECT LogNumber FROM dbo.Incident WHERE LustId = @LustIdIN)

       END 

---------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------
-- UPDATE YEAR CHECK


SELECT @_PreviousReceivedDateYear = (SELECT substring(convert(varchar(10),datepart(year,ReceivedDate)),3,2) 
                                     FROM dbo.Incident WHERE LustId = @LustIdIN)

   SELECT @_InputChar2DigitYear = SUBSTRING(CAST(DATEPART(YEAR, @ReceivedDate) AS VARCHAR(4)),3,2)	

  -- HAS A RECEIVED DATE YEAR VALUE CHANGE OCCURED?



   IF (@_InputChar2DigitYear <> @_PreviousReceivedDateYear)

   BEGIN 


      -- WHEN A RECEIVED DATE YEAR VALUE CHANGE HAS OCCURED:
      -- IS THE NEW VALUE THE CURRENT YEAR, OR ANOTHER YEAR?
      -- 
      -- "CURRENT OR OTHER YEAR" CHECK 

  

      IF @_InputChar2DigitYear <> @_SystemChar2DigitYear

         -- "OTHER YEAR" ACTIVITY 
         BEGIN
			SELECT @_NewLogNumberSeq = (SELECT MAX(CONVERT(INT, LogNbrSeq )) 
                                    FROM LUST.dbo.INCIDENT 
                                    WHERE LogNbrYear = @_InputChar2DigitYear)
			SELECT @_Result = @@ERROR
			IF @_Result <> 0
				BEGIN
					GOTO ABORT
				END
	
			SELECT @_NewLogNumberSeq = (@_NewLogNumberSeq + 1)
			SELECT @_Result = @@ERROR
			IF @_Result <> 0
				BEGIN
					GOTO ABORT
				END
         END

      ELSE     -- "CURRENT YEAR" ACTIVITY  
         BEGIN

			INSERT INTO LUST.dbo.LogNbrSequence (HoldingTank) VALUES ('X')

			SELECT @_Result = @@ERROR
			IF @_Result <> 0
				BEGIN
					GOTO ABORT
				END
	
			SELECT @_NewLogNumberSeq = SCOPE_IDENTITY()
			SELECT @_Result = @@ERROR
			IF @_Result <> 0
			BEGIN
				GOTO ABORT
			END

		END  

    SET @_LogNbrYearHasChanged = 1
    END

END

-------END OF YEAR UPDATE CHECK -------------------------------------------------------------------



---------------------------------------------------------------------------------------------------
-- IF NEW LOG NUMBER IS CREATED,
-- OR EXISTING LOG NUMBER YEAR UPDATED, FORMAT THE NEW LOG NUMBER.
IF ((@LustIdIN = 0) OR (@_LogNbrYearHasChanged = 1))
   
   BEGIN

	

   -- Convert Integer Sequence Number to CHAR.
   SELECT @_NewLogNumberSeqChar = CONVERT(VARCHAR(4),@_NewLogNumberSeq)
   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END


   -- Ensure that CHAR Sequence Number is length of 4.
   SELECT @_NewLogNumberSeqChar = 
	CASE 
	WHEN (LEN(RTRIM(@_NewLogNumberSeqChar)) = 1) THEN '000'+ @_NewLogNumberSeqChar
	WHEN (LEN(RTRIM(@_NewLogNumberSeqChar)) = 2) THEN '00'+ @_NewLogNumberSeqChar
	WHEN (LEN(RTRIM(@_NewLogNumberSeqChar)) = 3) THEN '0'+ @_NewLogNumberSeqChar
        ELSE @_NewLogNumberSeqChar
        END 

   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END

   -- Put new Log Number together.
   SELECT @_strLogNumber = @_SiteCounty + '-' + @_InputChar2DigitYear + '-' + @_NewLogNumberSeqChar
   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END
   END

---------------------------------------------------------------------------------------------------   




---------------------------------------------------------------------------------------------------

-- IF LOG NUMBER YEAR - SEQ UPDATE, DO ALL RELATED INCIDENT TABLE LOG NUMBER FIELD UPDATES NOW. 
IF @_LogNbrYearHasChanged = 1 -- THIS WILL ONLY HAPPEN DURING AN UPDATE OF COUNTY OR RECEIVED DATE.
 
   BEGIN 
   UPDATE [dbo].[Incident] 
   SET LogNumber =    @_strLogNumber
      --,LogNbrCounty = @_SiteCounty
      ,LogNbrYear =   @_InputChar2DigitYear
      ,LogNbrSeq =    @_NewLogNumberSeqChar
   WHERE LustId =     @LustIdIN
   END 

---------------------------------------------------------------------------------------------------
-- END OF "PROCESS LOG NUMBER" CODE BLOCK
-- ------------------------------------------------------------------



-----------------------------------------------------------------------
-- INSERT / UPDATE SECTION.
-----------------------------------------------------------------------


IF @LustIdIN  = 0 --Primary Key 
   BEGIN
   INSERT INTO [dbo].[Incident] 
       -- DB identity seed will create new LustId
	(
	 LogNumber
    ,LogNbrCounty      
    ,LogNbrYear
    ,LogNbrSeq
	,FacilityId
	,ReceivedDate
	,CreateDate
	,SiteName
	,SiteAddress
	,SiteCity
 	,SiteZip
	,SitePhone
	,NoValidAddress
	,SiteTypeId
	,FileStatusId
	,RegulatedTankInd
	,HotInd
	,NonRegTankInd
	,BrownfieldCodeId
  	,PropertyTranPendingInd
    ,ProgramTransferInd
    ,HotAuditRejectInd
    ,ActiveReleaseInd
    ,OptionLetterSentInd
	,SiteComment
	,SeeAlsoComment
    ,PublicSummaryComment   
	,GeolocId        -- 22 sep 2005 after talking with Beccy: Geoloc Id is created stand-alone.
                                 -- i should make this - if desired, before i run this process, so it's available when i get here..
                                 -- for the moment, ignore to get up and running!
	,OlprrId
	,LastChangeBy
	,LastChangeDate
	) 
    VALUES 
        (
	 @_strLogNumber
        ,@_SiteCounty 
        ,@_InputChar2DigitYear 
        ,@_NewLogNumberSeqChar 
	,@FacilityId
	,@ReceivedDate
	,GETDATE()
	,@SiteName
	,@SiteAddress
	,@SiteCity
	,@SiteZip
	,@SitePhone
	,@NoValidAddress
	,@SiteTypeId
	,@FileStatusId
	,@RegTankInd 
	,@HotInd
	,@NonRegTankInd
	,@BrownfieldCodeId
	,@PropertyTranPendingInd
 	,@ProgramTransferInd
	,@HotAuditRejectInd
    ,@ActiveReleaseInd
    ,@OptionLetterSentInd 
	,@SiteComment
	,@SeeAlsoComment
    ,@PublicSummaryComment      
	,@GeolocId
	,@OlprrId
    --,Substring(dbo.fn_CurrentUserName(SUSER_SNAME()), 1, 7)
	,@LastChangeBy
	,GETDATE()
	)
	
   SELECT @_Result  = @@ERROR
   SET @ErrorMessageHandler = Error_Message()



   IF     @_Result  <> 0
          BEGIN
          GOTO ABORT
          END

   SELECT @LustIdOUT = SCOPE_IDENTITY() --@@IDENTITY --GET THE NEW IDENTITY SEED VALUE! Primary Key  
   SELECT @_Result  = @@ERROR
   IF     @_Result  <> 0
          BEGIN
          GOTO ABORT
          END	

   END  --<<< END OF INSERT ROUTINE.

ELSE    -- <<<<<<<<<<<<< -- BEGIN UPDATE ROUTINE
   BEGIN   
        
   UPDATE [dbo].[Incident] 
   SET
	FacilityId = @FacilityId 
   ,ReceivedDate = @ReceivedDate 
   ,SiteName = @SiteName 
   ,SiteAddress = @SiteAddress 
   ,SiteCity = @SiteCity 
   ,SiteZip = @SiteZip 
   ,SitePhone = @SitePhone 
   ,NoValidAddress = @NoValidAddress
   ,SiteTypeId = @SiteTypeId 
   ,FileStatusId = @FileStatusId 
   ,RegulatedTankInd = @RegTankInd
   ,HotInd = @HotInd 
   ,NonRegTankInd = @NonRegTankInd
   ,BrownfieldCodeId = @BrownfieldCodeId 
   ,PropertyTranPendingInd = @PropertyTranPendingInd 
   ,ProgramTransferInd = @ProgramTransferInd
   ,HotAuditRejectInd = @HotAuditRejectInd 
   ,ActiveReleaseInd = @ActiveReleaseInd
   ,OptionLetterSentInd = @OptionLetterSentInd
   ,SiteComment = @SiteComment
   ,SeeAlsoComment = @SeeAlsoComment 
   ,PublicSummaryComment = @PublicSummaryComment -- TODO BDYER 30 MAY 2007 
   ,GeolocId = @GeolocId 
   ,OlprrId = @OlprrId 
   ,LastChangeBy = @LastChangeBy -- dbo.fn_CurrentUserName(SUSER_SNAME())
   ,LastChangeDate = GETDATE() 
    WHERE LustId = @LustIdIN --Primary Key

    SELECT @_Result  = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
    IF     @_Result  <> 0
           BEGIN
           GOTO ABORT
           END

    SELECT @LustIdOUT = @LustIdIN --Primary Key  
    SELECT @_Result  = @@ERROR
    IF     @_Result  <> 0
           BEGIN
           GOTO ABORT
           END	

	/*

	Assessment.DiscoveryDate is a nullable column, however, UI forces the update only upon a DiscoveryDate Change.
	The UI will also not allow the DiscoveryDate to be removed (Set to NULL).  Older records contain null values.

	*/	

		SELECT @AssessmentID = AssessmentId FROM Assessment WHERE LustId = @LustIdIN
		BEGIN
			IF @DiscoverDate IS NOT NULL AND @AssessmentID IS NOT NULL
				BEGIN
					EXEC dbo.apUpdAssessmentDiscoverDate
						@AssessmentID
						,@LustIdIN
						,@DiscoverDate -- todo bdyer 11 april 2007

				END
		END


		--EXEC apInsUpdManagementData
		-- @ManagementIdIn  
		--,@ManagementIdOut OUTPUT
		--,@LustIdIn
		--,@CleanupStartDt 
		--,@ReleaseStopDt 
		--,@FinalInvcRqstDt 
		--,@ClosedDt 
		--,@LetterOfAgreementDt 
		--,@LetterOfAgreementComment 
		--,@LastChangeBy
		--,@ErrorMessageHandler OUTPUT

		--IF ISNULL(@ErrorMessageHandler, '') != ''		
		--	BEGIN
		--		GOTO ABORT
		--	END

		

    END --<<< END OF UPDATE ROUTINE.

-- LogNumber Output set by either INSERT or UPDATE

SELECT @LogNumberOUT = @_strLogNumber
SELECT @_Result  = @@ERROR
IF     @_Result  <> 0
   BEGIN
   GOTO ABORT
   END	

-- EXIT STORED PROCEDURE WITH SUCCESS VALUE
RETURN @_Result


ABORT:
-- EXIT STORED PROCEDURE WITH ERROR VALUE

RETURN @_Result


GO
GRANT EXECUTE ON [dbo].[apInsUpdIncidentData] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apInsUpdAssessmentData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdAssessment
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
SELECT * FROM assessment where assessmentid = 51265

declare @ErrorMessageHandler VARCHAR(1024)
EXEC apInsUpdAssessmentData 51265, 51265, 51846, NULL, 1
					,1, 3, 1, 0, 0
					,0, 0, 1, 0, 0
					,0, 1, 0, 0, 0
					,0, 1, 0, 0, 1
					,0, 0, 1, 1, 0
					,0, 1, 1, 0, 0
					,0, 1, 0, 0, 460
					,NULL, NULL, 'agueda', @ErrorMessageHandler OUTPUT

select * FROM debugtable
truncate table debugtable
 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apInsUpdAssessmentData]
     @AssessmentIdIN int 
	,@AssessmentIdOUT int OUTPUT --Primary Key
	,@LustId int
    ,@DiscoverDate datetime  -- todo bdyer 11 april 2007
	,@ConfirmationId int

	,@DiscoveryId int
	,@ReleaseCauseId int
	,@ReleaseSourceId int    -- todo bdyer 11 april 2007
	,@SLMediaInd bit
	,@GWMediaInd bit

	,@SWMediaInd bit
	,@DWMediaInd bit
	,@FVMediaInd bit
	,@FPMediaInd bit
	,@UNMediaInd bit
	
	,@UGContamInd bit
	,@LGContamInd bit
	,@MGContamInd bit
	,@DSContamInd bit
	,@WOContamInd bit

	,@LBContamInd bit
	,@SVContamInd bit
	,@OPContamInd bit
	,@CHContamInd bit
	,@UNContamInd bit

	,@MTBEContamInd bit
	,@HOContamInd bit
	,@CleanupNecessaryInd bit
	,@OffSiteMigrationInd bit
	,@FPRemovedInd bit

	,@VPRemovedInd bit
	,@DelineateSL bit
	,@DelineateGW bit
	,@SLDelineated bit
	,@GWDelineated bit

	,@GWCompMonitoring bit
	,@CAPRequested bit
	,@CAPSubmitted bit
	,@CAPApproved bit
    ,@CurrentSiteScore int

	,@AmntRelCmnt varchar(8000)
	,@ContamCmnt varchar(8000)
	,@LastChangeBy VARCHAR(64)
	,@ErrorMessageHandler VARCHAR(1024) OUTPUT

AS

DECLARE @Result int
SELECT @Result = 0





-- Business Rules Validation ---------------------------------------------------------


-- Do not run this code without a pre-existing LUST ID.
IF NOT (@LustId > 0) 
       BEGIN
       SET @ErrorMessageHandler = 'An Assessment record can''t be created without a LUST Incident.'
       SET @Result = @@Error
       GOTO ABORT
       END


 -- todo bdyer 11 april 2007


--A Discovery, Cause of Release, Source of Release, and Confirmation value must be present.
IF NOT ((@ConfirmationId > 0) AND (@DiscoveryId > 0) AND (@ReleaseCauseId > 0) AND (@ReleaseSourceId > 0))
       BEGIN
       SET @ErrorMessageHandler = 'A Discovery, Cause of Release, Source of Release, and Confirmation value must exist.'
       SET @Result = @@Error
       GOTO ABORT
       END


-- One or more Medias must be selected
-- Media VALUES COULD BE 1, 0 OR NULL.
IF ((@SLMediaInd <> 1) AND
    (@GWMediaInd <> 1) AND
    (@SWMediaInd <> 1) AND
	(@DWMediaInd <> 1) AND
	(@FVMediaInd <> 1) AND
	(@FPMediaInd <> 1) AND
	(@UNMediaInd <> 1))
        BEGIN
        SET @ErrorMessageHandler = 'One or more Medias must be selected.'
        Set @Result = @@Error
        GoTo ABORT
        END



-- One or more Contaminants must be selected
-- Contaminant VALUES COULD BE 1, 0 OR NULL.
IF ((@UGContamInd <> 1) AND
	(@LGContamInd <> 1) AND
	(@MGContamInd <> 1) AND
	(@DSContamInd <> 1) AND
	(@WOContamInd <> 1) AND
	(@LBContamInd <> 1) AND
	(@SVContamInd <> 1) AND
	(@OPContamInd <> 1) AND
	(@CHContamInd <> 1) AND
	(@UNContamInd <> 1) AND
	(@MTBEContamInd <> 1) AND
	(@HOContamInd <> 1))
        BEGIN
        SET @ErrorMessageHandler = 'One or more Contaminants must be selected.'
        Set @Result = @@Error
        GoTo ABORT
        END



-----------------------------------------------------------------------------------------




IF @AssessmentIdIn  = 0 --Primary Key 
	BEGIN
	
	INSERT INTO [dbo].[Assessment] 
		(
		 [LustId]
        ,DiscoverDate       -- todo bdyer 11 april 2007
		,[ConfirmationId]
		,[DiscoveryId]
		,[ReleaseCauseId]

        ,ReleaseSourceId    -- todo bdyer 11 april 2007
		,[SLMediaInd]
		,[GWMediaInd]
		,[SWMediaInd]
		,[DWMediaInd]

		,[FVMediaInd]
		,[FPMediaInd]
		,[UNMediaInd]
		,[UGContamInd]
		,[LGContamInd]

		,[MGContamInd]
		,[DSContamInd]
		,[WOContamInd]
		,[LBContamInd]
		,[SVContamInd]

		,[OPContamInd]
		,[CHContamInd]
		,[UNContamInd]
		,[MTBEContamInd]
		,[HOContamInd]

		,[CleanupNecessaryInd]
		,[MigrationInd]
		,[FPRemovedInd]
		,[VPRemovedInd]
		,[DelineateSL]

		,[DelineateGW]
		,[SLDelineated]
		,[GWDelineated]
		,[GWCompMonitoring]
		,[CAPRequested]

		,[CAPSubmitted]
		,[CAPApproved]
        ,CurrentSiteScore
		,[AmntReleaseComment] 
		,[ContamComment]

		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @LustId
        ,@DiscoverDate
    	,@ConfirmationId
		,@DiscoveryId
		,@ReleaseCauseId

        ,@ReleaseSourceId
		,@SLMediaInd
		,@GWMediaInd
		,@SWMediaInd
		,@DWMediaInd

		,@FVMediaInd
		,@FPMediaInd
		,@UNMediaInd
		,@UGContamInd
		,@LGContamInd

		,@MGContamInd
		,@DSContamInd
		,@WOContamInd
		,@LBContamInd
		,@SVContamInd

		,@OPContamInd
		,@CHContamInd
		,@UNContamInd
		,@MTBEContamInd
		,@HOContamInd

		,@CleanupNecessaryInd
		,@OffSiteMigrationInd
		,@FPRemovedInd
		,@VPRemovedInd
		,@DelineateSL

		,@DelineateGW
		,@SLDelineated
		,@GWDelineated
		,@GWCompMonitoring
		,@CAPRequested

		,@CAPSubmitted
		,@CAPApproved
        ,@CurrentSiteScore
		,@AmntRelCmnt
		,@ContamCmnt

		,@LastChangeBy
		,GETDATE() 
		)
        SELECT @Result  = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
        IF     @Result  <> 0
               BEGIN
               GOTO ABORT
               END

	SELECT @AssessmentIdOut = SCOPE_IDENTITY() --scope_identity()
	
	SELECT @Result = @@ERROR
	IF     @Result <> 0
           BEGIN
	       GOTO ABORT
           END 

	END    -- END OF INSERT ROUTINE.

ELSE           -- BEGIN UPDATE ROUTINE
	BEGIN


	UPDATE [dbo].[Assessment] 
        SET
          DiscoverDate = @DiscoverDate            -- todo bdyer 11 april 2007

		,[ConfirmationId] = @ConfirmationId 
		,[DiscoveryId] = @DiscoveryId 
		,[ReleaseCauseId] = @ReleaseCauseId 

        ,ReleaseSourceId = @ReleaseSourceId      -- todo bdyer 11 april 2007

		,[SLMediaInd] = @SLMediaInd 
		,[GWMediaInd] = @GWMediaInd 
		,[SWMediaInd] = @SWMediaInd 
		,[DWMediaInd] = @DWMediaInd 
		,[FVMediaInd] = @FVMediaInd 
		,[FPMediaInd] = @FPMediaInd 
		,[UNMediaInd] = @UNMediaInd 
		,[UGContamInd] = @UGContamInd 
		,[LGContamInd] = @LGContamInd 
		,[MGContamInd] = @MGContamInd 
		,[DSContamInd] = @DSContamInd 
		,[WOContamInd] = @WOContamInd 
		,[LBContamInd] = @LBContamInd 
		,[SVContamInd] = @SVContamInd 
		,[OPContamInd] = @OPContamInd 
		,[CHContamInd] = @CHContamInd 
		,[UNContamInd] = @UNContamInd 
		,[MTBEContamInd] = @MTBEContamInd 
		,[HOContamInd] = @HOContamInd 
		,[CleanupNecessaryInd] = @CleanupNecessaryInd 
		,[MigrationInd] = @OffSiteMigrationInd
		,[FPRemovedInd] = @FPRemovedInd 
		,[VPRemovedInd] = @VPRemovedInd 
		,[DelineateSL] = @DelineateSL 
		,[DelineateGW] = @DelineateGW 
		,[SLDelineated] = @SLDelineated 
		,[GWDelineated] = @GWDelineated 
		,[GWCompMonitoring] = @GWCompMonitoring 
		,[CAPRequested] = @CAPRequested 
		,[CAPSubmitted] = @CAPSubmitted 
		,[CAPApproved] = @CAPApproved 
                ,CurrentSiteScore = @CurrentSiteScore
		,[AmntReleaseComment] =  @AmntRelCmnt
		,[ContamComment] = @ContamCmnt
		,[LastChangeBy] = @LastChangeBy
		,[LastChangeDate] = GETDATE() 
       WHERE    [AssessmentId] = @AssessmentIdIn --Primary Key
 
       SELECT @Result  = @@ERROR
	   SET @ErrorMessageHandler = Error_Message()
       IF     @Result  <> 0
              BEGIN
              GOTO ABORT
              END

       SELECT @AssessmentIdOut = @AssessmentIdIn --Primary Key  

       SELECT @Result  = @@ERROR
	   SET @ErrorMessageHandler = Error_Message()
       IF     @Result  <> 0
              BEGIN
              GOTO ABORT
              END

       RETURN @Result
       END 

/* Or, in case of failure... */
ABORT:
      RETURN @Result




GO
GRANT EXECUTE ON [dbo].[apInsUpdAssessmentData] TO [LUSTUser] AS [dbo]
GO


/****** Object:  StoredProcedure [dbo].[apUpdateSiteScoreData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[apUpdateSiteScoreData] 
(
   @LustId					INT
  ,@CurrentSiteScore		INT				OUTPUT
  ,@ErrorMessageHandler		VARCHAR(1024)	OUTPUT
  ,@LowScore				INT				OUTPUT 
  ,@AvgScore				INT				OUTPUT
  ,@HighScore				INT				OUTPUT 
  ,@ScoreCount				INT				OUTPUT	
  ,@ScoreRange				CHAR(10)        OUTPUT 

)

AS

--BEGIN TRAN trnCreateScore

DECLARE 

@errorvalue int
      ,@MediaValue       INT
      ,@MediaScore       INT
      ,@ContamValue      INT
      ,@ContamScore      INT
      ,@OffSiteValue     INT
      ,@OffSiteScore     INT
      ,@ScoreSelection   INT
      ,@ScoreValue       INT
	  ,@_CurrentScore	 INT
	  ,@_TotalScoreSumm int
      ,@_AvgLow int
      ,@_AvgHigh int 
      ,@_FullHighRange int 
      ,@_HighRange20 int 
      ,@_HighRange40 int 
      ,@_HighRange60 int 
      ,@_HighRange80 int 
      ,@_HighRange100 int 

--Initialize
select @errorvalue = 0
      ,@CurrentSiteScore = 0
      ,@MediaValue = 0
      ,@MediaScore = 0
      ,@ContamValue = 0
      ,@ContamScore = 0
      ,@OffSiteValue = 0
      ,@OffSiteScore = 0
      ,@ScoreSelection = 0
      ,@ScoreValue = 0

-- --------------------------------------------------------------------------------
--
-- Step #1 Check 6 Media values in dbo.Assessment - accumulate Score accordingly
--
-- --------------------------------------------------------------------------------

-- Media Drinking Water
select @MediaValue = (Select DWMediaInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @MediaValue = 1
        BEGIN
	Select   @MediaScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 1 and CategoryItemId = 1)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @MediaScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END

-- Media Surface Water
select @MediaValue = (Select SWMediaInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @MediaValue = 1
        BEGIN
	Select   @MediaScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 1 and CategoryItemId = 2)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @MediaScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END

-- Media Ground Water
select @MediaValue = (Select GWMediaInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @MediaValue = 1
        BEGIN
	Select   @MediaScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 1 and CategoryItemId = 3)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @MediaScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END

-- Media Soil
select @MediaValue = (Select SLMediaInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @MediaValue = 1
        BEGIN
	Select   @MediaScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 1 and CategoryItemId = 4)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @MediaScore
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END

-- Media Free Vapor
select @MediaValue = (Select FVMediaInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @MediaValue = 1
        BEGIN
	Select   @MediaScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 1 and CategoryItemId = 5)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @MediaScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END

-- Media Free Product
select @MediaValue = (Select FPMediaInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @MediaValue = 1
        BEGIN
	Select   @MediaScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 1 and CategoryItemId = 6)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @MediaScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- -------------------------------------------------------------------------------------
--
-- Step #2 Check 12 Contaminant values in dbo.Assessment - accumulate Score accordingly
--
-- -------------------------------------------------------------------------------------

-- Contaminant Unleaded Gas
select @ContamValue = (Select UGContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 1)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Leaded Gas
select @ContamValue = (Select LGContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 2)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Miscelaneous Gas
select @ContamValue = (Select MGContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 3)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Diesel
select @ContamValue = (Select DSContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 4)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END

-- Contaminant Waste Oil
select @ContamValue = (Select WOContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 5)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Lubricant
select @ContamValue = (Select LBContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 6)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Solevant
select @ContamValue = (Select SVContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 7)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant "Other Petroleum"
select @ContamValue = (Select OPContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK) 
	                        where CategoryId = 2 and CategoryItemId = 8)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Chemical
select @ContamValue = (Select CHContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 9)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END

-- TODO BDYER 1 APRIL 2006 MTBE SWAP-OUT
-- Contaminant Other
select @ContamValue = (Select MTBEContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 11)
		Select @errorvalue = @@ERROR 
			SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Unknown
select @ContamValue = (Select UNContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 12)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- Contaminant Heating Oil
select @ContamValue = (Select HOContamInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @ContamValue = 1
        BEGIN
	Select  @ContamScore = (select CategoryItemScore 
	                        from SiteScoringElements WITH (NOLOCK)
	                        where CategoryId = 2 and CategoryItemId = 6)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @ContamScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END



-- --------------------------------------------------------------------------------------------
--
-- Step #3 Check Off-Site Migration Indicator in dbo.Assessment - accumulate Score accordingly
--
-- --------------------------------------------------------------------------------------------
 
select @OffSiteValue = (Select MigrationInd from LUST.dbo.Assessment WITH (NOLOCK) WHERE LUSTID = @LustId)
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

if @OffSiteValue = 1
        BEGIN
	Select  @OffSiteScore = (select CategoryItemScore 
	                         from SiteScoringElements WITH (NOLOCK)
	                         where CategoryId = 3 and CategoryItemId = 1)
         Select @errorvalue = @@ERROR 
		 SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn

	Select  @CurrentSiteScore = @CurrentSiteScore + @OffSiteScore
        Select @errorvalue = @@ERROR 
		SET @ErrorMessageHandler = Error_Message()
        if @errorvalue > 0 goto ExitReturn
        END


-- ------------------------------------------------------------------------------------------------------
--
-- Step #4 Check 13 Site-specific Scoring Values in dbo.SiteScoringValues - accumulate Score accordingly
--
-- ------------------------------------------------------------------------------------------------------

-- DRINKING WATER REPLACEMENT
select @ScoreSelection = (select ISNULL(DwReplMeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)

       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 4 --> "DWREPL" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END


-- DRINKING WATER IMPACT
select @ScoreSelection = (select ISNULL(DwImpmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 5 --> "DWIMP" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END


-- DRINKING WATER IMPACT LIKELY
select @ScoreSelection = (select ISNULL(DwImpLiklymeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)

       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 6 --> "DWLKY" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END


-- VAPOR LEVEL
select @ScoreSelection = (select ISNULL(VprLvlmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)

       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 7 --> "VPLVL" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END


-- POPULATION EXPOSED
select @ScoreSelection = (select ISNULL(PopExposdmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)

       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 8 --> "POPSIZE" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END



-- ENVIRONMENT TYPE
select @ScoreSelection = (select ISNULL(EnvTypmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)

       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 9 --> "ENVTYP" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END



-- ENVIRONMENT IMPACT LIKELY
select @ScoreSelection = (select ISNULL(EnvImpLilelymeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 10 --> "ENVLKLY" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END



-- NON DRINKING WATER TYPE
select @ScoreSelection = (select ISNULL(NonDwSupTypmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 11 --> "NONDWTYP" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END



-- TO BE DETERMINED!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--
 --	[NonDwSupTypMediaScore] [int] NULL ,




-- UTILITY IMPACT
select @ScoreSelection = (select ISNULL(UtImpmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 12 --> "UTIMP" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END



-- ANNUAL RAINFALL
select @ScoreSelection = (select ISNULL(RainfallAnnualmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 13 --> "RAINAN" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END


-- SOIL PERMIABILITY
select @ScoreSelection = (select ISNULL(SoilPermmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 14 --> "SLPERM" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END


-- AQUIFER DEPTH
select @ScoreSelection = (select ISNULL(AqfrDepthmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements
                                where  CategoryId = 15 --> "AQDPTH" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END


-- SURFACE WATER DISTANCE
select @ScoreSelection = (select ISNULL(SwDistmeasure,0) from LUST.dbo.SiteScoreValues WITH (NOLOCK) WHERE LUSTID = @LustId)
       Select @errorvalue = @@ERROR 
	   SET @ErrorMessageHandler = Error_Message()
       if @errorvalue > 0 goto ExitReturn

       if @ScoreSelection > 0
       BEGIN
          Select @ScoreValue = (select CategoryItemScore
                                from   LUST.dbo.SiteScoringElements WITH (NOLOCK)
                                where  CategoryId = 16 --> "AQDPTH" 
                                and    CategoryItemId = @ScoreSelection)

          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn

          Select @CurrentSiteScore = @CurrentSiteScore + @ScoreValue
          Select @errorvalue = @@ERROR 
		  SET @ErrorMessageHandler = Error_Message()
          if @errorvalue > 0 goto ExitReturn
       END





UPDATE dbo.Assessment
SET    CurrentSiteScore = @CurrentSiteScore
WHERE  LustId = @LustId

Select @errorvalue = @@ERROR 
SET @ErrorMessageHandler = Error_Message()
if @errorvalue > 0 
   BEGIN
   
   --ROLLBACK TRAN trnCreateScore
   goto ExitReturn

   END

--COMMIT TRAN trnCreateScore

  -- Current Score
 SET @_CurrentScore =  (select CurrentSiteScore from Assessment where LustId = @Lustid)
       -- Lowest Score  -->OUTPUT #1
SELECT @LowScore = MIN(CurrentSiteScore), @HighScore = MAX(CurrentSiteScore), @_TotalScoreSumm = SUM(CurrentSiteScore), @ScoreCount = COUNT(*)
FROM Assessment
-- Average of all Scores  -->OUTPUT #2
SET @AvgScore = (@_TotalScoreSumm / @ScoreCount)
-- Establish AVERAGE high - low range - 100 point spread.    
SET @_AvgLow = (@AvgScore - 50)
SET @_AvgHigh = (@AvgScore + 50)

/*
establish the ranges
then compare current score - set text value accordingly
*/
SET @_FullHighRange = (@HighScore - @_AvgHigh)
SET @_HighRange20 = (@_AvgHigh + (@_FullHighRange * .2))
SET @_HighRange40 = (@_AvgHigh + (@_FullHighRange * .4))
SET @_HighRange60 = (@_AvgHigh + (@_FullHighRange * .6))
SET @_HighRange80 = (@_AvgHigh + (@_FullHighRange * .8))
SET @_HighRange100 = @_FullHighRange


IF @_CurrentScore < @_AvgLow
   SET @ScoreRange = 'LOW'

IF ((@_CurrentScore >= @_AvgLow) AND (@_CurrentScore <= @_AvgHigh))
   SET @ScoreRange = 'AVERAGE'

IF ((@_CurrentScore > @_AvgHigh) AND (@_CurrentScore <= @_HighRange20 ))
   SET @ScoreRange = 'HIGH20'

IF ((@_CurrentScore > @_HighRange20) AND (@_CurrentScore <= @_HighRange40 ))
   SET @ScoreRange = 'HIGH40'

IF ((@_CurrentScore > @_HighRange40) AND (@_CurrentScore <= @_HighRange60 ))
   SET @ScoreRange = 'HIGH60'

IF ((@_CurrentScore > @_HighRange60) AND (@_CurrentScore <= @_HighRange80 ))
   SET @ScoreRange = 'HIGH80'

IF (@_CurrentScore > @_HighRange80) 
   SET @ScoreRange = 'HIGH100'

SELECT @LowScore AS 'LowScore', @AvgScore AS 'AvgScore', @HighScore AS 'HighScore', @ScoreCount AS 'ScoreCount',@ScoreRange AS 'ScoreRange', @LustId AS 'LustId'


ExitReturn:

return @errorvalue







GO
GRANT EXECUTE ON [dbo].[apUpdateSiteScoreData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apReportLUSTStatus]    Script Date: 6/11/2019 5:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

truncate table debugtable
go

*/

-- -----------------------------------------------------------------------------
-- Name: apReportLUSTStatus
-- Description: DEQ OnLine Petroleum Release reporting:
--                     This Stored Procedure 

-- Called from:  OlprrEntry.asp
--
-- Company: Oregon DEQ
-- Author:  B.Dyer
-- Date:    Jan 16 2002
--
-- Revision history: 
-- date    name    description
--
-- 6-4-02, L.Shaver, added email formating
-- 06-11-2019	aguedea			removed redundant email address for developers
--




CREATE PROCEDURE [dbo].[apReportLUSTStatus]
(

-- ORIGINAL PARAMETER STACK
-- Incident Site data
-- Deq Office for  E-Mail Notification
	 @LUSTId					INT,
	 @OlprrID					INT,
	 @EmailSubject				VARCHAR(255),
	 @EmailRecipients			VARCHAR(255),
	 @EmailBody					VARCHAR(255)
          
 )
 AS


DECLARE 

--	@LustID				INT = 32461, -- 34876,
	@CRLF				VARCHAR(2) = CHAR(13) + CHAR(10),
	@TAB				CHAR(1) = CHAR(9),
	@body				VARCHAR(4096) = '',
	@ErrNum				INT,
	-- Report_Data Variables
	@ReportedBy			VARCHAR(50),
	@CompanyName		VARCHAR(50),
	@ReportedByPhone	VARCHAR(25),
	@ReportedByEmail	VARCHAR(64),
	@SiteAddress		VARCHAR(80),
	@SiteName			VARCHAR(40),
	@SiteCounty			VARCHAR(2),
	@SiteCountyName		VARCHAR(10), 
	@SiteCity			VARCHAR(20),
	@SiteZipCode		VARCHAR(10),
	@SitePhone			VARCHAR(25),
	@SiteComment		VARCHAR(720),
	@DateReceived       VARCHAR(20),
	@SiteType			VARCHAR(20),
	@FacilityID			VARCHAR(12),

	-- Responsible Party Variables 
	@RPFirstName		VARCHAR(30),
	@RPLastName			VARCHAR(30),
	@RPOrganization		VARCHAR(40),
	@RPCity				VARCHAR(25),
	@RPPhone			VARCHAR(25),
	@RPAddress			VARCHAR(40),
	@RPAddress2			VARCHAR(40),
	@RPState			VARCHAR(2),
	@RPZipCode			VARChAR(10),
	@RPEmailAddress		VARCHAR(40),

	-- Invoice Contact Variables
	@ICFirstName		VARCHAR(30),
	@ICLastName			VARCHAR(30),
	@ICOrganization		VARCHAR(40),
	@ICCity				VARCHAR(25),
	@ICPhone			VARCHAR(25),
	@ICAddress			VARCHAR(40),
	@ICAddress2			VARCHAR(40),
	@ICState			VARCHAR(2),
	@ICZipCode			VARChAR(10),
	@ICEmailAddress		VARCHAR(40),

	--

	@ConfirmationCode	VARCHAR(25),
	@DiscoveryCode		VARCHAR(25),
	@ReleaseCause		VARCHAR(25),
	---- Contaminents and Type

	@GWMediaInd			BIT,
	@SWMediaInd			BIT,
	@DWMediaInd			BIT,
	@SLMediaInd			BIT,
	@FVMediaInd			BIT,
	@FPMediaInd			BIT,
	@UGContamInd	    BIT,
	@LGContamInd	    BIT,
	@MGContamInd	    BIT,
	@DSContamInd	    BIT,
	@WOContamInd	    BIT,
	@HOContamInd	    BIT,
	@LBContamInd	    BIT,
	@SVContamInd	    BIT,
	@OPContamInd	    BIT,
	@CHContamInd	    BIT,
	@UNContamInd	    BIT,
	@MTBEContamInd	    BIT,
	@SiteStatus			VARCHAR(8)

	SET @EmailBody = ISNULL(@EmailBody, '')
	
	
	IF ISNULL(@LUSTId, 0) != 0
		BEGIN
			SELECT 
			@SiteName = LTRIM(RTRIM(ISNULL(Incident.SiteName, ''))), @ReportedBy = LTRIM(RTRIM(ISNULL(OlprrIncident.ReportedBy, ''))), @CompanyName = LTRIM(RTRIM(ISNULL(OlprrContractors.Company_Name, ''))), 
			@ReportedByPhone = LTRIM(RTRIM(ISNULL(OlprrIncident.ReportedByPhone, ''))), @SiteCountyName = LTRIM(RTRIM(ISNULL(OlprrIncident.SiteCounty, ''))), 
			@SiteAddress = LTRIM(RTRIM(ISNULL(Incident.SiteAddress, ''))), @SiteCity = LTRIM(RTRIM(ISNULL(Incident.SiteCity, ''))), 
			@SiteZipCode = LTRIM(RTRIM(ISNULL(Incident.SiteZip, ''))), @SiteComment = LTRIM(RTRIM(ISNULL(Incident.SiteComment, ''))), @SitePhone = LTRIM(RTRIM(ISNULL(incident.SitePhone, ''))), 
			@SiteType = CASE 'H'
			WHEN 'H' 
					THEN 'Heating Oil Tank'
			WHEN 'R'
					THEN 'Regulated UST'
			WHEN 'U'
					THEN 'Unregulated UST'
			END, 
			-- @EmailRecipients = ISNULL(@EmailRecipients, '') + LTRIM(RTRIM(ISNULL(olprrContractors.EMAIL_ADDRESS, ''))),
			@ReportedByEmail = LTRIM(RTRIM(ISNULL(olprrContractors.EMAIL_ADDRESS, ''))),
			@FacilityID = CONVERT(VARCHAR(12), Incident.FacilityID), @DateReceived = ISNULL(incident.ReceivedDate, '01/01/1900'),
			@RPFirstName = LTRIM(RTRIM(ISNULL(RPPty.FirstName, ''))), @RPLastName = LTRIM(RTRIM(ISNULL(RPPty.LastName, ''))), @RPOrganization = LTRIM(RTRIM(ISNULL(RpPty.Organization, ''))), 
			@RPCity = LTRIM(RTRIM(ISNULL(RPPTY.City, ''))), @RPAddress = LTRIM(RTRIM(ISNULL(RPPty.Street, ''))), @RPState = LTRIM(RTRIM(ISNULL(RPPTY.State, ''))), 
			@RPZipCode = LTRIM(RTRIM(ISNULL(RPPty.ZIP, ''))), @RPEmailAddress = LTRIM(RTRIM(ISNULL(RPPty.Email, ''))),
			@ICFirstName = LTRIM(RTRIM(ISNULL(ICPty.FirstName, ''))), @ICLastName = LTRIM(RTRIM(ISNULL(ICPty.LastName, ''))), @ICOrganization = LTRIM(RTRIM(ISNULL(ICPty.Organization, ''))), 
			@ICCity = LTRIM(RTRIM(ISNULL(ICPTY.City, ''))), @ICAddress = LTRIM(RTRIM(ISNULL(ICPty.Street, ''))), @ICState = LTRIM(RTRIM(ISNULL(ICPTY.State, ''))), 
			@ICZipCode = LTRIM(RTRIM(ISNULL(ICPty.ZIP, ''))), @ICEmailAddress = LTRIM(RTRIM(ISNULL(ICPty.Email, ''))),
			
			@ConfirmationCode = LTRIM(RTRIM(ISNULL(assessConfirmType.ConfirmationDescription, ''))), @DiscoveryCode = LTRIM(RTRIM(ISNULL(assessDiscoveryType.DiscoveryDescription, ''))),
			@ReleaseCause	= LTRIM(RTRIM(ISNULL(assessReleaseCauseType.ReleaseCauseDescription, ''))),

			--  
			@GWMediaInd = ISNULL(assess.GWMediaInd, 0), @SWMediaInd = ISNULL(assess.SWMediaInd, 0),
			@DWMediaInd = ISNULL(assess.DWMediaInd, 0), @SLMediaInd = ISNULL(assess.SLMediaInd, 0),
			@FVMediaInd  = ISNULL(assess.FVMediaInd, 0), @FPMediaInd = ISNULL(assess.FPMediaInd, 0),
			@UGContamInd  = ISNULL(assess.UGContamInd, 0), @LGContamInd  = ISNULL(assess.LGContamInd, 0),
			@MGContamInd = ISNULL(assess.MGContamInd, 0), @DSContamInd = ISNULL(assess.DSContamInd, 0),
			@WOContamInd = ISNULL(assess.WOContamInd, 0), @HOContamInd  = ISNULL(assess.HOContamInd, 0),
			@LBContamInd = ISNULL(assess.LBContamInd, 0), @SVContamInd = ISNULL(assess.SVContamInd, 0),
			@OPContamInd = ISNULL(assess.OPContamInd, 0), @CHContamInd  = ISNULL(assess.CHContamInd, 0),
			@UNContamInd = ISNULL(assess.UNContamInd ,0), @MTBEContamInd = ISNULL(assess.MTBEContamInd, 0)
	
			FROM dbo.Incident Incident WITH (NOLOCK) JOIN  dbo.vwLUSTParty RPPty  On Incident.LustID = RPPty.LustID AND RPPty.AffilTypeCd = 'Rp'
			LEFT JOIN dbo.vwLUSTParty ICPty  On Incident.LustID = ICPty.LustID AND ICPty.AffilTypeCd = 'CON'
			LEFT JOIN dbo.Assessment assess ON Incident.LustID = assess.LustID
			LEFT JOIN dbo.AssessmentConfirmationType assessConfirmType ON assess.ConfirmationCode = assessConfirmType.ConfirmationCode
			LEFT JOIN dbo.AssessmentDiscoveryType assessDiscoveryType ON assess.DiscoveryCode = assessDiscoveryType.DiscoveryCode
			LEFT JOIN dbo.AssessmentReleaseType assessReleaseCauseType ON assess.ReleaseCauseCode = assessReleaseCauseType.ReleaseCauseCode
			LEFT JOIN dbo.AssessmentSourceType ast on assess.ReleaseSourceId = ast.ReleaseSourceId
			LEFT JOIN dbo.OlprrIncident ON incident.OlprrID = olprrIncident.OlprrID
			LEFT JOIN dbo.OlprrContractors ON OlprrContractors.OlprrContractorsID = OlprrIncident.ContractorID
			WHERE Incident.LustId = @LustId

			--SELECT @SiteName = LTRIM(RTRIM(ISNULL(Incident.SiteName, ''))), @ReportedBy = ISNULL(OlprrIncident.ReportedBy,''), @CompanyName = ISNULL(OlprrContractors.Company_Name, ''), @ReportedByPhone = ISNULL(OlprrIncident.ReportedByPhone, ''), 
			--@SiteCountyName = ISNULL(Counties.County_Name, ''), @SiteAddress = ISNULL(Incident.SiteAddress, ''), @SiteCity = ISNULL(Incident.SiteCity, ''),
			--@SiteZipCode = ISNULL(Incident.SiteZip, ''), @SiteComment = ISNULL(Incident.SiteComment, ''),  @SitePhone = ISNULL(incident.SitePhone, ''),
			--@SiteType = CASE OlprrIncident.ReleaseType 
			--WHEN 'H' 
			--		THEN 'Heating Oil Tank'
			--WHEN 'R'
			--		THEN 'Regulated UST'
			--WHEN 'U'
			--		THEN 'Unregulated UST'
			--END, 
			--@FacilityID = CONVERT(VARCHAR(12), Incident.FacilityID), @DateReceived = ISNULL(incident.ReceivedDate, '01/01/1900'),
			----
			--@RPFirstName = LTRIM(RTRIM(ISNULL(contacts.FirstName, ''))), @RPLastName = LTRIM(RTRIM(ISNULL(contacts.LastName, ''))), @RPOrganization = LTRIM(RTRIM(ISNULL(contacts.organization, ''))),
			--@RPCity = LTRIM(RTRIM(ISNULL(contacts.City, ''))), @RPAddress = LTRIM(RTRIM(ISNULL(contacts.Address, ''))), 
			--@RPAddress2 = LTRIM(RTRIM(ISNULL(contacts.Address2, ''))), @RPState = LTRIM(RTRIM(ISNULL(contacts.state, ''))),  @RPZipCode = contacts.Zipcode,
			--@RPEmailAddress = LTRIM(RTRIM(ISNULL(contacts.EmailAddress, ''))), 

			----
			--@ICFirstName = LTRIM(RTRIM(ISNULL(IContacts.FirstName, ''))), @ICLastName = LTRIM(RTRIM(ISNULL(IContacts.LastName, ''))), @ICOrganization = LTRIM(RTRIM(ISNULL(IContacts.organization, ''))),
			--@ICCity = LTRIM(RTRIM(ISNULL(IContacts.City, ''))), @ICAddress = LTRIM(RTRIM(ISNULL(Icontacts.Address, ''))), @ICAddress = LTRIM(RTRIM(ISNULL(IContacts.Address2, ''))), 
			--@ICState = LTRIM(RTRIM(ISNULL(IContacts.state, ''))), @ICZipCode = LTRIM(RTRIM(IContacts.Zipcode)),  @ICEmailAddress = LTRIM(RTRIM(ISNULL(IContacts.EmailAddress, '')))

			----
			--,@ConfirmationCode = LTRIM(RTRIM(ISNULL(assessConfirmType.ConfirmationDescription, ''))), @DiscoveryCode = LTRIM(RTRIM(ISNULL(assessDiscoveryType.DiscoveryDescription, '')))
			--,@ReleaseCause	= LTRIM(RTRIM(ISNULL(assessReleaseCauseType.ReleaseCauseDescription, '')))

			----  
			--,@GWMediaInd = ISNULL(assess.GWMediaInd, 0), @SWMediaInd = ISNULL(assess.SWMediaInd, 0)
			--,@DWMediaInd = ISNULL(assess.DWMediaInd, 0), @SLMediaInd = ISNULL(assess.SLMediaInd, 0)
			--,@FVMediaInd  = ISNULL(assess.FVMediaInd, 0), @FPMediaInd = ISNULL(assess.FPMediaInd, 0)

			--,@UGContamInd  = ISNULL(assess.UGContamInd, 0), @LGContamInd  = ISNULL(assess.LGContamInd, 0)
			--,@MGContamInd = ISNULL(assess.MGContamInd, 0), @DSContamInd = ISNULL(assess.DSContamInd, 0)
			--,@WOContamInd = ISNULL(assess.WOContamInd, 0), @HOContamInd  = ISNULL(assess.HOContamInd, 0)
			--,@LBContamInd = ISNULL(assess.LBContamInd, 0), @SVContamInd = ISNULL(assess.SVContamInd, 0)
			--,@OPContamInd = ISNULL(assess.OPContamInd, 0), @CHContamInd  = ISNULL(assess.CHContamInd, 0)
			--,@UNContamInd = ISNULL(assess.UNContamInd ,0), @MTBEContamInd = ISNULL(assess.MTBEContamInd, 0)

			--FROM Incident JOIN OlprrIncident ON Incident.OlprrID = OlprrIncident.OlprrId 
			--JOIN OlprrContractors ON OlprrContractors.OlprrContractorsId = OlprrIncident.ContractorId
			--INNER JOIN OlprrContacts contacts ON incident.OlprrID = contacts.Olprrid AND contacts.ContactType = 'RP'
			--LEFT JOIn OlprrContacts IContacts ON incident.OlprrID = IContacts.Olprrid AND IContacts.ContactType = 'IC'
			--JOIN agency.dbo.Counties ON CONVERT(INT, Counties.County_Code) = CONVERT(INT, OlprrIncident.SiteCounty) AND OlprrIncident.SiteCounty != 'WA'
			--INNER JOIN dbo.Assessment assess ON incident.LustId = assess.LustId
			--INNER JOIN dbo.AssessmentConfirmationType assessConfirmType ON assess.ConfirmationCode = assessConfirmType.ConfirmationCode
			--LEFT JOIN dbo.AssessmentDiscoveryType assessDiscoveryType ON assess.DiscoveryCode = assessDiscoveryType.DiscoveryCode
			--LEFT JOIN dbo.AssessmentReleaseType assessReleaseCauseType ON assess.ReleaseCauseCode = assessReleaseCauseType.ReleaseCauseCode
			--LEFT JOIN dbo.AssessmentSourceType ast on assess.ReleaseSourceId = ast.ReleaseSourceId
			--WHERE Incident.LUSTId = @LustID
		END
	ELSE
		BEGIN
			SELECT @SiteName = LTRIM(RTRIM(ISNULL(OlprrIncident.SiteName, ''))), @ReportedBy = LTRIM(RTRIM(ISNULL(OlprrIncident.ReportedBy,''))), @CompanyName = LTRIM(RTRIM(ISNULL(OlprrContractors.Company_Name, ''))), 
			@ReportedByPhone = LTRIM(RTRIM(ISNULL(OlprrIncident.ReportedByPhone, ''))), @SiteCountyName = LTRIM(RTRIM(ISNULL(Counties.County_Name, ''))), 
			@SiteAddress = LTRIM(RTRIM(ISNULL(OlprrIncident.SiteAddress, ''))), @SiteCity = LTRIM(RTRIM(ISNULL(OlprrIncident.SiteCity, ''))),
			@SiteZipCode = LTRIM(RTRIM(ISNULL(OlprrIncident.SiteZipCode, ''))), @SiteComment = LTRIM(RTRIM(ISNULL(OlprrIncident.SiteComment, ''))), 
			@SiteType = CASE OlprrIncident.ReleaseType 
			WHEN 'H' 
					THEN 'Heating Oil Tank'
			WHEN 'R'
					THEN 'Regulated UST'
			WHEN 'U'
					THEN 'Unregulated UST'
			END, 
			-- @EmailRecipients = ISNULL(@EmailRecipients, '') + LTRIM(RTRIM(ISNULL(olprrContractors.EMAIL_ADDRESS, ''))),
			@ReportedByEmail = LTRIM(RTRIM(ISNULL(olprrContractors.EMAIL_ADDRESS, ''))),
			@FacilityID = CONVERT(VARCHAR(12), OlprrIncident.FacilityID),
			--
			@RPFirstName = LTRIM(RTRIM(ISNULL(contacts.FirstName, ''))), @RPLastName = LTRIM(RTRIM(ISNULL(contacts.LastName, ''))), @RPOrganization = LTRIM(RTRIM(ISNULL(contacts.organization, ''))),
			@RPCity = LTRIM(RTRIM(ISNULL(contacts.City, ''))), @RPAddress = LTRIM(RTRIM(ISNULL(contacts.Address, ''))), 
			@RPAddress2 = LTRIM(RTRIM(ISNULL(contacts.Address2, ''))), @RPState = LTRIM(RTRIM(ISNULL(contacts.state, ''))),  @RPZipCode = contacts.Zipcode,
			@RPEmailAddress = LTRIM(RTRIM(ISNULL(contacts.EmailAddress, ''))), 

			--
			@ICFirstName = LTRIM(RTRIM(ISNULL(IContacts.FirstName, ''))), @ICLastName = LTRIM(RTRIM(ISNULL(IContacts.LastName, ''))), @ICOrganization = LTRIM(RTRIM(ISNULL(IContacts.organization, ''))),
			@ICCity = LTRIM(RTRIM(ISNULL(IContacts.City, ''))), @ICAddress = LTRIM(RTRIM(ISNULL(Icontacts.Address, ''))), @ICAddress = LTRIM(RTRIM(ISNULL(IContacts.Address2, ''))), 
			@ICState = LTRIM(RTRIM(ISNULL(IContacts.state, ''))), @ICZipCode = LTRIM(RTRIM(IContacts.Zipcode)),  @ICEmailAddress = LTRIM(RTRIM(ISNULL(IContacts.EmailAddress, '')))

			--
			,@ConfirmationCode = LTRIM(RTRIM(ISNULL(assessConfirmType.ConfirmationDescription, ''))), @DiscoveryCode = LTRIM(RTRIM(ISNULL(assessDiscoveryType.DiscoveryDescription, '')))
			,@ReleaseCause	= LTRIM(RTRIM(ISNULL(assessReleaseCauseType.ReleaseCauseDescription, '')))

			--  
			,@GWMediaInd = ISNULL(assess.GWMediaInd, 0), @SWMediaInd = ISNULL(assess.SWMediaInd, 0)
			,@DWMediaInd = ISNULL(assess.DWMediaInd, 0), @SLMediaInd = ISNULL(assess.SLMediaInd, 0)
			,@FVMediaInd  = ISNULL(assess.FVMediaInd, 0), @FPMediaInd = ISNULL(assess.FPMediaInd, 0)

			,@UGContamInd  = ISNULL(assess.UGContamInd, 0), @LGContamInd  = ISNULL(assess.LGContamInd, 0)
			,@MGContamInd = ISNULL(assess.MGContamInd, 0), @DSContamInd = ISNULL(assess.DSContamInd, 0)
			,@WOContamInd = ISNULL(assess.WOContamInd, 0), @HOContamInd  = ISNULL(assess.HOContamInd, 0)
			,@LBContamInd = ISNULL(assess.LBContamInd, 0), @SVContamInd = ISNULL(assess.SVContamInd, 0)
			,@OPContamInd = ISNULL(assess.OPContamInd, 0), @CHContamInd  = ISNULL(assess.CHContamInd, 0)
			,@UNContamInd = ISNULL(assess.UNContamInd ,0), @MTBEContamInd = ISNULL(assess.MTBEContamInd, 0)


			FROM OlprrIncident LEFT JOIN OlprrContractors ON OlprrContractors.OlprrContractorsId = OlprrIncident.ContractorId
			LEFT JOIN OlprrContacts contacts ON OlprrIncident.OlprrID = contacts.Olprrid AND contacts.ContactType = 'RP'
			LEFT JOIn OlprrContacts IContacts ON OlprrIncident.OlprrID = IContacts.Olprrid AND IContacts.ContactType = 'IC'
			LEFT JOIN agency.dbo.Counties ON CONVERT(INT, Counties.County_Code) = CONVERT(INT, OlprrIncident.SiteCounty) AND OlprrIncident.SiteCounty != 'WA'
			LEFT JOIN dbo.OlprrAssessment assess ON OlprrIncident.OlprrID = assess.OlprrID 
			LEFT JOIN dbo.AssessmentConfirmationType assessConfirmType ON assess.ConfirmationCode = assessConfirmType.ConfirmationCode
			LEFT JOIN dbo.AssessmentDiscoveryType assessDiscoveryType ON assess.DiscoveryCode = assessDiscoveryType.DiscoveryCode
			LEFT JOIN dbo.AssessmentReleaseType assessReleaseCauseType ON assess.ReleaseCauseCode = assessReleaseCauseType.ReleaseCauseCode
			LEFT JOIN dbo.AssessmentSourceType ast on assess.ReleaseSourceId = ast.ReleaseSourceId
			Where OlprrIncident.OlprrId = @OlprrId
		END
			
	-- Report_Data

	print 'Email Body = ' + @EmailBody 

	SET @body = @EmailBody + @CRLF
	SET @body = @body + 'Reported by:   ' + UPPER(ISNULL(@ReportedBy, '')) + @CRLF
	SET @body = @body + 'Company Name:  ' + UPPER(ISNULL(@CompanyName, '')) + @CRLF
	SET @body = @body + 'Site Name:     ' + UPPER(ISNULL(@SiteName, '')) + @CRLF
	SET @body = @body + 'Site Address:  ' + UPPER(ISNULL(@SiteAddress, '')) + @CRLF
	SET @body = @body + 'Site County:   ' + UPPER(ISNULL(@SiteCountyName, '')) + @CRLF
	SET @body = @body + 'Site City:     ' + UPPER(ISNULL(@SiteCity, '')) + @CRLF
	SET @body = @body + 'Site Zip Code: ' + UPPER(ISNULL(@SiteZipCode, '')) + @CRLF
	IF LEN(@SitePhone) > 1
		SET @body = @body + 'Site Phone:    ' + UPPER(ISNULL(@SitePhone, '')) + @CRLF
	IF LEN(@SiteComment) > 1
		SET @body = @body + 'Comments:      ' + UPPER(ISNULL(@SiteComment, '')) + @CRLF

	print @body

	SET @body = @body + 'Date Received: ' + UPPER(ISNULL(@DateReceived, '')) + @CRLF
	SET @body = @body + 'Release Type:  ' + ISNULL(@SiteType, '') + @CRLF
	SET @body = @body + 'Facility ID:   ' + ISNULL(@FacilityId, '') + @CRLF
	SET @body = @body + 'Email:         ' + ISNULL(@ReportedByEmail, '') + @CRLF 
	

-- Report_Data Ends
-- Responsible_Party_Data
	SET @body = @body + @CRLF + Replicate('_', 70) + @CRLF
	SET @body = @body + @CRLF + LEFT(LTRIM(RTRIM('RESPONSIBLE PARTY INFORMATION')) + SPACE(40), 40) 
	SET @body = @body + LEFT(LTRIM(RTRIM('INVOICE CONTACT INFORMATION')) + SPACE(40), 40)
	SET @body = @body + @CRLF + 'First Name:    ' + Replicate(' ', 25) + 'First Name:    '

	IF LEN(@RPFirstName) > 0 
		SET @body = @body + @CRLF + LEFT(LTRIM(RTRIM(ISNULL(@RPFirstName, ''))) + SPACE(40), 40)
	ELSE
		SET @body = @body + @CRLF + SPACE(40)


	IF LEN(@ICFirstName) > 0
		SET @body = @body + ISNULL(@ICFirstName, '')

	SET @body = @body + @CRLF + 'Last Name:     ' + Replicate(' ', 25) + 'Last Name:     '
	IF LEN(ISNULL(@RPLastName, '')) > 0
		SET @body = @body + @CRLF + LEFT(ISNULL(@RPLastName, '') + SPACE(40), 40)
	ELSE
		SET @body = @body + @CRLF + SPACE(40)

	IF LEN(ISNULL(@ICLastName, '')) > 0
		SET @body = @body + ISNULL(@ICLastName, '')
	
	IF LEN(ISNULL(@RPOrganization, '')) > 0 OR LEN(ISNULL(@ICOrganization, '')) > 0
		BEGIN
			SET @body = @body + @CRLF + 'Organization:  ' + Replicate(' ', 25) + 'Organization:  '

			IF LEN(ISNULL(@RPOrganization, '')) > 0 
				SET @body = @body + @CRLF + LEFT(ISNULL(@RPOrganization, '') + SPACE(40), 40)
			ELSE
				SET @body = @body + @CRLF + SPACE(40)
			IF LEN(ISNULL(@ICOrganization, '')) > 0
				SET @body = @body + ISNULL(@ICOrganization, '')

		END
	SET @body = @body + @CRLF + 'City:          ' + REPLICATE(' ', 25) + 'City:          '
	IF LEN(ISNULL(@RPCity, '')) > 0 
		SET @body = @body + @CRLF + LEFT(ISNULL(@RPCity, '') + SPACE(40), 40)
	ELSE
		SET @body = @body + @CRLF + SPACE(40)

	IF LEN(ISNULL(@ICCity, '')) > 0
		SET @body = @body + ISNULL(@ICCity, '')

	SET @body = @body + @CRLF + 'Phone:         ' + REPLICATE(' ', 25) + 'Phone:         '
	IF LEN(ISNULL(@RPPhone, '')) > 0
		SET @body = @body + @CRLF + LEFT(ISNULL(@RPPhone, '') + SPACE(40), 40)
	ELSE
		SET @body = @body + @CRLF + SPACE(40)
	IF LEN(ISNULL(@ICPhone, '')) > 0
		SET @body = @body + ISNULL(@ICPhone, '')
	
	
	SET @body = @body + @CRLF + 'Address:       ' + REPLICATE(' ', 25) + 'Address:       '
	IF LEN(ISNULL(@RPAddress, '')) > 0
		SET @body = @body + @CRLF + LEFT(ISNULL(@RPAddress, '') + SPACE(40), 40)
	ELSE
		SET @body = @body + SPACE(40)
	IF LEN(ISNULL(@ICAddress, '')) > 0
		SET @body = @body + ISNULL(@ICAddress, '')
	IF LEN(ISNULL(@RPAddress2, '')) > 0 OR LEN(ISNULL(@ICAddress2, '')) > 0
		BEGIN
			SET @body = @body + @CRLF + 'Address 2:     ' + REPLICATE(' ', 25) + 'Address 2:     '
			IF LEN(ISNULL(@RPAddress2, '')) > 0 
				SET @body = @body + LEFT(ISNULL(@RPAddress2, '') + SPACE(40), 40)
			else
				SET @body = @body + SPACE(40)
		END
		IF LEN(ISNULL(@ICAddress2, '')) > 0
			SET @body = @body + ISNULL(@ICAddress2, '')
	IF LEN(ISNULL(@RPState, '')) > 0 
		SET @body = @body + @CRLF + LEFT(ISNULL(@RPState, '') + SPACE(40), 40)
	ELSE
		SET @body = @body + @CRLF + SPACE(40)
	IF LEN(ISNULL(@ICState, '')) > 0
		SET @body = @body + ISNULL(@ICstate, '')
	
	SET @body = @body + @CRLF + 'Zip:           ' + REPLICATE(' ', 25) + 'Zip:           '
	IF LEN(ISNULL(@RPZipcode, '')) > 0 
		SET @body = @body + @CRLF + LEFT(ISNULL(@RPZipcode, '') + SPACE(40), 40)
	ELSE
		SET @body = @body + SPACE(40)
	IF LEN(ISNULL(@ICZipcode, '')) > 0
		SET @body = @body + ISNULL(@ICZipcode, '')

	IF LEN(ISNULL(@RPEmailAddress, '')) > 0 OR LEN(ISNULL(@ICEmailAddress, '')) > 0 
		BEGIN
			SET @body = @body + @CRLF + 'Email:         ' + REPLICATE(' ', 25) + 'Email:         '
			IF LEN(ISNULL(@RPEmailAddress, '')) > 0 
				SET @body = @body + @CRLF + LEFT(ISNULL(@RPEmailAddress, '') + SPACE(40), 40)
			ELSE
				SET @body = @body + @CRLF + SPACE(40)
			IF LEN(ISNULL(@ICEmailAddress, '')) > 0 
				SET @body = @body + ISNULL(@ICEmailAddress, '')
		END
	
	-- Media and Contaminents
	
	SET @body = @body + @CRLF + Replicate('_', 70) + @CRLF + @CRLF
	
	SET @body = @body + 'Confirmation:   ' + ISNULL(@ConfirmationCode, '') + @CRLF
	SET @body = @body + LEFT('Discovery:      ' + ISNULL(@DiscoveryCode, '') + SPACE(40), 40)
	SET @body = @body + 'Cause:          ' + ISNULL(@ReleaseCause, '') + @CRLF
	
	-- Contaminents
	SET @body = @body + @CRLF + @CRLF + LEFT('MEDIA TYPE' + SPACE(40), 40) + 'CONTAMINANT TYPE' + @CRLF
	
	IF @SLMediaInd > 0 OR @UGContamInd > 0
		BEGIN
			If @SLMediaInd > 0
				SET @body = @body + LEFT('Soil' + SPACE(40), 40)
			ELSE
				SET @body = @body + SPACE(40)
			IF @UGContamInd > 0
				SET @body = @body + 'Unleaded Gasoline'
			SET @body = @body + @CRLF
		END	

		

	IF @GWMediaInd > 0 OR @LGContamInd > 0
		BEGIN
			IF @GWMediaInd > 0
				SET @body = @body + LEFT('Ground Water' + SPACE(40), 40)
			ELSE
				SET @body = @body + SPACE(40)
			IF @LGContamInd > 0
				SET @body = @body + 'Leaded Gasoline' 
			SET @body = @body + @CRLF
		END

	IF @SWMediaInd > 0 OR @MGContamInd > 0
		BEGIN
			IF @SWMediaInd > 0 
				SET @body = @body + LEFT('Surface Water' + SPACE(40), 40)
			ELSE
				SET @body = @body + SPACE(40)
			IF @MGContamInd > 0
				SET @body = @body + 'Misc. Gasoline'
			SET @body = @body + @CRLF
		END
	
	IF @DWMediaInd > 0 OR @DSContamInd > 0
		BEGIN
			IF @DWMediaInd > 0
				SET @body = @body + LEFT('Drinking Water' + SPACE(40), 40)
			ELSE
				SET @body = @body + SPACE(40)
			IF @DSContamInd > 0
				SET @body = @body + 'Diesel (Motor Fuel)'
			SET @body = @body + @CRLF
		END

	IF @FVMediaInd > 0 OR @WOContamInd > 0 
		BEGIN
			IF @FVMediaInd > 0
				SET @body = @body + LEFT('Vapor' + SPACE(40), 40)
			ELSE
				SET @body = @body + SPACE(40)
			IF @WOContamInd > 0 
				SET @body = @body + 'Waste Oil'
			SET @body = @body + @CRLF
		END

	IF @FPMediaInd > 0 OR @HOContamInd > 0
		BEGIN
			IF @FPMediaInd > 0
				SET @body = @body + LEFT('Free Product' + SPACE(40), 40)
			ELSE
				SET @body = @body + SPACE(40)
			IF @HOContamInd > 0
				SET @body = @body + 'Heating Oil'
			SET @body = @body + @CRLF
		END
	
	IF @LBContamInd > 0
		BEGIN
			SET @body = @body + REPLICATE(' ', 40)
			SET @body = @body + 'Lubricant' + @CRLF
		END
	If @SVContamInd > 0
		BEGIN
			SET @body = @body + REPLICATE(' ', 40)
			SET @body = @body + 'Solvent' + @CRLF
		END
	If @OPContamInd > 0
		BEGIN
			SET @body = @body + REPLICATE(' ', 40)
			SET @body = @body + 'Other Pet. Dist.' + @CRLF
		END
	If @CHContamInd > 0
		BEGIN
			SET @body = @body + REPLICATE(' ', 40)
			SET @body = @body + 'Chemical' + @CRLF
		END
	If @MTBEContamInd > 0
		BEGIN
			SET @body = @body + REPLICATE(' ', 40)
			SET @body = @body + 'Other' + @CRLF
		END
	If @UNContamInd > 0
		BEGIN
			SET @body = @body + REPLICATE(' ', 40)
			SET @body = @body + 'Unknown' + @CRLF
		END


-- Responsible_Party_Data Ends
--	select @EmailRecipients, @body, @EmailSubject

	
	DECLARE @Profile VARCHAR(12) 

	SET @EmailRecipients = ISNULL(@EmailRecipients, '') 


	
	EXEC msdb.dbo.sp_send_dbmail
	@Profile_name = 'default',
	@recipients = @EmailRecipients,
	--@recipients = 'guedea.alex@deq.state.or.us',
	@body = @body,  
	@subject = @EmailSubject 


ExitRtn:
   --RETURN @ErrNum




GO
GRANT EXECUTE ON [dbo].[apReportLUSTStatus] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apInsLUSTAffilPartyData]    Script Date: 5/30/2019 8:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[apInsLUSTAffilPartyData]
(
		@LUSTID			Integer			= 0,
		@AffilType		VarChar(3)		= '',
		@StartDate		DateTime		= NULL,
		@EndDate		DateTime		= NULL,
		@Organization	Varchar(40)		= '',

		@SubOrg			VarChar(40)		= '',
		@JobTitle		VarChar(40)		= '',
		@FirstName		VarChar(40)		= '',
		@LastName		VarChar(40)		= '',
		@Phone			VarChar(40)		= '',

		@Email			VarChar(40)		= '',
		@Street			VarChar(56)		= '',
		@City			VarChar(25)		= '',
		@ZIP			VarChar(10)		= '',
		@State			VarChar(2)		= '',

		@Country		VarChar(25)		= '',
		@AffilComments	VarChar(2000)	= '',
		@LastChangeBy   VARCHAR(64)			,		-- REQUIRED!
		@PartyID		Integer			= 0  OUTPUT,
		@AffiliationID	Integer			= 0  OUTPUT,

		@ErrorMessageHandler   VARCHAR(1024) OUTPUT,
		@Result			Bit				= 0  OUTPUT
)AS
/* ===================================================================================
--	Author:			Lewis L0
--	Create date:	May 25,2006
--	Description:	This procedure is created to replace the original version, called
--					apInsLUSTContact, with additional input parameter 'SubOrg'.
--
--					1.	Add LUST Contact (Affiliation/Party) record into the databases.
--					2.	Relevant Organization/Contact Person/Mailing Address records 
--						are also created if not found in the databases.
--					3.	Either Organization or LastName (and FirstName) is mandatory.
--					4.	If Organization exists, LUST allows enter FirstName without
--						LastName.
--					5.	The following tables are updated:
--						-  ADDR.dbo.AffilParty
--						-  ADDR.dbo.AddrSeqNbrs
--						-  ADDR.dbo.AffilContacts
--						-  ADDR.dbo.ContactPerson
--						-  ADDR.dbo.MailAddress		
--						-  ADDR.dbo.Organization
--						-  ADDR.dbo.LUSTAffilCntcts
--						-  AGENCY.dbo.Affiliation
--					6.	Program Reference ID (i.e. LUST ID# will not be validated in 
--						this procedure and assuming correct.
--					7.	LUST program allows more than one contact record for each contact 
--						type.
--
--
--	Input:		@LUSTID
--				@AffilType	(i.e. RP/RPT/CON/INV)
--				@StartDate
--				@EndDate
--				@Organization
--				@SubOrg
--				@JobTitle
--				@FirstName
--				@LastName	
--				@Phone
--				@Street	
--				@City		
--				@State		
--				@ZIP		
--				@Country
--
--	Output:		@PartyID
--				@AffiliationID
--				@ErrMsg		
--				@Result		0 - Failure; 1 - Success
--
--	Modifications:
--  Date	   Initials Details
--	--------   --------	------------------------------------------------------------------
--	06/10/05   llo		Added new input parameter (EndDate); Fixed bugs of incorrect
--						duplicate record message.
--	06/17/05   llo		Use sub-stored procedure (i.e. bpChkAffilDates) to validates
--						Affiliation Dates rather than inline codes.
--	10/13/05   llo		Modifications - Replace sub-routine call of bpChkAffilDates with
--						bpChkDupAffilParty(ADDR) for validation of Affiliation Dates.
--	05/10/06   llo		Modifications - Added checking for JobTitle requires Organization.
--	06/19/06   llo		Modifications - Add input parameter, SubOrg.
--	10/17/06   llo		Modifications - Allow LUST users to change an existing Contact
--						record from UPPER-Case into Mixed-case or reversely.
-- ===================================================================================== */

BEGIN
	SET NOCOUNT ON

	DECLARE @ErrNum 		Integer, 
			@RowNum 		Integer,
			@SysErr			Integer,
			@PgmRef			VarChar(10),
			@Dummy			Integer,
			@ArchAffilID	Integer,
			@AffilTypeDesc	VarChar(40),
			@OrgID			Integer,
			@IsIndv			Bit,
			@CntctPerID		Integer,
			@AffilName		VarChar(40),
			@ArchAffilType	VarChar(3),
			@Fax			VarChar(40),
			@MailAddrID		Integer,
			@AffilCntctID	Integer,
			@StaffID		Integer,
			@NewOrg			Bit,
			@NewCntctPer	Bit,
			@NewMailAddr	Bit,
			@LegalNm		VarChar(40),
			@DBEmail		VarChar(40),
			@Phone2			VarChar(40),
			@DbComments		VarChar(2000),
			@OwnshpCd		Char(1),
			@MI				Char(1),
			@Suffix			VarChar(15),
			@IsPartyFound	Bit,
			@ReqUpdOrg		Bit,			-- 10/17/2006 - Changed
			@ReqUpdCP		Bit,
			@ReqUpdMA		Bit,			-- 10/17/2006 - Changed
			@IsDupRec		Bit,
			@LUST			VarChar(4),
			@RESPARTY		Char(1),
			@CMNFACID		Integer,
			@UNKNOWN		Char(1),
			@ORG_NAME		Char(1),
			@ADDR_ADMIN		Integer,		-- 10/17/2006 - Changed
			@NOW			DateTime,
			@TRUE 			Bit, 
			@FALSE 			Bit
	SELECT  @ErrNum 		= 0, 
			@RowNum 		= 0,
			@SysErr			= 0,
			@PgmRef			= '',
			@Dummy			= 0,
			@AffilTypeDesc	= '',
			@AffiliationID	= 0,
			@ArchAffilID	= 0,
			@OrgID			= 0,
			@IsIndv			= 0,
			@CntctPerID		= 0,
			@MailAddrID		= 0,
			@AffilCntctID	= 0,
			@StaffID		= 0,
			@NewOrg			= 0,
			@NewCntctPer	= 0,
			@NewMailAddr	= 0,
			@AffilName		= '',
			@ArchAffilType	= '',
			@Fax			= '',
			-- @Result			= 0,
			-- @ErrMsg			= '',
			@DbComments		= '',
			@OwnshpCd		= '',
			@MI				= '',
			@Suffix			= '',
			@IsPartyFound	= 0,
			@ReqUpdOrg		= 0,			-- 10/17/2006 - Changed
			@ReqUpdCP		= 0,
			@ReqUpdMA		= 0,			-- 10/17/2006 - Changed
			@LegalNm		= '',
			@DBEmail		= '',
			@Phone2			= '',
			@IsDupRec		= 0,
			@LUST			= 'LUST',
			@RESPARTY		= 'R',
			@CMNFACID		= 0,
			@UNKNOWN		= 'U',
			@ORG_NAME		= 'O',
			@ADDR_ADMIN		= 499979,		-- 10/17/2006 - Changed
			@NOW			= GETDATE(),
			@TRUE 			= 1, 
			@FALSE 			= 0


--	1.	Validates input parameters...
--	1a.	If Affiliation Type is invalid, don't need to continue...

	SELECT @AffilTypeDesc = AffilTypeDesc
	FROM AGENCY.dbo.AffilTypes
	WHERE fkPgmInt 	  = @LUST
	  AND AffilTypeCd = @AffilType
	  AND IsActive	  = @TRUE
	SELECT @ErrNum = @@ERROR, @RowNum = @@ROWCOUNT
	IF @ErrNum <> 0
		GOTO ExitRtn

	IF @RowNum = 0
	BEGIN
		SELECT	@ErrNum	= 51001,
				@ErrorMessageHandler = 'Invalid Affiliation Type Code ('
					   + @AffilType + ')'
		GOTO ExitRtn
	END

/*
--	1b.	If Effective (Start) Date is missing, don't need to continue...
--		10/13/2005 - Changed

	IF @StartDate IS NULL
	BEGIN
		SELECT @ErrMsg = 'Start Date of Contact record is missing.'
		GOTO ExitRtn
	END

	IF @EndDate IS NULL
		GOTO ValidPartyRtn

	IF @EndDate < @StartDate
	BEGIN
		SELECT @ErrMsg = 'Invalid End Date (before start Date is not allowed).'
		GOTO ExitRtn
	END
*/
	
--	1c.	Organization and Contact Person info.
--		If Organization or LastName is missing, don't need to continue...
--		5/10/2006 - Add criteria for JobTitle requires Organization.


SET @ErrorMessageHandler = ''

ValidPartyRtn:
	SELECT 	@AffilName	= ISNULL(LTRIM(@Organization),''),
			@LastName	= LTRIM(ISNULL(@LastName,'')),
			@SubOrg		= LTRIM(ISNULL(@SubOrg,'')),
			@JobTitle	= LTRIM(ISNULL(@JobTitle,'')),
			@Street		= LTRIM(ISNULL(@Street,'')),
			@Email		= LTRIM(ISNULL(@Email,'')),
			@OwnshpCd	= @UNKNOWN

	IF (@AffilName = '') AND (@JobTitle <> '')
	BEGIN
		SELECT	@ErrNum	= 51002,
				@ErrorMessageHandler = 'Organization is required when Title is entered.'
		GOTO ExitRtn
	END


	SET @ErrorMessageHandler = ''

	EXEC @ErrNum = ADDR.dbo.bpValidPartyInfo @LUST,
											 @LastName		OUTPUT,
											 @FirstName		OUTPUT,
											 @MI,
											 @Organization	OUTPUT,
											 @OwnshpCd,
											 @IsIndv    	OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		SET @ErrorMessageHandler = 'Problem with ADDR.dbo.bpValidPartyInfo'
		GOTO ExitRtn
	END

	IF @ErrNum = 0
		GOTO ValidAddrRtn

	SELECT @ErrorMessageHandler = ADDR.dbo.fnCntctPerErrMsg (@ErrNum)
	GOTO ExitRtn

--	1d.	Email and Mailing Address.
--		If Mailing Address or Email Address is invalid, don't continue...

ValidAddrRtn:
	IF @IsIndv = @TRUE
		SELECT @AffilName = @Organization

	IF (@Street = '')
	BEGIN
		SELECT	@ErrNum	= 51003,
				@ErrorMessageHandler = 'Address - Street Name or PO Box is missing.'
		GOTO ExitRtn
	END


	SET @ErrorMessageHandler = ''
	EXEC @ErrNum = ADDR.dbo.bpValidAddrInfo @Email,
											@Street		OUTPUT,
											@City		OUTPUT,
											@State,
											@ZIP		OUTPUT,
											@Country	OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		SET @ErrorMessageHandler = 'Problem with ADDR.dbo.bpValidAddrInfo'	
		GOTO ExitRtn
	END

	IF (@ErrNum = 0)
		GOTO  SrhOrgRtn

	SELECT @ErrorMessageHandler = ADDR.dbo.fnMailAddrErrMsg (@ErrNum)
	GOTO ExitRtn

--	2.	See if Organization record already created...
--		10/17/2006 - Changed.

SrhOrgRtn:
	SET @ErrorMessageHandler = ''
	EXEC @ErrNum = ADDR.dbo.bpSrhOrgID @IsIndv,
									   @Organization,
									   @OrgID 	OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		SET @ErrorMessageHandler = 'Problem with ADDR.dbo.bpSrhOrgID'	
		GOTO ExitRtn
	END

	IF @ErrNum = 0
		GOTO NewCPerRtn

	SELECT @ErrorMessageHandler = ADDR.dbo.fnCntctPerErrMsg (@ErrNum)
	GOTO ExitRtn

NewCPerRtn:
	IF (@OrgID IS NULL) OR (@OrgID = 0)
	BEGIN
		SELECT	@NewOrg 		= @TRUE, 
				@NewCntctPer 	= @TRUE
		GOTO SrhAddrRtn
	END

--	10/17/2006 - Changed.

	IF EXISTS  (SELECT 1 FROM ADDR.dbo.Organization 
				WHERE OrgID = @OrgID
				  AND LastUpdBy <> @ADDR_ADMIN)
		SELECT @ReqUpdOrg = @TRUE




--	3.	If Organization already created, see if Contact Person 
--		record already created and further update is required.
--	3a.	Any 'matched' Contact Person record out there (in the databases)?

SrhCPerRtn:
	SET @ErrorMessageHandler = ''
	EXEC @ErrNum = ADDR.dbo.bpSrhCntctPerID  @LUST,
											 @OrgID,
											 @SubOrg,
											 @JobTitle,
											 @LastName,
											 @FirstName,
											 @MI			OUTPUT,
											 @Suffix		OUTPUT,
											 @Phone,
											 @CntctPerID	OUTPUT,
											 @Phone2		OUTPUT,
											 @Fax			OUTPUT,
											 @DBEmail		OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		SET @ErrorMessageHandler = 'Problem with ADDR.dbo.bpSrhCntctPerID'	
		GOTO ExitRtn
	END

	IF @ErrNum = 0
		GOTO CPerNullRtn

	SELECT @ErrorMessageHandler = ADDR.dbo.fnCntctPerErrMsg (@ErrNum)
	GOTO ExitRtn

--	3b.	If no 'matched' Contact Person is found, do nothing here...

CPerNullRtn:
	IF (@CntctPerID IS NULL) OR (@CntctPerID = 0)
	BEGIN
		SELECT @NewCntctPer = @TRUE
		GOTO SrhAddrRtn
	END

--	3c.	If provided EmailAddr variable has no value, do nothing here...
--		10/17/2006 - Changed

--	IF @Email = ''
--		GOTO SrhAddrRtn
--	ELSE
		SELECT @ReqUpdCP = @TRUE


--	4.	See if Mailing Address record already created...
--		10/17/2006 - Changed.

SrhAddrRtn:
	SET @ErrorMessageHandler = ''
	EXEC @ErrNum = ADDR.dbo.bpSrhMailAddrID @Street, 
											@City,
											@State,
											@ZIP,
											@Country,
											@MailAddrID OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		SET @ErrorMessageHandler = 'Problem with ADDR.dbo.bpSrhMailAddrID'	
		GOTO ExitRtn
	END

	IF @ErrNum = 0
		GOTO AddrNullRtn

	SELECT @ErrorMessageHandler = ADDR.dbo.fnMailAddrErrMsg (@ErrNum)
	GOTO ExitRtn

AddrNullRtn:
	IF (@MailAddrID = 0)
		SELECT @MailAddrID  = NULL
	
--		10/17/2006 - Changed.

	IF (@MailAddrID IS NULL)
	BEGIN
		SELECT @NewMailAddr = @TRUE
		GOTO ChkDupPartyRtn
	END

	IF EXISTS  (SELECT 1 FROM ADDR.dbo.MailAddress
				WHERE AddrID = @MailAddrID
				  AND LastUpdBy <> @ADDR_ADMIN)
		SELECT @ReqUpdMA = @TRUE


--	5.	If Contact Person and Mailing Address records already created,
--		see if Party record already created or duplicate...
--		OwnshpCd of AffilParty table won't be carried forward to this SProc.
--		OR (@NewMailAddr = @TRUE) -- 12/06/02 Modification
--	5a.	Search for Party record...

ChkDupPartyRtn:
	SET @ErrorMessageHandler = ''
	IF (@NewCntctPer = @TRUE) OR (@NewMailAddr = @TRUE)
		GOTO FindStaffRtn

	EXEC @ErrNum = ADDR.dbo.bpSrhPartyID @CntctPerID,
										 @MailAddrID,
										 @PartyID 	  OUTPUT,
										 @LegalNm,
										 @OwnshpCd,
										 @DbComments
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
		BEGIN
			SELECT @ErrNum = @SysErr
			SET @ErrorMessageHandler = 'Problem with ADDR.dbo.bpSrhPartyID'	
		END

	IF @ErrNum <> 0
		GOTO ExitRtn

	IF @PartyID > 0
		SELECT @IsPartyFound = @TRUE
	ELSE
		GOTO FindStaffRtn

--	5b.	Has relevant LUST Contact record already created?
--		06/17/2005 - changed (llo)
--		10/13/2005 - Bugs Fixed (llo)
/*
	EXEC @ErrNum = LUSTNew.dbo.bpChkAffilDates @LUST,
											   @LUSTID,
											   @AffilType,
											   @PartyID,
											   @StartDate,
											   @EndDate,
											   @AffiliationID
*/
	SET @ErrorMessageHandler = ''
	EXEC @ErrNum = ADDR.dbo.bpChkDupAffilParty	@LUST,
												@LUSTID,
												@AffilType,
												@AffiliationID,
												@PartyID,
												@StartDate,
												@EndDate,
												@IsDupRec	OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		SET @ErrorMessageHandler = 'Problem with ADDR.dbo.bpChkDupAffilParty'	
		GOTO ExitRtn
	END

	IF @ErrNum > 0
	BEGIN
		SELECT @ErrorMessageHandler = ADDR.dbo.fnAffilErrMsg(@ErrNum)
		GOTO ExitRtn
	END

	IF @IsDupRec = @TRUE
	BEGIN
		SELECT	@ErrNum	= 51004,
			@ErrorMessageHandler = 'Duplicate Affiliation/Party record is found.'
		GOTO ExitRtn
	END


--	6.	Find Employee ID from user NT Login...

FindStaffRtn:
	SET @ErrorMessageHandler = ''
	
	
	--EXEC @ErrNum = AGENCY.dbo.apGetUserEmpID @StaffID OUTPUT
	SELECT @StaffID = EMP_ID
	FROM HRIS.dbo.vActiveEmpTbl
	WHERE NT_LOGIN = @LastChangeBy
	

	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		SET @ErrorMessageHandler = 'Problem with Getting LastChangeBy'	
		GOTO ExitRtn
	END

	IF @ErrNum = 0 
		GOTO SaveRecRtn

	SELECT @ErrorMessageHandler = AGENCY.dbo.fnLoginErrMsg (@ErrNum)
	GOTO ExitRtn

--	7.	Add/Update Party related record(s)...
--	7a.	Generate a new Party ID first...
--		10/17/2006 - Changed.

SaveRecRtn:
	BEGIN TRAN
		SET @ErrorMessageHandler = ''
		IF @IsPartyFound = @TRUE
			GOTO UpdOrgRtn

		EXEC @ErrNum = ADDR.dbo.bpGenPartyID @PartyID OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting ADDR.dbo.bpGenPartyID '	
			END

		IF @ErrNum <> 0
			GOTO Rollbackrtn
			
--	7b.	Add a new Party record...
--		LUST stores Ownership Type info and Comments in Affiliation Table;
--		and Legal Name is save in the Program Database...

		EXEC @ErrNum = ADDR.dbo.bpInsAffilParty @PartyID, 
												'', 
												'', 
												''
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn

--	7c.	Add Organization record...

		IF @NewOrg = @FALSE
			GOTO UpdOrgRtn
		SET @ErrorMessageHandler = ''
		EXEC @ErrNum = ADDR.dbo.bpInsOrg @Organization,
										 @IsIndv,
										 @OrgID OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting ADDR.dbo.bpInsOrg @Organization'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn

		GOTO  AddCntctPerRtn

		
--	10/17/2006 - Changed.
--	This routine provides LUST Users a chance to make cases change 
--	(i.e. UPPER-case to mixed-case) of the Organization Name.
--	** Only for those Organization record was not verified yet **

UpdOrgRtn:
		SET @ErrorMessageHandler = ''
		IF @ReqUpdOrg = @FALSE
			GOTO  AddCntctPerRtn

		EXEC @ErrNum = ADDR.dbo.bpUpdOrg @OrgID,
										 @Organization,
										 @IsIndv,
										 @Dummy		OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting ADDR.dbo.bpUpdOrg'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn



--	7d.	Add Contact Person record (if required)...

AddCntctPerRtn:
SET @ErrorMessageHandler = ''
		IF @NewCntctPer = @FALSE
			GOTO UpdCntctPerRtn

		EXEC @ErrNum = ADDR.dbo.bpInsCntctPer @OrgID,
											  @SubOrg,
											  @JobTitle,
											  @LastName,
											  @FirstName,
											  @MI,
											  @Suffix,
											  @Email,
											  @Phone,
											  @Phone2,
											  @Fax,
 											  @StaffID,
											  @CntctPerID OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting ADDR.dbo.bpInsCntctPer'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn
		
		GOTO AddMailAddrRtn

--	7e.	If Contact Person record already created, update the non-index fields...

UpdCntctPerRtn:
SET @ErrorMessageHandler = ''
		IF @ReqUpdCP = @FALSE
			GOTO AddMailAddrRtn
		
		EXEC @ErrNum = ADDR.dbo.bpUpdCntctPer @CntctPerID,
											  @OrgID,
											  @SubOrg,
											  @JobTitle,
											  @LastName,
											  @FirstName,
											  @MI,
											  @Suffix,
											  @Email,
											  @Phone,
											  @Phone2,
											  @Fax,
											  @StaffID,
											  @Dummy OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting  ADDR.dbo.bpUpdCntctPer'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn


--	7f.	Add/Update Mailing Address record (if required)...

AddMailAddrRtn:
SET @ErrorMessageHandler = ''
		IF @NewMailAddr = @FALSE
			GOTO UpdMailAddrRtn

		EXEC @ErrNum = ADDR.dbo.bpInsMailAddr @Street,
											  '',
											  @City,
											  @State,
											  @ZIP,
											  @Country,
											  @StaffID,
											  @MailAddrID OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting  ADDR.dbo.bpInsMailAddr'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn

--	10/17/2006 - Changed.

UpdMailAddrRtn:
SET @ErrorMessageHandler = ''
		IF @ReqUpdMA <> @TRUE
			GOTO AddAffilCntctRtn

		EXEC @ErrNum = ADDR.dbo.bpUpdMailAddr @MailAddrID,
											  @Street,
											  '',
											  @City,
											  @State,
											  @ZIP,
											  @Country,
											  @StaffID,
											  @Dummy OUTPUT
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting ADDR.dbo.bpUpdMailAddr'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn


--	7g.	Add Affiliation Contact record...

AddAffilCntctRtn:
SET @ErrorMessageHandler = ''
		IF @IsPartyFound = @TRUE
			GOTO InsAffilRtn

		EXEC @ErrNum = ADDR.dbo.bpInsAffilCntct @LUST,
												@PartyID,
												@RESPARTY,
												@CntctPerID,
												@MailAddrID,
												@StaffID,
												@AffilCntctID OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting ADDR.dbo.bpInsAffilCntct'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn

--	7h.	Add Affiliation record...

InsAffilRtn:
SET @ErrorMessageHandler = ''
		EXEC @ErrNum = AGENCY.dbo.bpInsAffiliation @CMNFACID,
												   @AffilType, 
												   @StartDate, 
												   @EndDate,
												   @LUST, 
												   @LUSTID,
												   @OwnshpCd,
												   @AffilComments,
												   @StaffID, 
												   @AffiliationID OUTPUT
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting AGENCY.dbo.bpInsAffiliation'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn

--	7i.	Save LUST Affiliation Contact record...

		EXEC @ErrNum = ADDR.dbo.bpInsLUSTAffilCntcts @AffiliationID,
													@PartyID
		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting ADDR.dbo.bpInsLUSTAffilCntcts'
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn

--	7j.	Save Organization Name into Affiliation Name table for auditing purposes...
SET @ErrorMessageHandler = ''



		EXEC @ErrNum = AGENCY.dbo.bpInsAffilName @AffiliationID,
												 @ORG_NAME,
												 @LUST,
												 @AffilName,
												 @StaffID


		SELECT @SysErr = @@ERROR
		IF @SysErr <> 0
			BEGIN
				SELECT @ErrNum = @SysErr
				SET @ErrorMessageHandler = 'Problem with Getting AGENCY.dbo.bpInsAffilName ' + CONVERT(VARCHAR, @ErrNum)
			END
		IF @ErrNum <> 0
			GOTO RollbackRtn

--	8.	Save changes into the databases...	

SaveDbRtn:
	COMMIT TRAN
	SELECT @Result = @TRUE
	GOTO ExitRtn
	
--	9.	Discard changes in case something goes wrong...

RollbackRtn:
	ROLLBACK TRAN

ExitRtn:



	RETURN (@Result)
END

GO

GRANT EXECUTE ON [dbo].[apInsLUSTAffilPartyData] TO [LUSTUser] AS [dbo]
GO


/****** Object:  StoredProcedure [dbo].[apCreateIncidentData]    Script Date: 6/11/2019 5:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
 -----------------------------------------------------------------------------------------------------------
  apCreateIncident

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
  06/11/2019	aguedea		Modified so that EmailReviewer is based on LastChanged By, referencing HRIS.dbo.EmpHisInitVw
				Added check for when on PROD add DEQTanksReview groups
				Now calls apReportLustStatus with the new EmailReviewer data

 -----------------------------------------------------------------------------------------------------------

 declare @ErrorMessageHandler VARCHAR(1024), @LogNumberTemp VARCHAR(10), @LustIDTemp INT, @ResultSp INT

 exec apCreateIncidentData 
		0, NULL, 03, '04-01-2019', 'Alex Test Site'
		,'123 Site Address Rd', 'Hillsboro', '97123', '503-555-1212', 0
		,0 , 1, 0, '', 0
		,@ErrorMessagehandler OUTPUT, @LogNumberTemp OUTPUT, @LustIDTemp OUTPUT, '04-01-2019', 1
		,0, 0, 1, 0, 0
		,0, 0, 1, 0, 0
		,1, 0, 1, 0, 0
		,1, 0, 0, 1, 0
		,0, 'Test Org', 'FN Test', 'LN Test', '503-555-1212'
		,'guedea.alex@deq.state.or.us', '12 RP STREET NAME', 'Hillsboro', '97123', 'OR'
		,'US', NULL, 'IC ORG', 'IC FIRST', 'IC LAST'
		,'503-555-1213', 'guedea.alex@deq.state.or.us', '123 IC St', 'Hillsboro', '97123'
		,'OR', 'US', 'IC Comments', NULL, 'ACCEPT'
		,'aguedea', @ResultSP OUTPUT

SELECT @ErrorMessageHandler, @LogNumberTemp, @LustIDTemp, @ResultSp

select * FROM vwLustParty where lustid > 52944



select top 10 * FROM incident order by lustid desc

select * FROm assessment
delete from incident where lustid = (SELECT LustId from incident where SiteName = 'Alex Test Site')
delete FROM assessment where lustid = (SELECT LustId from incident where SiteName = 'Alex Test Site')

select * FROM incident where lustid = (SELECT LustId from incident where SiteName = 'Alex Test Site')
select * FROM assessment where lustid = (SELECT LustId from incident where SiteName = 'Alex Test Site')

select * FROM sitescore

select * FROM SiteScoreValues
select * FROM debugtable
truncate table debugtable

select s
exec apGetAssessmentByLustIdData 52945
select * FROM incident where lustid = 52945


 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apCreateIncidentData] 
-- in-coming Incident values
	 @LustIdIN							INT = 0
	,@FacilityId						int = NULL
	,@CountyId							int
	,@ReceivedDate						datetime
    ,@SiteName							varchar(40)

	,@SiteAddress						varchar(40)
	,@SiteCity							varchar(20)
	,@SiteZip							varchar(5)
	,@SitePhone							varchar(25) = ''
    ,@NoValidAddress					bit	= NULL

	,@RegTankInd						bit
	,@HotInd							bit
	,@NonRegTankInd						bit
	,@SiteComment						varchar(8000) = NULL
	,@OlprrId							INTEGER
    
	,@ErrorMessageHandler   			varchar(1024) OUTPUT
    ,@LogNumberTemp						varchar(10) OUTPUT
	,@LustIdTemp						int OUTPUT            
-- in-coming Assessment values
    ,@DiscoverDate						datetime -- todo bdyer 11 april 2007
	,@ConfirmationCode					VARCHAR(2)

	,@DiscoveryCode						VARCHAR(2)
	,@ReleaseCauseCode					VARCHAR(2)
	,@ReleaseSourceId int  -- todo bdyer 11 april 2007
	,@SLMediaInd bit
	,@GWMediaInd bit


	,@SWMediaInd bit
	,@DWMediaInd bit
	,@FVMediaInd bit
	,@FPMediaInd bit
	-- TODO BDYER 7 MAR 2006 --> NOT IN SERVICE!!!!!!!!! ,@UNMediaInd bit 
	,@UGContamInd bit
	
	
	,@LGContamInd bit
	,@MGContamInd bit
	,@DSContamInd bit
	,@WOContamInd bit
	,@LBContamInd bit

	,@SVContamInd bit
	,@OPContamInd bit
	,@CHContamInd bit
	,@UNContamInd bit
	,@MTBEContamInd bit

	,@HOContamInd bit
-- in-coming Responsible Party values
	,@RPOrganization	Varchar(40)	
	,@RPFirstName		VarChar(40)
	,@RPLastName		VarChar(40)
	,@RPPhone		VarChar(40) = NULL

	,@RPEmail		VarChar(40)	= NULL
	,@RPStreet		VarChar(56)
	,@RPCity		VarChar(25)
	,@RPZIP			VarChar(10)	
	,@RPState		VarChar(2)

	,@RPCountry							VarChar(25) = NULL
	,@RPAffilComments					VarChar(2000) = NULL
-- in-coming Invoice Contact values
	,@ICOrganization					Varchar(40)	= NULL
	,@ICFirstName						VarChar(40) = NULL
	,@ICLastName						VarChar(40) = NULL


	,@ICPhone							VarChar(40) = NULL
	,@ICEmail							VarChar(40)	= NULL
	,@ICStreet							VarChar(56) = NULL
	,@ICCity							VarChar(25) = NULL
	,@ICZIP								VarChar(10)	= NULL 

	,@ICState							VarChar(2) = NULL
	,@ICCountry							VarChar(25) = NULL
	,@ICAffilComments					VarChar(2000) = NULL 
	,@AppID								VARCHAR(25) = NULL
	,@NewSiteStatus						VARCHAR(8)

	,@LastChangeby						VARCHAR(64)
	,@ResultSP							INT OUTPUT
	

AS


--      working variables
DECLARE @_NewLogNumber					VarChar(10)
       ,@_NewLustId						INTEGER
       ,@_ResponsibleParty     VarChar(3)
       ,@_InvoiceContact       VarChar(3)
       ,@_LustContact          VarChar(3)
       ,@TodayDate				datetime
	   ,@EmailSubject			VARCHAR(255) = ''
	   ,@EmailHeader			VARCHAR(255) = ''
	   ,@EmailContact			VARCHAR(255) = ''
	   ,@EmailReviewer			VARCHAR(255) = ''
	   ,@DEQOffice				VARCHAR(3) = ''
	   ,@ErrNum					INT = 0
	   ,@Recipients				VARCHAR(255) = ''
	   ,@GeoLocID				INT = 0
	   ,@ConfirmationId			INT = NULL
	   ,@DiscoveryId			INT = NULL
	   ,@ReleaseCauseId			INT = NULL
	   ,@ErrorHandlerMsg		VARCHAR(2000)
	   ,@SP_Result				INT
	   ,@Result					Bit = 0


-- Initialize working variables
SELECT  @Result = 0
       ,@_NewLustId = 0
       ,@_ResponsibleParty = 'RP'
       ,@_InvoiceContact   = 'INV'
       ,@_LustContact      = 'CON'
       ,@TodayDate = getdate()



BEGIN TRAN


--

	

IF ISNULL(@OlprrID, 0) != 0
	BEGIN
		IF EXISTS (SELECT * FROM Incident WHERE olprrId = @OlprrID)
			BEGIN
				SET @ErrorMessageHandler = 'This OlprrId Already Exists in LUST'
				SET @Result = -1
				Goto Abort
			END
	END

	--INSERT INTO debugtable (insertTime, Message)
	--SELECT GETDATE(), 'xxx   ACCEPT FOR ' + Convert(varchar, ISNULL(@NewSiteStatus, ''))

/*
	**************************  CURRENT OLPRR Design issue  **************************  

	UI Displays the Description of the values and the UI has the ID's hard coded.  This stored procedure will pass in the Code values and 
	perform a lookup to the Id for storage.

	**************************  CURRENT OLPRR Design issue  **************************  
*/

-- Lookup of the ConfirmationId from the ConfirmationCode 
SET @ConfirmationId = (SELECT ConfirmationId FROM LUST.dbo.AssessmentConfirmationType WHERE @ConfirmationCode = ConfirmationCode)


-- Lookup of the DiscoveryId from the DiscoveryCode 
SET @DiscoveryId = (SELECT DiscoveryId FROM LUST.dbo.AssessmentDiscoveryType WHERE @DiscoveryCode = DiscoveryCode)


-- Lookup of the ReleaseCauseId from the ReleaseCauseCode 
SET @ReleaseCauseId = (SELECT ReleaseCauseId FROM LUST.dbo.AssessmentReleaseType WHERE @ReleaseCauseCode = ReleaseCauseCode)


IF @NewSiteStatus = 'ACCEPT' OR @NewSiteStatus = 'LUST'
	BEGIN


	
		INSERT INTO debugtable (insertTime, Message)
		SELECT GETDATE(), 'ACCEPT FOR ' + Convert(varchar, @OlprrId)

		SELECT @SiteCity = UPPER(@SiteCity)


	-- BDYER 11 JAN 2006 
	IF @GeolocId = 0
	   BEGIN
	   SELECT @GeolocId = NULL
	   END

	IF @FacilityId = 0
	   BEGIN
	   SELECT @FacilityId = NULL
	   END



	IF (LTRIM(RTRIM(ISNULL(@APPId, ''))) != '' AND LTRIM(RTRIM(@APPId)) != 'LUST')				-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< User supplied ID  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		BEGIN
			INSERT INTO debugtable (insertTime, Message)
			SELECT GETDATE(), '@AppId ' + Convert(varchar, ISNULL(@AppId, ''))
		
			--EXEC dbo.apRetrieveGeoLocIDData @appID, @GeoLocID OUTPUT
			
			--IF ISNULL(@GeoLocID, 0) = 0
			--	BEGIN
			--		--SET @ErrNum = @@ERROR
			--		--IF  @ErrNum <> 0
			--			--BEGIN	
			--				SET @ErrorMessage = 'Error in OLPRR Reporting process.' 
			--						   + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)    
			--						   + '          Error in Stored Procedure apOLPRRInsertIncidentData'
			--						   + CHAR(13) + CHAR(10)
			--						   + '          At "INSERT RetrieveGeoLocID" ' 
			--						   + CHAR(13) + CHAR(10)
			--						   + '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
			--						   + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)
			--						   + '          OlprrID: ' + Convert(VARCHAR, @OlprrID)
			--			--END
			--	END
		END

	--INSERT INTO debugtable (insertTime, Message)
	--SELECT GETDATE(), 'Inserting into Incident Table for ' + Convert(varchar, @OlprrId)

	EXEC dbo.apInsUpdIncidentData
		 @LustIdIN 
		,@FacilityId
		,@CountyId
		,@ReceivedDate      
		,@SiteName,
		
		@SiteAddress, @SiteCity, @SiteZip, @SitePhone ,@NoValidAddress
		,0, 0, @RegTankInd, @HotInd, @NonRegTankInd

	 --   ,0,0,0,0 --@BrownfieldCodeId,@PropertyTranPendingInd,@ProgramTransferInd,@HotAuditRejectInd 
		,0, 0, 0 ,0, 0
		,0, @SiteComment, NULL, NULL, @GeolocId
		,@OlprrId, @DiscoverDate, @LastChangeby, @LogNumberOUT = @LogNumberTemp OUTPUT, @LustIdOUT = @_NewLustId OUTPUT
		,@ErrorMessageHandler = @ErrorHandlerMsg OUTPUT, @ResultSP = @SP_Result OUTPUT

		SELECT @Result = @@ERROR

		IF @SP_Result <> 0 
		BEGIN
				--SET @ErrorMessage = 'Error in Create Incident record process. ' + Convert(VARCHAR, @OlprrId) + ' -- Contact Support.'
				SET @ErrorMessageHandler = @ErrorHandlerMsg
				SET @Result = -1
				GOTO Abort
				--GOTO Success
			END

		

	SELECT  @LustIdTemp = @_NewLustId

	If @LustIdTemp != 0
		BEGIN
		IF ISNULL(@LustIdTemp, 0) = 0
			BEGIN
				SET  @ErrorMessageHandler = 'Error in Create Incident record process. ' + Convert(VARCHAR, @OlprrId) + ' -- Contact Support.'
				SET @Result = -1
				--GOTO ABORT
			END 

		
		EXEC dbo.apInsUpdAssessmentData
			 0, NULL ,@_NewLustId ,@DiscoverDate ,@ConfirmationId, 
			 @DiscoveryId, @ReleaseCauseId, @ReleaseSourceId ,@SLMediaInd, @GWMediaInd
			
			,@SWMediaInd, @DWMediaInd, @FVMediaInd, @FPMediaInd, 0 -- TODO BDYER 7 MAR 2006 @UNMediaInd
			,@UGContamInd, @LGContamInd, @MGContamInd, @DSContamInd, @WOContamInd, 
			
			@LBContamInd, @SVContamInd, @OPContamInd, @CHContamInd, @UNContamInd, 
			@MTBEContamInd, @HOContamInd, 0 ,0 ,0 
			
			,0, 0, 0, 0, 0  --,@CleanupNecessaryInd,@OffSiteMigrationInd,@FPRemovedInd,@VPRemovedInd, @DelineateSL,
			--@DelineateGW,@SLDelineated,@GWDelineated ,@DelineateSL,
			,0 ,0 ,0, 0, 0 --,@GWCompMonitoring,@CAPRequested,@CAPSubmitted,@CAPApproved,@CurrentSiteScore
			
			,NULL, NULL, @LastChangeby, @ErrorMessageHandler OUTPUT --,@AmntRelCmnt,@ContamCmnt

		 SELECT @Result = @@ERROR
		 IF     @Result <> 0
			 BEGIN
				SET @ErrorMessageHandler = 'Error in Create Assessment record process. OlprrID ' + Convert(VARCHAR, @OlprrId) + ' -- Contact Support.'
				SET @Result = -1
				GOTO ABORT
			 END

		DECLARE @CurrentSiteScore INT, @LowScore INT, @AvgScore INT, @HighScore INT, @ScoreCount INT, @ScoreRange CHAR(10)

		EXEC apUpdateSiteScoreData  @_NewLustId, @CurrentSiteScore	OUTPUT, @ErrorMessageHandler OUTPUT, @LowScore OUTPUT, @AvgScore OUTPUT
			,@HighScore	OUTPUT, @ScoreCount	OUTPUT, @ScoreRange	OUTPUT 
		

		 SELECT @Result = @@ERROR
		 IF     @Result <> 0
			 BEGIN
			 SET @ErrorMessageHandler = 'Error in Create Site Score record process. OlprrId ' + Convert(VARCHAR, @OlprrId) + ' -- Contact Support.'
			 GOTO ABORT
			 END

		-- ALTER  CONTACTS
		--Create Responsible Party Contact for all new LUST Incidents.
		EXEC dbo.apInsLUSTAffilPartyData
			@_NewLustId        
		   ,@_ResponsibleParty 
		   ,@TodayDate          
		   ,NULL               -- @RPEndDate : Will always be null from the OLPRR.
		   ,@RPOrganization

		   ,NULL               --@RP Sub Org : Will always be null from the OLPRR.
		   ,NULL               --@RPJobTitle : Will always be null from the OLPRR.
		   ,@RPFirstName
		   ,@RPLastName
		   ,@RPPhone	

		   ,@RPEmail
		   ,@RPStreet
		   ,@RPCity	
		   ,@RPZIP	
		   ,@RPState

		   ,@RPCountry	
		   ,@RPAffilComments
		   ,@LastChangeby			-- @LastChangeBy
		   ,NULL					-- @PartyID
		   ,NULL					-- @AffiliationID

		   ,@ErrorMessageHandler OUTPUT	-- @ErrMsg
		   ,@Result	OUTPUT			-- @Result

		 SELECT @Result = @@ERROR
		 IF     @Result <> 0
			 BEGIN
			 SET @ErrorMessageHandler = 'Error in Create Contact record process. OlprrId ' + Convert(VARCHAR, @OlprrId) + ' -- Contact Support.'
			 GOTO ABORT
			 END


		--IF AN HOT ENTRY FROM OLPRR PROCESS, CREATE ADDITIONAL 'LUST CONTACT' WITH IN-COMING RP DATA.
		IF ((@HotInd = 1) AND (@OlprrId > 0))
				BEGIN 
			
			EXEC dbo.apInsLUSTAffilPartyData
				@_NewLustId        -- not passed from u/i  
			   ,@_LustContact      -- not passed from u/i
			   ,@TodayDate
			   ,NULL               -- @RPEndDate : Will always be null from the OLPRR.
			   ,@RPOrganization

			   ,NULL               --@RP SubOrg : Will always be null from the OLPRR and Create Incident process.
			   ,NULL                   --@RPJobTitle : Will always be null from the OLPRR.
			   ,@RPFirstName
			   ,@RPLastName
			   ,@RPPhone	

			   ,@RPEmail
			   ,@RPStreet
			   ,@RPCity	
			   ,@RPZIP	
			   ,@RPState

			   ,@RPCountry	
			   ,@RPAffilComments
			   ,@LastChangeby			-- @LastChangeBy
		       ,NULL					-- @PartyID
		       ,NULL					-- @AffiliationID

		       ,@ErrorMessageHandler OUTPUT	-- @ErrMsg
		       ,@Result	OUTPUT			-- @Result

				 SELECT @Result = @@ERROR
			 IF     @Result <> 0
				 BEGIN
					 SET @ErrorMessageHandler = 'Error in Create Contact record process. OlprrId ' + + Convert(VARCHAR, @OlprrId) + ' -- Contact Support.'
				 GOTO ABORT
				 END
				END

			--INSERT INTO debugtable (insertTime, Message)
			--SELECT GETDATE(), 'After Responsible Party Update Table for ' + Convert(varchar, @OlprrId)

		-- If new LUST Incident is Regulated or Non-Regulated, create Invoice Contact

		IF ((@RegTankInd = 1) OR (@NonRegTankInd = 1))
				BEGIN

			EXEC dbo.apInsLUSTAffilPartyData
				@_NewLustId
			   ,@_InvoiceContact
			   ,@TodayDate 
			   ,NULL               
			   ,@ICOrganization

			   ,NULL              
			   ,NULL               
			   ,@ICFirstName
			   ,@ICLastName
			   ,@ICPhone	

			   ,@ICEmail
			   ,@ICStreet
			   ,@ICCity	
			   ,@ICZIP	
			   ,@ICState

			   ,@ICCountry	
			   ,@ICAffilComments
			   ,@LastChangeby			-- @LastChangeBy
		       ,NULL					-- @PartyID
		       ,NULL					-- @AffiliationID

		       ,@ErrorMessageHandler OUTPUT	-- @ErrMsg
		       ,@Result	OUTPUT			-- @Result
	
			 SELECT @Result = @@ERROR
			 IF ISNULL(@Result, 0) <> 0
				 BEGIN
					 --SET @ErrorMessage = 'Error in Create Contact record process. OlprrId ' + Convert(VARCHAR, @OlprrId) + ' -- Contact Support.'
					 Set @ErrorMessageHandler = @ErrorHandlerMsg
					 SET @Result = -1
				 GOTO ABORT
				 END
			   END
		END

		IF @NewSiteStatus = 'ACCEPT'

			BEGIN
				If ISNULL(@LustIdTemp, 0) = 0 
	
					BEGIN
						SET @ErrorMessageHandler = 'OLPRR Review could not create the LUST Record for OlprrID = ' + CONVERT(VARCHAR, ISNULL(@OlprrId, ''))
						SET @Result = -1
						GOTO Success
					END
				ELSE
					BEGIN
						IF @DEQOffice = ''
							BEGIN
								SELECT @DEQOffice = (SELECT DEQOffice FROM OlprrIncident WHERE OlprrID = @OlprrID)
							END
	
						EXEC apOLPRRUpdIncidentStatus @Result OUTPUT, @OlprrId, 'ACCEPT'
						SELECT @Result = @@ERROR
						IF @Result <> 0
							BEGIN
								SET @ErrorMessageHandler = 'Error in Updating Accpt Status of OLPRR Record ' + Convert(VARCHAR, @OlprrId) + ' . -- Contact Support.'
								SET @Result = -1
								GOTO ABORT
						END
			
						-- Create Email content
						SET @EmailSubject = 'OLPRR Incident Report in Accepted Status. Log Number: ' + ISNULL(@LogNumberTemp, '')
						SET @EmailHeader = 'Your on-line tank data submittal has been reviewed and accepted by the State of Oregon DEQ.' + CHAR(10) + CHAR(13)
						SET @EmailHeader = @EmailHeader + 'New LUST Incident Log Number: ' + ISNULL(@LogNumberTemp, '')
						-- Email recipients
						SET @EmailReviewer = (SELECT ISNULL(email_addr, '') FROM HRIS.dbo.EmpHisInitVw WHERE NT_LOGIN = @LastChangeby)
						IF CHARINDEX('PROD', @@SERVERNAME) > 0
							SET @EmailReviewer = @EmailReviewer + (SELECT CASE ISNULL(@DEQOffice, '') WHEN 'EUG' THEN ';DEQTanksReviewEugene@deq.state.or.us'
																		WHEN 'MDF' THEN ';DEQTanksReviewMedford@deq.state.or.us'
																		WHEN 'SLM' THEN ';DEQTanksReviewSalem@deq.state.or.us'
																		ELSE ''
																	END)
						ELSE 
							SET @EmailReviewer = @EmailReviewer + ';QUAN.Nga@deq.state.or.us; GUEDEA.Alex@deq.state.or.us'
						
						--IF CHARINDEX('PROD', @@SERVERNAME) > 0
						--	BEGIN
						--		INSERT INTO debugtable (insertTime, Message)
						--		SELECT GETDATE(), 'Servername = ' + ISNULL(@@SERVERNAME, '') 
						--	END

						--IF CHARINDEX('MAINT', @@SERVERNAME) > 0
						--	BEGIN
						--		INSERT INTO debugtable (insertTime, Message)
						--		SELECT GETDATE(), 'Servername = ' + ISNULL(@@SERVERNAME, '') 
						--	END
						--IF CHARINDEX('DEV', @@SERVERNAME) > 0
						--	BEGIN
						--		INSERT INTO debugtable (insertTime, Message)
						--		SELECT GETDATE(), 'Servername = ' + ISNULL(@@SERVERNAME, '') 
						--	END


						--INSERT INTO debugtable (insertTime, Message)
						--SELECT GETDATE(), 'email reviewer = ' + @EmailReviewer

						--INSERT INTO debugtable (insertTime, Message)
						--SELECT GETDATE(), 'rpEmail recipients = ' + @RPEmail

						--INSERT INTO debugtable (insertTime, Message)
						--SELECT GETDATE(), 'icEmail recipients = ' + @ICEmail


	
						-- Generate Email 
						EXEC apReportLUSTStatus @LustIdTemp, 0, @EmailSubject, @EmailReviewer, @EmailHeader
						
						SELECT @Result = @@ERROR
						IF @Result <> 0
							BEGIN
								SET @ErrorMessageHandler = 'Error in Generating Accept EMAIL for OLPRR Record ' + Convert(VARCHAR, @OlprrId) 
								SET @Result = -1
								GOTO ABORT
							END
					END
				END
END




ELSE IF @NewSiteStatus = 'HOLD'
	BEGIN


		IF EXISTS (SELECT * FROM OlprrIncident WHERE olprrId = @OlprrID AND LTRIM(RTRIM(UPPER(SiteStatus))) = 'HOLD')
			BEGIN
				SET @ErrorMessageHandler = 'This Release has already been placed on HOLD'
				SET @Result = -1
			Goto Abort
		END
	

		
		EXEC apOLPRRUpdIncidentStatus @Result OUTPUT, @OlprrId, 'HOLD'
		SELECT @Result = @@ERROR
		IF @Result <> 0
			BEGIN
			SET @ErrorMessageHandler = 'Error in Updating Accpt Status of OLPRR Record ' + Convert(VARCHAR, @OlprrId) + ' . -- Contact Support.'
			SET @Result = -1
			GOTO ABORT
		END

		SET @EmailSubject = 'OLPRR Incident Report in Hold Status.'
		SET @EmailHeader = 'Your on-line tank data submittal has been reviewed and HOLD by the State of Oregon DEQ.'
		SET @EmailReviewer = (SELECT ISNULL(email_addr, '') FROM HRIS.dbo.EmpHisInitVw WHERE NT_LOGIN = @LastChangeby)
		IF CHARINDEX('PROD', @@SERVERNAME) > 0 
			SET @EmailReviewer = @EmailReviewer + (SELECT CASE ISNULL(@DEQOffice, '') WHEN 'EUG' THEN ';DEQTanksReviewEugene@deq.state.or.us'
					WHEN 'MDF' THEN ';DEQTanksReviewMedford@deq.state.or.us'
					WHEN 'SLM' THEN ';DEQTanksReviewSalem@deq.state.or.us'
					ELSE ''
				END)
		ELSE 
			SET @EmailReviewer = @EmailReviewer + ';QUAN.Nga@deq.state.or.us; GUEDEA.Alex@deq.state.or.us'
						


		EXEC apReportLUSTStatus 0, @OlprrID, @EmailSubject, @EmailReviewer, @EmailHeader
		SELECT @Result = @@ERROR
		IF @Result <> 0
		BEGIN
			SET @ErrorMessageHandler = 'Error in Generating Hold EMAIL for OLPRR Record ' + Convert(VARCHAR, @OlprrId) 
			GOTO ABORT
		END

	END
ELSE IF @NewSiteStatus = 'DECLINE'
	BEGIN

		IF EXISTS (SELECT * FROM OlprrIncident WHERE olprrId = @OlprrID AND LTRIM(RTRIM(UPPER(SiteStatus))) = 'DECLINE')
			BEGIN
				SET @ErrorMessageHandler = 'This Release has already been placed on DECLINED'
				SET @Result = -1
				GOTO Abort
		END
	
		EXEC apOLPRRUpdIncidentStatus @Result OUTPUT, @OlprrId, 'DECLINE'
		SELECT @Result = @@ERROR
		IF @Result <> 0
		BEGIN
			SET @ErrorMessageHandler = 'Error in Updating Accpt Status of OLPRR Record ' + Convert(VARCHAR, @OlprrId) + ' . -- Contact Support.'
			SET @Result = -1
			GOTO ABORT
		END

		SET @EmailSubject = 'OLPRR Incident Report in Decline Status.'
		SET @EmailHeader = 'Your on-line tank data submittal has been reviewed and DECLINED by the State of Oregon DEQ.'
		SET @EmailReviewer = (SELECT ISNULL(email_addr, '') FROM HRIS.dbo.EmpHisInitVw WHERE NT_LOGIN = @LastChangeby)
		IF CHARINDEX('PROD', @@SERVERNAME) > 0 
			SET @EmailReviewer = @EmailReviewer + (SELECT CASE ISNULL(@DEQOffice, '') WHEN 'EUG' THEN ';DEQTanksReviewEugene@deq.state.or.us'
				WHEN 'MDF' THEN ';DEQTanksReviewMedford@deq.state.or.us'
				WHEN 'SLM' THEN ';DEQTanksReviewSalem@deq.state.or.us'
				ELSE ''
			END)
		ELSE 
			SET @EmailReviewer = @EmailReviewer + ';QUAN.Nga@deq.state.or.us; GUEDEA.Alex@deq.state.or.us'

		EXEC apReportLUSTStatus 0, @OlprrID, @EmailSubject, @EmailReviewer, @EmailHeader
		IF @Result <> 0
		BEGIN
			SET @ErrorMessageHandler = 'Error in Generating Hold EMAIL for OLPRR Record ' + Convert(VARCHAR, @OlprrId) 
			SET @Result = -1
			GOTO ABORT
		END

	END


--Success exit
Success:
COMMIT TRAN
RETURN @Result
Goto EndProc


-- Failure exit
ABORT:
ROLLBACK TRAN


SELECT @ErrorMessageHandler
--IF  LEN(LTRIM(RTRIM(ISNULL(@ErrorMessage, ''))))  <> 0
--	BEGIN	

--		EXEC msdb.dbo.sp_send_dbmail
--		@profile_name = 'default',
--		@Recipients = 'guedea.alex@deq.state.or.us',
--		@body =  @ErrorMessage,
--		@subject = 'Olprr Error'
--	END

RETURN @Result


EndProc:



GO
GRANT EXECUTE ON [dbo].[apCreateIncidentData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltAllPCSData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apDltPCS

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE     PROCEDURE [dbo].[apDltAllPCSData]
	 @PCSID int --Primary Key	 
	,@Result Bit = 0  OUTPUT
	,@ErrorMessageHandler	VARCHAR(1024)		OUTPUT
AS

	DECLARE @ErrNum int
	SET @ErrNum = 0

	BEGIN TRANSACTION
	
		DELETE FROM [dbo].[PcsSwPermit]
		WHERE PcsSwPermit.PcsId = @PCSID

		SET @ErrNum = @@ERROR

		IF @ErrNum <> 0 
			BEGIN
				SET @ErrorMessageHandler = @@Error
				GOTO ABORT
			END

		DELETE FROM [dbo].[PetroContamSoil]
		WHERE [PCSID] = @PCSID --Primary Key
	
		SET @ErrNum = @@ERROR
		
		IF @ErrNum <> 0 
			BEGIN
				SET @ErrorMessageHandler = @@Error
				GOTO ABORT
			END
		ELSE
			BEGIN
				COMMIT TRANSACTION
				SET @Result = 0
				RETURN @result
			END
	
	
/* Or, in case of failure... */
ABORT:
	BEGIN
		ROLLBACK TRANSACTION
		SET @Result = 1
		RETURN @Result
    END







GO
GRANT EXECUTE ON [dbo].[apDltAllPCSData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltConsultantData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apDltConsultant

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/



CREATE PROCEDURE [dbo].[apDltConsultantData]
	 @ConsultantId			INT --Primary Key
	,@ErrorMessageHandler	VARCHAR(1024)		OUTPUT
	,@Result				BIT		= 0			OUTPUT
AS

DECLARE  @RecCount int
SELECT   @RecCount = 0

--Check if any WorkReported record references this ConsultantID
SELECT @RecCount = Count(*) 
FROM [dbo].[WorkReported] 
WHERE ConsultantId = @ConsultantId

IF (@RecCount > 0)
	BEGIN
		SET @ErrorMessageHandler = 'You cannot delete this Consultant. Information is referenced by one or more Work Reported records.'
		SET @Result = @@Error
		GOTO ABORT
	END

DELETE FROM [dbo].[Consultant]
WHERE [Id] = @ConsultantId --Primary Key

SELECT @Result = @@ERROR
SET @ErrorMessageHandler = Error_Message()
IF @Result <> 0
	GOTO ABORT
	
-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
	RETURN @Result -- 0
-----------------------------------------------------------------------------

/* Or, in case of failure... */
ABORT:
      RETURN @Result  --  Return @@Error > 0


GO
GRANT EXECUTE ON [dbo].[apDltConsultantData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltPCSData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apDltPCS

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE     PROCEDURE [dbo].[apDltPCSData]
	 @PCSID int --Primary Key	 
	,@Result Bit = 0  OUTPUT
	,@ErrorMessageHandler	VARCHAR(1024)		OUTPUT
AS

DECLARE @ErrNum int
SET @ErrNum = 0

DELETE FROM [dbo].[PetroContamSoil]
	WHERE [PCSID] = @PCSID --Primary Key
	
SET @ErrNum = @@ERROR
SET @ErrorMessageHandler = @@Error
IF @ErrNum <> 0

	BEGIN
	GOTO ABORT
	END
ELSE	-- Successful Completion. @Result initialized = 0 in variable definition.
	BEGIN
	RETURN @Result
	END 

/* Or, in case of failure... */
ABORT:
	BEGIN
	SELECT @Result = 1
	RETURN @Result
        END







GO
GRANT EXECUTE ON [dbo].[apDltPCSData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltPCSPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apDltPCSPermit

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/


CREATE    PROCEDURE [dbo].[apDltPCSPermitData]
	 @SWPermitID int --Primary Key
	,@Result Bit = 0  OUTPUT
	,@ErrorMessageHandler	VARCHAR(1024)		OUTPUT
AS

DECLARE @ErrNum int
SET @ErrNum = 0

DELETE FROM [dbo].[PCSSWPermit]
WHERE [PCSSWPermitID] =  @SWPermitID --Primary Key
	
SET @ErrNum = @@ERROR


IF @ErrNum <> 0
	BEGIN
		SET @ErrorMessageHandler = @@Error
		GOTO ABORT
	END
ELSE	-- Successful Completion. @Result initialized = 0 in variable definition.
	BEGIN
		RETURN @Result
	END 

/* Or, in case of failure... */
ABORT:
	BEGIN
		SELECT @Result = 1
		RETURN @Result
     	END








GO
GRANT EXECUTE ON [dbo].[apDltPCSPermitData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltPictureData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[apDltPictureData]
	 @PictureId				INT
	,@ErrorMessageHandler	VARCHAR(1024)		OUTPUT
	,@Result				Bit = 0				OUTPUT
AS

DECLARE @ErrNum int
SET @ErrNum = 0


-- ----------------------------------------------------
BEGIN TRANSACTION


DELETE SitePicture WHERE (PictureId = @PictureId) 
IF @@RowCount = 0
	BEGIN
		ROLLBACK TRANSACTION
		SELECT @Result = 0
		SET @ErrorMessageHandler = 'Error while deleting picture'
	END




DELETE Picture WHERE (PictureID = @PictureID)
IF @@RowCount = 0
	BEGIN
		ROLLBACK TRANSACTION
		SELECT @Result = 0
		SET @ErrorMessageHandler = 'Error while deleting picture'
	END

COMMIT TRANSACTION
SELECT @Result = 1
GO
GRANT EXECUTE ON [dbo].[apDltPictureData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltProjMgrHistoryData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
apDltProjMgrHistory

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/


CREATE     PROCEDURE [dbo].[apDltProjMgrHistoryData]
	 @ProjMgrHistId int --Primary Key
	,@ErrorMessageHandler	VARCHAR(1024) OUTPUT
	,@Result Bit = 0  OUTPUT
AS

DECLARE @ErrNum int
SET @ErrNum = 0

DELETE FROM [dbo].[ProjectManagerHistory]
	WHERE [ProjMgrHistId] = @ProjMgrHistId --Primary Key
	
SET @ErrNum = @@ERROR
SET @ErrorMessageHandler = @@Error
IF @ErrNum <> 0

	BEGIN
	GOTO ABORT
	END
ELSE	-- Successful Completion. @Result initialized = 0 in variable definition.
	BEGIN
	RETURN @Result
	END 

/* Or, in case of failure... */
ABORT:
	BEGIN
	SELECT @Result = 1
	RETURN @Result
        END







GO
GRANT EXECUTE ON [dbo].[apDltProjMgrHistoryData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltPublicNoticeData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apDltPublicNotice

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE   PROCEDURE [dbo].[apDltPublicNoticeData]
	 @PublicNoticeId int --Primary Key	 
	,@Result				BIT = 0			OUTPUT
	,@ErrorMessageHandler	VARCHAR(1024)	OUTPUT
AS

DECLARE @ErrNum int
SET @ErrNum = 0

DELETE FROM [dbo].[PublicNotice]
	WHERE [PublicNoticeId] = @PublicNoticeId --Primary Key
	
SELECT @ErrNum = @@ERROR
SET @ErrorMessageHandler = Error_Message()
IF @ErrNum <> 0

	BEGIN
	GOTO ABORT
	END
ELSE	-- Successful Completion. @Result initialized = 0 in variable definition.
	BEGIN
	RETURN @Result
	END 

/* Or, in case of failure... */
ABORT:
	BEGIN
	SELECT @Result = 1
	RETURN @Result
        END






GO
GRANT EXECUTE ON [dbo].[apDltPublicNoticeData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltSiteControlData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apDltSiteControl

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE     PROCEDURE [dbo].[apDltSiteControlData]
	 @SiteControlId int --Primary Key
	 ,@ErrorMessageHandler	VARCHAR(1024)	OUTPUT
	,@Result Bit = 0  OUTPUT
AS

DECLARE @ErrNum int
SET @ErrNum = 0

DELETE FROM [dbo].[SiteControl]
	WHERE [SiteControlId] = @SiteControlId --Primary Key
	
SET @ErrNum = @@ERROR
SET @ErrorMessageHandler = Error_Message()
IF @ErrNum <> 0

	BEGIN
	GOTO ABORT
	END
ELSE	-- Successful Completion. @Result initialized = 0 in variable definition.
	BEGIN
	RETURN @Result
	END 

/* Or, in case of failure... */
ABORT:
	BEGIN
	SELECT @Result = 1
	RETURN @Result
        END







GO
GRANT EXECUTE ON [dbo].[apDltSiteControlData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltSiteScoreData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO




/*****************************************************************************/
/*
**		Name: [dbo].[apDltSiteScore]
**		Desc: deletes a record from [dbo].[SiteScore] Associated w/ a passed in primary key(s)
**		
**		Inputs:	@SiteScoreId int --Primary Key

**		  		
**		Outputs:
**		@Result		Bit		= 0  OUTPUT	0 = Update successfully --  Anything else = Failure
**
**		Return values: @Result
** 
**		Called by:   LUST
**                       
**      Author: B.Dyer
**		Date: 28 March 2005 
*******************************************************************************
**		Change History
*******************************************************************************
**	Date:		Author:		Description:
**	--------	--------	---------------------------------------
**    		
*******************************************************************************
*/

/*****************************************************************************/
CREATE PROCEDURE [dbo].[apDltSiteScoreData]
	@SiteScoreId			INT 
	,@ErrorMessageHandler	VARCHAR(1024)	OUTPUT
   ,@Result					Bit = 0			OUTPUT
  
AS

DECLARE @ErrNum int
SET @ErrNum = 0

DELETE FROM [dbo].[SiteScoreValues]
	WHERE [SiteScoreId] = @SiteScoreId --Primary Key
	
		
SELECT @ErrNum = @@ERROR
SET @ErrorMessageHandler = Error_Message()
IF @ErrNum <> 0
	BEGIN
		GOTO ABORT
	END
ELSE	-- Successful Completion. @Result initialized = 0 in variable definition.
	BEGIN
		SELECT @Result =  0
		RETURN @Result
	END 

/* Or, in case of failure... */
ABORT:
	BEGIN
		SELECT @Result =  1
		RETURN @Result
	END 






GO
GRANT EXECUTE ON [dbo].[apDltSiteScoreData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apDltWorkReportedData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apDltWorkReported

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apDltWorkReportedData]
	 @WorkReportedId		INT --Primary Key
	 ,@ErrorMessageHandler	VARCHAR(1024)	OUTPUT
	,@Result				BIT = 0			OUTPUT
AS

DECLARE @ErrNum int
SET @ErrNum = 0

DELETE FROM [dbo].[WorkReported]
	WHERE [WorkReportedId] = @WorkReportedId --Primary Key
	
SELECT @ErrNum = @@ERROR
SET @ErrorMessageHandler = Error_Message()
IF @ErrNum <> 0

	BEGIN
	GOTO ABORT
	END
ELSE	-- Successful Completion. @Result initialized = 0 in variable definition.
	BEGIN
	RETURN @Result
	END 

/* Or, in case of failure... */
ABORT:
	BEGIN
	SELECT @Result = 1
	RETURN @Result
        END




GO
GRANT EXECUTE ON [dbo].[apDltWorkReportedData] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apGetAffilByIdData]    Script Date: 7/10/2019 2:44:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/*
 -----------------------------------------------------------------------------------------------------------
  apGetAffilById

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
  7/10/2019		aguedea			Added the chrischeck column.  Needed to use the vwCRISPartyData instead.
 -----------------------------------------------------------------------------------------------------------
EXEC [apGetAffilByIdData] 303243   ---- << CRIS Contact party Detail
EXEC [apGetAffilByIdData] 281632   ---- << LUST Invoice Contact party Detail
EXEC [apGetAffilByIdData] 218586	---- << CRIS Contact party Detail
EXEC [apGetAffilByIdData] 230742
EXEC [apGetAffilByIdData] 230741
EXEC [apGetAffilByIdData] 230740

EXEC [apGetAffilByIdData] 230738
EXEC [apGetAffilByIdData] 230737


 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apGetAffilByIdData]
		 @AffilId         int
AS

	SELECT 
				AffilId
			   ,AffilTypeCd
			   ,AffilTypeDesc
			   ,StartDt
			   ,EndDt
			   ,PartyID AS PartyId
			   ,Organization
			   ,SubOrganization
			   ,JobTitle
			   ,FirstName
			   ,LastName
			   ,Phone
			   ,Email       
			   ,Street                 
			   ,City
			   ,State   
			   ,ZIP AS Zip
			   ,Country
			   ,AffilComments
			   ,LastUpdBy
			   ,LastUpdDttm 
			   ,CONVERT(INT, ZP4Checked) AS ZP4Checked
			   ,incident.LustId, 
			   incident.LogNumber,
	   	  			  CASE ISNULL(incident.RegulatedTankInd, 0) WHEN 1 THEN 'R'
					ELSE CASE ISNULL(incident.HotInd, 0) WHEN 1 THEN 'H'
						ELSE CASE ISNULL(incident.NonRegTankInd, 0) WHEN 1 THEN 'U'
						END
					END
				END AS ReleaseType,
				ISNULL(cp.LUSTId, 0)   AS crischeck
		FROM       
			   dbo.vwLUSTParty WITH (NOLOCK) LEFT OUTER JOIN incident ON vwLustParty.LustId = incident.LustId
			   LEFT OUTER JOIN CRIS.dbo.Project cp WITH (NOLOCK) ON incident.LustId = cp.LUSTId
			   WHERE  AffilId = @AffilId

UNION ALL
		
			SELECT  AffilID 
					,AffilType
					,'CRIS INVOICE CONTACT' AS AffilTypeDesc
					,AffilStartDate AS StartDt
					,AffilEndDate AS EndDt
					,PartyID AS PartyId
					,Organization 
					,SubOrg AS SubOrganization
					,' ' AS JobTitle
					,FirstName
					,LastName
					,Phone 
					,Email 
					,Street 
					,City 
					,State
					,ZIP
					,Country
					,AffilComments
					,NULL AS LastUpdBy
					,NULL AS LastUpdDttm
					,NULL AS ZP4Checked
					,0 AS LustId
					,NULL AS LogNumber
					,NULL AS ReleaseType
					,ISNULL(LustId, 0) AS chrischeck
 
			FROM    LUST.dbo.vwCRISPartyData WITH (NOLOCK) 
			WHERE    AffilId = @AffilId



GO
GRANT EXECUTE ON [dbo].[apGetAffilByIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentAllByLustId]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetAssessmentAllByLustId]
		@LustId INT
AS 

DECLARE  @_CurrentScore int
        ,@_TotalScoreSumm int
        ,@_AvgLow int
        ,@_AvgHigh int 
        ,@_FullHighRange int 
        ,@_HighRange20 int 
        ,@_HighRange40 int 
        ,@_HighRange60 int 
        ,@_HighRange80 int 
        ,@_HighRange100 int 
		,@LowScore int 
        ,@AvgScore int 
        ,@HighScore int 
        ,@ScoreCount int 
        ,@ScoreRange char(10) 

   -- Current Score
         SET @_CurrentScore =  (select CurrentSiteScore from Assessment where LustId = @Lustid)
       -- Lowest Score  -->OUTPUT #1
		SELECT @LowScore = MIN(CurrentSiteScore), @HighScore = MAX(CurrentSiteScore), @_TotalScoreSumm = SUM(CurrentSiteScore), @ScoreCount = COUNT(*)
		FROM Assessment
       -- Average of all Scores  -->OUTPUT #2
         SET @AvgScore = (@_TotalScoreSumm / @ScoreCount)
       -- Establish AVERAGE high - low range - 100 point spread.    
         SET @_AvgLow = (@AvgScore - 50)
         SET @_AvgHigh = (@AvgScore + 50)

/*
establish the ranges
then compare current score - set text value accordingly
*/
        SET @_FullHighRange = (@HighScore - @_AvgHigh)
        SET @_HighRange20 = (@_AvgHigh + (@_FullHighRange * .2))
        SET @_HighRange40 = (@_AvgHigh + (@_FullHighRange * .4))
        SET @_HighRange60 = (@_AvgHigh + (@_FullHighRange * .6))
        SET @_HighRange80 = (@_AvgHigh + (@_FullHighRange * .8))
        SET @_HighRange100 = @_FullHighRange


IF @_CurrentScore < @_AvgLow
   SET @ScoreRange = 'LOW'

IF ((@_CurrentScore >= @_AvgLow) AND (@_CurrentScore <= @_AvgHigh))
   SET @ScoreRange = 'AVERAGE'

IF ((@_CurrentScore > @_AvgHigh) AND (@_CurrentScore <= @_HighRange20 ))
   SET @ScoreRange = 'HIGH20'

IF ((@_CurrentScore > @_HighRange20) AND (@_CurrentScore <= @_HighRange40 ))
   SET @ScoreRange = 'HIGH40'

IF ((@_CurrentScore > @_HighRange40) AND (@_CurrentScore <= @_HighRange60 ))
   SET @ScoreRange = 'HIGH60'

IF ((@_CurrentScore > @_HighRange60) AND (@_CurrentScore <= @_HighRange80 ))
   SET @ScoreRange = 'HIGH80'

IF (@_CurrentScore > @_HighRange80) 
   SET @ScoreRange = 'HIGH100'





SELECT 
Assessment.AssessmentId, Assessment.DiscoverDate, Assessment.CleanupNecessaryInd, Assessment.MigrationInd, Assessment.ConfirmationId
,Assessment.DiscoveryId, Assessment.ReleaseCauseId, Assessment.ReleaseSourceId
,Assessment.SLMediaInd, Assessment.GWMediaInd, Assessment.SWMediaInd, Assessment.DWMediaInd, Assessment.FVMediaInd
,Assessment.FPMediaInd, Assessment.UNMediaInd, Assessment.UGContamInd, Assessment.LGContamInd, Assessment.MGContamInd
,Assessment.DSContamInd, Assessment.WOContamInd, Assessment.LBContamInd, Assessment.SVContamInd
,Assessment.OPContamInd, Assessment.CHContamInd, Assessment.UNContamInd, Assessment.MTBEContamInd, Assessment.HOContamInd
,Assessment.FPRemovedInd, Assessment.VPRemovedInd, Assessment.DelineateSL, Assessment.DelineateGW
,Assessment.SLDelineated, Assessment.GWDelineated, Assessment.GWCompMonitoring, Assessment.CAPRequested
,Assessment.CAPSubmitted, Assessment.CAPApproved, Assessment.CurrentSiteScore, Assessment.AmntReleaseComment
,Assessment.ContamComment, Assessment.LastChangeBy AssessmentLastChangeBy, Assessment.LastChangeDate  AssessmentLastChangeDate

-- Site Score Values
,SiteScoreValues.SiteScoreId, SiteScoreValues.DwReplMeasure, SiteScoreValues.DwImpMeasure
,SiteScoreValues.DwImpLiklyMeasure, SiteScoreValues.VprLvlMeasure, SiteScoreValues.PopExposdMeasure
,SiteScoreValues.EnvTypMeasure, SiteScoreValues.EnvImpLilelyMeasure, SiteScoreValues.NonDwSupTypMeasure
,SiteScoreValues.UtImpMeasure, SiteScoreValues.RainfallAnnualMeasure, SiteScoreValues.SoilPermMeasure 
,SiteScoreValues.AqfrDepthMeasure, SiteScoreValues.SwDistMeasure, SiteScoreValues.LastChangeBy SiteScoreLastChangeBy
, SiteScoreValues.LastChangeDate SiteScoreLastChangeDate
, @LowScore AS 'LowScore', @AvgScore AS 'AvgScore', @HighScore AS 'HighScore', @ScoreCount AS 'ScoreCount',@ScoreRange AS 'ScoreRange', @LustId AS 'LustId'

FROM dbo.Assessment WITH (NOLOCK) LEFT OUTER JOIN dbo.SiteScoreValues WITH (NOLOCK) ON Assessment.LustId = SiteScoreValues.LustId
WHERE Assessment.LustId = @LustId



GO
GRANT EXECUTE ON [dbo].[apGetAssessmentAllByLustId] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetAssessmentByLustId

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 exec apGetAssessmentByLustIdData 51818

 -----------------------------------------------------------------------------------------------------------
*/


CREATE  PROCEDURE [dbo].[apGetAssessmentByLustIdData]
	 @LustId 			int 


AS


SELECT --[LustId --Primary Key 
	 AssessmentId
    ,DiscoverDate    -- TODO BDYER 12 APRIL 2007
    ,CleanupNecessaryInd
	,MigrationInd
	,ConfirmationId
	,DiscoveryId
	,ReleaseCauseId
    ,ReleaseSourceId  -- TODO BDYER 12 APRIL 2007
	,SLMediaInd
	,GWMediaInd
	,SWMediaInd
	,DWMediaInd
	,FVMediaInd
	,FPMediaInd
	,UNMediaInd
	,UGContamInd
	,LGContamInd
	,MGContamInd
	,DSContamInd
	,WOContamInd
	,LBContamInd
	,SVContamInd
	,OPContamInd
	,CHContamInd
	,UNContamInd
	,MTBEContamInd
	,HOContamInd
	,FPRemovedInd
	,VPRemovedInd
	,DelineateSL
	,DelineateGW
	,SLDelineated
	,GWDelineated
	,GWCompMonitoring
	,CAPRequested
	,CAPSubmitted
	,CAPApproved
    ,CurrentSiteScore
	,AmntReleaseComment
	,ContamComment
	,LastChangeBy
	,LastChangeDate

FROM [dbo].[Assessment] WITH (NOLOCK)
WHERE [LustId] = @LustId


















GO
GRANT EXECUTE ON [dbo].[apGetAssessmentByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentSiteScoreValuesByLustId]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetAssessmentSiteScoreValuesByLustId]
		@LustId INT
AS 
SELECT 
Assessment.AssessmentId, Assessment.DiscoverDate, Assessment.CleanupNecessaryInd, Assessment.MigrationInd, Assessment.ConfirmationId
,Assessment.DiscoveryId, Assessment.ReleaseCauseId, Assessment.ReleaseSourceId
,Assessment.SLMediaInd, Assessment.GWMediaInd, Assessment.SWMediaInd, Assessment.DWMediaInd, Assessment.FVMediaInd
,Assessment.FPMediaInd, Assessment.UNMediaInd, Assessment.UGContamInd, Assessment.LGContamInd, Assessment.MGContamInd
,Assessment.DSContamInd, Assessment.WOContamInd, Assessment.LBContamInd, Assessment.SVContamInd
,Assessment.OPContamInd, Assessment.CHContamInd, Assessment.UNContamInd, Assessment.MTBEContamInd, Assessment.HOContamInd
,Assessment.FPRemovedInd, Assessment.VPRemovedInd, Assessment.DelineateSL, Assessment.DelineateGW
,Assessment.SLDelineated, Assessment.GWDelineated, Assessment.GWCompMonitoring, Assessment.CAPRequested
,Assessment.CAPSubmitted, Assessment.CAPApproved, Assessment.CurrentSiteScore, Assessment.AmntReleaseComment
,Assessment.ContamComment, Assessment.LastChangeBy AssessmentLastChangeBy, Assessment.LastChangeDate  AssessmentLastChangeDate

-- Site Score Values
,SiteScoreValues.SiteScoreId, SiteScoreValues.DwReplMeasure, SiteScoreValues.DwImpMeasure
,SiteScoreValues.DwImpLiklyMeasure, SiteScoreValues.VprLvlMeasure, SiteScoreValues.PopExposdMeasure
,SiteScoreValues.EnvTypMeasure, SiteScoreValues.EnvImpLilelyMeasure, SiteScoreValues.NonDwSupTypMeasure
,SiteScoreValues.UtImpMeasure, SiteScoreValues.RainfallAnnualMeasure, SiteScoreValues.SoilPermMeasure 
,SiteScoreValues.AqfrDepthMeasure, SiteScoreValues.SwDistMeasure, SiteScoreValues.LastChangeBy SiteScoreLastChangeBy
, SiteScoreValues.LastChangeDate SiteScoreLastChangeDate


FROM dbo.Assessment WITH (NOLOCK) JOIN dbo.SiteScoreValues WITH (NOLOCK) ON Assessment.LustId = SiteScoreValues.LustId
WHERE Assessment.LustId = @LustId

GO
GRANT EXECUTE ON [dbo].[apGetAssessmentSiteScoreValuesByLustId] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetAssessmentSiteScoreValuesRangesByLustId]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetAssessmentSiteScoreValuesRangesByLustId]
		@LustId INT
AS 


DECLARE  @_CurrentScore int
        ,@_TotalScoreSumm int
        ,@_AvgLow int
        ,@_AvgHigh int 
        ,@_FullHighRange int 
        ,@_HighRange20 int 
        ,@_HighRange40 int 
        ,@_HighRange60 int 
        ,@_HighRange80 int 
        ,@_HighRange100 int 
		,@LowScore int 
        ,@AvgScore int 
        ,@HighScore int 
        ,@ScoreCount int 
        ,@ScoreRange char(10) 

   -- Current Score
         SET @_CurrentScore =  (select CurrentSiteScore from Assessment where LustId = @Lustid)
       -- Lowest Score  -->OUTPUT #1
		SELECT @LowScore = MIN(CurrentSiteScore), @HighScore = MAX(CurrentSiteScore), @_TotalScoreSumm = SUM(CurrentSiteScore), @ScoreCount = COUNT(*)
		FROM Assessment
       -- Average of all Scores  -->OUTPUT #2
         SET @AvgScore = (@_TotalScoreSumm / @ScoreCount)
       -- Establish AVERAGE high - low range - 100 point spread.    
         SET @_AvgLow = (@AvgScore - 50)
         SET @_AvgHigh = (@AvgScore + 50)

/*
establish the ranges
then compare current score - set text value accordingly
*/
        SET @_FullHighRange = (@HighScore - @_AvgHigh)
        SET @_HighRange20 = (@_AvgHigh + (@_FullHighRange * .2))
        SET @_HighRange40 = (@_AvgHigh + (@_FullHighRange * .4))
        SET @_HighRange60 = (@_AvgHigh + (@_FullHighRange * .6))
        SET @_HighRange80 = (@_AvgHigh + (@_FullHighRange * .8))
        SET @_HighRange100 = @_FullHighRange


IF @_CurrentScore < @_AvgLow
   SET @ScoreRange = 'LOW'

IF ((@_CurrentScore >= @_AvgLow) AND (@_CurrentScore <= @_AvgHigh))
   SET @ScoreRange = 'AVERAGE'

IF ((@_CurrentScore > @_AvgHigh) AND (@_CurrentScore <= @_HighRange20 ))
   SET @ScoreRange = 'HIGH20'

IF ((@_CurrentScore > @_HighRange20) AND (@_CurrentScore <= @_HighRange40 ))
   SET @ScoreRange = 'HIGH40'

IF ((@_CurrentScore > @_HighRange40) AND (@_CurrentScore <= @_HighRange60 ))
   SET @ScoreRange = 'HIGH60'

IF ((@_CurrentScore > @_HighRange60) AND (@_CurrentScore <= @_HighRange80 ))
   SET @ScoreRange = 'HIGH80'

IF (@_CurrentScore > @_HighRange80) 
   SET @ScoreRange = 'HIGH100'





SELECT 
Assessment.AssessmentId, Assessment.DiscoverDate, Assessment.CleanupNecessaryInd, Assessment.MigrationInd, Assessment.ConfirmationId
,Assessment.DiscoveryId, Assessment.ReleaseCauseId, Assessment.ReleaseSourceId
,Assessment.SLMediaInd, Assessment.GWMediaInd, Assessment.SWMediaInd, Assessment.DWMediaInd, Assessment.FVMediaInd
,Assessment.FPMediaInd, Assessment.UNMediaInd, Assessment.UGContamInd, Assessment.LGContamInd, Assessment.MGContamInd
,Assessment.DSContamInd, Assessment.WOContamInd, Assessment.LBContamInd, Assessment.SVContamInd
,Assessment.OPContamInd, Assessment.CHContamInd, Assessment.UNContamInd, Assessment.MTBEContamInd, Assessment.HOContamInd
,Assessment.FPRemovedInd, Assessment.VPRemovedInd, Assessment.DelineateSL, Assessment.DelineateGW
,Assessment.SLDelineated, Assessment.GWDelineated, Assessment.GWCompMonitoring, Assessment.CAPRequested
,Assessment.CAPSubmitted, Assessment.CAPApproved, Assessment.CurrentSiteScore, Assessment.AmntReleaseComment
,Assessment.ContamComment, Assessment.LastChangeBy AssessmentLastChangeBy, Assessment.LastChangeDate  AssessmentLastChangeDate

-- Site Score Values
,SiteScoreValues.SiteScoreId, SiteScoreValues.DwReplMeasure, SiteScoreValues.DwImpMeasure
,SiteScoreValues.DwImpLiklyMeasure, SiteScoreValues.VprLvlMeasure, SiteScoreValues.PopExposdMeasure
,SiteScoreValues.EnvTypMeasure, SiteScoreValues.EnvImpLilelyMeasure, SiteScoreValues.NonDwSupTypMeasure
,SiteScoreValues.UtImpMeasure, SiteScoreValues.RainfallAnnualMeasure, SiteScoreValues.SoilPermMeasure 
,SiteScoreValues.AqfrDepthMeasure, SiteScoreValues.SwDistMeasure, SiteScoreValues.LastChangeBy SiteScoreLastChangeBy
, SiteScoreValues.LastChangeDate SiteScoreLastChangeDate
, @LowScore AS 'LowScore', @AvgScore AS 'AvgScore', @HighScore AS 'HighScore', @ScoreCount AS 'ScoreCount',@ScoreRange AS 'ScoreRange', @LustId AS 'LustId'

FROM dbo.Assessment WITH (NOLOCK) LEFT JOIN dbo.SiteScoreValues WITH (NOLOCK) ON Assessment.LustId = SiteScoreValues.LustId
WHERE Assessment.LustId = @LustId

GO
GRANT EXECUTE ON [dbo].[apGetAssessmentSiteScoreValuesRangesByLustId] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetConsultantByIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[apGetConsultantByIdData] 
@ConsultantID INT
AS

SELECT 	
		id consultantId,
 	 	CompanyName 
	     ,Address
	     ,City 		
	     ,State	
	     ,ZipCode		
 	     ,Phone 
	     ,Fax 		
         ,EmailAddress 	
	     ,LastChangeBy 
	     ,LastChangeDate 	

FROM
	   	[dbo].[Consultant] WITH (NOLOCK)
WHERE 	[Id] = @ConsultantID
GO
GRANT EXECUTE ON [dbo].[apGetConsultantByIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetConsultantsData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
 -----------------------------------------------------------------------------------------------------------
  apGetConsultants

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 DECLARE @totalRows INT, @TotalPages INT, @Result INT
 EXEC apGetConsultantsData NULL, NULL, NULL, NULL, 1, 1, 1, 10, @TotalRows OUTPUT, @TotalPages OUTPUT, @Result OUTPUT

 SELECT @totalRows, @TotalPages, @Result


 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apGetConsultantsData]
	 @companyName	VARCHAR(40)     = NULL
	,@address		VARCHAR(40)		= NULL
	,@city			VARCHAR(20)		= NULL
	,@zipCode		VARCHAR(10)		= NULL
	,@SortColumn    INT             = NULL
    ,@SortOrder     INT             = NULL
    ,@PageNumber    INT             = NULL
    ,@RowsPerPage   INT             = NULL
    ,@TotalRows     INT             OUTPUT
    ,@TotalPages    INT             OUTPUT 
	,@RESULT        INT				OUTPUT


AS


-- ERROR VALUE RETURN?
DECLARE @SQLQuery AS VARCHAR(8000) 
DECLARE @SQLColumns AS VARCHAR(1024)
DECLARE @WHERE varchar(4096) 
DECLARE @OrderBy VARCHAR(1024) 
DECLARE @RowsCalc DECIMAL 
DECLARE @Pagination VARCHAR(128)


SET @SQLQuery = '
'
SET @WHERE = ' 
WHERE 1 = 1 AND '
SET @OrderBy = ''
SET @Pagination = '
'


IF ISNULL(@PageNumber, 0) = 0
       SET @PageNumber = 1

IF ISNULL(@RowsPerPage, 0) = 0
       SET @RowsPerPage = 10

IF ISNULL(@SortColumn, 0) = 0
       BEGIN
              SET @SortColumn = 2
              SET @SortOrder = -1
       END 


IF ISNULL(@SortOrder, 0) = 0
       SET @SortOrder = 1


IF NOT ISNULL(@companyName, '') = ''
	SET @WHERE = @WHERE + ' ( companyName LIKE ''' + @companyName + '%'') AND '

IF NOT ISNULL(@address, '') = ''
	SET @WHERE = @WHERE + ' ( address LIKE ''' + @address + '%'') AND '

IF NOT ISNULL(@city, '') = ''
	SET @WHERE = @WHERE + ' ( city LIKE ''' + @city + '%'') AND '

IF NOT ISNULL(@ZipCode, '') = ''
	SET @WHERE = @WHERE + ' ( zipCode = ''' + @zipCode + ''') AND '

IF RIGHT(LTRIM(RTRIM(@WHERE)), 3) = 'AND'
       SET @WHERE = SUBSTRING(@WHERE, 1, LEN(LTRIM(RTRIM(@WHERE))) - 3)

SET @WHERE = @WHERE + '
'

SET @SQLColumns = '
	SELECT id consultantid, CompanyName, Address, City, State, ZipCode, Phone, Fax, EmailAddress, LastChangeBy, LastChangeDate'

SET @SQLQuery = '
	FROM LUST.dbo.CONSULTANT WITH (NOLOCK)' 


SET @OrderBy = 'ORDER BY '

IF @SortOrder = 1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy  = @OrderBy  + ' CompanyName ASC'
              ELSE IF @SortColumn = 2 
					 SET @OrderBy = @OrderBy + ' + Address ASC'
              ELSE IF @SortColumn = 3
                     SET @OrderBy = @OrderBy + ' City ASC'
              ELSE IF @SortColumn = 4
                     SET @OrderBy = @OrderBy + ' ZipCode ASC'
			  ELSE IF @SortColumn = 5 
					 SET @Orderby = @OrderBy + ' LastChangeBy ASC'
			  ELSE IF @SortColumn = 6 
					 SET @Orderby = @OrderBy + ' LastChangeDate ASC'
       END
ELSE IF @SortOrder = -1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy = @OrderBy + ' CompanyName DESC'
              ELSE IF @SortColumn = 2
                     SET @OrderBy = @OrderBy +  ' Address DESC'
              ELSE IF @SortColumn = 3
                     SET @OrderBy = @OrderBy + ' City DESC'
              ELSE IF @SortColumn = 4
                     SET @OrderBy = @OrderBy + ' ZipCode DESC'
			  ELSE IF @SortColumn = 5 
					 SET @Orderby = @OrderBy + ' LastChangeBy DESC'
			  ELSE IF @SortColumn = 6
					 SET @Orderby = @OrderBy + ' LastChangeDate DESC'

       END
              


/*
SELECT @SQL = 'SELECT id, CompanyName, Address, City, State 
	         FROM LUSTNew.dbo.CONSULTANT' 
*/

--SELECT @SQLQuery = 'SELECT id, CompanyName, 
--		   ISNULL(Address,'''') + COALESCE('', '' + City, '''')+ COALESCE('', '' + State,'''') as Address
--	         FROM LUST.dbo.CONSULTANT WITH (NOLOCK)' 





SET @SQLQuery = @SQLQuery + ' '

SET @Pagination  = @Pagination + ' 
       OFFSET ((' + CONVERT(VARCHAR, @PageNumber) + ' -1 ) * ' + CONVERT(VARCHAR, @RowsPerPage) + ') ROWS'
SET @Pagination = @Pagination + ' 
       FETCH NEXT ' + CONVERT(VARCHAR, @RowsPerPage) + ' ROWS ONLY;'


DECLARE @SQLCounts AS NVARCHAR(MAX) = 'SELECT @totals = COUNT (Distinct CompanyName) 
		FROM LUST.dbo.CONSULTANT WITH (NOLOCK)' 


SET @SQLCounts = @SQLCounts  + @WHERE 

EXEC sp_executesql @SQLCounts, N'@totals INT OUTPUT', @TotalRows OUTPUT



SET @TotalPages = @TotalRows / @RowsPerPage


-- This condition indicates the query returned data but did not fill a page so return 1
IF (@TotalPages = 0 AND @TotalRows <> 0)
       BEGIN
              
              -- return 1 
              SET @TotalPages = @TotalPages + 1
       END
ELSE
       BEGIN
			  
              -- this indicates the query did fill at least 1 page and now we need to see if there is a MOD Rows per Page value
              -- if so, increment the pages + 1
              SET @RowsCalc = @TotalRows % @RowsPerPage
              IF @RowsCalc > 0.0
                     SET @Totalpages = @TotalPages + 1
       END

	   
--------------------------------------------------------------
--     MAIN QUERY
--------------------------------------------------------------
SET @SQLQuery = @SQLColumns + @SQLQuery + @Where + @OrderBy + @Pagination

--Print @SQLQuery

--run the query
EXEC(@SQLQuery)

SELECT @RESULT = @@ERROR



GO
GRANT EXECUTE ON [dbo].[apGetConsultantsData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetCountyIdAndNameFromZP4Fips]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetCountyIdAndNameFromZP4Fips

  aguedea
  

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
 08-20-2018		aguedea			created - Instead of calling 2 stored procedures to get different columns from the same 
								table, just make one call to get both columns.
 -----------------------------------------------------------------------------------------------------------

 Usage:

	DECLARE @incidentcounty INT, @countyname VARCHAR(256)
	EXEC [apGetCountyIdAndNameFromZP4Fips] '51', @incidentcounty OUTPUT , @countyname OUTPUT
	SELECT @incidentcounty , @countyname 



*/

CREATE PROCEDURE [dbo].[apGetCountyIdAndNameFromZP4Fips]

  @ZP4FipsCounty		INT
  ,@IncidentCounty		Integer OUTPUT
  ,@CountyName			VARCHAR(10) OUTPUT
 

AS

DECLARE @Result INT
DECLARE @FIPSCODE INT = 41000  -- 


SELECT @IncidentCounty = County_Code, @CountyName = County_Name
FROM   AGENCY.dbo.COUNTIES WITH (NOLOCK)
WHERE  FIPS_COUNTY_CODE = @FIPSCODE + @ZP4FipsCounty

SELECT @Result = @@ERROR

RETURN @Result




GO
GRANT EXECUTE ON [dbo].[apGetCountyIdAndNameFromZP4Fips] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetImageAllByLustID]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apGetImageByID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/


/*
** ObjectName: apGetImageByID
**
*/

CREATE PROCEDURE [dbo].[apGetImageAllByLustID]
	@LustId int
AS

SELECT
	 PictureID
	,IsNull(Caption, '') AS Caption
	,Convert(varchar(10), PictureDate, 101) AS PictureDate
	,[Image] AS Picture
	,LastChangeBy
	,LastChangeDate

FROM         	
	dbo.vwSitePictures WITH (NOLOCK)
WHERE
	fkLustId = @LustId








GO
GRANT EXECUTE ON [dbo].[apGetImageAllByLustID] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetImageByIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apGetImageByID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/


/*
** ObjectName: apGetImageByID
**
*/

CREATE PROCEDURE [dbo].[apGetImageByIdData]
	@PictureID int
AS

SELECT
	incident.lustId
	,pics.PictureID
	,pics.SitePictureId
	,IsNull(pics.Caption, '') AS Caption
	,pics.PictureDate
	,pics.LastChangeBy
	,pics.LastChangeDate
	,incident.LogNumber
	,[Image] AS Picture

FROM         	
	 dbo.incident INNER JOIN dbo.vwSitePictures pics WITH (NOLOCK) ON incident.LustId = pics.fkLustId
WHERE
	PictureID = @PictureID
GO
GRANT EXECUTE ON [dbo].[apGetImageByIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetImageByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apGetImageByID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 apGetImageByLustIdData 403

 -----------------------------------------------------------------------------------------------------------
*/


/*
** ObjectName: apGetImageByID
**
*/

CREATE PROCEDURE [dbo].[apGetImageByLustIdData]
	@LustId INT

AS

BEGIN 
		SELECT
			incident.LustId
			, pics.PictureID
			, pics.SitePictureId
			,IsNull(pics.Caption, '') AS Caption
			,pics.PictureDate
			,pics.LastChangeBy
			,pics.LastChangeDate
			,incident.LogNumber
		FROM  dbo.incident INNER JOIN dbo.vwSitePictures pics WITH (NOLOCK) ON incident.LustId = pics.fkLustId
		WHERE
			incident.LustId = @LustId
END

GO
GRANT EXECUTE ON [dbo].[apGetImageByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetIncidentByIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
apGetIncidentById

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
 use lust

 exec [apGetIncidentByIdData] 2395

 -----------------------------------------------------------------------------------------------------------
*/

CREATE       PROCEDURE [dbo].[apGetIncidentByIdData]
	 @LustId					int --Primary Key

AS

         


SELECT  
	   l.LustId
	  ,L.LogNumber
      ,L.LogNbrCounty
      ,L.FacilityId
	  ,ISNULL(tpv.Tmcntr_Key, 0) AS  QtimeId  --Tmcntr_Key
	  ,ISNULL(cp.LUSTId, 0)   as crischeck
  --    ,cp.LUSTID 
      ,L.ReceivedDate
      ,L.CreateDate
      ,L.SiteName
      ,L.SiteAddress
      ,L.SiteCity
      ,L.SiteZip
      ,L.SitePhone
	  ,cast( ISNULL(L.NoValidAddress,0) as INT) AS 'NoValidAddress'
      --,L.NoValidAddress
      ,L.SiteTypeId
      ,L.FileStatusId
	  ,CASE ISNULL(L.RegulatedTankInd, 0) WHEN 1 THEN 'R'
			ELSE CASE ISNULL(L.HotInd, 0) WHEN 1 THEN 'H'
				ELSE CASE ISNULL(L.NonRegTankInd, 0) WHEN 1 THEN 'U'
				END
			END
		END AS ReleaseType
	  ,cast( ISNULL(L.RegulatedTankInd,0) as INT) AS 'RegulatedTankInd'
      --,L.RegulatedTankInd
	  ,cast( ISNULL(L.HotInd,0) as INT) AS 'HotInd'
      --,L.HotInd
	  ,cast( ISNULL(L.NonRegTankInd,0) as INT) AS 'NonRegTankInd'
      --,L.NonRegTankInd
      ,L.BrownfieldCodeId
	  ,cast( ISNULL(L.PropertyTranPendingInd,0) as INT) AS 'PropertyTranPendingInd'
      --,L.PropertyTranPendingInd
	  ,cast( ISNULL(L.ProgramTransferInd,0) as INT) AS 'ProgramTransferInd'
      --,L.ProgramTransferInd
	  ,cast( ISNULL(L.HotAuditRejectInd,0) as INT) AS 'HotAuditRejectInd'
      --,L.HotAuditRejectInd
	  ,cast( ISNULL(L.ActiveReleaseInd,0) as INT) AS 'ActiveReleaseInd'
      --,L.ActiveReleaseInd
	  ,cast( ISNULL(L.OptionLetterSentInd,0) as INT) AS 'OptionLetterSentInd'
      --,L.OptionLetterSentInd
      ,L.SiteComment
      ,L.SeeAlsoComment
      ,L.PublicSummaryComment
      ,L.GeolocId
      ,L.OlprrId
      ,L.LastChangeBy
      ,L.LastChangeDate
	  ,ISNULL(FACA.LAT_DEGREES_COORD, 0.0) as LatDegrees
	  ,ISNULL(FACA.LAT_MINUTES_COORD, 0.0) as LatMinutes
	  ,ISNULL(FACA.LAT_SECONDS_COORD, 0.0) as LatSeconds
	  ,ISNULL(FACA.LAT_DECIMAL_COORD, 0.0) as LatDecimals
	  ,ISNULL(FACA.LONG_DEGREES_COORD, 0.0) as LongDegrees
	  ,ISNULL(FACA.LONG_MINUTES_COORD, 0.0) as LongMinutes
	  ,ISNULL(FACA.LONG_SECONDS_COORD, 0.0) as LongSeconds
	  ,ISNULL(FACA.LONG_DECIMAL_COORD, 0.0) as LongDecimals
	  ,Mgmt.ManagementId
      ,Mgmt.CleanupStartDate
      ,Mgmt.ReleaseStopDate
      ,Mgmt.FinalInvcRqstDate
      ,Mgmt.ClosedDate
      ,Mgmt.LetterOfAgreementDate
      ,Mgmt.LetterOfAgreementComment
      ,Mgmt.LastChangeBy as MgmtLastChangeBy
      ,Mgmt.LastChangeDate as MgmtLastChangeDate
	  ,Assess.DiscoverDate
     


FROM dbo.Incident L WITH (NOLOCK)
        left outer join ATAS.dbo.TmcntrPgmVw tpv WITH (NOLOCK) on L.LogNumber = tpv.LOG_NBR
        left outer join CRIS.dbo.Project cp WITH (NOLOCK) on L.LustId = cp.LUSTId
		LEFT OUTER JOIN AGENCY.dbo.FACA_GEO_LOC FACA WITH (NOLOCK) ON L.GeoLocId = FACA.Identifier
		LEFT OUTER JOIN [dbo].[Management] Mgmt WITH (NOLOCK) ON Mgmt.LustId = L.LustId
		LEFT OUTER JOIN [dbo].[Assessment] Assess WITH (NOLOCK) ON Assess.LustId = L.LustId
WHERE L.LustId = @LustId --Primary Key

GO
GRANT EXECUTE ON [dbo].[apGetIncidentByIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetInspectionByInspectionIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apGetInspectionByLustID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

exec apGetInspectionByLustIdData 6007, null
exec apGetInspectionByLustIdData 6007, 471

 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetInspectionByInspectionIdData] 
		@InspectionId INT
AS

	BEGIN
		SELECT 	
			  ins.InspectionID,
			  ins.InspectionDate,
			  CASE IsNull(dbo.fnGetUserNameByNtLogin(ins.InspectorID),'')
			  WHEN '' THEN InspectorID
			  ELSE dbo.fnGetUserNameByNtLogin(ins.InspectorID)
			  END AS Inspector,
			  IsNull(dbo.fnGetInspectionTypesByInspectionID(ins.InspectionID),'') AS InspectionTypes,
			  ins.Comment,
			  ins.LastChangeBy,
			  ins.LastChangeDate,
			  incident.LustId,
			  incident.LogNumber
		FROM
			  [dbo].[Inspection] ins WITH (NOLOCK)
			  INNER JOIN incident ON ins.LustId = incident.LustId
		WHERE ins.InspectionId = @InspectionID
	END	





GO
GRANT EXECUTE ON [dbo].[apGetInspectionByInspectionIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetInspectionByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apGetInspectionByLustID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

exec apGetInspectionByLustIdData 6007, null
exec apGetInspectionByLustIdData 6007, 471

 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetInspectionByLustIdData] 
        @LustId INT
AS

	BEGIN
		SELECT 	
			  ins.InspectionID,
			  ins.InspectionDate,
			  CASE IsNull(dbo.fnGetUserNameByNtLogin(ins.InspectorID),'')
			  WHEN '' THEN InspectorID
			  ELSE dbo.fnGetUserNameByNtLogin(ins.InspectorID)
			  END AS Inspector,
			  IsNull(dbo.fnGetInspectionTypesByInspectionID(ins.InspectionID),'') AS InspectionTypes,
			  ins.Comment,
			  ins.LastChangeBy,
			  ins.LastChangeDate,
			  incident.LustId,
			  incident.LogNumber
		FROM
			  incident INNER JOIN [dbo].[Inspection] ins WITH (NOLOCK) ON incident.LustId = ins.LustId
		WHERE incident.LustId = @LustId
	END
	
GO
GRANT EXECUTE ON [dbo].[apGetInspectionByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLogNumber]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[apGetLogNumber] 
           	@LustId INT
AS           
SELECT 		
            incident.LustId
		   ,incident.LogNumber
		   	  	  ,CASE ISNULL(incident.RegulatedTankInd, 0) WHEN 1 THEN 'R'
			ELSE CASE ISNULL(incident.HotInd, 0) WHEN 1 THEN 'H'
				ELSE CASE ISNULL(incident.NonRegTankInd, 0) WHEN 1 THEN 'U'
				END
			END
		END AS ReleaseType
		, incident.siteName
FROM
	 [dbo].[incident] 
WHERE Incident.LustId = @LustId
GO
GRANT EXECUTE ON [dbo].[apGetLogNumber] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesAssesementTabData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLookupTablesAssesementTabData]

AS 


DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))



-- Assessment Discovery Type ---------------------------> Table #8
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Discovery Type' As DataType,
	'0' AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Discovery Type' As DataType,
		DiscoveryId,
       DiscoveryDescription
FROM   LUST.dbo.AssessmentDiscoveryType WITH (NOLOCK)
Order by DiscoveryDescription

-- Assessment Confirmation Type ---------------------------> Table #9
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Confirmation Type' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Confirmation Type' AS DataType,
		ConfirmationId,
       ConfirmationDescription
FROM   LUST.dbo.AssessmentConfirmationType WITH (NOLOCK)
Order by ConfirmationDescription


-- Assessment Release Cause Type ---------------------------> Table #10

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Assessment Release Cause Type' AS DataType, 
		0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Assessment Release Cause Type' AS DataType, 
		ReleaseCauseId,
       ReleaseCauseDescription
FROM   LUST.dbo.AssessmentReleaseType WITH (NOLOCK)
Order by ReleaseCauseDescription


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type' AS DataType,
	0 AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type' AS DataType,
		ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
Order by 2


-- Scoring - Drinking Water Replacement---------------------Table #11
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'Drinking Water Replacement' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Replacement' AS DataType,
		CategoryItemId,
		CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 4               --> Category = 'DWREPL'
Order by CategoryItemDescription


-- Scoring - Drinking Water Impact--------------------------Table #12
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Impact' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Impact' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 5               --> Category = 'DWIMP'
Order by CategoryItemDescription


-- Scoring - Drinking Water Impact Likely-------------------Table #13
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Impact Likely' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Impact Likely' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 6               --> Category = 'DWLKLY'
Order by CategoryItemDescription


-- Scoring - Vapor Level------------------------------------Table #14
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Vapor Level' AS DataType,
		0 AS Id, 
		'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'	Vapor Level' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 7               --> Category = 'VPVL'
Order by CategoryItemDescription


-- Scoring - Population Size effected-----------------------Table #15
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Population Size Effected' AS DataType, 
		0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Population Size Effected' AS DataType, 
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 8               
Order by CategoryItemDescription


-- Scoring - Environment Type--------------------------------Table #16
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Type' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Type' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 9               --> Category = 'ENVTYP'
Order by CategoryItemDescription


-- Scoring - Environment Impact Likely-----------------------Table #17
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Impact Likely' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Impact Likely' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 10               --> Category = 'ENVLKLY'
Order by CategoryItemDescription


-- Scoring - Non-Drinking Water Supply Type------------------->Table #18
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Non-Drinking Water Supply' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Non-Drinking Water Supply' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 11               --> Category = 'NONDWTYP'
Order by CategoryItemDescription


-- Scoring - Utility Impacted---------------------------------->Table # 19
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Utility Impacted' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Utility Impacted' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 12               --> Category = 'UTIMP'
Order by CategoryItemDescription


-- Scoring - Annual Rainfall----------------------------------->Table # 20
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Annual Rainfall' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Annual Rainfall' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 13               --> Category = 'RAINAN'
Order by CategoryItemDescription


-- Scoring - Soil Permiability---------------------------------->Table # 21
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Soil Permiability' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Soil Permiability' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 14               --> Category = 'SLPERM'
Order by CategoryItemDescription


-- Scoring - Aquifer Depth-------------------------------------->Table # 22
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Aquifer Depth' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Aquifer Depth' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 15               --> Category = 'SLPERM'
Order by CategoryItemDescription


-- Scoring - Surface Water Distance----------------------------->Table # 23
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Surface Water Distance' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Surface Water Distance' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 16               --> Category = 'SWDIST'
Order by CategoryItemDescription


select * FROM @LookupValues

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesAssesementTabData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesByType]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
 -----------------------------------------------------------------------------------------------------------
 apGetLookupTables

  B.Dyer
  OCT 2006

Main LUST application combo box data source provider.

DO NOT MODIFY THE SEQUENCE OF THESE SELECT STATEMENTS, 
AS THEY ARE REFERENCED NUMERICALLY IN THE LUST APPLICATION.

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date      Name    Description
 -----------------------------------------------------------------------------------------------------------
 5-17-2016	llo		Changed Licening database instance from Audit back to Prod.

 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apGetLookupTablesByType]
	@TableType AS VARCHAR(25)

AS

----------------------------> Table #0
IF @TableType = 'Counties'
	GOTO Counties
ELSE IF @TableType = 'Cities'
	GOTO Cities
ELSE IF @TableType = 'ZipCode'
	GOTO ZipCode
ELSE IF @TableType = 'SiteType'
	GOTO SiteType
ELSE IF @TableType = 'FileStatus'
	-- Closure Type in LUST UI (Incident Tab)
	GOTO FileStatus
ELSE IF @TableType = 'Brownfield'
	GOTO BrownField
ELSE IF @TableType = 'Regions'
	GOTO Regions
ELSE IF @TableType = 'ProjectManager'
	GOTO ProjectManager
ELSE IF @TableType = 'AssessmentDiscovery'
	GOTO AssessmentDiscovery 
ELSE IF @TableType = 'AssessmentConfirmation'
	GOTO AssessmentConfirmation 
ELSE IF @TableType = 'AssessmentReleaseCause'
	GOTO AssessmentReleaseCause 
ELSE IF @TableType = 'DrinkingWaterReplacement'
	GOTO DrinkingWaterReplacement
ELSE IF @TableType = 'DrinkingWaterImpact'
	GOTO DrinkingWaterImpact
ELSE IF @TableType = 'DrinkingWaterImpactLikely'
	GOTO DrinkingWaterImpactLikely
ELSE IF @TableType = 'VaporLevel'
	GOTO VaporLevel
ELSE IF @TableType = 'PopulationSizeEffected'
	GOTO PopulationSizeEffected
ELSE IF @TableType = 'EnvironmentType'
	GOTO EnvironmentType
ELSE IF @TableType = 'EnvironmentImpactLikely'
	GOTO EnvironmentImpactLikely
ELSE IF @TableType = 'NonDrinkingWaterSupply'
	GOTO NonDrinkingWaterSupply
ELSE IF @TableType = 'UtilityImpacted'
	GOTO UtilityImpacted
ELSE IF @TableType = 'AnnualRainfall'
	GOTO AnnualRainfall
ELSE IF @TableType = 'SoilPermiability'
	GOTO SoilPermiability
ELSE IF @TableType = 'AquiferDepth'
	GOTO AquiferDepth
ELSE IF @TableType = 'SurfaceWaterDistance'
	GOTO SurfaceWaterDistance
ELSE IF @TableType = 'ContactTypes'
	GOTO ContactTypes
ELSE IF @TableType = 'States'
	GOTO States
ELSE IF @TableType = 'PublicNotice'
	GOTO PublicNotice
ELSE IF @TableType = 'WorkType'
	GOTO WorkType
ELSE IF @TableType = 'WorkReportedBy'
	GOTO WorkReportedBy
ELSE IF @TableType = 'ControlType'
	GOTO ControlType
ELSE IF @TableType =  'ControlDescription'
	GOTO ControlDescription
ELSE IF @TableType = 'ControlDescriptionEngineering'
	GOTO ControlDescriptionEngineering
ELSE IF @TableType = 'ControlDescriptionInstiutional'
	GOTO ControlDescriptionInstiutional
ELSE IF @TableType = 'LandfillFacilities'
	GOTO LandfillFacilities
ELSE IF @TableType = 'TreatmentFacilities'
	GOTO TreatmentFacilities
ELSE IF @TableType = 'SoilStatus'
	GOTO SoilStatus
ELSE IF @TableType = 'ContactTypesNoINV'
	GOTO ContactTypesNoINV
ELSE IF @TableType = 'AssessmentReleaseSource:'
	GOTO AssessmentReleaseSource
ELSE IF @TableType = 'AssessmentReleaseSourceReported'
	GOTO AssessmentReleaseSourceReported
ELSE
	GOTO NoOp
	
Counties:
SELECT 
	0 AS DeqCountyCode, 
	'' AS CountyName
UNION

SELECT distinct
       cast(COUNTY_CODE as integer)  as DeqCountyCode,
       COUNTY_NAME as CountyName
FROM   AGENCY.dbo.COUNTIES  WITH (NOLOCK)
where  COUNTY_CODE not in (0,37,38,39)                                                 
ORDER BY CountyName  

GOTO NoOp

-- City values----------------------------> Table #1
Cities:
SELECT 
	'0' AS PlaceName, 
	'' AS PlaceName2
UNION


SELECT distinct
       rtrim(ltrim(PlaceName)) AS PlaceName ,
       rtrim(ltrim(PlaceName)) AS PlaceName2
FROM   AGENCY.DBO.PLACES WITH (NOLOCK)                                        
ORDER BY PlaceName                                               

GOTO NoOp

-- ZipCode values ----------------------------> Table #2

ZipCode:
SELECT 
	'0' AS ZipCode, 
	'' AS ZipCode2
UNION
SELECT distinct
       ZipCode,
       ZipCode AS ZipCode2
FROM   AGENCY.DBO.PLACES  WITH (NOLOCK)                                       
ORDER BY ZipCode              

GOTO NoOp

-- Site Type values ----------------------------> Table #3

SiteType:
SELECT 
	0 AS Id, 
	''AS descript
UNION


SELECT SiteTypeId,
       SiteTypeDescription
FROM   LUST.dbo.SiteType WITH (NOLOCK)
ORDER BY 2

GOTO NoOp

-- File Status values ----------------------------> Table #4
FileStatus:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT FileStatusTypeId,
       FileStatusTypeDescription
from   LUST.dbo.FileStatusType WITH (NOLOCK)
order by 2

GOTO NoOp

--Brownfield values ----------------------------> Table #5
BrownField:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT BrownfieldCodeId,
                 Description
FROM     LUST.dbo.BrownfieldCode WITH (NOLOCK)
Order by 2

GOTO NoOp

-- DEQ Regions----------------------------> Table #6
Regions:
SELECT 
	'0' AS Id, 
	'' AS Descript
UNION
SELECT DeqRegionAbbr,
       CASE DeqRegionAbbr
       WHEN 'ER' THEN 'Eastern'
       WHEN 'NWR' THEN 'Northwestern'
       WHEN 'WR'  THEN 'Western'
       END as  Descript
from   AGENCY.dbo.DEQRegions WITH (NOLOCK)
where  DeqRegionAbbr <> 'HQ'
order by Descript

GOTO NoOp

-- PROJECT MANAGER Search screen list ----------------------------> Table #7
ProjectManager:
SELECT 
	'0' AS Id, 
	'' AS descript
UNION
SELECT 
	'1' AS Id, 
	'- NO PM ASSIGNED -' AS descript
UNION
select distinct 
       a.PmLogin,
       ISNULL(b.lf_nm,a.PmLogin) as descript
from   LUST.dbo.ProjectManagerHistory a WITH (NOLOCK)
left join   hris.dbo.EmpHisInitVw b WITH (NOLOCK)
       on a.PmLogin = b.Nt_Login
where  a.EndDate is null
AND    a.PmLogin <> 'CONV'
order  by descript

GOTO NoOp

-- Assessment Discovery Type ---------------------------> Table #8
AssessmentDiscovery:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT DiscoveryId,
       DiscoveryDescription
FROM   LUST.dbo.AssessmentDiscoveryType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Assessment Confirmation Type ---------------------------> Table #9
AssessmentConfirmation:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ConfirmationId,
       ConfirmationDescription
FROM   LUST.dbo.AssessmentConfirmationType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Assessment Release Cause Type ---------------------------> Table #10
AssessmentReleaseCause:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ReleaseCauseId,
       ReleaseCauseDescription
FROM   LUST.dbo.AssessmentReleaseType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Scoring - Drinking Water Replacement---------------------Table #11
DrinkingWaterReplacement:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 4               --> Category = 'DWREPL'
Order by 2

GOTO NoOp

-- Scoring - Drinking Water Impact--------------------------Table #12
DrinkingWaterImpact:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 5               --> Category = 'DWIMP'
Order by 2

GOTO NoOp

-- Scoring - Drinking Water Impact Likely-------------------Table #13
DrinkingWaterImpactLikely:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 6               --> Category = 'DWLKLY'
Order by 2

GOTO NoOp

-- Scoring - Vapor Level------------------------------------Table #14
VaporLevel:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 7               --> Category = 'VPVL'
Order by 2

GOTO NoOp

-- Scoring - Population Size effected-----------------------Table #15
PopulationSizeEffected:
SELECT 	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 8               
Order by 2

GOTO NoOp

-- Scoring - Environment Type--------------------------------Table #16
EnvironmentType:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 9               --> Category = 'ENVTYP'
Order by 2

GOTO NoOp

-- Scoring - Environment Impact Likely-----------------------Table #17
EnvironmentImpactLikely:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 10               --> Category = 'ENVLKLY'
Order by 2

GOTO NoOp

-- Scoring - Non-Drinking Water Supply Type------------------->Table #18
NonDrinkingWaterSupply:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 11               --> Category = 'NONDWTYP'
Order by 2

GOTO NoOp

-- Scoring - Utility Impacted---------------------------------->Table # 19
UtilityImpacted:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 12               --> Category = 'UTIMP'
Order by 2

GOTO NoOp

-- Scoring - Annual Rainfall----------------------------------->Table # 20
AnnualRainfall:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 13               --> Category = 'RAINAN'
Order by 2

GOTO NoOp

-- Scoring - Soil Permiability---------------------------------->Table # 21
SoilPermiability:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 14               --> Category = 'SLPERM'
Order by 2

GOTO NoOp

-- Scoring - Aquifer Depth-------------------------------------->Table # 22
AquiferDepth:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 15               --> Category = 'SLPERM'
Order by 2

GOTO NoOp

-- Scoring - Surface Water Distance----------------------------->Table # 23
SurfaceWaterDistance:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 16               --> Category = 'SWDIST'
Order by 2

GOTO NoOp

--Contact Types -------------------------------------------->Table # 24
ContactTypes:
SELECT  '' AS SID,
	'' AS Descript
UNION
SELECT 	AffilTypeCd,
	AffilTypeDesc
FROM    AGENCY.dbo.AffilTypes WITH (NOLOCK)
WHERE   fkPgmInt = 'LUST'
AND     AffilTypeCd <> 'CST' --> Tanks Consultants
ORDER BY 1

GOTO NoOp

-- State List -------------------------------------------->Table # 25
States:
SELECT '' As SID,
       '' As Descript
UNION
SELECT STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  1

GOTO NoOp

-- Public Notice Type Description ------------------------>Table # 26
PublicNotice:
SELECT 
	0 AS PublicNoticeTypeID, 
	'' AS Description
UNION
SELECT distinct
       PublicNoticeTypeID,
       Description 
FROM   dbo.PublicNoticeType  WITH (NOLOCK)                                      
ORDER BY Description                   

GOTO NoOp


-- WORK REPORTED TYPES - WORK REPORTED BY values --------->Table # 27
WorkType:
SELECT  WorkTypeId as ID,
        WorkTypeDescription as Descript
FROM    LUST.dbo.WorkReportedType WITH (NOLOCK)
ORDER BY Descript

GOTO NoOp

-- Work Reported initial combo box load          --------->Table # 28
-- of current OTIS CONSULTANTS and USTLIC SERVICE PROVIDERS


-- Modified B.Dyer 26 Feb 2007
WorkReportedBy:
SELECT 
	'0' AS SID, 
	'' AS Descript
UNION

select 'RE' + CAST(b. PersonID as varchar) as SID,
       UPPER(d.LicenseStatus)+ ': ' 
       + LTRIM(RTRIM(b. FullName)) + ' ' 
       + isnull(b. AddressCity,'NO ADDRESS') + ' ' 
       + isnull(b. AddressState,' ')as Descript 

from   Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
join   Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

--from   [deqsql1\audit].Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
--join   [deqsql1\audit].Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

where  b. PersonType  = 'SP'
and    b. FullName is not null  
UNION
select 'CN' + CAST(c.ID as varchar) as SID,
       'CONSULTANT: ' + LTRIM(RTRIM(c.CompanyName))  + ' ' 
       + isnull(c.CITY,'NO ADDRESS')+ ' ' 
       + isnull(c.STATE,' ') as Descript 
from   LUST.dbo.CONSULTANT c WITH (NOLOCK)
ORDER BY Descript   

GOTO NoOp

-- Site Control Lookup Tables
-- SiteControlType .Tables-------------------------(29)
ControlType:
SELECT        '' AS TypeID
		, '' AS TypeCode
		, 'Please Select One' as TypeDescription
UNION
SELECT     	  TypeID As TypeID
		, TypeCode As TypeCode
		, TypeDescription as TypeDescription
FROM      	SiteControlType WITH (NOLOCK)
ORDER BY 	TypeID

GOTO NoOp

--DislpayALLControlDescription .Tables--------------(30)
ControlDescription:
SELECT        '' AS ControlID	
		, 'Please Select One' AS DislpayControlDescription
		, '' AS fkTypeCodeID
		, '' AS ControlDescription
		, '' AS GroupDescription
		, '' AS fkTypeCodeID
UNION
SELECT     	  ControlID 
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
		  COALESCE(ControlDescription, '') as DisplayControlDescription
		, fkGroupID
		, ControlDescription
		, GroupDescription
		, fkTypeCodeID
FROM   	dbo.SiteControlDesc WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
ORDER BY 	ControlID

GOTO NoOp

--DislpayControlDescription for E type.Tables-----------------------(31)
ControlDescriptionEngineering:
SELECT        '' AS ControlID	
		, 'Please Select One' AS DislpayControlDescription
		, '' AS fkTypeCodeID
		, '' AS ControlDescription
		, '' AS GroupDescription
		, '' AS fkTypeCodeID
UNION
SELECT     	  ControlID
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
	        COALESCE(ControlDescription, '') as DisplayControlDescription
		, fkGroupID
		, ControlDescription
		, GroupDescription
		, fkTypeCodeID
FROM   	dbo.SiteControlDesc  WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 2
ORDER BY 	GroupDescription, ControlDescription

GOTO NoOp

--DislpayControlDescription for I type.Tables------------------------(32)
ControlDescriptionInstiutional:
SELECT        '' AS ControlID
		, 'Please Select One' AS DislpayControlDescription
		, '' AS fkTypeCodeID
		, '' AS ControlDescription
		, '' AS GroupDescription
		, '' AS fkTypeCodeID
UNION
SELECT     	ControlID 
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
		  COALESCE(ControlDescription, '') as DisplayControlDescription
		, fkGroupID
		, ControlDescription
		, GroupDescription
		, fkTypeCodeID
FROM   	dbo.SiteControlDesc WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 1
ORDER BY 	GroupDescription, ControlDescription

GOTO NoOp

--PCS lookup tables
--Landfill Facilities   (table ----------------------33)
LandfillFacilities:
SELECT 
	   0 AS PcsDisposalFacilityID, 
	   '' AS FacilityName
UNION
SELECT   PcsDisposalFacilityID,
         FacilityName
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'L'
ORDER BY FacilityName

GOTO NoOp

--Treatment Facilities  (table -----------------------34)
TreatmentFacilities:
SELECT 
	   0 AS PcsDisposalFacilityID, 
	   '' AS FacilityName
UNION
SELECT   PcsDisposalFacilityID,
         FacilityName
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'T'
ORDER BY FacilityName

GOTO NoOp

--Soil Status  (table --------------------------------35)
SoilStatus:  
SELECT 
	   0 AS SoilStatusTypeID, 
	   '' AS SoilStatusTypeDescription
UNION
SELECT   SoilStatusTypeID, 
         SoilStatusTypeDescription
FROM     LUST.dbo.PcsSoilStatusType WITH (NOLOCK)
ORDER BY SoilStatusTypeDescription

GOTO NoOp


/*

		Same AS STATES
*/
-- State List -------------------------------------------->Table # 36
--ADDED BDYER 26 JUNE 2006 TO SEPERATE "IC" AND "RP" STATES.

/*
SELECT '' As SID,
       '' As Descript
UNION


SELECT STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  1

GOTO NoOp

*/







--Contact Types -------------------------------------------->Table # 37
ContactTypesNoINV:
SELECT  '' AS SID,
	'' AS Descript
UNION
SELECT 	AffilTypeCd,
	AffilTypeDesc
FROM    AGENCY.dbo.AffilTypes WITH (NOLOCK)
WHERE   fkPgmInt = 'LUST'
AND     AffilTypeCd <> 'CST' --> Tanks Consultants
AND     AffilTypeCd <> 'INV'
ORDER BY 1

GOTO NoOp

--TODO BDYER 0CT 16 2006
-- i need City, County, and Zip Code set for the LookupTables class, 
-- which will hand off to the incident screen,
-- where these values are required. 
-- Presenting a blank here is asking for trouble.
-- DUMP LEADING BLANK



-- SOURCE OF RELEASE table lookups added 12 April 2007 per new EPA guidlines.
-- B.Dyer

-- Assessment Release Source Type ---------------------------> Table #44
AssessmentReleaseSource:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Assessment Release Source Type No Blank ---------------------------> Table #45

-- TODO BDYER 23 MAY 2007 - EXCLUDE "NOT REPORTED"
AssessmentReleaseSourceReported:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
WHERE  ReleaseSourceId <> 7
Order by 2

GOTO NoOp

NoOp:


GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesByType] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesByTypeData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
 -----------------------------------------------------------------------------------------------------------
 apGetLookupTables

  B.Dyer
  OCT 2006

Main LUST application combo box data source provider.

DO NOT MODIFY THE SEQUENCE OF THESE SELECT STATEMENTS, 
AS THEY ARE REFERENCED NUMERICALLY IN THE LUST APPLICATION.

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date      Name    Description
 -----------------------------------------------------------------------------------------------------------
 5-17-2016	llo		Changed Licening database instance from Audit back to Prod.

 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apGetLookupTablesByTypeData]
	@TableType AS VARCHAR(100)

AS

----------------------------> Table #0
IF @TableType = 'Counties'
	GOTO Counties
ELSE IF @TableType = 'Cities'
	GOTO Cities
ELSE IF @TableType = 'ZipCode'
	GOTO ZipCode
ELSE IF @TableType = 'SiteType'
	GOTO SiteType
ELSE IF @TableType = 'FileStatus'
	-- Closure Type in LUST UI (Incident Tab)
	GOTO FileStatus
ELSE IF @TableType = 'Brownfield'
	GOTO BrownField
ELSE IF @TableType = 'Regions'
	GOTO Regions
ELSE IF @TableType = 'ProjectManager'
	GOTO ProjectManager
ELSE IF @TableType = 'AssessmentDiscovery'
	GOTO AssessmentDiscovery 
ELSE IF @TableType = 'AssessmentConfirmation'
	GOTO AssessmentConfirmation 
ELSE IF @TableType = 'AssessmentReleaseCause'
	GOTO AssessmentReleaseCause 
ELSE IF @TableType = 'DrinkingWaterReplacement'
	GOTO DrinkingWaterReplacement
ELSE IF @TableType = 'DrinkingWaterImpact'
	GOTO DrinkingWaterImpact
ELSE IF @TableType = 'DrinkingWaterImpactLikely'
	GOTO DrinkingWaterImpactLikely
ELSE IF @TableType = 'VaporLevel'
	GOTO VaporLevel
ELSE IF @TableType = 'PopulationSizeEffected'
	GOTO PopulationSizeEffected
ELSE IF @TableType = 'EnvironmentType'
	GOTO EnvironmentType
ELSE IF @TableType = 'EnvironmentImpactLikely'
	GOTO EnvironmentImpactLikely
ELSE IF @TableType = 'NonDrinkingWaterSupply'
	GOTO NonDrinkingWaterSupply
ELSE IF @TableType = 'UtilityImpacted'
	GOTO UtilityImpacted
ELSE IF @TableType = 'AnnualRainfall'
	GOTO AnnualRainfall
ELSE IF @TableType = 'SoilPermiability'
	GOTO SoilPermiability
ELSE IF @TableType = 'AquiferDepth'
	GOTO AquiferDepth
ELSE IF @TableType = 'SurfaceWaterDistance'
	GOTO SurfaceWaterDistance
ELSE IF @TableType = 'ContactTypes'
	GOTO ContactTypes
ELSE IF @TableType = 'States'
	GOTO States
ELSE IF @TableType = 'PublicNotice'
	GOTO PublicNotice
ELSE IF @TableType = 'WorkType'
	GOTO WorkType
ELSE IF @TableType = 'WorkReportedBy'
	GOTO WorkReportedBy
ELSE IF @TableType = 'ControlType'
	GOTO ControlType
ELSE IF @TableType =  'ControlDescription'
	GOTO ControlDescription
ELSE IF @TableType = 'ControlDescriptionEngineering'
	GOTO ControlDescriptionEngineering
ELSE IF @TableType = 'ControlDescriptionInstiutional'
	GOTO ControlDescriptionInstiutional
ELSE IF @TableType = 'LandfillFacilities'
	GOTO LandfillFacilities
ELSE IF @TableType = 'TreatmentFacilities'
	GOTO TreatmentFacilities
ELSE IF @TableType = 'SoilStatus'
	GOTO SoilStatus
ELSE IF @TableType = 'ContactTypesNoINV'
	GOTO ContactTypesNoINV
ELSE IF @TableType = 'AssessmentReleaseSource:'
	GOTO AssessmentReleaseSource
ELSE IF @TableType = 'AssessmentReleaseSourceReported'
	GOTO AssessmentReleaseSourceReported
ELSE IF @TableType = 'DescriptionEngineering'
	GOTO DescriptionEngineering
ELSE IF @TableType = 'DescriptionInstitutional'
	GOTO DescriptionInstitutional
ELSE IF @TableType = 'ControlType2'
	GOTO ControlType2
ELSE IF @TableType = 'LustHotcSearchType'
	GOTO LustHotcSearchType
ELSE IF @TableType = 'HotcDecommType'
	GOTO HotcDecommType
ELSE IF @TableType = 'HotcFeeDefault'
	GOTO HotcFeeDefault
ELSE	GOTO NoOp
	
Counties:
SELECT 
	0 AS DeqCountyCode, 
	'' AS CountyName
UNION

SELECT distinct
       cast(COUNTY_CODE as integer)  as DeqCountyCode,
       COUNTY_NAME as CountyName
FROM   AGENCY.dbo.COUNTIES  WITH (NOLOCK)
where  COUNTY_CODE not in (0,37,38,39)                                                 
ORDER BY CountyName  

GOTO NoOp

-- City values----------------------------> Table #1
Cities:
SELECT 
	'0' AS PlaceName, 
	'' AS PlaceName2
UNION


SELECT distinct
       rtrim(ltrim(PlaceName)) AS PlaceName ,
       rtrim(ltrim(PlaceName)) AS PlaceName2
FROM   AGENCY.DBO.PLACES WITH (NOLOCK)                                        
ORDER BY PlaceName                                               

GOTO NoOp

-- ZipCode values ----------------------------> Table #2

ZipCode:
SELECT 
	'0' AS ZipCode, 
	'' AS ZipCode2
UNION
SELECT distinct
       ZipCode,
       ZipCode AS ZipCode2
FROM   AGENCY.DBO.PLACES  WITH (NOLOCK)                                       
ORDER BY ZipCode              

GOTO NoOp

-- Site Type values ----------------------------> Table #3

SiteType:
SELECT 
	0 AS Id, 
	''AS descript
UNION


SELECT SiteTypeId,
       SiteTypeDescription
FROM   LUST.dbo.SiteType WITH (NOLOCK)
ORDER BY 2

GOTO NoOp

-- File Status values ----------------------------> Table #4
FileStatus:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT FileStatusTypeId,
       FileStatusTypeDescription
from   LUST.dbo.FileStatusType WITH (NOLOCK)
order by 2

GOTO NoOp

--Brownfield values ----------------------------> Table #5
BrownField:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT BrownfieldCodeId,
                 Description
FROM     LUST.dbo.BrownfieldCode WITH (NOLOCK)
Order by 2

GOTO NoOp

-- DEQ Regions----------------------------> Table #6
Regions:
SELECT 
	'0' AS Id, 
	'' AS Descript
UNION
SELECT DeqRegionAbbr,
       CASE DeqRegionAbbr
       WHEN 'ER' THEN 'Eastern'
       WHEN 'NWR' THEN 'Northwestern'
       WHEN 'WR'  THEN 'Western'
       END as  Descript
from   AGENCY.dbo.DEQRegions WITH (NOLOCK)
where  DeqRegionAbbr <> 'HQ'
order by Descript

GOTO NoOp

-- PROJECT MANAGER Search screen list ----------------------------> Table #7
ProjectManager:
SELECT 
	'0' AS Id, 
	'' AS descript
UNION
SELECT 
	'1' AS Id, 
	'- NO PM ASSIGNED -' AS descript
UNION
select distinct 
       a.PmLogin,
       ISNULL(b.lf_nm,a.PmLogin) as descript
from   LUST.dbo.ProjectManagerHistory a WITH (NOLOCK)
left join   hris.dbo.EmpHisInitVw b WITH (NOLOCK)
       on a.PmLogin = b.Nt_Login
where  a.EndDate is null
AND    a.PmLogin <> 'CONV'
order  by descript

GOTO NoOp

-- Assessment Discovery Type ---------------------------> Table #8
AssessmentDiscovery:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT DiscoveryId,
       DiscoveryDescription
FROM   LUST.dbo.AssessmentDiscoveryType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Assessment Confirmation Type ---------------------------> Table #9
AssessmentConfirmation:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ConfirmationId,
       ConfirmationDescription
FROM   LUST.dbo.AssessmentConfirmationType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Assessment Release Cause Type ---------------------------> Table #10
AssessmentReleaseCause:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ReleaseCauseId,
       ReleaseCauseDescription
FROM   LUST.dbo.AssessmentReleaseType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Scoring - Drinking Water Replacement---------------------Table #11
DrinkingWaterReplacement:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 4               --> Category = 'DWREPL'
Order by 2

GOTO NoOp

-- Scoring - Drinking Water Impact--------------------------Table #12
DrinkingWaterImpact:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 5               --> Category = 'DWIMP'
Order by 2

GOTO NoOp

-- Scoring - Drinking Water Impact Likely-------------------Table #13
DrinkingWaterImpactLikely:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 6               --> Category = 'DWLKLY'
Order by 2

GOTO NoOp

-- Scoring - Vapor Level------------------------------------Table #14
VaporLevel:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 7               --> Category = 'VPVL'
Order by 2

GOTO NoOp

-- Scoring - Population Size effected-----------------------Table #15
PopulationSizeEffected:
SELECT 	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 8               
Order by 2

GOTO NoOp

-- Scoring - Environment Type--------------------------------Table #16
EnvironmentType:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 9               --> Category = 'ENVTYP'
Order by 2

GOTO NoOp

-- Scoring - Environment Impact Likely-----------------------Table #17
EnvironmentImpactLikely:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 10               --> Category = 'ENVLKLY'
Order by 2

GOTO NoOp

-- Scoring - Non-Drinking Water Supply Type------------------->Table #18
NonDrinkingWaterSupply:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 11               --> Category = 'NONDWTYP'
Order by 2

GOTO NoOp

-- Scoring - Utility Impacted---------------------------------->Table # 19
UtilityImpacted:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 12               --> Category = 'UTIMP'
Order by 2

GOTO NoOp

-- Scoring - Annual Rainfall----------------------------------->Table # 20
AnnualRainfall:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 13               --> Category = 'RAINAN'
Order by 2

GOTO NoOp

-- Scoring - Soil Permiability---------------------------------->Table # 21
SoilPermiability:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 14               --> Category = 'SLPERM'
Order by 2

GOTO NoOp

-- Scoring - Aquifer Depth-------------------------------------->Table # 22
AquiferDepth:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 15               --> Category = 'SLPERM'
Order by 2

GOTO NoOp

-- Scoring - Surface Water Distance----------------------------->Table # 23
SurfaceWaterDistance:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 16               --> Category = 'SWDIST'
Order by 2

GOTO NoOp

--Contact Types -------------------------------------------->Table # 24
ContactTypes:
SELECT  '' AS SID,
	'' AS Descript
UNION
SELECT 	AffilTypeCd,
	AffilTypeDesc
FROM    AGENCY.dbo.AffilTypes WITH (NOLOCK)
WHERE   fkPgmInt = 'LUST'
AND     AffilTypeCd <> 'CST' --> Tanks Consultants
ORDER BY 1

GOTO NoOp

-- State List -------------------------------------------->Table # 25
States:
SELECT '' As SID,
       '' As Descript
UNION
SELECT STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  1

GOTO NoOp

-- Public Notice Type Description ------------------------>Table # 26
PublicNotice:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT distinct
       PublicNoticeTypeID as Id,
       Description as Descript
FROM   dbo.PublicNoticeType  WITH (NOLOCK)                                      
ORDER BY 2                   

GOTO NoOp


-- WORK REPORTED TYPES - WORK REPORTED BY values --------->Table # 27
WorkType:
SELECT  WorkTypeId as ID,
        WorkTypeDescription as Descript
FROM    LUST.dbo.WorkReportedType WITH (NOLOCK)
ORDER BY Descript

GOTO NoOp

-- Work Reported initial combo box load          --------->Table # 28
-- of current OTIS CONSULTANTS and USTLIC SERVICE PROVIDERS


-- Modified B.Dyer 26 Feb 2007
WorkReportedBy:
SELECT 
	'0' AS SID, 
	'' AS Descript
UNION

select 'RE' + CAST(b. PersonID as varchar) as SID,
       UPPER(d.LicenseStatus)+ ': ' 
       + LTRIM(RTRIM(b. FullName)) + ' ' 
       + isnull(b. AddressCity,'NO ADDRESS') + ' ' 
       + isnull(b. AddressState,' ')as Descript 

from   Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
join   Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

--from   [deqsql1\audit].Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
--join   [deqsql1\audit].Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

where  b. PersonType  = 'SP'
and    b. FullName is not null  
UNION
select 'CN' + CAST(c.ID as varchar) as SID,
       'CONSULTANT: ' + LTRIM(RTRIM(c.CompanyName))  + ' ' 
       + isnull(c.CITY,'NO ADDRESS')+ ' ' 
       + isnull(c.STATE,' ') as Descript 
from   LUST.dbo.CONSULTANT c WITH (NOLOCK)
ORDER BY Descript   

GOTO NoOp

-- Site Control Lookup Tables
-- SiteControlType .Tables-------------------------(29)
ControlType:
SELECT        '' AS TypeID
		, '' AS TypeCode
		, 'Please Select One' as TypeDescription
UNION
SELECT     	  TypeID As TypeID
		, TypeCode As TypeCode
		, TypeDescription as TypeDescription
FROM      	SiteControlType WITH (NOLOCK)
ORDER BY 	TypeID

GOTO NoOp

--DislpayALLControlDescription .Tables--------------(30)
ControlDescription:
SELECT        '' AS ControlID	
		, 'Please Select One' AS DislpayControlDescription
		, '' AS fkTypeCodeID
		, '' AS ControlDescription
		, '' AS GroupDescription
		, '' AS fkTypeCodeID
UNION
SELECT     	  ControlID 
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
		  COALESCE(ControlDescription, '') as DisplayControlDescription
		, fkGroupID
		, ControlDescription
		, GroupDescription
		, fkTypeCodeID
FROM   	dbo.SiteControlDesc WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
ORDER BY 	ControlID

GOTO NoOp

--DislpayControlDescription for E type.Tables-----------------------(31)
ControlDescriptionEngineering:
SELECT        '' AS ControlID	
		, 'Please Select One' AS DislpayControlDescription
		, '' AS fkTypeCodeID
		, '' AS ControlDescription
		, '' AS GroupDescription
		, '' AS fkTypeCodeID
UNION
SELECT     	  ControlID
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
	        COALESCE(ControlDescription, '') as DisplayControlDescription
		, fkGroupID
		, ControlDescription
		, GroupDescription
		, fkTypeCodeID
FROM   	dbo.SiteControlDesc  WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 2
ORDER BY 	GroupDescription, ControlDescription

GOTO NoOp

--DislpayControlDescription for I type.Tables------------------------(32)
ControlDescriptionInstiutional:
SELECT        '' AS ControlID
		, 'Please Select One' AS DislpayControlDescription
		, '' AS fkTypeCodeID
		, '' AS ControlDescription
		, '' AS GroupDescription
		, '' AS fkTypeCodeID
UNION
SELECT     	ControlID 
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
		  COALESCE(ControlDescription, '') as DisplayControlDescription
		, fkGroupID
		, ControlDescription
		, GroupDescription
		, fkTypeCodeID
FROM   	dbo.SiteControlDesc WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 1
ORDER BY 	GroupDescription, ControlDescription

GOTO NoOp

--PCS lookup tables
--Landfill Facilities   (table ----------------------33)
LandfillFacilities:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT   PcsDisposalFacilityID as Id,
         FacilityName as Descript
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'L'
ORDER BY 2

GOTO NoOp

--Treatment Facilities  (table -----------------------34)
TreatmentFacilities:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT   PcsDisposalFacilityID,
         FacilityName
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'T'
ORDER BY 2

GOTO NoOp

--Soil Status  (table --------------------------------35)
SoilStatus:  
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT   SoilStatusTypeID, 
         SoilStatusTypeDescription
FROM     LUST.dbo.PcsSoilStatusType WITH (NOLOCK)
ORDER BY 2

GOTO NoOp


/*

		Same AS STATES
*/
-- State List -------------------------------------------->Table # 36
--ADDED BDYER 26 JUNE 2006 TO SEPERATE "IC" AND "RP" STATES.

/*
SELECT '' As SID,
       '' As Descript
UNION


SELECT STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  1

GOTO NoOp

*/







--Contact Types -------------------------------------------->Table # 37
ContactTypesNoINV:
SELECT  '' AS SID,
	'' AS Descript
UNION
SELECT 	AffilTypeCd,
	AffilTypeDesc
FROM    AGENCY.dbo.AffilTypes WITH (NOLOCK)
WHERE   fkPgmInt = 'LUST'
AND     AffilTypeCd <> 'CST' --> Tanks Consultants
AND     AffilTypeCd <> 'INV'
ORDER BY 1

GOTO NoOp

--TODO BDYER 0CT 16 2006
-- i need City, County, and Zip Code set for the LookupTables class, 
-- which will hand off to the incident screen,
-- where these values are required. 
-- Presenting a blank here is asking for trouble.
-- DUMP LEADING BLANK



-- SOURCE OF RELEASE table lookups added 12 April 2007 per new EPA guidlines.
-- B.Dyer

-- Assessment Release Source Type ---------------------------> Table #44
AssessmentReleaseSource:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
Order by 2

GOTO NoOp

-- Assessment Release Source Type No Blank ---------------------------> Table #45

-- TODO BDYER 23 MAY 2007 - EXCLUDE "NOT REPORTED"
AssessmentReleaseSourceReported:
SELECT 
	0 AS Id, 
	'' AS Descript
UNION
SELECT ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
WHERE  ReleaseSourceId <> 7
Order by 2

GOTO NoOp



--ControlDescription for E type.Tables-----------------------(46)
DescriptionEngineering:
SELECT     	  ControlID as Id
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
	        COALESCE(ControlDescription, '') as Descript
FROM   	dbo.SiteControlDesc  WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 2
ORDER BY 	GroupDescription, ControlDescription

GOTO NoOp

--ControlDescription for I type.Tables------------------------(47)
DescriptionInstitutional:
SELECT     	ControlID as Id
		, COALESCE(GroupDescription, '') 
		  +  '  -  ' +
		  COALESCE(ControlDescription, '') as Descript
FROM   	dbo.SiteControlDesc WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 1
ORDER BY 	GroupDescription, ControlDescription

GOTO NoOp

-- Site Control Lookup Tables
-- SiteControlType .Tables-------------------------(29)
ControlType2:
SELECT     	  TypeID As Id
--		, TypeCode As TypeCode
		, TypeDescription as Descript
FROM      	SiteControlType WITH (NOLOCK)
ORDER BY 	TypeID

GOTO NoOp

-- Lust Hotc search Lookup Tables
-- LustHotcSearch .Tables-------------------------(29)
LustHotcSearchType:
	SELECT	Sid = '1', Descript = 'Search LUST Only'
	UNION
	SELECT	Sid = '2', Descript = 'Search HOTC Only'
	UNION
	SELECT	Sid = '3', Descript = 'Search LUST & HOTC'

GOTO NoOp

-- HotcDecommType search Lookup Tables
-- HotcDecommType .Tables-------------------------(29)
HotcDecommType:
	SELECT	Sid = 'In-Place', Descript = 'In-Place'
	UNION
	SELECT	Sid = 'Removed ', Descript = 'Removed'

GOTO NoOp

-- HotcFeeDefault search Lookup Tables
-- HotcFeeDefault .Tables-------------------------(29)
HotcFeeDefault:
	SELECT	Sid = 'Lust', Descript = '50.00'
	UNION
	SELECT	Sid = 'Hotc', Descript = '125.00'

GOTO NoOp

NoOp:


GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesByTypeData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesConsultants]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[apGetLookupTablesConsultants]

AS 


DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


-- State List -------------------------------------------->Table # 25
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
		'' As SID,
       '' As Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
	STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  2


select * FROM @LookupValues 

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesConsultants] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesContactsTabData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLookupTablesContactsTabData]

AS 


DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


--Contact Types -------------------------------------------->Table # 37
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Contact Type' AS DataType,
	'' AS SID,
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Contact Type' AS DataType,
	AffilTypeCd,
	AffilTypeDesc
FROM    AGENCY.dbo.AffilTypes WITH (NOLOCK)
WHERE   fkPgmInt = 'LUST'
AND     AffilTypeCd <> 'CST' --> Tanks Consultants
AND     AffilTypeCd <> 'INV'
ORDER BY 1


-- State List -------------------------------------------->Table # 25
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
		'' As SID,
       '' As Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
	STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  2



select * FROM @LookupValues

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesContactsTabData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLookupTablesData]

AS 

DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)

SELECT 
	'CountName' AS DataType,
	'0' AS CodeValue, 
	'' AS NameValue


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
		'CountName' AS DataType,
       cast(COUNTY_CODE as VARCHAR)  AS CodeValue,
       COUNTY_NAME as NameValue
FROM   AGENCY.dbo.COUNTIES  WITH (NOLOCK)
where  COUNTY_CODE not in (0,37,38,39)                                                 
ORDER BY NameValue



-- City values----------------------------> Table #1
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'PlaceName' AS DataType,
	'0' AS PlaceName, 
	'' AS PlaceName2


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
	   'PlaceName' AS DataType,
       rtrim(ltrim(PlaceName)) AS CodeValue,
       rtrim(ltrim(PlaceName)) AS NameValue
FROM   AGENCY.DBO.PLACES WITH (NOLOCK)                                        
ORDER BY 2



-- ZipCode values ----------------------------> Table #2
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'ZipCode' AS DataType,
	'0' AS ZipCode, 
	'' AS ZipCode2
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
	  'ZipCode' AS DataType,
       ZipCode,
       ZipCode AS ZipCode2
FROM   AGENCY.DBO.PLACES  WITH (NOLOCK)                                       
ORDER BY ZipCode              

-- Site Type values ----------------------------> Table #3

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'SiteTypeDescription' AS DataType,
	'0' AS Id, 
	''AS descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
		'SiteTypeDescription' AS DataType,
		SiteTypeId,
       SiteTypeDescription
FROM   LUST.dbo.SiteType WITH (NOLOCK)
ORDER BY 2






-- File Status values ----------------------------> Table #4
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'FileStatusTypeDescription' AS DataType,
	0 AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'FileStatusTypeDescription' AS DataType,
		CAST(FileStatusTypeId AS VARCHAR),
       FileStatusTypeDescription
from   LUST.dbo.FileStatusType WITH (NOLOCK)
order by 2

--Brownfield values ----------------------------> Table #5
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'BrownFieldCode' AS DataType,
	0 AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'BrownFieldCode' AS DataType,
		BrownFieldCode AS CodeValue,
		Description AS NameValue
FROM     LUST.dbo.BrownfieldCode WITH (NOLOCK)
Order by 2


-- DEQ Regions----------------------------> Table #6
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'Region' AS DataType,
	'0' AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Region' AS DataType,
	   DeqRegionAbbr,
       CASE DeqRegionAbbr
       WHEN 'ER' THEN 'Eastern'
       WHEN 'NWR' THEN 'Northwestern'
       WHEN 'WR'  THEN 'Western'
       END as  Descript
from   AGENCY.dbo.DEQRegions WITH (NOLOCK)
where  DeqRegionAbbr <> 'HQ'
order by Descript


-- PROJECT MANAGER Search screen list ----------------------------> Table #7

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
Values (
	'ProjectManagerHistory',
	'0' , 
	'' )
	,
	(
	'ProjectManagerHistory' ,
	'1' , 
	'- NO PM ASSIGNED -' )

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT DISTINCT 
	   'ProjectManagerHistory' As DataType,
	   --ROW_NUMBER() OVER(PARTITION BY a.PmLogin ORDER BY a.PmLogin) AS Row#,
       a.PmLogin,
       ISNULL(b.lf_nm,a.PmLogin) as descript
from   LUST.dbo.ProjectManagerHistory a WITH (NOLOCK)
left join   hris.dbo.EmpHisInitVw b WITH (NOLOCK)
       on a.PmLogin = b.Nt_Login
where  a.EndDate is null
AND    a.PmLogin <> 'CONV'
order  by descript



-- Assessment Discovery Type ---------------------------> Table #8
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Discovery Type' As DataType,
	'0' AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Discovery Type' As DataType,
		DiscoveryId,
       DiscoveryDescription
FROM   LUST.dbo.AssessmentDiscoveryType WITH (NOLOCK)
Order by DiscoveryDescription



-- Assessment Confirmation Type ---------------------------> Table #9
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Confirmation Type' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Confirmation Type' AS DataType,
		ConfirmationId,
       ConfirmationDescription
FROM   LUST.dbo.AssessmentConfirmationType WITH (NOLOCK)
Order by ConfirmationDescription



-- Assessment Release Cause Type ---------------------------> Table #10

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Assessment Release Cause Type' AS DataType, 
		0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Assessment Release Cause Type' AS DataType, 
		ReleaseCauseId,
       ReleaseCauseDescription
FROM   LUST.dbo.AssessmentReleaseType WITH (NOLOCK)
Order by ReleaseCauseDescription





-- Scoring - Drinking Water Replacement---------------------Table #11
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Replacement' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Replacement' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 4               --> Category = 'DWREPL'
Order by CategoryItemDescription




-- Scoring - Drinking Water Impact--------------------------Table #12
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Impact' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Impact' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 5               --> Category = 'DWIMP'
Order by CategoryItemDescription



-- Scoring - Drinking Water Impact Likely-------------------Table #13
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'Drinking Water Impact Likely' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Drinking Water Impact Likely' AS DataType,
	CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 6               --> Category = 'DWLKLY'
Order by CategoryItemDescription



-- Scoring - Vapor Level------------------------------------Table #14
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Vapor Level' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Vapor Level' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 7               --> Category = 'VPVL'
Order by CategoryItemDescription



-- Scoring - Population Size effected-----------------------Table #15
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Population Size Effected' AS DataType,
		0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Population Size Effected' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 8               
Order by CategoryItemDescription


-- Scoring - Environment Type--------------------------------Table #16
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Type' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Type' AS DataType, 
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 9               --> Category = 'ENVTYP'
Order by CategoryItemDescription


-- Scoring - Environment Impact Likely-----------------------Table #17
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Impact Likely' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Environment Impact Likely' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 10               --> Category = 'ENVLKLY'
Order by CategoryItemDescription



-- Scoring - Non-Drinking Water Supply Type------------------->Table #18
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Non-Drinking Water Supply Type' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Non-Drinking Water Supply Type' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 11               --> Category = 'NONDWTYP'
Order by CategoryItemDescription


-- Scoring - Utility Impacted---------------------------------->Table # 19
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Utility Impacted' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Utility Impacted' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 12               --> Category = 'UTIMP'
Order by CategoryItemDescription



-- Scoring - Annual Rainfall----------------------------------->Table # 20
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Annual Rainfall' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Annual Rainfall' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 13               --> Category = 'RAINAN'
Order by CategoryItemDescription


-- Scoring - Soil Permiability---------------------------------->Table # 21
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Soil Permiability' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Soil Permiability' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 14               --> Category = 'SLPERM'
Order by CategoryItemDescription


-- Scoring - Aquifer Depth-------------------------------------->Table # 22
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Aquifer Depth' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Aquifer Depth' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 15               --> Category = 'SLPERM'
Order by CategoryItemDescription


-- Scoring - Surface Water Distance----------------------------->Table # 23
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Surface Water Distance' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Surface Water Distance' AS DataType,
		CategoryItemId,
       CategoryItemDescription
FROM   LUST.dbo.SiteScoringElements WITH (NOLOCK)
WHERE  CategoryId = 16               --> Category = 'SWDIST'
Order by CategoryItemDescription


--Contact Types -------------------------------------------->Table # 24
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Contact Types' AS DataType, 
	'' AS SID,
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Contact Types' AS DataType, 
	AffilTypeCd,
	AffilTypeDesc
FROM    AGENCY.dbo.AffilTypes WITH (NOLOCK)
WHERE   fkPgmInt = 'LUST'
AND     AffilTypeCd <> 'CST' --> Tanks Consultants
ORDER BY AffilTypeCd



-- State List -------------------------------------------->Table # 25
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
		'' As SID,
       '' As Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
	STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  2



-- Public Notice Type Description ------------------------>Table # 26
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Public Notice Type' AS DataType,
	0 AS PublicNoticeTypeID, 
	'' AS Description
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT DISTINCT
	  'Public Notice Type' AS DataType,
       PublicNoticeTypeID,
       Description 
FROM   dbo.PublicNoticeType  WITH (NOLOCK)                                      
ORDER BY Description                   

-- WORK REPORTED TYPES - WORK REPORTED BY values --------->Table # 27
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Work Reported Types' AS DataType, 
		WorkTypeId AS ID,
        WorkTypeDescription AS Descript
FROM    LUST.dbo.WorkReportedType WITH (NOLOCK)
ORDER BY Descript


-- Work Reported initial combo box load          --------->Table # 28
-- of current OTIS CONSULTANTS and USTLIC SERVICE PROVIDERS


-- Modified B.Dyer 26 Feb 2007
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Work By' AS DataType,
	'0' AS SID, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)

select DISTINCT 'Work By' AS DataType,
		'RE' + CAST(b. PersonID as varchar) as SID,
       UPPER(d.LicenseStatus)+ ': ' 
       + LTRIM(RTRIM(b. FullName)) + ' ' 
       + isnull(b. AddressCity,'NO ADDRESS') + ' ' 
       + isnull(b. AddressState,' ')as Descript 

from   Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
join   Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

--from   [deqsql1\audit].Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
--join   [deqsql1\audit].Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

where  b. PersonType  = 'SP'
and    b. FullName is not null  

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
select 'Work By' AS DataType,
		'CN' + CAST(c.ID as varchar) as SID,
       'CONSULTANT: ' + LTRIM(RTRIM(c.CompanyName))  + ' ' 
       + isnull(c.CITY,'NO ADDRESS')+ ' ' 
       + isnull(c.STATE,' ') as Descript 
from   LUST.dbo.CONSULTANT c WITH (NOLOCK)
ORDER BY Descript   




-- Site Control Lookup Tables
-- SiteControlType .Tables-------------------------(29)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Site Control Type' AS DataType,
	      '' AS TypeID
		, 'Please Select One' as TypeDescription
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Site Control Type' AS DataType,
    	  TypeID As TypeID
		, TypeDescription as TypeDescription
FROM      	SiteControlType WITH (NOLOCK)
ORDER BY 	TypeID



--DislpayALLControlDescription .Tables--------------(30)
/* NOT USED IN LUST */

--SELECT        '' AS ControlID	
--		, 'Please Select One' AS DislpayControlDescription
--		, '' AS fkTypeCodeID
--		, '' AS ControlDescription
--		, '' AS GroupDescription
--		, '' AS fkTypeCodeID
--UNION
--SELECT     	  ControlID 
--		, COALESCE(GroupDescription, '') 
--		  +  '  -  ' +
--		  COALESCE(ControlDescription, '') as DisplayControlDescription
--		, fkGroupID
--		, ControlDescription
--		, GroupDescription
--		, fkTypeCodeID
--FROM   	dbo.SiteControlDesc WITH (NOLOCK)
--	INNER JOIN
--       	dbo.SiteControlGroup WITH (NOLOCK) ON 
--		fkGroupID = GroupID 
--	INNER JOIN
--            dbo.SiteControlType WITH (NOLOCK) ON 
--		fkTypeCodeID = TypeID
--ORDER BY 	ControlID


--DislpayControlDescription for E type.Tables-----------------------(31)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Engineering Control Type' AS DataType,
	      '' AS ControlID,	
		 '' AS ControlDescription

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Engineering Control Type' AS DataType,
	   	  ControlID
		, ControlDescription
FROM   	dbo.SiteControlDesc  WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 2
ORDER BY 	GroupDescription, ControlDescription



--DislpayControlDescription for I type.Tables------------------------(32)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Institutional Control Type' AS DataType,
     '' AS ControlID,
	  '' AS ControlDescription

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT     	'Institutional Control Type' AS DataType,
		ControlID 
		, ControlDescription
FROM   	dbo.SiteControlDesc WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 1
ORDER BY 	ControlDescription


--PCS lookup tables
--Landfill Facilities   (table ----------------------33)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'LandFile Facilities' AS DataType,
	   0 AS PcsDisposalFacilityID, 
	   '' AS FacilityName

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'LandFile Facilities' AS DataType,
		PcsDisposalFacilityID,
         FacilityName
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'L'
ORDER BY FacilityName


--Treatment Facilities  (table -----------------------34)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Treatment Facility Types' AS DataType,
	   0 AS PcsDisposalFacilityID, 
	   '' AS FacilityName
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Treatment Facility Types' AS DataType,
		 PcsDisposalFacilityID,
         FacilityName
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'T'
ORDER BY FacilityName


--Soil Status  (table --------------------------------35)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Soil Status' AS DataTypes,
	   0 AS SoilStatusTypeID, 
	   '' AS SoilStatusTypeDescription
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Soil Status' AS DataTypes,
		 SoilStatusTypeID, 
         SoilStatusTypeDescription
FROM     LUST.dbo.PcsSoilStatusType WITH (NOLOCK)
ORDER BY SoilStatusTypeDescription



-- State List -------------------------------------------->Table # 36
--ADDED BDYER 26 JUNE 2006 TO SEPERATE "IC" AND "RP" STATES.
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State List' AS DataType, 
		'' As SID,
       '' As Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State List' AS DataType, STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  2


--Contact Types -------------------------------------------->Table # 37
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Contact Type' AS DataType,
	'' AS SID,
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Contact Type' AS DataType,
	AffilTypeCd,
	AffilTypeDesc
FROM    AGENCY.dbo.AffilTypes WITH (NOLOCK)
WHERE   fkPgmInt = 'LUST'
AND     AffilTypeCd <> 'CST' --> Tanks Consultants
AND     AffilTypeCd <> 'INV'
ORDER BY 1


--TODO BDYER 0CT 16 2006
-- i need City, County, and Zip Code set for the LookupTables class, 
-- which will hand off to the incident screen,
-- where these values are required. 
-- Presenting a blank here is asking for trouble.
-- DUMP LEADING BLANK

--County No Blank -------------------------------------> Table #38
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct 
	   'County Names' AS DataType,
       cast(COUNTY_CODE as integer)  as DeqCountyCode,
       COUNTY_NAME as CountyName
FROM   AGENCY.dbo.COUNTIES  WITH (NOLOCK)
where  COUNTY_CODE not in (0,37,38,39)                                           
ORDER BY CountyName  


-- City No Blank---------------------------------------> Table #39
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT DISTINCT
	   'Place Name' AS DataType,
       rtrim(ltrim(PlaceName)) AS PlaceName ,
       rtrim(ltrim(PlaceName)) AS PlaceName2
FROM   AGENCY.DBO.PLACES  WITH (NOLOCK)                                       
ORDER BY PlaceName                                               



-- ZipCode No Blank ----------------------------> Table #40
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
	   'ZIP Codes' AS DataType,
       ZipCode,
       ZipCode as ZipCode2
FROM   AGENCY.DBO.PLACES   WITH (NOLOCK)                                      
ORDER BY ZipCode              


-- Assessment Discovery Type No Blank ---------------------------> Table #41





INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Discovery Code' AS DataType,
		 DiscoveryId,
       DiscoveryDescription
FROM   LUST.dbo.AssessmentDiscoveryType WITH (NOLOCK)
Order by DiscoveryDescription



-- Assessment Confirmation Type No Blank ---------------------------> Table #42

-- TODO BDYER OCT 16 2006
-- REMOVE TOP BLANK, AS THESE VALUES ARE PRESENTED INAN "UPDATE-ONLY" SCREEN.
--SELECTION OF A BLANK WILL ALWAYS BE AN ERROR. SO WHY OFFER IT?


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Confirmation Type' AS DataType, 
		ConfirmationCode,
       ConfirmationDescription
FROM   LUST.dbo.AssessmentConfirmationType WITH (NOLOCK)
Order by ConfirmationDescription




-- Assessment Release Cause Type No Blank ---------------------------> Table #43

-- TODO BDYER 23 MAY 2007 - EXCLUDE "NOT REPORTED"
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Cause Type' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Cause Type' AS DataType,
		ReleaseCauseId,
       ReleaseCauseDescription
FROM   LUST.dbo.AssessmentReleaseType WITH (NOLOCK)
WHERE  ReleaseCauseId <> 8
Order by 2




-- SOURCE OF RELEASE table lookups added 12 April 2007 per new EPA guidlines.
-- B.Dyer

-- Assessment Release Source Type ---------------------------> Table #44


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type' AS DataType,
	0 AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type' AS DataType,
		ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
Order by 2

-- Assessment Release Source Type No Blank ---------------------------> Table #45

-- TODO BDYER 23 MAY 2007 - EXCLUDE "NOT REPORTED"
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type Reported' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type Reported' AS DataType,
		ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
WHERE  ReleaseSourceId <> 7
Order by 2



--select * FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)




SELECT * FROM @LookupValues order by 1

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesIncidentTabData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLookupTablesIncidentTabData]

AS 


DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
Values (
	'ProjectManagerHistory',
	'0' , 
	'' )
	,
	(
	'ProjectManagerHistory' ,
	'1' , 
	'- NO PM ASSIGNED -' )

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT DISTINCT 
	   'ProjectManagerHistory' As DataType,
	   --ROW_NUMBER() OVER(PARTITION BY a.PmLogin ORDER BY a.PmLogin) AS Row#,
       a.PmLogin,
       ISNULL(b.lf_nm,a.PmLogin) as descript
from   LUST.dbo.ProjectManagerHistory a WITH (NOLOCK)
left join   hris.dbo.EmpHisInitVw b WITH (NOLOCK)
       on a.PmLogin = b.Nt_Login
where  a.EndDate is null
AND    a.PmLogin <> 'CONV'
order  by descript


--County No Blank -------------------------------------> Table #38
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct 
	   'County Names' AS DataType,
       cast(COUNTY_CODE as integer)  as DeqCountyCode,
       COUNTY_NAME as CountyName
FROM   AGENCY.dbo.COUNTIES  WITH (NOLOCK)
where  COUNTY_CODE not in (0,37,38,39)                                           
ORDER BY CountyName  


-- City No Blank---------------------------------------> Table #39
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT DISTINCT
	   'Place Name' AS DataType,
       rtrim(ltrim(PlaceName)) AS PlaceName ,
       rtrim(ltrim(PlaceName)) AS PlaceName2
FROM   AGENCY.DBO.PLACES  WITH (NOLOCK)                                       
ORDER BY PlaceName                                               



-- ZipCode No Blank ----------------------------> Table #40
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
	   'ZIP Codes' AS DataType,
       ZipCode,
       ZipCode as ZipCode2
FROM   AGENCY.DBO.PLACES   WITH (NOLOCK)                                      
ORDER BY ZipCode              



-- Site Type values ----------------------------> Table #3

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'SiteTypeDescription' AS DataType,
	'0' AS Id, 
	''AS descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
		'SiteTypeDescription' AS DataType,
		SiteTypeId,
       SiteTypeDescription
FROM   LUST.dbo.SiteType WITH (NOLOCK)
ORDER BY 2

-- File Status values ----------------------------> Table #4
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'FileStatusTypeDescription' AS DataType,
	0 AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'FileStatusTypeDescription' AS DataType,
		CAST(FileStatusTypeId AS VARCHAR),
       FileStatusTypeDescription
from   LUST.dbo.FileStatusType WITH (NOLOCK)
order by 2


--Brownfield values ----------------------------> Table #5
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'BrownFieldCode' AS DataType,
	0 AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'BrownFieldCode' AS DataType,
		BrownFieldCode AS CodeValue,
		Description AS NameValue
FROM     LUST.dbo.BrownfieldCode WITH (NOLOCK)
Order by 2

select * FROM @LookupValues

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesIncidentTabData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesNewIncidentData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLookupTablesNewIncidentData]

AS 


DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)

SELECT 
	'CountyName' AS DataType,
	'0' AS CodeValue, 
	'' AS NameValue


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
		'CountyName' AS DataType,
       cast(COUNTY_CODE as VARCHAR)  AS CodeValue,
       COUNTY_NAME as NameValue
FROM   AGENCY.dbo.COUNTIES  WITH (NOLOCK)
where  COUNTY_CODE not in (0,37,38,39)                                                 
ORDER BY NameValue



-- City values----------------------------> Table #1
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'PlaceName' AS DataType,
	'0' AS PlaceName, 
	'' AS PlaceName2


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
	   'PlaceName' AS DataType,
       rtrim(ltrim(PlaceName)) AS CodeValue,
       rtrim(ltrim(PlaceName)) AS NameValue
FROM   AGENCY.DBO.PLACES WITH (NOLOCK)                                        
ORDER BY 2



-- ZipCode values ----------------------------> Table #2
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 
	'ZipCode' AS DataType,
	'0' AS ZipCode, 
	'' AS ZipCode2
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT distinct
	  'ZipCode' AS DataType,
       ZipCode,
       ZipCode AS ZipCode2
FROM   AGENCY.DBO.PLACES  WITH (NOLOCK)                                       
ORDER BY ZipCode              


-- State List -------------------------------------------->Table # 25
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
		'' As SID,
       '' As Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'State Codes' AS DataType, 
	STATE_CODE,  STATE_CODE  
FROM AGENCY.DBO.STATES WITH (NOLOCK)
WHERE STATE_CODE Is NOT NULL
ORDER BY  2

-- Assessment Discovery Type ---------------------------> Table #8
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Discovery Type' As DataType,
	'0' AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Discovery Type' As DataType,
		DiscoveryId,
       DiscoveryDescription
FROM   LUST.dbo.AssessmentDiscoveryType WITH (NOLOCK)
Order by DiscoveryDescription

-- Assessment Confirmation Type ---------------------------> Table #9
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Confirmation Type' AS DataType,
	0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Confirmation Type' AS DataType,
		ConfirmationId,
       ConfirmationDescription
FROM   LUST.dbo.AssessmentConfirmationType WITH (NOLOCK)
Order by ConfirmationDescription


-- Assessment Release Cause Type ---------------------------> Table #10

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Assessment Release Cause Type' AS DataType, 
		0 AS Id, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 	'Assessment Release Cause Type' AS DataType, 
		ReleaseCauseId,
       ReleaseCauseDescription
FROM   LUST.dbo.AssessmentReleaseType WITH (NOLOCK)
Order by ReleaseCauseDescription


INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type' AS DataType,
	0 AS Id, 
	'' AS Descript

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Assessment Release Source Type' AS DataType,
		ReleaseSourceId,
       UPPER(ReleaseSourceDescription)
FROM   LUST.dbo.AssessmentSourceType WITH (NOLOCK)
Order by 2


select * FROM @LookupValues

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesNewIncidentData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesPCS]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[apGetLookupTablesPCS]

AS 


DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))



--PCS lookup tables
--Landfill Facilities   (table ----------------------33)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'LandFile Facilities' AS DataType,
	   0 AS PcsDisposalFacilityID, 
	   '' AS FacilityName

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'LandFile Facilities' AS DataType,
		PcsDisposalFacilityID,
         FacilityName
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'L'
ORDER BY FacilityName


--Treatment Facilities  (table -----------------------34)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Treatment Facility Types' AS DataType,
	   0 AS PcsDisposalFacilityID, 
	   '' AS FacilityName
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Treatment Facility Types' AS DataType,
		 PcsDisposalFacilityID,
         FacilityName
FROM     LUST.dbo.PcsDisposalFacility WITH (NOLOCK)
WHERE    FacilityType = 'T'
ORDER BY FacilityName


--Soil Status  (table --------------------------------35)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Soil Status' AS DataTypes,
	   0 AS SoilStatusTypeID, 
	   '' AS SoilStatusTypeDescription
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Soil Status' AS DataTypes,
		 SoilStatusTypeID, 
         SoilStatusTypeDescription
FROM     LUST.dbo.PcsSoilStatusType WITH (NOLOCK)
ORDER BY SoilStatusTypeDescription


select * FROM @LookupValues 

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesPCS] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesPublicNoticeData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLookupTablesPublicNoticeData]

AS 

DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


-- Public Notice Type Description ------------------------>Table # 26
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'Public Notice Type' AS DataType,
	0 AS PublicNoticeTypeID, 
	'' AS Description
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT DISTINCT
	  'Public Notice Type' AS DataType,
       PublicNoticeTypeID,
       Description 
FROM   dbo.PublicNoticeType  WITH (NOLOCK)                                      
ORDER BY Description                 

SELECT * FROM @LookupValues order by 1

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesPublicNoticeData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesSiteControlData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLookupTablesSiteControlData]

AS 

DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


-- SiteControlType .Tables-------------------------(29)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Site Control Type' AS DataType,
	      '' AS TypeID
		, 'Please Select One' as TypeDescription
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Site Control Type' AS DataType,
    	  TypeID As TypeID
		, TypeDescription as TypeDescription
FROM      	SiteControlType WITH (NOLOCK)
ORDER BY 	TypeID


--DislpayControlDescription for E type.Tables-----------------------(31)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Engineering Control Type' AS DataType,
	      '' AS ControlID,	
		 '' AS ControlDescription

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'Engineering Control Type' AS DataType,
	   	  ControlID
		, ControlDescription
FROM   	dbo.SiteControlDesc  WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 2
ORDER BY 	GroupDescription, ControlDescription



--DislpayControlDescription for I type.Tables------------------------(32)
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT   'Institutional Control Type' AS DataType,
     '' AS ControlID,
	  '' AS ControlDescription

INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT     	'Institutional Control Type' AS DataType,
		ControlID 
		, ControlDescription
FROM   	dbo.SiteControlDesc WITH (NOLOCK)
	INNER JOIN
       	dbo.SiteControlGroup WITH (NOLOCK) ON 
		fkGroupID = GroupID 
	INNER JOIN
            dbo.SiteControlType WITH (NOLOCK) ON 
		fkTypeCodeID = TypeID
WHERE 	fkTypeCodeID = 1
ORDER BY 	ControlDescription

SELECT * FROM @LookupValues order by 1

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesSiteControlData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLookupTablesWorkReported]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[apGetLookupTablesWorkReported]

AS 


DECLARE @LookupValues Table (id INT IDENTITY PRIMARY KEY, DataType VARCHAR(48), CodeValue VARCHAR(32), NameValue VARCHAR(128))


-- WORK REPORTED TYPES - WORK REPORTED BY values --------->Table # 27
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT  'WorkType' AS DataType, 
		WorkTypeId as ID,
        WorkTypeDescription as Descript
FROM    LUST.dbo.WorkReportedType WITH (NOLOCK)
ORDER BY Descript


-- Work Reported initial combo box load          --------->Table # 28
-- of current OTIS CONSULTANTS and USTLIC SERVICE PROVIDERS


-- Modified B.Dyer 26 Feb 2007
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
SELECT 'WorkBy' AS DataType,
	'0' AS SID, 
	'' AS Descript
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
select 'WorkBy' AS DataType,
		'RE' + CAST(b. PersonID as varchar) as SID,
       UPPER(d.LicenseStatus)+ ': ' 
       + LTRIM(RTRIM(b. FullName)) + ' ' 
       + isnull(b. AddressCity,'NO ADDRESS') + ' ' 
       + isnull(b. AddressState,' ')as Descript 

from   Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
join   Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID
where  b. PersonType  = 'SP'
and    b. FullName is not null  
INSERT INTO @LookupValues (DataType, CodeValue, NameValue)
select 'WorkBy' AS DataType,
		'CN' + CAST(c.ID as varchar) as SID,
       'CONSULTANT: ' + LTRIM(RTRIM(c.CompanyName))  + ' ' 
       + isnull(c.CITY,'NO ADDRESS')+ ' ' 
       + isnull(c.STATE,' ') as Descript 
from   LUST.dbo.CONSULTANT c WITH (NOLOCK)
ORDER BY Descript   



select * FROM @LookupValues 

GO
GRANT EXECUTE ON [dbo].[apGetLookupTablesWorkReported] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apGetLustSearchData]    Script Date: 6/20/2019 10:00:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
-----------------------------------------------------------------------------------------------------------
  apGetLustSearchData

Revision History:
-----------------------------------------------------------------------------------------------------------
  Date               Name          Description
-----------------------------------------------------------------------------------------------------------
06-08-2018          aguedea        Creation
06/11/2019			aguedea		   Changed how facilityId is search, when null then not included in criteria, when -1 then search is on facilityId = -1 else
								   search on FacilityId = @FacilityId 
6/20/2019			aguedea			TankStatus was using 1 and -1 as filters, now uses 1 and 2 as required


declare @TotalRows                   INT, @TotalPages                  INT,@RESULT                      INT			

exec [apGetLustSearchData]
NULL
,NULL
,NULL
,-1
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,1
,1
,1
,10
,@TotalRows                   OUTPUT
,@TotalPages                  OUTPUT 
,@RESULT                      OUTPUT





-----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetLustSearchData]
               @LogCounty                   VARCHAR(2)		= NULL
              ,@LogYear                     VARCHAR(2)		= NULL
              ,@LogSeqNbr					VARCHAR(4)		= NULL
              ,@FacilityId                  INT				= NULL
              ,@SiteName                    VARCHAR(40)		= NULL
              ,@SiteAddress                 VARCHAR(40)		= NULL
              ,@SiteCity                    VARCHAR(20)		= NULL
              ,@SiteZipCode                 VARCHAR(5)		= NULL
			  ,@SiteCounty			        VARCHAR(10)     = NULL
              ,@RegionCode                  VARCHAR(3)		= NULL
              ,@ReleaseSiteTypeCode         CHAR(1)			= NULL
              ,@CleanUpSiteTypeId           INT             = NULL
              ,@FileStatusId                INT             = NULL
              ,@ProjectManagerCode			VARCHAR(7)		= NULL
              ,@ContactFirstName            VARCHAR(40)		= NULL
              ,@ContactLastName             VARCHAR(40)		= NULL
              ,@ContactOrganization         VARCHAR(40)		= NULL
              ,@TankStatusId                INT             = NULL
              ,@HotAuditRejectInd           BIT             = NULL
              ,@CompareDate1Id              INT             = NULL
              ,@CompareDate2Id              INT             = NULL
              ,@CompareDate1IdFromDate		DATETIME		= NULL
              ,@CompareDate1IdToDate        DATETIME		= NULL
              ,@CompareDate2IdFromDate		DATETIME		= NULL
              ,@CompareDate2IdToDate        DATETIME		= NULL
              ,@SortColumn                  INT             = NULL
              ,@SortOrder                   INT             = NULL
              ,@PageNumber                  INT             = NULL
              ,@RowsPerPage                 INT             = NULL
              ,@TotalRows                   INT             OUTPUT
              ,@TotalPages                  INT             OUTPUT 
              ,@RESULT                      INT				OUTPUT

              
              
AS
--SET rowcount 20000
DECLARE @SQLQuery AS VARCHAR(8000) 
DECLARE @SQLColumns AS VARCHAR(1024)
DECLARE @WHERE varchar(4096) 
DECLARE @OrderBy VARCHAR(1024) 
DECLARE @Date1ValueEntered AS BIT 
DECLARE @Date2ValueEntered AS BIT
DECLARE @RowsCalc DECIMAL 
DECLARE @Pagination VARCHAR(128)



SET @SQLQuery = '
'
SET @WHERE = ' 
WHERE 1 = 1 AND '
SET @Date1ValueEntered = 0
SET @Date2ValueEntered = 0
SET @OrderBy = ''
SET @Pagination = '
'



IF ISNULL(@PageNumber, 0) = 0
       SET @PageNumber = 1

IF ISNULL(@RowsPerPage, 0) = 0
       SET @RowsPerPage = 10

IF ISNULL(@SortColumn, 0) = 0
       BEGIN
              SET @SortColumn = 2
              SET @SortOrder = -1
       END 


IF ISNULL(@SortOrder, 0) = 0
       SET @SortOrder = 1

----------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                     Create WHERE Statement
----------------------------------------------------------------------------------------------------------------------------------------------------------


IF (LEN(ISNULL(@LogCounty, '')) > 0 AND LEN(ISNULL(@LogYear, '')) > 0 AND LEN(ISNULL(@LogSeqNbr , '')) > 0 )
       SET @WHERE = @WHERE + ' (Inc.LogNumber = ''' + @LogCounty + '-' + @LogYear + '-' + @LogSeqNbr  + ''') AND '
	   ---SET @WHERE = @WHERE + ' (Inc.LogNumber = ''' + @LogCounty + '-' + @LogYear + '-' + @LogSeqNbr  + ''') AND '
ELSE
       BEGIN
              --PRINT @LogCounty + ' ' + @LogYear + ' ' + @LogSeqNbr 
              IF LEN(ISNULL(@LogCounty, '')) > 0
                     SET @WHERE = @WHERE + ' ( Inc.LogNbrCounty = ''' + ISNULL(@LogCounty, '') + ''') AND ' 

              IF LEN(ISNULL(@LogYear, '')) > 0 
                     BEGIN
                     SET @WHERE = @WHERE + ' ( Inc.LogNbrYear = ''' + ISNULL(@LogYear, '') + ''') AND '  
                     END
              IF LEN(ISNULL(@LogSeqNbr , '')) > 0 
                     SET @WHERE = @WHERE + ' ( Inc.LogNbrSeq = ''' + ISNULL(@LogSeqNbr , '') + ''') AND ' 
       END



IF ISNULL(@FacilityID, 1) = 1
    SET @WHERE = @WHERE 
ELSE IF @FacilityID = -1
	SET @WHERE = @WHERE + ' ( Inc.FacilityID = -1) AND '
ELSE
	SET @WHERE = @WHERE + ' ( Inc.FacilityID = ' + CONVERT(VARCHAR, @FacilityID) + ') AND '

IF LEN(ISNULL(@SiteName, '')) > 0
       BEGIN
              SET @WHERE = @WHERE + ' (( Inc.SiteName LIKE ''' + ISNULL(@SiteName, '') + '%'') OR ( SNA.SiteNamealias LIKE ''' + ISNULL(@SiteName, '') + '%'')) AND '
       END

IF LEN(ISNULL(@SiteAddress, '')) > 0
       SET @WHERE = @WHERE + ' ( Inc.SiteAddress LIKE ''' + ISNULL(@SiteAddress, '') + '%'') AND '

IF LEN(ISNULL(@SiteCity, '')) > 0
       SET @WHERE = @WHERE + ' ( Inc.SiteCity LIKE ''' + ISNULL(@SiteCity, '') + '%'') AND '

IF LEN(ISNULL(@SiteZipCode, '')) > 0
       SET @WHERE = @WHERE + ' ( Inc.SiteZip LIKE ''' + ISNULL(@SitezipCode, '') + '%'') AND '

       -- RegulatedTankInd and HotInd are indicators
       -- Values can be 0 Not Set Or 1 Set
       -- In order for Query to use values it is set to -1 when NULL as to not include this in the filter
IF ISNULL(@ReleaseSiteTypeCode, '') = 'R'
       SET @WHERE = @WHERE + ' ( Inc.RegulatedTankInd = 1) AND '
ELSE IF ISNULL(@ReleaseSiteTypeCode, '') = 'H'
       SET @WHERE = @WHERE + ' ( Inc.HotInd = 1) AND '
ELSE IF ISNULL(@ReleaseSiteTypeCode, '') = 'U'
       SET @WHERE = @WHERE + ' ( Inc.RegulatedTankInd = 0 ) AND ( Inc.HotInd = 0 ) AND '


IF ISNULL(@CleanUpSiteTypeID, 0) != 0
       SET @WHERE = @WHERE + ' ( Inc.SiteTypeID = ' + CONVERT(VARCHAR, @CleanUpSiteTypeID) + ') AND '

IF ISNULL(@FileStatusID, 0) != 0
       SET @WHERE = @WHERE + ' ( Inc.FileStatusID = ' + CONVERT(VARCHAR, @FileStatusID) + ') AND '

IF LEN(ISNULL(NULLIF(@ProjectManagerCode, '0'), '')) > 0 

       BEGIN
              IF @ProjectManagerCode = '1'
                     SET @WHERE = @WHERE + ' INC.LustId NOT IN (SELECT NoPM.LUSTID FROM LUST.dbo.ProjectManagerHistory NoPM) AND '
              ELSE
                     SET @WHERE = @WHERE + ' ( PMH.PMLogin = ''' + ISNULL(@ProjectManagerCode, '') + ''') AND PMH.EndDate IS NULL AND '
       END

IF LEN(ISNULL(@ContactFirstName, '')) > 0
       SET @WHERE = @WHERE + ' ( LP.FirstName LIKE ''' + ISNULL(@ContactFirstName, '') + '%'') AND '

IF LEN(ISNULL(@ContactLastName, '')) > 0
       SET @WHERE = @WHERE + ' ( LP.LastName LIKE ''' + ISNULL(@ContactLastName, '') + '%'') AND '

IF LEN(ISNULL(@ContactOrganization, '')) > 0
       SET @WHERE = @WHERE + ' ( LP.Organization LIKE ''' + ISNULL(@ContactOrganization, '') + '%'') AND '

IF LEN(ISNULL(@RegionCode, '')) > 0
       SET @WHERE = @WHERE + ' ( AC.Region = ''' + ISNULL(@RegionCode, '') + ''') AND '

IF LEN(ISNULL(@SiteCounty, '')) > 0
		SET @WHERE = @WHERE + ' ( AC.County_Code = ''' + ISNULL(@SiteCounty, '') + ''') AND '

IF ISNULL(@TankStatusId, -99) = 1
       SET @WHERE = @WHERE + ' ( MNG.FinalInvcRqstDate IS NULL) AND '
ELSE IF ISNULL(@TankStatusId, -99) = 2
       SET @WHERE = @WHERE + ' ( MNG.FinalInvcRqstDate IS NOT NULL) AND '

IF ISNULL(@HotAuditRejectInd, 0) = 1
       SET @WHERE = @WHERE + ' ( INC.HotAuditRejectInd = 1 ) AND '


/*
              ReceiveDate = 1

*/
IF ISNULL(@CompareDate1Id, 0) != 0 
       BEGIN
              IF @CompareDate1Id = 1
                     BEGIN
                           IF @CompareDate1IdFromDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( INC.ReceivedDate >= ''' + CONVERT(VARCHAR, @CompareDate1IdFromDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @CompareDate1IdToDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( INC.ReceivedDate <= ''' + CONVERT(VARCHAR, @CompareDate1IdToDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END

                           IF @Date1ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( INC.ReceivedDate IS NOT NULL ) AND '
                     END
              ELSE  
                     IF @CompareDate1Id = 2
                     BEGIN
                           IF @CompareDate1IdFromDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( MNG.CleanupStartDate >= ''' + CONVERT(VARCHAR, @CompareDate1IdFromDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END    
                           IF @CompareDate1IdToDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( MNG.CleanupStartDate <= '''  + CONVERT(VARCHAR, @CompareDate1IdToDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @Date1ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( MNG.CleanupStartDate IS NOT NULL ) AND '
                     END
              ELSE
                     IF @CompareDate1Id = 3
                     BEGIN
                           IF @CompareDate1IdFromDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( MNG.ReleaseStopDate >= ''' +  CONVERT(VARCHAR, @CompareDate1IdFromDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @CompareDate1IdToDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + '  (MNG.ReleaseStopDate <= ''' + CONVERT(VARCHAR, @CompareDate1IdToDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @Date1ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( MNG.ReleaseStopDate IS NOT NULL ) AND '
                     END
              ELSE
                     IF @CompareDate1Id = 4
                     BEGIN
                           IF @CompareDate1IdFromDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( MNG.FinalInvcRqstDate >= ''' +  CONVERT(VARCHAR, @CompareDate1IdFromDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @CompareDate1IdToDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + '  (MNG.FinalInvcRqstDate <= ''' + CONVERT(VARCHAR, @CompareDate1IdToDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @Date1ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( MNG.FinalInvcRqstDate IS NOT NULL ) AND '
                     END
              ELSE
                     IF @CompareDate1Id = 5
                     BEGIN
                           IF @CompareDate1IdFromDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( MNG.ClosedDate >= ''' +  CONVERT(VARCHAR, @CompareDate1IdFromDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @CompareDate1IdToDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + '  (MNG.ClosedDate <= ''' + CONVERT(VARCHAR, @CompareDate1IdToDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @Date1ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( MNG.ClosedDate IS NOT NULL ) AND '
                     END
              ELSE
                     IF @CompareDate1Id = 6
                     BEGIN
                           IF @CompareDate1IdFromDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( MNG.LetterOfAgreementDate >= ''' +  CONVERT(VARCHAR, @CompareDate1IdFromDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @CompareDate1IdToDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + '  (MNG.LetterOfAgreementDate <= ''' + CONVERT(VARCHAR, @CompareDate1IdToDate, 101) + ''') AND '
                                         SET @Date1ValueEntered = 1
                                  END
                           IF @Date1ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( MNG.LetterOfAgreementDate IS NOT NULL ) AND '
                     END
       END

----------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                     From Date 2
----------------------------------------------------------------------------------------------------------------------------------------------------------
IF LEN(ISNULL(@CompareDate2Id, '')) > 0 
       BEGIN
              IF @CompareDate2Id = 1  -- ReceivedDate 
                     BEGIN
                           IF @CompareDate2IdFromDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( INC.ReceivedDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdFromDate, 101) + ''') AND '
                                         SET @Date2ValueEntered = 1
                                  END
                           IF @CompareDate2IdToDate IS NOT NULL
                                  BEGIN
                                         SET @WHERE = @WHERE + ' ( INC.ReceivedDate <= ''' + CONVERT(VARCHAR, @CompareDate2IdToDate, 101) + ''') AND '
                                         SET @Date2ValueEntered = 1
                                  END

                           IF @Date2ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( INC.ReceivedDate IS NOT NULL ) AND '
                     END
              ELSE
                     IF @CompareDate2Id = 2     -- CLEANUPSTARTDATE
                           BEGIN
                                  IF @CompareDate2IdFromDate IS NOT NULL
                                         BEGIN
                                                SET @WHERE = @WHERE + ' ( MNG.CleanupStartDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdFromDate, 101) + ''') AND '
                                                SET @Date2ValueEntered = 1
                                         END
                                  IF @CompareDate2IdToDate IS NOT NULL
                                         BEGIN
                                                SET @WHERE = @WHERE + ' ( MNG.CleanupStartDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdToDate, 101) + ''') AND '
                                                SET @Date2ValueEntered = 1
                                         END
                                  IF @Date2ValueEntered = 0
                                  SET @WHERE = @WHERE + ' ( MNG.CleanupStartDate IS NOT NULL ) AND '
                           END
                     ELSE
                           IF @CompareDate2Id = 3 --RELEASESTOPDATE
                                  BEGIN
                                         IF @CompareDate2IdFromDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.ReleaseStopDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdFromDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @CompareDate2IdToDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.ReleaseStopDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdToDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @Date2ValueEntered = 0
                                         SET @WHERE = @WHERE + ' ( MNG.ReleaseStopDate IS NOT NULL ) AND '
                                  END
                     ELSE
                           IF @CompareDate2Id = 4 --FINALINVCRQSTDATE
                                  BEGIN
                                         IF @CompareDate2IdFromDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.FinalInvcRqstDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdFromDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @CompareDate2IdToDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.FinalInvcRqstDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdToDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @Date2ValueEntered = 0
                                         SET @WHERE = @WHERE + ' ( MNG.FinalInvcRqstDate IS NOT NULL ) AND '
                                  END
                     ELSE
                           IF @CompareDate2Id = 5 -- CLOSEDDATE
                                  BEGIN
                                         IF @CompareDate2IdFromDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.ClosedDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdFromDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @CompareDate2IdToDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.ClosedDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdToDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @Date2ValueEntered = 0
                                         SET @WHERE = @WHERE + ' ( MNG.ClosedDate IS NOT NULL ) AND '
                                  END
                     ELSE
                           IF @CompareDate2Id = 6 --'LetterOfAgreementDate'
                                  BEGIN
                                         IF @CompareDate2IdFromDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.LetterOfAgreementDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdFromDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @CompareDate2IdToDate IS NOT NULL
                                                BEGIN
                                                       SET @WHERE = @WHERE + ' ( MNG.LetterOfAgreementDate >= ''' + CONVERT(VARCHAR, @CompareDate2IdToDate, 101) + ''') AND '
                                                       SET @Date2ValueEntered = 1
                                                END
                                         IF @Date2ValueEntered = 0
                                         SET @WHERE = @WHERE + ' ( MNG.LetterOfAgreementDate IS NOT NULL ) AND '
                                  END

       END    




IF RIGHT(LTRIM(RTRIM(@WHERE)), 3) = 'AND'
       SET @WHERE = SUBSTRING(@WHERE, 1, LEN(LTRIM(RTRIM(@WHERE))) - 3)
       
--PRINT 'Right before @Where reset = ' + @Where
SET @WHERE = @WHERE + '
'


SET @SQLColumns  = '
       SELECT DISTINCT
       INC.LustId, 
       INC.LogNumber as LogNumber, 
       INC.SiteName,
      (ISNULL(INC.SiteAddress,'''') + COALESCE('' '' + INC.SiteCity, '''')+ COALESCE('', '' + INC.SiteZip,'''')) as SiteAddress,
       MNG.FinalInvcRqstDate as FirDt, 
       MNG.ClosedDate as ClosedDt,
       CAST(INC.FacilityId AS VARCHAR(6)) as FacilityId,
       ASS.CurrentSiteScore as SiteScore '
SET @SQLQuery = '
       FROM LUST.dbo.INCIDENT INC WITH (NOLOCK)
       LEFT JOIN LUST.dbo.MANAGEMENT MNG WITH (NOLOCK) ON INC.LUSTID = MNG.LUSTID
       LEFT JOIN LUST.dbo.ProjectManagerHistory PMH WITH (NOLOCK) ON INC.LUSTID = PMH.LUSTID
       LEFT JOIN AGENCY.dbo.COUNTIES AC WITH (NOLOCK) ON INC.LOGNBRCOUNTY = AC.COUNTY_CODE
       LEFT JOIN LUST.dbo.vwLUSTParty LP WITH (NOLOCK) ON INC.LustId = LP.LustId 
       LEFT JOIN LUST.dbo.SiteNameAlias SNA WITH (NOLOCK) ON INC.LustId = SNA.LustId 
       LEFT JOIN LUST.dbo.Assessment ASS WITH (NOLOCK) ON INC.LustID = ASS.LustID  ' 


SET @OrderBy = 'ORDER BY '

IF @SortOrder = 1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy  = @OrderBy  + ' Inc.LustID ASC'
              ELSE IF @SortColumn = 2 
                     --SET @OrderBy = @OrderBy + '''' + '  ' + ''' + Inc.LogNumber ASC'
					 SET @OrderBy = @OrderBy + ' + LogNumber ASC'
              ELSE IF @SortColumn = 3
                     SET @OrderBy = @OrderBy + ' SiteName ASC'
              ELSE IF @SortColumn = 4
                     SET @OrderBy = @OrderBy + ' SiteAddress ASC'
              ELSE IF @SortColumn = 5
                     SET @OrderBy = @OrderBy + ' FirDt ASC'
              ELSE IF @SortColumn = 6
                     SET @OrderBy = @OrderBy + ' ClosedDt ASC'
              ELSE IF @SortColumn = 7
                     SET @OrderBy = @OrderBy + ' FacilityId ASC'
              ELSE IF @SortColumn = 8
                     SET @OrderBy = @OrderBy + ' SiteScore ASC'
       END
ELSE IF @SortOrder = -1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy = @OrderBy + ' Inc.LustID DESC'
              ELSE IF @SortColumn = 2
                     SET @OrderBy = @OrderBy +  ' LogNumber DESC'
              ELSE IF @SortColumn = 3
                     SET @OrderBy = @OrderBy + ' SiteName DESC'
              ELSE IF @SortColumn = 4
                     SET @OrderBy = @OrderBy + ' SiteAddress DESC'
              ELSE IF @SortColumn = 5
                     SET @OrderBy = @OrderBy + ' FirDt DESC'
              ELSE IF @SortColumn = 6
                     SET @OrderBy = @OrderBy + ' ClosedDt DESC'
              ELSE IF @SortColumn = 7
                     SET @OrderBy = @OrderBy + ' FacilityId DESC'
              ELSE IF @SortColumn = 8
                     SET @OrderBy = @OrderBy + ' SiteScore DESC'
       END
              


IF (CHARINDEX('MILTON FREEWATER',@Where,0) > 0)
       SELECT @Where = REPLACE(@Where,'MILTON FREEWATER','MILTON_FREEWATER')

IF (CHARINDEX('MILTON-FREEWATER',@Where,0) > 0)
       SELECT @Where = REPLACE(@Where,'MILTON-FREEWATER','MILTON_FREEWATER')

--Put all the queries variables together
--SET @SQLQuery = @SQLQuery + @Where + @OrderBy

SET @SQLQuery = @SQLQuery + ' '

SET @Pagination  = @Pagination + ' 
       OFFSET ((' + CONVERT(VARCHAR, @PageNumber) + ' -1 ) * ' + CONVERT(VARCHAR, @RowsPerPage) + ') ROWS'
SET @Pagination = @Pagination + ' 
       FETCH NEXT ' + CONVERT(VARCHAR, @RowsPerPage) + ' ROWS ONLY;'

--------------------------------------------------------------
--     Counts Query
--------------------------------------------------------------


DECLARE @SQLCounts AS NVARCHAR(MAX) = 'SELECT @totals = COUNT (DISTINCT Inc.LogNumber)
       FROM LUST.dbo.INCIDENT INC WITH (NOLOCK)
       LEFT JOIN LUST.dbo.MANAGEMENT MNG WITH (NOLOCK) ON INC.LUSTID = MNG.LUSTID
       LEFT JOIN LUST.dbo.ProjectManagerHistory PMH WITH (NOLOCK) ON INC.LUSTID = PMH.LUSTID
       LEFT JOIN AGENCY.dbo.COUNTIES AC WITH (NOLOCK) ON INC.LOGNBRCOUNTY = AC.COUNTY_CODE
       LEFT JOIN LUST.dbo.vwLUSTParty LP WITH (NOLOCK) ON INC.LustId = LP.LustId 
       LEFT JOIN LUST.dbo.SiteNameAlias SNA WITH (NOLOCK) ON INC.LustId = SNA.LustId 
       LEFT JOIN LUST.dbo.Assessment ASS WITH (NOLOCK) ON INC.LustID = ASS.LustID '

SET @SQLCounts = @SQLCounts  + @WHERE 

EXEC sp_executesql @SQLCounts, N'@totals INT OUTPUT', @TotalRows OUTPUT



SET @TotalPages = @TotalRows / @RowsPerPage

-- This condition indicates the query returned data but did not fill a page so return 1
IF (@TotalPages = 0 AND @TotalRows <> 0)
       BEGIN
              --PRINT '@totalpages = 0 and @totalrows <> 0   ' + Convert(varchar, @totalPages) + ' ' + Convert(varchar, @totalRows)
              -- return 1 
              SET @TotalPages = @TotalPages + 1
       END
ELSE
       BEGIN
              -- this indicates the query did fill at least 1 page and now we need to see if there is a MOD Rows per Page value
              -- if so, increment the pages + 1
              SET @RowsCalc = @TotalRows % @RowsPerPage
              IF @RowsCalc > 0.0
                     SET @Totalpages = @TotalPages + 1
       END


--------------------------------------------------------------
--     MAIN QUERY
--------------------------------------------------------------
SET @SQLQuery = @SQLColumns + @SQLQuery + @Where + @OrderBy + @Pagination

--Print @SQLQuery

--run the query
EXEC(@SQLQuery)


SELECT @RESULT = @@ERROR
--SET ROWCOUNT 0



GO
GRANT EXECUTE ON [dbo].[apGetLustSearchData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetOLPRRLookupTables]    Script Date: 7/10/2019 5:24:25 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


/***********************************************************************************************************************/
/*
**		Name: dbo.apGetOLPRRLookupTables
**		Desc:	Returns multiple datasets to be used for populating dropdowns on the online reprting form.
**		
**		Return values: Recordsets
** 
**		Called by:   LUST
**              
**		Auth: Art Knight
**
**		Date: 07/20/2017
************************************************************************************************************************
**		Change History
************************************************************************************************************************
**	   Date		Author		Description:
**	----------	--------	--------------------------------------------------------------------------------------------
**	08/02/2017	knight		Add separator between US states and foreign territories/states.
**  05/29/2018  guedea		Added Types for OLPRR Offices and Incidents
**	7/10/2019	aguedea	    Added the new tabletype CountiesUnsorted
************************************************************************************************************************
exec apGetOLPRRLookupTables 'CountiesUnsorted'


*/

/***********************************************************************************************************************/

CREATE PROCEDURE [dbo].[apGetOLPRRLookupTables]
		@TableType AS VARCHAR(25)
AS


IF		@TableType = 'CalendarMonths'
	GOTO CalendarMonths
ELSE IF	@TableType = 'TimeAMPM'
	GOTO TimeAMPM
ELSE IF	@TableType = 'SiteType'
	GOTO SiteType
ELSE IF	@TableType = 'Counties'
	GOTO Counties
ELSE IF	@TableType = 'Quadrant'
	GOTO Quadrant
ELSE IF	@TableType = 'StreetType'
	GOTO StreetType
ELSE IF	@TableType = 'PhoneType'
	GOTO PhoneType
ELSE IF	@TableType = 'ConfirmationType'
	GOTO ConfirmationType
ELSE IF	@TableType = 'DiscoveryType'
	GOTO DiscoveryType
ELSE IF	@TableType = 'ReleaseCauseType'
	GOTO ReleaseCauseType
ELSE IF	@TableType = 'SourceType'
	GOTO SourceType
ELSE IF	@TableType = 'States'
	GOTO States
ELSE IF @TableType = 'DEQOffice'
	GOTO DEQOffice
ELSE IF @TableType = 'IncidentStatus'
	GOTO IncidentStatus
ELSE IF @TableType = 'TankStatus'
	GOTO TankStatus
ELSE IF @TableType = 'Region'
	GOTO Region
ELSE IF @TableType = 'City'
	GOTO City
ELSE IF @TableType = 'FileStatus'
	GOTO FileStatus
ELSE IF @TableType = 'DateCompare'
	GOTO DateCompare
ELSE IF @TableType = 'ZipCode'
	GOTO ZipCode
ELSE IF @TableType = 'CleanupSiteType'
	GOTO CleanupSiteType
ELSE IF @TableType = 'ProjectManager'
	GOTO ProjectManager
ELSE IF @TableType = 'CountiesUnsorted'
	GOTO CountiesUnsorted
GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 0, Months
CalendarMonths:
	--SELECT	Number = 0, MonthName = ''
	--UNION
	SELECT	Number, DATENAME(MONTH, '2012-' + CAST(Number as varchar(2)) + '-1') MonthName
	FROM	master..spt_values
	WHERE	Type = 'P' and Number between 1 and 12
	ORDER BY Number

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 01, AM/PM
TimeAMPM:
	--SELECT	AmPm = ''
	--UNION
	SELECT	AmPm = 'AM'
	UNION
	SELECT	AmPm = 'PM'

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 02, Site Type
SiteType:
	--SELECT	SiteTypeCode = '',  SiteType = ''
	--UNION
	SELECT	SiteTypeCode = 'H', SiteType = 'Heating Oil Tank'
	UNION
	SELECT	SiteTypeCode = 'R', SiteType = 'Regulated UST'
	UNION
	SELECT	SiteTypeCode = 'U', SiteType = 'Unregulated UST'

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 03, Counties
Counties:
	--SELECT	CountyCode = 0, CountyName = ''
	--UNION
	SELECT DISTINCT
			CountyCode = CAST(COUNTY_CODE AS INTEGER), CountyName = COUNTY_NAME, SortBy = 1
	FROM	AGENCY.dbo.COUNTIES  WITH (NOLOCK)
	WHERE	COUNTY_NAME IN ('Washington','Marion','Clackamas','Multnomah')                                                 
	UNION
	SELECT DISTINCT
			CountyCode = 999, CountyName = '--------------------', SortBy = 2
	UNION
	SELECT DISTINCT
			CountyCode = CAST(COUNTY_CODE AS INTEGER), CountyName = COUNTY_NAME, SortBy = 3
	FROM	AGENCY.dbo.COUNTIES  WITH (NOLOCK)
	WHERE	COUNTY_CODE NOT IN (0,37,38,39)                                                 
	AND		COUNTY_NAME NOT IN ('Washington','Marion','Clackamas','Multnomah')                                                 
	ORDER BY SortBy, CountyName  

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 04, Quadrant
Quadrant:
	--SELECT	Quadrant = '',   SortBy = 0
	--UNION
	SELECT	Quadrant = 'N',  SortBy = 1
	UNION
	SELECT	Quadrant = 'S',  SortBy = 2
	UNION
	SELECT	Quadrant = 'E',  SortBy = 3
	UNION
	SELECT	Quadrant = 'W',  SortBy = 4
	UNION
	SELECT	Quadrant = 'NE', SortBy = 5
	UNION
	SELECT	Quadrant = 'NW', SortBy = 6
	UNION
	SELECT	Quadrant = 'SE', SortBy = 7
	UNION
	SELECT	Quadrant = 'SW', SortBy = 8
	ORDER BY SortBy

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 05, Street Type
StreetType:
	--SELECT	StreetType = '',          SortBy =  0
	--UNION
	SELECT	StreetType = 'Street',    SortBy =  1
	UNION
	SELECT	StreetType = 'Avenue',    SortBy =  2
	UNION
	SELECT	StreetType = 'Road',      SortBy =  3
	UNION
	SELECT	StreetType = 'Boulevard', SortBy =  4
	UNION
	SELECT	StreetType = 'Lane',      SortBy =  5
	UNION
	SELECT	StreetType = 'Way',       SortBy =  6
	UNION
	SELECT	StreetType = 'Drive',     SortBy =  7
	UNION
	SELECT	StreetType = 'Highway',   SortBy =  8
	UNION
	SELECT	StreetType = 'Court',     SortBy =  9
	UNION
	SELECT	StreetType = 'Place',     SortBy = 10
	UNION
	SELECT	StreetType = 'Parkway',   SortBy = 11
	UNION
	SELECT	StreetType = 'Terrace',   SortBy = 12
	UNION
	SELECT	StreetType = 'Loop',      SortBy = 13
	UNION
	SELECT	StreetType = 'Circle',    SortBy = 14
	ORDER BY SortBy

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 06, Phone Type
PhoneType:
	--SELECT	PhoneType = '',      SortBy = 0
	--UNION
	SELECT	PhoneType = 'Home',  SortBy = 1
	UNION
	SELECT	PhoneType = 'Cell',  SortBy = 2
	UNION
	SELECT	PhoneType = 'Work',  SortBy = 3
	UNION
	SELECT	PhoneType = 'Fax',   SortBy = 4
	UNION
	SELECT	PhoneType = 'Other', SortBy = 5
	ORDER BY SortBy

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 07, Confirmation Type
ConfirmationType:
	--SELECT	ConfirmationCode = '', ConfirmationDescription = '', SortBy = 0
	--UNION
	SELECT	ConfirmationCode
	,		ConfirmationDescription = CASE ConfirmationDescription
										  WHEN 'CONTRACTOR RPT'        THEN 'Contractor'
										  WHEN 'RP REPORT'             THEN 'RP Report'
										  WHEN 'STAFF SITE INSPECTION' THEN 'Staff: DEQ'
										  WHEN 'LAB SAMPLE - DEQ'      THEN 'Lab: DEQ'
										  WHEN 'LAB SAMPLE - RP'       THEN 'Lab: RP'
										  WHEN 'LAB SAMPLE - OTHER'    THEN 'Lab: Other'
										  WHEN 'OTHER'                 THEN 'Other'
										  ELSE ConfirmationDescription
									  END
	,		SortBy                  = CASE ConfirmationDescription
										  WHEN 'CONTRACTOR RPT'        THEN 1
										  WHEN 'RP REPORT'             THEN 2
										  WHEN 'STAFF SITE INSPECTION' THEN 3
										  WHEN 'LAB SAMPLE - DEQ'      THEN 4
										  WHEN 'LAB SAMPLE - RP'       THEN 5
										  WHEN 'LAB SAMPLE - OTHER'    THEN 6
										  WHEN 'OTHER'                 THEN 7
										  ELSE ConfirmationId
									  END
	FROM	AssessmentConfirmationType
	ORDER BY SortBy

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 08, Discovery Type
DiscoveryType:
	--SELECT	DiscoveryCode = '', DiscoveryDescription = '', SortBy = 0
	--UNION
	SELECT	DiscoveryCode
	,		DiscoveryDescription = CASE DiscoveryDescription
									   WHEN 'Decommissioning'    THEN 'Decommissioning'
									   WHEN 'Routine monitoring' THEN 'Routine Monitoring'
									   WHEN 'Complaint'          THEN 'Complaint'
									   WHEN 'Leak detection'     THEN 'Leak Detection'
									   WHEN 'Site assessment'    THEN 'Site Assessment'
									   WHEN 'Tightness test'     THEN 'Tightness Test'
									   WHEN 'Other'              THEN 'Other'
									   ELSE DiscoveryDescription
								   END
	,		SortBy               = CASE DiscoveryDescription
									   WHEN 'Decommissioning'    THEN 1
									   WHEN 'Routine monitoring' THEN 2
									   WHEN 'Complaint'          THEN 3
									   WHEN 'Leak detection'     THEN 4
									   WHEN 'Site assessment'    THEN 5
									   WHEN 'Tightness test'     THEN 6
									   WHEN 'Other'              THEN 7
									   ELSE DiscoveryId
								   END
	FROM	dbo.AssessmentDiscoveryType
	ORDER BY SortBy

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 09, Release Cause Type
ReleaseCauseType:
	--SELECT	ReleaseCauseCode = '', ReleaseCauseDescription = '', SortBy = 0
	--UNION
	SELECT	ReleaseCauseCode
	,		ReleaseCauseDescription = CASE ReleaseCauseDescription
										  WHEN 'OVERFILL'             THEN 'Overfill'
										  WHEN 'SPILL'                THEN 'Spill'
										  WHEN 'CORROSION'            THEN 'Corrosion'
										  WHEN 'INSTALLATION PROBLEM' THEN 'Install Problem'
										  WHEN 'PHYSICAL/MECH DAMAGE' THEN 'Physical/Mechanicl Damage'
										  WHEN 'OTHER'                THEN 'Other'
										  WHEN 'UNKNOWN'              THEN 'Unknown'
										  ELSE ReleaseCauseDescription
									  END
	,		SortBy                  = CASE ReleaseCauseDescription
										  WHEN 'OVERFILL'             THEN 1
										  WHEN 'SPILL'                THEN 2
										  WHEN 'CORROSION'            THEN 3
										  WHEN 'INSTALLATION PROBLEM' THEN 4
										  WHEN 'PHYSICAL/MECH DAMAGE' THEN 5
										  WHEN 'OTHER'                THEN 6
										  WHEN 'UNKNOWN'              THEN 7
										  ELSE ReleaseCauseId
									  END
	FROM	dbo.AssessmentReleaseType
	WHERE	ReleaseCauseCode NOT IN ('NR')
	ORDER BY SortBy

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 10, Source Type
SourceType:
	--SELECT	ReleaseSourceId = 0, ReleaseSourceDescription = ''
	--UNION
	SELECT	ReleaseSourceId, ReleaseSourceDescription
	FROM	dbo.AssessmentSourceType
	WHERE	ReleaseSourceDescription NOT IN ('Not Reported')
	ORDER BY ReleaseSourceId

	GOTO EndRoutine

------------------------------------------------------------------------------------------------------------------------
-- 11, States
States:
	SELECT	STATE_CODE, STATE_NAME, SortBy = 1
	FROM	AGENCY.dbo.STATES
	WHERE	STATE_CODE = 'OR'
	UNION
	SELECT	STATE_CODE, STATE_NAME, SortBy = 2
	FROM	AGENCY.dbo.STATES
	WHERE	STATE_CODE IN ('WA')
	UNION
	SELECT	STATE_CODE, STATE_NAME, SortBy = 3
	FROM	AGENCY.dbo.STATES
	WHERE	STATE_CODE IN ('CA')
	UNION
	SELECT	STATE_CODE, STATE_NAME, SortBy = 4
	FROM	AGENCY.dbo.STATES
	WHERE	STATE_CODE IN ('ID')
	UNION
	SELECT	STATE_CODE = 'ZZ', STATE_NAME = '--------------------', SortBy = 5
	UNION
	SELECT	STATE_CODE, STATE_NAME, SortBy = 6
	FROM	AGENCY.dbo.STATES
	WHERE	STATE_CODE NOT IN ('OR', 'WA', 'CA', 'ID', 'AB', 'AS', 'BC', 'CM', 'CZ', 'GU', 'LB', 'MB', 'NF', 'NS', 'NT', 'ON', 'PE', 'PQ', 'PR', 'SK', 'TT', 'VI', 'YT')
	UNION
	SELECT	STATE_CODE = 'ZZ', STATE_NAME = '--------------------', SortBy = 7
	UNION
	SELECT	STATE_CODE, STATE_NAME, SortBy = 8
	FROM	AGENCY.dbo.STATES
	WHERE	STATE_CODE IN ('AB', 'BC', 'CZ', 'GU', 'LB', 'MB', 'NF', 'NS', 'NT', 'ON', 'PE', 'PQ', 'PR', 'SK', 'VI', 'YT')
	ORDER BY SortBy, STATE_NAME

	GOTO EndRoutine

-- 12, DEQ Office locations
DEQOffice:
	SELECT DeqOffice = 'NWR', SortBy = 1
	UNION ALL
	SELECT DeqOffice = 'DAL', SortBy = 2
	UNION ALL
	SELECT DeqOffice = 'SLM', SortBy = 3
	UNION ALL
	SELECT DeqOffice = 'EUG', SortBy = 4
	UNION ALL 
	SELECT Deqoffice = 'MDF', SortBy = 5

	GOTO EndRoutine


-- 13, Incident statuses
IncidentStatus:
	
	SELECT IncidentStatus = 'NEW', SortBy = 1
	UNION ALL
	SELECT IncidentStatus = 'HOLD', SortBy = 2
	UNION ALL
	SELECT IncidentStatus = 'ACCEPT', SortBy = 3
	UNION ALL
	SELECT IncidentStatus ='DECLINE', SortBy = 4

	GOTO EndRoutine

-- 14, Tank Status 
TankStatus:
	SELECT TankStatusDescription = 'ACTIVE', TankStatusId = 1  
	UNION ALL
	SELECT TankStatusDescription = 'CLOSED', TankStatusId = 2

	GOTO EndRoutine

-- 15, Region
Region:

	SELECT 
		'0' AS RegionCode, 
		'' AS RegionDescription
	UNION
	SELECT DeqRegionAbbr AS RegionCode,
		   CASE DeqRegionAbbr
		   WHEN 'ER' THEN 'Eastern'
		   WHEN 'NWR' THEN 'Northwestern'
		   WHEN 'WR'  THEN 'Western'
		   END as  RegionDescription
	FROM   AGENCY.dbo.DEQRegions WITH (NOLOCK)
	WHERE  DeqRegionAbbr <> 'HQ'
	ORDER BY RegionDescription	

	GOTO EndRoutine

-- 16, City
City:

	SELECT 
		'0' AS PlaceName, 
		'' AS PlaceName2
	UNION


	SELECT DISTINCT
		   RTRIM(LTRIM(PlaceName)) AS PlaceName ,
		   RTRIM(LTRIM(PlaceName)) AS PlaceName2
	FROM   AGENCY.DBO.PLACES WITH (NOLOCK)                                        
	ORDER BY PlaceName                                               

	GOTO EndRoutine

-- 17, File Status
FileStatus:
	SELECT '' AS FileStatusTypeDescription,
	'0' AS FileStatusTypeID

	UNION ALL

	SELECT FileStatusTypeDescription, FileStatusTypeID
	FROM LUST.dbo.FileStatusType

	GOTO EndRoutine


-- 18, Date Comparision Literal Text
DateCompare:
	SELECT DateComparision = '', 0 AS ID
	UNION 
	SELECT DateComparision = 'Receive Date', 1 AS ID
	UNION
	SELECT DateComparision = 'Cleanup Start Date', 2 AS ID
	UNION
	SELECT DateComparision = 'Release Stop Date', 3 AS ID
	UNION
	SELECT DateComparision = 'Final Invoice Req Date', 4 AS ID
	UNION
	SELECT DateComparision = 'Closed Date', 5 AS ID
	UNION
	SELECT DateComparision = 'Letter Of Agreement Date', 6 AS ID
	ORDER BY ID

	GOTO EndRoutine

-- 19, Zip Code
ZipCode:
	SELECT 
		'0' AS ZipCode1, 
		'' AS ZipCode2
	UNION
	SELECT distinct
		   ZipCode as ZipCode1,
		   ZipCode AS ZipCode2
	FROM   AGENCY.DBO.PLACES  WITH (NOLOCK)                                       
	ORDER BY ZipCode1              

	GOTO EndRoutine

-- 20, Cleanup Site Type
CleanupSiteType:

	SELECT '' AS CleanupSiteTypeDescription, 0 AS CleanupSiteTypeId
	UNION ALL
	SELECT SiteTypeDescription AS CleanupSiteTypeDescription, SiteTypeId AS CleanupSiteTypeId
	FROM [LUST].[dbo].[SiteType]

	GOTO EndRoutine

-- 21, Project Manager 
ProjectManager:
	SELECT 
		'0' AS ProjectManagerCode, 
		'' AS ProjectManagerDescription
	UNION
	SELECT 
		'1' AS ProjectManagerCode, 
		'- NO PM ASSIGNED -' AS ProjectManagerDescription
	UNION
	select distinct 
		   a.PmLogin AS ProjectManagerCode,
		   ISNULL(b.lf_nm,a.PmLogin) as ProjectManagerDescription
	from   LUST.dbo.ProjectManagerHistory a WITH (NOLOCK)
	left join   hris.dbo.EmpHisInitVw b WITH (NOLOCK)
		   on a.PmLogin = b.Nt_Login
	where  a.EndDate is null
	AND    a.PmLogin <> 'CONV'
	order  by ProjectManagerDescription

	GOTO EndRoutine

-- 22, CountiesUnsorted
CountiesUnsorted:
	
	SELECT DISTINCT
			CountyCode = CAST(COUNTY_CODE AS INTEGER), CountyName = COUNTY_NAME, SortBy = 3
	FROM	AGENCY.dbo.COUNTIES  WITH (NOLOCK)
	WHERE	COUNTY_CODE NOT IN (0,37,38,39)                                                 
	ORDER BY SortBy, CountyName  

	GOTO EndRoutine


EndRoutine:



GO
GRANT EXECUTE ON [dbo].[apGetOLPRRLookupTables] TO [LUSTUser] AS [dbo]
GO
GRANT EXECUTE ON  [dbo].[apGetOLPRRLookupTables] TO [OLPRRENTRY]
GO
GRANT EXECUTE ON  [dbo].[apGetOLPRRLookupTables] TO [ZSQL Developers]
GO
/****** Object:  StoredProcedure [dbo].[apGetPartyByFirstLastOrgNameData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[apGetPartyByFirstLastOrgNameData](

        @FirstName      VARCHAR(40) = '',
        @LastName       VARCHAR(40) = '',
		@PartyOrg	    VARCHAR(40) = '',
		@SortColumn		INT         = NULL,
        @SortOrder		INT			= NULL,
        @PageNumber		INT			= NULL,
        @RowsPerPage	INT			= NULL,
        @TotalRows		INT	OUTPUT,
        @TotalPages		INT OUTPUT 
)
AS 
/*******************************************************************************
***	Name:    apGetPartyByFirstLastOrgNameData
***	Author:  Alex Guedea	Date: 08/16/2018        	   
******************************* DESCRIPTION ************************************
***                                        		    
***	Input:	PartyName
***		PartyOrg, FirstName, LastName, SortColumn, SortOrder, PageNumber, RowsPerPage
		PartyOrg = Name of Organization
		FirstName = First Name of Party
		LastName = Last Name of Party
		SortColumn = Indicate the Sort order (1 or 2, Organization or LastName + FirstName respectfully)
		SortOrder = Indicate Ascending or Descending (1 or -1)
		PageNumber = Indicate the page you wish to see (1-x)
		RowsPerPage = Indicate how many rows per page 


***
***	Output from Query:	PartyID                    		  
***		Organization
***		FirstName
***		LastName
***		PersonName (i.e. FirstName + LastName)
***		Phone
***		Street    
***		City 
***		State
***		ZIP
***		Address (i.e. Street + City + State + Zip)
***		Country
***					 
	Output From Stored Procedure 
		TotalRows = Number of all rows returned given the criteria entered
		TotalPages = Number of pages returned TotalRows / RowsPerPage
		   
***	Modification:
***	Date	   Initials	Details
***	--------   --------	-------------------------------------------------
***
***
***
********************************************************************************/

/*

TEST

declare @PartyOrg Varchar(32), @LastName Varchar(32), @FirstName Varchar(32), @SortColumn INT, @SortOrder Int, @PageNumber INT, @RowsPerPage INT, @TotalRows INT, @TotalPages INT, @Totals int
SET @PartyOrg = 'AS'
SET @FirstName = ''
SET @LastName = ''

SET @SortColumn = 2
SET @SortOrder = 1
SET @PageNumber = 12
SET @RowsPerPage = 15

EXEC apGetPartyByFirstLastOrgNameData
@FirstName, 
@LastName,  
@PartyOrg,
@SortColumn,
@SortOrder,
@PageNumber,	
@RowsPerPage, 
@TotalRows	OUTPUT,
@TotalPages	OUTPUT 

Select  @TotalRows, @TotalPages


*/


BEGIN
	SET NOCOUNT ON

DECLARE 
	@ErrNum INTEGER, @SQLQuery VARCHAR(8000), @SQLColumns VARCHAR(1024), @WHERE varchar(4096), @OrderBy VARCHAR(1024), @Pagination VARCHAR(128), @RowsCalc DECIMAL 

PRINT 'First Name = ' + ISNULL(@Firstname, '')
PRINT 'Last Name = ' + ISNULL(@LastName, '')
PRINT 'Party Org = ' + ISNULL(@PartyOrg, '')

IF @FirstName IS NULL
	SET @FirstName = ''
IF @LastName IS NULL
	SET @LastName = ''
IF @PartyOrg IS NULL
	SET @PartyOrg = ''

SET @ErrNum = 0
SET @TotalRows = 0
SET @TotalPages = 0
SET @SQLColumns = ''
SET @OrderBy = '
ORDER BY '
SET @Pagination = '
'
SET @SQLQuery = '
'
SET @WHERE = '
WHERE '



IF ISNULL(@PageNumber, 0) = 0
       SET @PageNumber = 1

IF ISNULL(@RowsPerPage, 0) = 0
       SET @RowsPerPage = 10

IF ISNULL(@SortColumn, 0) = 0
       BEGIN
              SET @SortColumn = 1
       END 


IF ISNULL(@SortOrder, 0) = 0
       SET @SortOrder = 1

	

SET @SqlColumns = ' 
SELECT
PartyId			= PartyID,
Organization	= Organization,
FirstName		= FirstName,
LastName		= LastName,
PersonName		= LTRIM(FirstName + '' '' + LastName), 
Phone			= Phone,
Street			= Street,
City			= City,
State			= State,
ZIP				= ZIP,
Address			= CASE 
			WHEN vAffilParty.Street = '''' THEN ''''
			ELSE vAffilParty.Street + '', ''
				+ vAffilParty.City + '', ''
				+ vAffilParty.State + '' ''
				+ vAffilParty.ZIP
			END,
Country			= vAffilParty.Country,
Email			= vAffilParty.email,
SubOrganization = vAffilparty.SubOrganization '

SET @SQLQuery = '
FROM ADDR.dbo.vAffilParty JOIN agency.dbo.cities cities ON vAffilParty.City = cities.City_Name'


SET @WHERE = '
WHERE 1 = 1
AND (''' +  @PartyOrg + ''' IS NULL OR (''' + @PartyOrg + ''' iS NOT NULL AND Organization LIKE ''' + @PartyOrg + '%''))
AND ((''' + @LastName + ''' IS NOT NULL AND LastName LIKE ''' + @LastName + '%''
	AND  (''' + @FirstName + ''' IS NOT NULL AND FirstName LIKE ''' + @FirstName + '%'')))'



IF @SortOrder = 1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy  = @OrderBy  + ' Organization ASC, LastName ASC, FirstName ASC'
              ELSE IF @SortColumn = 2 
                     SET @OrderBy = @OrderBy + 'LastName + '' '' + Firstname ASC, Organization ASC'
       END
ELSE IF @SortOrder = -1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy = @OrderBy + ' Organization DESC, LastName DESC, FirstName DESC'
              ELSE IF @SortColumn = 2
                     SET @OrderBy = @OrderBy + 'LastName + '' '' + Firstname DESC, Organization DESC'
       END
              

SET @Pagination  = @Pagination + ' 
       OFFSET ((' + CONVERT(VARCHAR, @PageNumber) + ' -1 ) * ' + CONVERT(VARCHAR, @RowsPerPage) + ') ROWS'
SET @Pagination = @Pagination + ' 
       FETCH NEXT ' + CONVERT(VARCHAR, @RowsPerPage) + ' ROWS ONLY;'


--------------------------------------------------------------
--     Counts Query
--------------------------------------------------------------


DECLARE @SQLCounts AS NVARCHAR(MAX) = 'SELECT @totals = COUNT (*)
       FROM ADDR.dbo.vAffilParty'

SET @SQLCounts = @SQLCounts  + @WHERE 


EXEC sp_executesql @SQLCounts, N'@totals INT OUTPUT', @TotalRows OUTPUT

--------------------------------------------------------------------------------------


SET @TotalPages = @TotalRows / @RowsPerPage

-- This condition indicates the query returned data but did not fill a page so return 1
IF (@TotalPages = 0 AND @TotalRows <> 0)
       BEGIN
              --PRINT '@totalpages = 0 and @totalrows <> 0   ' + Convert(varchar, @totalPages) + ' ' + Convert(varchar, @totalRows)
              -- return 1 
              SET @TotalPages = @TotalPages + 1
       END
ELSE
       BEGIN
              -- this indicates the query did fill at least 1 page and now we need to see if there is a MOD Rows per Page value
              -- if so, increment the pages + 1
              SET @RowsCalc = @TotalRows % @RowsPerPage
              IF @RowsCalc > 0.0
                     SET @Totalpages = @TotalPages + 1
       END


--------------------------------------------------------------
--     MAIN QUERY
--------------------------------------------------------------
SET @SQLQuery = @SQLColumns + @SQLQuery + @Where + @OrderBy + @Pagination

--print @SqlQuery


EXEC(@SQLQuery)


SET @ErrNum = @@ERROR

ExitRtn:
	RETURN (@ErrNum)
END







GO
GRANT EXECUTE ON [dbo].[apGetPartyByFirstLastOrgNameData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPartyGridByLustIdData]    Script Date: 5/13/2019 4:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
apGetPartyGridByLustId

  B.Dyer
  OCT 2006

-- This stored procedure returns LUST Contacts, 
-- and any associated Contact data fron the CRIS System.

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 exec [dbo].[apGetPartyGridByLustIdData] 28382
  exec [dbo].[apGetPartyGridByLustIdData] 2395

 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetPartyGridByLustIdData]
	@LustId  int 
AS

SELECT AffilId
	  ,isnull(AffilTypeCd,' ') AffilTypeCd
      ,isnull(AffilTypeDesc,' ') AffilTypeDesc
      ,StartDt 
      ,EndDt
	  ,PartyID AS PartyId
      ,ISNULL(Organization, ' ') AS Organization
	  ,ISNULL(SubOrganization, ' ') AS SubOrganization
	  ,ISNULL(JobTitle, ' ') AS JobTitle
	  ,ISNULL(FirstName,' ') AS FirstName
      ,ISNULL(LastName,' ') AS LastName
      ,ISNULL(Phone,' ') AS Phone
      ,ISNULL(Email,' ') AS Email       
      ,ISNULL(Street,' ') AS Street                 
      ,ISNULL(City,' ') AS City
      ,ISNULL(State,' ') AS State   
      ,ISNULL(ZIP,' ') AS Zip
      ,ISNULL(Country,' ') AS Country
      ,ISNULL(CONVERT(VARCHAR(2000), AffilComments),' ') AS AffilComments
      ,ISNULL(LastUpdBy,' ') AS LastUpdBy
      ,LastUpdDttm 
      ,CONVERT(INT, ZP4Checked) AS ZP4Checked
	  ,ISNULL(incident.LustId, @LustId) AS LustId
	  ,0 AS CRISCheck
	  ,incident.LogNumber
	  	  ,CASE ISNULL(incident.RegulatedTankInd, 0) WHEN 1 THEN 'R'
			ELSE CASE ISNULL(incident.HotInd, 0) WHEN 1 THEN 'H'
				ELSE CASE ISNULL(incident.NonRegTankInd, 0) WHEN 1 THEN 'U'
				END
			END
		END AS ReleaseType
from  dbo.vwLUSTParty  WITH (NOLOCK) LEFT OUTER JOIN Incident ON vwLustParty.LustId = incident.LustId
where  vwLUStParty.LustId = @LustId

UNION

SELECT vwCRISParty.AffilID
	  ,' ' AS AffilTypeCd
      ,'CRIS Invoice Contact' AS AffilTypeDesc
      ,AffilStartDate AS StartDt
      ,AffilEndDate AS EndDt
	  ,vwCRISParty.PartyId AS PartyId
	  ,ISNULL(vwCRISParty.Organization, ' ') AS Organization
	  ,ISNULL(SubOrg, ' ') AS SubOrganization
	  ,' ' AS Jobtitle
      ,ISNULL(vwCRISParty.FirstName, ' ') AS FirstName 
	  ,ISNULL(vwCRISParty.LastName, ' ') AS LastName
	  ,ISNULL(vwCRISParty.Phone, ' ') AS Phone
	  ,ISNULL(vwCRISParty.Email, ' ') AS Email
	  ,ISNULL(vwCRISParty.Street, ' ') AS Street
	  ,ISNULL(vwCRISParty.City,' ') AS City
      ,ISNULL(vwCRISParty.State,' ') AS State   
      ,ISNULL(vwCRISParty.ZIP,' ') AS Zip
      ,ISNULL(vwCRISParty.Country,' ') AS Country
	  ,ISNULL(CONVERT(VARCHAR(2000),  vwCRISParty.AffilComments), ' ') AS AffilComments
	  ,ISNULL(ResponsibleParty.LastUpdateBy, ' ') AS LastUpdBy
	  ,ResponsibleParty.LastUpdateDate AS LastUpdDttm
	  ,0 AS ZP4Checked
	  ,ISNULL(incident.LustId, @LustId) AS LustId
	  ,cp.LustId AS CRISCheck
	  ,incident.LogNumber
	  	  ,CASE ISNULL(incident.RegulatedTankInd, 0) WHEN 1 THEN 'R'
			ELSE CASE ISNULL(incident.HotInd, 0) WHEN 1 THEN 'H'
				ELSE CASE ISNULL(incident.NonRegTankInd, 0) WHEN 1 THEN 'U'
				END
			END
		END AS ReleaseType
		
from   CRIS.dbo.vwCRISParty  WITH (NOLOCK) LEFT OUTER JOIN CRIS.dbo.ResponsibleParty ON vwCRISParty.AffilID = ResponsibleParty.fkAffilID
	   LEFT OUTER JOIN vwLUSTParty ON vwCRISParty.partyId = vwLUStParty.partyId
	   LEFT OUTER JOIN incident ON incident.LustId = vwLUSTParty.LustId
	   INNER JOIN CRIS.dbo.Project cp WITH (NOLOCK) ON vwCRISParty.ProjectID = cp.ProjectID
       WHERE AffilType = 'INV'
	   AND cp.LustId = @LustId
GO


GRANT EXECUTE ON [dbo].[apGetPartyGridByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSByLustIdData]    Script Date: 7/16/2019 2:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
 apGetPCSByLustId

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
  7/17/2019		aguedea			Added PcsSwPermit.SwlaPermitNbr 
 -----------------------------------------------------------------------------------------------------------
 EXEC apGetPCSByLustIdData 8263


 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apGetPCSByLustIdData] 
  @LustId INT
AS
select
	pcs.PcsId
	,pcs.DispLandfillFacId 
	,pcs.DispThrmFacId 
	,pcs.OnSiteDisposalInd
	,pcs.OffSiteDispAddr
	,pcs.SoilStatusId
	,pcs.SoilStatusCode
	,pcs.LandfillAmtYrds3
	,pcs.ThermalAmtYrds3 
	,pcs.OnSiteAmtYrds3
	,pcs.OffSiteAmtYrds3
	,pcs.DisposalDate
	,pcs.PCSComment
	,pcs.LastChangeBy
	,pcs.LastChangeDate
	,incident.LustId
	,incident.LogNumber
	,p.SwlaPermitNbr
		FROM
	   			incident inner JOIN [dbo].[PetroContamSoil] pcs WITH (NOLOCK) ON incident.LustId = pcs.LustId
				Left join	dbo.PcsSwPermit p WITH (NOLOCK) on pcs.pcsId = p.PcsId
		WHERE 	incident.LustId = @LustId

GO
GRANT EXECUTE ON [dbo].[apGetPCSByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSByPCSIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetPCSByPCSID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetPCSByPCSIDData] 
       	 @PCSID 			    INT
AS

SELECT 	
	pcs.PcsId
	,pcs.DispLandfillFacId 
	,pcs.DispThrmFacId 
	,pcs.OnSiteDisposalInd
	,pcs.OffSiteDispAddr
	,pcs.SoilStatusId
	,pcs.SoilStatusCode
	,pcs.LandfillAmtYrds3
	,pcs.ThermalAmtYrds3 
	,pcs.OnSiteAmtYrds3
	,pcs.OffSiteAmtYrds3
	,pcs.DisposalDate
	,pcs.PCSComment
	,pcs.LastChangeBy
	,pcs.LastChangeDate
	,incident.LustId
	,incident.LogNumber
FROM
	   	[dbo].[PetroContamSoil] pcs WITH (NOLOCK)
		INNER JOIN incident ON pcs.LustId = incident.LustId
WHERE 	PCSID = @PCSID








GO
GRANT EXECUTE ON [dbo].[apGetPCSByPCSIDData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSByPCSIDDataCombined]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetPCSByPCSID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

Create PROCEDURE [dbo].[apGetPCSByPCSIDDataCombined] 
       	 @PCSID 			    INT
AS

SELECT 	
	pcs.PcsId
	,pcs.DispLandfillFacId 
	,pcs.DispThrmFacId 
	,pcs.OnSiteDisposalInd
	,pcs.OffSiteDispAddr
	,pcs.SoilStatusId
	,pcs.SoilStatusCode
	,pcs.LandfillAmtYrds3
	,pcs.ThermalAmtYrds3 
	,pcs.OnSiteAmtYrds3
	,pcs.OffSiteAmtYrds3
	,pcs.DisposalDate
	,pcs.PCSComment
	,pcs.LastChangeBy
	,pcs.LastChangeDate
	,incident.LustId
	,incident.LogNumber
FROM
	   	[dbo].[PetroContamSoil] pcs WITH (NOLOCK)
		INNER JOIN incident ON pcs.LustId = incident.LustId
WHERE 	PCSID = @PCSID








GO
GRANT EXECUTE ON [dbo].[apGetPCSByPCSIDDataCombined] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPcsPcsPermitByPcsIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetPCSByPCSID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetPcsPcsPermitByPcsIdData] 
       	 @PCSID 			    INT
AS

SELECT 	
	pcs.PcsId
	,pcs.DispLandfillFacId 
	,pcs.DispThrmFacId 
	,pcs.OnSiteDisposalInd
	,pcs.OffSiteDispAddr
	,pcs.SoilStatusId
	,pcs.SoilStatusCode
	,pcs.LandfillAmtYrds3
	,pcs.ThermalAmtYrds3 
	,pcs.OnSiteAmtYrds3
	,pcs.OffSiteAmtYrds3
	,pcs.DisposalDate
	,pcs.PCSComment
	,pcs.LastChangeBy
	,pcs.LastChangeDate
	,incident.LustId
	,incident.LogNumber
	,p.PcsSwPermitId
	,p.SwlaPermitNbr
	,p.ApplReceivedDate
	,p.IssueDate
	,p.ExpirationDate
	,p.PermitExtensionDate
	,p.SwFeeInd
	,p.LandUseApproveInd
	,p.TreatmentDescription
	,p.LastChangeDate as pcsPermitLastChangeDate
	,p.LastChangeBy as  pcsPermitLastChangeBy
	
FROM
	   	[dbo].[PetroContamSoil] pcs WITH (NOLOCK)
		INNER JOIN incident ON pcs.LustId = incident.LustId
		Left join	dbo.PcsSwPermit p WITH (NOLOCK) on pcs.pcsId = p.PcsId
WHERE 	pcs.PCSID = @PCSID








GO
GRANT EXECUTE ON [dbo].[apGetPcsPcsPermitByPcsIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPCSPermitByPCSIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetPCSPermitByPCSID

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

Create PROCEDURE [dbo].[apGetPCSPermitByPCSIDData] 
       	 @PCSID 			INT
AS
SELECT 	
  p.PcsSwPermitId
  ,p.SwlaPermitNbr
  ,p.ApplReceivedDate
  ,p.IssueDate
  ,p.ExpirationDate
  ,p.PermitExtensionDate
  ,p.SwFeeInd
  ,p.LandUseApproveInd
  ,p.TreatmentDescription
  ,p.LastChangeBy
  ,p.LastChangeDate
FROM
	   	dbo.PcsSwPermit p WITH (NOLOCK)
WHERE 	PCSID = @PCSID

GO
GRANT EXECUTE ON [dbo].[apGetPCSPermitByPCSIDData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetProjMgrHistoryByLustIdData]    Script Date: 7/22/2019 8:52:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
apGetProjMgrHistoryByLustId

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
  7/22/2019		aguedea			Added filter for projectmanagerhistory.EndDate IS NULL
 -----------------------------------------------------------------------------------------------------------

 exec apGetProjMgrHistoryByLustIdData 103
 exec apGetProjMgrHistoryByLustIdData 9133

 select * FROM [ProjectManagerHistory]
 where lustid = 103




 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetProjMgrHistoryByLustIdData] 
   	@LustId int
AS

	BEGIN
		SELECT 	
      		pMgr.ProjMgrHistID,
	   		CASE IsNull(dbo.fnGetUserNameByNtLogin(PmLogin),'')
	   		WHEN '' THEN PmLogin
	   		ELSE dbo.fnGetUserNameByNtLogin(PmLogin)
	   		END AS UserName, 
	   		pMgr.AssignedDate,
	   		pMgr.EndDate,
      		pMgr.LastChangeBy,
       		pMgr.LastChangeDate,
			pMgr.LustId,
			Incident.LogNumber
		FROM
				[dbo].[Incident] Inner JOIN [dbo].[ProjectManagerHistory] pMgr WITH (NOLOCK) ON pMgr.LustId = Incident.LustId
		WHERE      	Incident.LustId = @LustId
		AND pMgr.EndDate IS NULL
		ORDER BY   	UserName
	END

GO
GRANT EXECUTE ON [dbo].[apGetProjMgrHistoryByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetProjMgrHistoryByPMHIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
apGetProjMgrHistoryByLustId

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 exec apGetProjMgrHistoryByLustIdData 103, null
 exec apGetProjMgrHistoryByLustIdData 9133, 5673

 select * FROM [ProjectManagerHistory]
 where lustid = 103




 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetProjMgrHistoryByPMHIDData] 
	@ProjMgrHistId INT NULL
AS


	BEGIN
		SELECT 	
      			pMgr.ProjMgrHistID,
	   			CASE IsNull(dbo.fnGetUserNameByNtLogin(PmLogin),'')
	   			WHEN '' THEN PmLogin
	   			ELSE dbo.fnGetUserNameByNtLogin(PmLogin)
	   			END AS UserName, 
	   			pMgr.AssignedDate,
	   			pMgr.EndDate,
      			pMgr.LastChangeBy,
       			pMgr.LastChangeDate,
				pMgr.LustId,
				Incident.LogNumber
		FROM
	   			[dbo].[ProjectManagerHistory] pMgr WITH (NOLOCK) 
				JOIN [dbo].[incident] ON pMgr.LustId = Incident.LustId
		WHERE      	ProjMgrHistId = @ProjMgrHistId 
		ORDER BY   	UserName
	END

GO
GRANT EXECUTE ON [dbo].[apGetProjMgrHistoryByPMHIDData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPublicNoticeByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
apGetPublicNoticeByLustId
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
 exec [apGetPublicNoticeByLustIdData] 10229 , null
 exec [apGetPublicNoticeByLustIdData] 10229 , 75


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetPublicNoticeByLustIdData] 
      @LustId INT
AS

		SELECT 	
			 [PublicNoticeId]
			,[dbo].[PublicNotice].PublicNoticeTypeID
			,[Description]
 			,[PublicNoticeDate]
			,[MeetingDate]
			,[Comment]
			,[MeetingRqstInd]
			,[dbo].[PublicNotice].[LastChangeBy]
			,[dbo].[PublicNotice].[LastChangeDate]
			,incident.LustId
			,incident.LogNumber
		FROM [dbo].[incident] LEFT JOIN [dbo].[PublicNotice] WITH (NOLOCK) ON incident.LustId = PublicNotice.LustId
		INNER JOIN [dbo].[PublicNoticeType] WITH (NOLOCK)
		ON  [dbo].[PublicNotice].[PublicNoticeTypeID] = [dbo].[PublicNoticeType].[PublicNoticeTypeID]
		WHERE incident.LustId = @LustId;
GO
GRANT EXECUTE ON [dbo].[apGetPublicNoticeByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetPublicNoticeByPNIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
apGetPublicNoticeByLustId
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
 exec [apGetPublicNoticeByLustIdData] 10229 , null
 exec [apGetPublicNoticeByLustIdData] 10229 , 75


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetPublicNoticeByPNIdData] 
	  @PublicNoticeId INT = NULL
AS

		SELECT 	
			 [PublicNoticeId]
			,[dbo].[PublicNotice].[PublicNoticeTypeId]
			,[Description]
 			,[PublicNoticeDate]
			,[MeetingDate]
			,[Comment]
			,[MeetingRqstInd]
			,[dbo].[PublicNotice].[LastChangeBy]
			,[dbo].[PublicNotice].[LastChangeDate]
			,incident.LustId
			,incident.LogNumber
		FROM
			 [dbo].[PublicNotice] WITH (NOLOCK)
		INNER JOIN [dbo].[PublicNoticeType] WITH (NOLOCK)
		ON  [dbo].[PublicNotice].[PublicNoticeTypeID] = [dbo].[PublicNoticeType].[PublicNoticeTypeID]
		LEFT JOIN [dbo].[incident] ON incident.LustId = PublicNotice.LustId
		WHERE PublicNotice.PublicNoticeId = @PublicNoticeId;
GO
GRANT EXECUTE ON [dbo].[apGetPublicNoticeByPNIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetScoringRangeData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* --------------------------------------------------------------------------
apGetScoringRange
  --------------------------------------------------------------------------      
21 Jan 2005
B.Dyer 


The purpose of this stored procedure as follows:

 
1. Pass the folowing values back to the Business Class
   a. Lowest current score --> @LowScore
   b. Highest current score --> @HighScore
   c. Average current score --> @AvgScore
   d. Count of all Scored Sites --> @ScoreCount

2. Establish a Scoring Range, and return it to the Business Class.
   --> @ScoreRange

   Scoring Ranges : "LOW"
                    "AVERAGE" 
                            Working variables: @_AvgLow = (@AvgScore - 50)
                                               @_AvgHigh = (@AvgScore + 50)
                    "HIGH20"
                    "HIGH40"
                    "HIGH60"
                    "HIGH80"
                    "HIGH100"

   The Scoring Range values will be used for color activation of a series of labels 
   in the U/I, the "Scoring Thermometer". Pretty corny, huh? It works, and displays a ranking 
   much better than the old Oracle Ranking application (LIPS) ever did!

   Scoring Ranges determined as follows:
   
   a. Determine the Average Score (@AvgScore) of all LUST Incidents.
      Average Score = (Sum( all scores) / ( count of all scores))

   b. "AVERAGE" will be assigned for all Scores plus or minus 50 from the determined @AvgScore,
      a range of 100.

   c. "LOW" will be assigned for all Scores below "AVERAGE" range. 

      IT'S IMPORTANT TO NOTE THAT THE VAST MAJORITY OF SCORES ARE PRETTY LOW 
     (MOST HEATING OIL TANK WILL BE VERY LOW), AND THE BEGINNING "LOW" AND "AVERAGE"
      SCORES ARE VERY ADEQUATE.

   d. The "HIGH20" thru "HIGH100" ranges:
      These ranges will be returned to denote that a particular Incident's Score is higher than normal.

      d1. working variable @_HighRangeValue =  (@HighScore - @AvgScore)

      d2. Divide @_HighRangeValue into 5 even ammounts.

      5 spread for the high values: using these, with "LOW" and "AVERAGE"s,
      use the Incident's CurrentSiteScore to compare against these 7 value ranges,
      assigning and returning the appropriate text value.
--------------------------------------------------------------------------

EXEC apGetScoringRangeData 2395

*/

CREATE PROCEDURE [dbo].[apGetScoringRangeData]

         @Lustid int
 AS

DECLARE  @_CurrentScore int
        ,@_TotalScoreSumm int
        ,@_AvgLow int
        ,@_AvgHigh int 
        ,@_FullHighRange int 
        ,@_HighRange20 int 
        ,@_HighRange40 int 
        ,@_HighRange60 int 
        ,@_HighRange80 int 
        ,@_HighRange100 int 
		,@LowScore int 
        ,@AvgScore int 
        ,@HighScore int 
        ,@ScoreCount int 
        ,@ScoreRange char(10) 

       -- Current Score
         SET @_CurrentScore =  (select CurrentSiteScore from Assessment where LustId = @Lustid)

       -- Lowest Score  -->OUTPUT #1
        SET @LowScore = (SELECT MIN(CurrentSiteScore) from Assessment)

       -- Highest Score  -->OUTPUT #3
         SET @HighScore = (SELECT MAX(CurrentSiteScore) from Assessment)

       -- Sum of all Scores
         SET @_TotalScoreSumm = (SELECT SUM(CurrentSiteScore) from Assessment)

       -- Count of all Incidents Scored   -->OUTPUT #4
         SET @ScoreCount = (SELECT COUNT(*) from Assessment)

       -- Average of all Scores  -->OUTPUT #2
         SET @AvgScore = (@_TotalScoreSumm / @ScoreCount)

       -- Establish AVERAGE high - low range - 100 point spread.    
         SET @_AvgLow = (@AvgScore - 50)

         SET @_AvgHigh = (@AvgScore + 50)

/*
establish the ranges
then compare current score - set text value accordingly
*/
        SET @_FullHighRange = (@HighScore - @_AvgHigh)

        SET @_HighRange20 = (@_AvgHigh + (@_FullHighRange * .2))

        SET @_HighRange40 = (@_AvgHigh + (@_FullHighRange * .4))

        SET @_HighRange60 = (@_AvgHigh + (@_FullHighRange * .6))

        SET @_HighRange80 = (@_AvgHigh + (@_FullHighRange * .8))

        SET @_HighRange100 = @_FullHighRange


IF @_CurrentScore < @_AvgLow
   SET @ScoreRange = 'LOW'

IF ((@_CurrentScore >= @_AvgLow) AND (@_CurrentScore <= @_AvgHigh))
   SET @ScoreRange = 'AVERAGE'

IF ((@_CurrentScore > @_AvgHigh) AND (@_CurrentScore <= @_HighRange20 ))
   SET @ScoreRange = 'HIGH20'

IF ((@_CurrentScore > @_HighRange20) AND (@_CurrentScore <= @_HighRange40 ))
   SET @ScoreRange = 'HIGH40'

IF ((@_CurrentScore > @_HighRange40) AND (@_CurrentScore <= @_HighRange60 ))
   SET @ScoreRange = 'HIGH60'

IF ((@_CurrentScore > @_HighRange60) AND (@_CurrentScore <= @_HighRange80 ))
   SET @ScoreRange = 'HIGH80'

IF (@_CurrentScore > @_HighRange80) 
   SET @ScoreRange = 'HIGH100'

SELECT @LowScore AS 'LowScore', @AvgScore AS 'AvgScore', @HighScore AS 'HighScore', @ScoreCount AS 'ScoreCount',@ScoreRange AS 'ScoreRange', @LustId AS 'LustId'

ErrorRtn:


ExitRtn:










GO
GRANT EXECUTE ON [dbo].[apGetScoringRangeData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetScoringValuesByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apGetScoringValuesByLustId

  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetScoringValuesByLustIdData] 
            @LustId int
AS
SELECT 	
            SiteScoreId
           ,DwReplMeasure
           ,DwImpMeasure
           ,DwImpLiklyMeasure
           ,VprLvlMeasure
           ,PopExposdMeasure
           ,EnvTypMeasure
           ,EnvImpLilelyMeasure
           ,NonDwSupTypMeasure
           ,UtImpMeasure
           ,RainfallAnnualMeasure
           ,SoilPermMeasure
           ,AqfrDepthMeasure
           ,SwDistMeasure
           ,LastChangeBy
           ,LastChangeDate
FROM
	[dbo].[SiteScoreValues] WITH (NOLOCK)
WHERE [LustId] = @LustId


GO
GRANT EXECUTE ON [dbo].[apGetScoringValuesByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteAliasByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  [apGetSiteAliasByLustIdData]
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


exec [apGetSiteAliasByLustIdData] 37544, NULL 
exec [apGetSiteAliasByLustIdData] 37544, 10804

 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apGetSiteAliasByLustIdData] 
            @LustId INT	
			,@SiteNameAliasId INT = NULL
           

AS

IF ISNULL(@SiteNameAliasId, 0) = 0
	BEGIN
		SELECT 	
		Incident.LustId,
		SiteNameAlias.SiteNameAliasId,	
        SiteNameAlias.SiteNameAlias
        ,SiteNameAlias.LastChangeBy
        ,SiteNameAlias.LastChangeDate
		,Incident.LogNumber

		FROM
		[dbo].[SiteNameAlias] JOIN [dbo].[Incident] WITH (NOLOCK) ON SiteNameAlias.LustId = Incident.LustId
		WHERE Incident.LustId = @LustId

	END
ELSE
	BEGIN
		SELECT 
		SiteNameAlias.SiteNameAlias
		,SiteNameAlias.LastChangeBy
        ,SiteNameAlias.LastChangeDate
		,Incident.LogNumber


		FROM
		[dbo].[SiteNameAlias] WITH (NOLOCK)
		JOIN [dbo].[Incident] ON SiteNameAlias.LustId = Incident.LustId
		WHERE [SiteNameAliasId] = @SiteNameAliasID
	END	


GO
GRANT EXECUTE ON [dbo].[apGetSiteAliasByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteAliasBySiteNameAliasIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apGetSiteAliasBySiteNameAliasId
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 exec [apGetSiteAliasBySiteNameAliasIdData] 10337

 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apGetSiteAliasBySiteNameAliasIdData] 
           	@SiteNameAliasId INT
AS           
SELECT 		
            SiteNameAlias.LustId
			,SiteNameAlias.SiteNameAliasId
           ,SiteNameAlias.SiteNameAlias
           ,SiteNameAlias.LastChangeBy
           ,SiteNameAlias.LastChangeDate
		   ,incident.LogNumber

FROM
	  [dbo].[SiteNameAlias] WITH (NOLOCK) JOIN [dbo].[incident] WITH (NOLOCK) ON SiteNameAlias.LustId = Incident.LustId
WHERE SiteNameAlias.SiteNameAliasId = @SiteNameAliasId
GO
GRANT EXECUTE ON [dbo].[apGetSiteAliasBySiteNameAliasIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteControlBySCIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* -------------------------------------------------------------
** ObjectName: apGETSiteControlBySCID
**
** Author: Nina Wooster
**
** Company Name: DEQ
**
** Description: The following procedure queries an 
** 
**
** Revision History:
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  Date        	Name        	Description
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  06/02/05	N.Wooster 	      Initial Creation
** 
**
**
**  -------------------------------------------------------------
exec apGetSiteControlBySCIDData  15

*/

CREATE PROCEDURE [dbo].[apGetSiteControlBySCIDData]

	 	 @SiteControlID	  int

AS


SELECT
       
		 dbo.SiteControl.SiteControlID, dbo.SiteControlDesc.ControlId, dbo.siteControlDesc.ControlDescription,
		 dbo.SiteControl.ControlBeginDate, dbo.SiteControl.ControlEndDate, dbo.SiteControl.FrequencyOfReview,
		 dbo.SiteControl.ControlComment, dbo.SiteControl.LastReviewBy, dbo.SiteControl.LastReviewDate, 
		 dbo.SiteControl.LastChangeBy, dbo.SiteControl.LastChangeDate, dbo.SiteControlType.TypeId, 
		 dbo.SiteControl.fkLustID, dbo.Incident.LogNumber


FROM  	dbo.SiteControlType WITH (NOLOCK) INNER JOIN dbo.SiteControlGroup WITH (NOLOCK) ON dbo.SiteControlType.TypeId = dbo.SiteControlGroup.fkTypeCodeId
		INNER JOIN dbo.SiteControlDesc WITH (NOLOCK) ON dbo.SiteControlGroup.GroupId = dbo.SiteControlDesc.fkGroupId
		INNER JOIN dbo.SiteControl WITH (NOLOCK) ON dbo.SiteControl.fkControlId = dbo.SiteControlDesc.ControlId 
		INNER JOIN dbo.incident ON dbo.SiteControl.fkLustId = dbo.Incident.LustId
WHERE   dbo.SiteControl.SiteControlId = @SiteControlId 

GO
GRANT EXECUTE ON [dbo].[apGetSiteControlBySCIDData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetSiteControlsByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[apGetSiteControlsByLustIdData]
/*
** ObjectName: dbo.apGetSiteControlsByLustID
**
** Author: Nina Wooster
**
** Company Name: DEQ
**
** Description: The following procedure queries an 
** 
**
** Revision History:
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  Date        	Name        	Description
** --------------------------------------------------------------------------------------------------------------------------------------------------------------
**  6/01/05		N.Wooster   	Initial Creation
** 
**
** 
**

EXEC [apGetSiteControlsByLustIdData] 13504


*/
	--Input/Output Values
    	@LustID		INT
	

AS 

----------------------------------------

	BEGIN
		SELECT  dbo.SiteControl.SiteControlID
			, dbo.SiteControlDesc.ControlId
			, dbo.sitecontroldesc.controldescription
			, dbo.Sitecontrol.ControlBeginDate
			, dbo.SiteControl.ControlEndDate
			, dbo.SiteControl.FrequencyOfReview
			, dbo.SiteControl.ControlComment, dbo.SiteControl.LastReviewBy
			, dbo.SiteControl.LastReviewDate, dbo.SiteControl.LastChangeBy, dbo.SiteControl.LastChangeDate
			, dbo.SitecontrolType.TypeId, dbo.SiteControl.fkLustId
			, dbo.incident.LogNumber  


		FROM incident JOIN dbo.SiteControl ON dbo.SiteControl.fkLustId = incident.LustId
		JOIN dbo.SiteControlDesc WITH (NOLOCK) ON dbo.SiteControlDesc.ControlID = dbo.SiteControl.fkControlID
		JOIN dbo.SiteControlGroup ON dbo.SiteControlGroup.GroupId = dbo.SiteControlDesc.fkGroupId
		JOIN dbo.SiteControlType WITH (NOLOCK) ON dbo.SiteControlType.TypeId = dbo.SiteControlGroup.fkTypeCodeId
		WHERE     dbo.SiteControl.fkLustID = @LustID
	END

GO
GRANT EXECUTE ON [dbo].[apGetSiteControlsByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetWorkReportedByLustIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetWorkReportedByLustIdData
  
 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date      Name    Description
 -----------------------------------------------------------------------------------------------------------
 5-17-2016	llo		Changed Licening database instance from Audit back to Prod.

 exec apGetWorkReportedByLustIdData 37247, null
 exec apGetWorkReportedByLustIdData 37247, 54279 
 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetWorkReportedByLustIdData] 
     @LustId INT
AS


	BEGIN
		SELECT 	a.WorkReportedId as WRID,
       			a.WorkReportedDate as WRKDATE,
				b.WorkTypeId,
       			b.WorkTypeDescription as WRKDESC,
      			isnull(
				CASE
				   -- get consultant company name
    			   WHEN       a.WorkReportedId in 
				   (SELECT wr1.WorkReportedId from WorkReported wr1 where wr1.ConsultantId <> 0)
    			   THEN 
				   d.CompanyName  

				   -- Get Regulated Entity Service Provider company name
    			   WHEN       a.WorkReportedId in
				   (SELECT wr2.WorkReportedId from WorkReported wr2 where wr2.ServiceProviderId <> 0)
				   THEN 
    			   c. FullName
				END 
      			,'OTIS CONVERSION') as WORKBY,
				ISNULL(CASE
				   -- get consultant company name
    			   WHEN       a.WorkReportedId in 
				   (SELECT wr1.WorkReportedId from WorkReported wr1 where wr1.ConsultantId <> 0)
    			   THEN 
				   'CN' + CAST(a.ConsultantId AS VARCHAR) 

				   				   
    			   WHEN       a.WorkReportedId in
				   (SELECT wr2.WorkReportedId from WorkReported wr2 where wr2.ServiceProviderId <> 0)
				   THEN 
 				   'RE' + CAST(c.PersonID AS VARCHAR)
				END, 'OTIS CONVERSION') AS SIDWorkBy, 
				a.Comment,
       			a.LastChangeBy,
       			a.LastChangeDate,
				a.LustId,
				incident.LogNumber

		FROM incident LEFT JOIN dbo.WorkReported a WITH (NOLOCK) ON Incident.LustId = a.LustId 
		JOIN dbo.WorkReportedType b WITH (NOLOCK) ON a.WorkReportedTypeId = b.WorkTypeId
		LEFT JOIN  	Licensing.dbo.vUST_PersonInfo c WITH (NOLOCK) ON c. PersonID = a.ServiceProviderId
		--left JOIN  	[deqsql1\audit].Licensing.dbo.vUST_PersonInfo c WITH (NOLOCK) ON c. PersonID = a.ServiceProviderId
		left JOIN  	CONSULTANT d WITH (NOLOCK) ON d.ID = a.ConsultantId
		WHERE      	incident.LustId =  @LustId
		ORDER BY   	a.WorkReportedDate desc

	END

GO
GRANT EXECUTE ON [dbo].[apGetWorkReportedByLustIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetWorkReportedByWrIdData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apGetWorkReportedByLustIdData
  
 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date      Name    Description
 -----------------------------------------------------------------------------------------------------------
 5-17-2016	llo		Changed Licening database instance from Audit back to Prod.

 exec apGetWorkReportedByLustIdData 37247, null
 exec apGetWorkReportedByLustIdData 37247, 54279 
 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apGetWorkReportedByWrIdData] 
	 @WorkReportedId	INT 
AS



	BEGIN

		SELECT 	a.WorkReportedId as WRID,
       			a.WorkReportedDate as WRKDATE,
				b.WorkTypeId,
       			b.WorkTypeDescription as WRKDESC,
      			isnull(
				CASE
				   -- get consultant company name
    			   WHEN       a.WorkReportedId in 
				   (SELECT wr1.WorkReportedId from WorkReported wr1 where wr1.ConsultantId <> 0)
    			   THEN 
				   d.CompanyName  

				   -- Get Regulated Entity Service Provider company name
    			   WHEN       a.WorkReportedId in
				   (SELECT wr2.WorkReportedId from WorkReported wr2 where wr2.ServiceProviderId <> 0)
				   THEN 
    			   c. FullName
				END 
      			,'OTIS CONVERSION') as WORKBY,  
				ISNULL(CASE
				   -- get consultant company name
    			   WHEN       a.WorkReportedId in 
				   (SELECT wr1.WorkReportedId from WorkReported wr1 where wr1.ConsultantId <> 0)
    			   THEN 
				   'CN' + CAST(a.ConsultantId AS VARCHAR) 

				   				   
    			   WHEN       a.WorkReportedId in
				   (SELECT wr2.WorkReportedId from WorkReported wr2 where wr2.ServiceProviderId <> 0)
				   THEN 
 				   'RE' + CAST(c.PersonID AS VARCHAR)
				END, 'OTIS CONVERSION') AS SIDWorkBy, 
				a.Comment,
       			a.LastChangeBy,
       			a.LastChangeDate,
				a.LustId,
				incident.LogNumber

		FROM	dbo.WorkReported a WITH (NOLOCK)
		JOIN   	dbo.WorkReportedType b WITH (NOLOCK) ON a.WorkReportedTypeId = b.WorkTypeId
		LEFT JOIN  	Licensing.dbo.vUST_PersonInfo c WITH (NOLOCK) ON c. PersonID = a.ServiceProviderId
		--left JOIN  	[deqsql1\audit].Licensing.dbo.vUST_PersonInfo c WITH (NOLOCK) ON c. PersonID = a.ServiceProviderId
		left JOIN  	CONSULTANT d WITH (NOLOCK) ON d.ID = a.ConsultantId
		JOIN incident ON a.LustId = incident.LustId
		WHERE      	a.WorkReportedId = @WorkReportedId
		ORDER BY   	a.WorkReportedDate desc
	END


GO
GRANT EXECUTE ON [dbo].[apGetWorkReportedByWrIdData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRInsertIncident]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- -----------------------------------------------------------------------------
-- Name: apOLPRRInsertIncident
-- Description: DEQ OnLine Petroleum Release reporting:
--                     This Stored Procedure recieves data input from LUST On-Line Petroleum Release Reporting process
--                     and inserts it into SqlServer LUST database.
--                     This Stored Procedure inserts data into: LUST.OLPRR_INCIDENT
--                                                                                    LUST.OLPRR_CONTACTS
--                                                                                    LUST.OLPRR_ASSESSMENT
--
-- Called from:  OlprrEntry.asp
--
-- Company: Oregon DEQ
-- Author:  B.Dyer
-- Date:    Jan 16 2002
--
-- Revision history: 
-- date    name    description
--
-- 6-4-02, L.Shaver, added email formating

-- ------------------------------------------------------
-- August 2005
-- B.Dyer
-- Fit to differently shaped OLPRR "holding tank" tables
-- as part of the -disconnect from ORACLE- work.

-- ------------------------------------------------------
-- April 2007
-- B.Dyer
-- Add new SOURCE OF RELEASE value.
-- Add Discovery Date back - per HOTC Program request.

-- ------------------------------------------------------
-- 03/18/2010
-- T.Zhai
-- Change the Line 767 from "FROM LUST.dbo.OLPRR_DEQ_CONTACTS"
-- to "FROM LUST.dbo.OLPRRDEQCONTACTS"
-- ------------------------------------------------------
-- 07/24/2017
-- A Knight
-- Update @SITE_PHONE to VARCHAR(25).
-- ------------------------------------------------------
-- 07/25/2017
-- A Knight
-- Update @STREET_NBR to VARCHAR(11).
-- ----------------------------------------------------------------------------- 
-- 07/25/2017
-- A Knight
-- Update @strStreetNbr to VARCHAR(11).
-- ----------------------------------------------------------------------------- 
-- 08/02/2017
-- A Knight
-- Comment out the code that sends email to the CONTRACTOR.
-- ----------------------------------------------------------------------------- 
-- 08/02/2017
-- A Knight
-- Add @INITIAL_COMMENT to email sent DEQ Recipient.
-- ---------------------------------------------------------------------------------------------------------------------
-- 08/03/2017
-- A Knight
-- Add new input parameter @REPORTED_BY_EMAIL; use it to send email to contrator.
-- ---------------------------------------------------------------------------------------------------------------------
-- 01/29/2019
-- A Knight
-- Increase @RP_EMAIL and @IC_EMAIL length to 40.
-- ---------------------------------------------------------------------------------------------------------------------

CREATE                                                               
PROCEDURE [dbo].[apOLPRRInsertIncident]
(

/*
-------------BDYER 4 AUG 2005 ------------------------------------------------------------------------------------------
these input parameters are used with this naming convention ,
and in this order,
from the Contractor ASP front-end... don't change!
------------------------------------------------------------------------------------------------------------------------
*/



-- ORIGINAL PARAMETER STACK

-- Incident Site data
 @ErrNum	     SMALLINT OUTPUT,
 @CONTRACTOR_UID     VARCHAR(20),        
 @CONTRACTOR_PWD     VARCHAR(20),   
 @REPORTED_BY        VARCHAR(50),
 @REPORTED_BY_PHONE  VARCHAR(25),
 @REPORTED_BY_EMAIL  VARCHAR(75),
 @RELEASE_TYPE       VARCHAR(1),
 @DATE_RECEIVED      DATETIME,
 @FACILITY_ID        NUMERIC,
 @SITE_NAME          VARCHAR(40), 
 @SITE_COUNTY        VARCHAR(2), 
 @STREET_NBR         VARCHAR(11),
 @STREET_QUAD        VARCHAR(2),
 @STREET_NAME        VARCHAR(30),
 @STREET_TYPE        VARCHAR(10),
 @SITE_ADDRESS       VARCHAR(40),
 @SITE_CITY          VARCHAR(25), 
 @SITE_ZIPCODE       VARCHAR(10),
 @SITE_PHONE         VARCHAR(25), 
 @INITIAL_COMMENT    VARCHAR(720) = NULL,

 -- Incident Assessment data
 @DISCOVERY_DATE     DATETIME, 
 @CONFIRMATION_CODE  VARCHAR(2),
 @DISCOVERY_CODE     VARCHAR(2),
 @CAUSE_CODE         VARCHAR(2),
 @SOURCEID           NUMERIC, 

-- Responsible Party data
 @RP_FIRSTNAME       VARCHAR(20),
 @RP_LASTNAME        VARCHAR(20),
 @RP_ORGANIZATION    VARCHAR(40),
 @RP_ADDRESS         VARCHAR(40),
 @RP_ADDRESS2        VARCHAR(40) = NULL,
 @RP_CITY            VARCHAR(25),
 @RP_STATE           VARCHAR(2),
 @RP_ZIPCODE         VARCHAR(10),
 @RP_PHONE           VARCHAR(30),
 @RP_EMAIL           VARCHAR(40),

 @IC_FIRSTNAME       VARCHAR(20),
 @IC_LASTNAME        VARCHAR(20),
 @IC_ORGANIZATION    VARCHAR(40),
 @IC_ADDRESS         VARCHAR(40),
 @IC_ADDRESS2        VARCHAR(25) = NULL,
 @IC_CITY            VARCHAR(25),
 @IC_STATE           VARCHAR(2),
 @IC_ZIPCODE         VARCHAR(10),
 @IC_PHONE           VARCHAR(30),
 @IC_EMAIL           VARCHAR(40),

-- Media data
 @GROUNDWATER        SMALLINT,
 @SURFACEWATER       SMALLINT,
 @DRINKINGWATER      SMALLINT,
 @SOIL               SMALLINT,
 @VAPOR              SMALLINT,
 @FREEPRODUCT        SMALLINT,

--Contamimnant data
 @UNLEADEDGAS        SMALLINT,
 @LEADEDGAS          SMALLINT,
 @MISCGAS            SMALLINT,
 @DIESEL             SMALLINT,
 @WASTEOIL           SMALLINT,
 @HEATINGOIL         SMALLINT,
 @LUBRICANT          SMALLINT,
 @SOLVENT            SMALLINT,
 @OTHERPET           SMALLINT,
 @CHEMICAL           SMALLINT,
 @UNKNOWN            SMALLINT,
 @MTBE               SMALLINT,
-- Date Time Stamp
 @SUBMIT_DATETIME    VARCHAR(30),

-- Deq Office for  E-Mail Notification
 @DEQ_OFFICE         VARCHAR(3)               
            
 )
 AS


DECLARE 
   @strAddress        VARCHAR(60)
  ,@strStreetNbr      VARCHAR(11) 
  ,@strStreetQuad     VARCHAR(2)
  ,@strStreetName     VARCHAR(30)
  ,@strStreetType     VARCHAR(10)

  --,@vNewOlprrId        SMALLINT
  ,@vNewOlprrId			   INT
  ,@strContractorName  VARCHAR(50)
  ,@iContractorId      INTEGER,         


--  EMAIL variables	  

 @MyRecipients       VARCHAR(100),
 @MyMessage          VARCHAR(1200),
 @strContractorEmail VARCHAR(50),
 @vEmailCountyName   VARCHAR(40),
 @vEMAIL	     VARCHAR (8000),
 @vErrStr            VARCHAR(800), 
 @ErrorSubject	     VARCHAR (200),
 @ErrorRecipients    VARCHAR(100)

IF @FACILITY_ID IS NULL 
   SET @FACILITY_ID = 0

SELECT @iContractorId =
(SELECT OlprrContractorsId FROM LUST.dbo.OlprrContractors
 WHERE  UID = @CONTRACTOR_UID
 AND    PWD = @CONTRACTOR_PWD)



 SET @ErrorSubject = 'ERROR in Oregon DEQ Online Petroleum Release Reporting system.'  
 SET @ErrorRecipients = 'DeqTanksReviewSupport@deq.state.or.us' 	
 --SET @ErrorRecipients = 'guedea.alex@deq.state.or.us; quan.nga@deq.state.or.us' 	


SELECT @strStreetNbr  = RTRIM(@STREET_NBR)
SELECT @strStreetQuad = RTRIM(@STREET_QUAD)
SELECT @strStreetName = RTRIM(@STREET_NAME)
SELECT @strStreetType = RTRIM(@STREET_TYPE)



BEGIN TRAN ReceiveOlprrIncident

BEGIN

SET @ErrNum = 1

--SELECT  @strContractorEmail = EMAIL_ADDRESS,@strContractorName = COMPANY_NAME
--		FROM LUST.dbo.OlprrContractors
--                WHERE UID = @CONTRACTOR_UID
--                AND   PWD = @CONTRACTOR_PWD
SELECT  @strContractorEmail = @REPORTED_BY_EMAIL


--> Error Check
SET @ErrNum = @@ERROR
IF  @ErrNum <> 0
    BEGIN	
        SET @vErrStr = 'Error in OLPRR Reporting process.' +
                       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+   
                       '          Error in Stored Procedure apOLPRRInsertIncident'
                       + CHAR(13) + CHAR(10)+ 
                       '          At "Retrieve Contractor Name and E-mail Address" ' 
                       + CHAR(13) + CHAR(10)+ 
                       '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
		       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+
                       '          Company : ' + @strContractorName + '   ' + 'UID :' + @CONTRACTOR_UID  

	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = @ErrorRecipients,
	@body =  @vErrStr,
	@subject = @ErrorSubject

	GOTO RollbackRtn
    END
END


/*
------Prepare Address -----------------------------------------------------------------------
ADDRESS CONSOLIDATION:

IF IN-COMING VALUES STREET NBR AND STREET NAME EXIST, THESE ARE TO BE USED AS THE NEW SITE ADDRESS. 
IF THERE ARE STREET-QUAD, STREET-TYPE VALUES, ADD THEM IN. ALL VALUES LOADED INTO WORKING VARIABLE @strAddress.

IF IN-COMING STREET NBR AND STREET NAME ARE EMPTY, 
IN-COMING VALUE SITE_ADDRESS ("OTHER ADDRESS" IN THE U/I) IS USED AS THE NEW SITE ADDRESS, 
AGAIN LOADED INTO WORKING VARIABLE @strAddress, THEN INTO DB SiteAddress.

----------------------------------------------------------------------------------------------
*/

BEGIN

SET @ErrNum = 1


-- -------------------------------------------------------------------------------------------
-- 28 NOV 2005 TODO BDYER
-- THIS ADDRESS PREPERATION NEEDS A SCRUBBING:
--
-- IF @STREET_NBR -AND- @STREET_NAME ARE NOT NULL,
-- Make the dbo.OlprrIncidentNew.SiteAddress value out of the 4 in-coming seperate values.

-- In the U/I, if the address is built in pieces like this, it's automatically built together into
-- in-coming parameter @SITE_ADDRESS.

-- so i want to find out if these 2 values are the same.
-- if they are, simply wipe out the @SITE_ADDRESS value.

-- if they are different, send the @STREET_NBR -AND- @STREET_NAME values
-- to dbo.OlprrIncidentNew.SiteAddress, and send @SITE_ADDRESS
-- to dbo.OlprrIncidentNew.OtherAddress.

--NOW!
-- IF @STREET_NBR -AND- @STREET_NAME ARE NULL,
-- assume that I've got a @SITE_ADDRESS value.
-- send this to dbo.OlprrIncidentNew.SiteAddress.

--THAT'S IT! BUILD IT.




--Adressess...

-- if 2 different value sets are entered, 
--    keep them both in (STREET NBR+STREET QUAD+STREET NAME+STREET TYPE) and @SITE_ADDRESS.
--    @SITE_ADDRESS is ADDRESS2 in the Contractor OLPRR U/I.

-- if 2 value come in, and they are exactly the same, empty out the @SITE_ADDRESS value. 
--    It was automatically loaded up in the U/I, and is a duplicate.

-- if only one value comes in, regardless of which one, nake it the main Address


--CHECK #1
IF ((@STREET_NBR IS NOT NULL) AND (@STREET_NAME IS NOT NULL))

    BEGIN
    IF ((LEN(RTRIM(@STREET_NBR)) > 0 ) AND (LEN(RTRIM(@STREET_NAME)) > 0)) 
	BEGIN 
	SELECT @strAddress = @strStreetNbr
        END
	
    IF LEN(RTRIM(@STREET_QUAD)) > 0
	BEGIN
	SELECT @strAddress = @strAddress + ' ' + @strStreetQuad 
	END
	
    SELECT @strAddress = @strAddress + ' ' + @strStreetName
	
    IF LEN(RTRIM(@STREET_TYPE)) > 0
	BEGIN
	SELECT @strAddress = @strAddress + ' ' + @strStreetType
	END

    END  



-- NOW I NEED TO FIND OUT IF THE BUILT-UP @strAddress IS THE SAME AS CURRENT @SITE_ADDRESS VALUE.
-- IF IT IS JUST AN ASP RE-HASH OF THE 4 STREET VALUES, DUMP IT.
--CHECK #2

IF RTRIM(@SITE_ADDRESS) = RTRIM(@strAddress)
	BEGIN
	SET @SITE_ADDRESS = '' --<<< OLPRR ASP FRONT-END "OTHER ADDRESS" VALUE.
	END



-- IF ONLY U/I "OTHER ADDRESS" VALUE IS LOADED, USE IT AS MAIN ADDRESS.
--CHECK #3

 IF ((@STREET_NBR IS NULL) AND (@STREET_NAME IS NULL)) OR 
    ((LEN(RTRIM(@STREET_NBR))= 0 ) OR (LEN(RTRIM(@STREET_NAME)) = 0)) 
-- GET U/I OTHER ADDRESS AS MAIN SITE ADDRESS.
	BEGIN
	SET @strAddress = ''
	SELECT @strAddress = @SITE_ADDRESS --< THIS IS THE "OTHER ADDRESS" VALUE.
        SET    @SITE_ADDRESS = '' 
	END





---------------------------------------------------------------------------------------------
--> Error Check
SET @ErrNum = @@ERROR
IF  @ErrNum <> 0
    BEGIN	
        SET @vErrStr = 'Error in OLPRR Reporting process.' +
                       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+   
                       '          Error in Stored Procedure apOLPRRInsertIncident'
                       + CHAR(13) + CHAR(10)+ 
                       '          At "Prepare Address" ' 
                       + CHAR(13) + CHAR(10)+ 
                       '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
		       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+
                       '          Company : ' + @strContractorName + '   ' + 'UID :' + @CONTRACTOR_UID  

	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = @ErrorRecipients,
	@body =  @vErrStr,
	@subject = @ErrorSubject

	GOTO RollbackRtn
    END
END



BEGIN

SET @ErrNum = 1

INSERT INTO dbo.OlprrIncident
           (ReleaseType  
           ,ReceiveDate  
           ,FacilityId   
           ,SiteName     
           ,SiteCounty  
           ,SiteAddress  
           ,OtherAddress 
           ,SiteCity
           ,SiteZipCode
           ,SitePhone
           ,SiteComment
           ,ContractorId
           ,DeqOffice
           ,ReportedBy
           ,ReportedByPhone)
VALUES                           
          (@RELEASE_TYPE
          ,CONVERT(VARCHAR (10),@DATE_RECEIVED,101)
          ,@FACILITY_ID
          ,RTRIM(@SITE_NAME)
          ,@SITE_COUNTY        
          ,RTRIM(@strAddress)
          ,RTRIM(@SITE_ADDRESS)  --<<< ASP "OTHER ADDRESS" VALUE.
          ,RTRIM(@SITE_CITY)   
          ,RTRIM(@SITE_ZIPCODE)   
          ,RTRIM(@SITE_PHONE)   
          ,RTRIM(@INITIAL_COMMENT)    
          ,@iContractorId               
	      ,@DEQ_OFFICE	
	      ,@REPORTED_BY
	      ,@REPORTED_BY_PHONE)

--> Error Check
SET @ErrNum = @@ERROR
IF  @ErrNum <> 0
    BEGIN	
        SET @vErrStr = 'Error in OLPRR Reporting process.' +
                       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+   
                       '          Error in Stored Procedure apOLPRRInsertIncident'
                       + CHAR(13) + CHAR(10)+ 
                       '          At "INSERT INTO dbo.OlprrIncident" ' 
                       + CHAR(13) + CHAR(10)+ 
                       '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
		       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+
                       '          Company : ' + @strContractorName + '   ' + 'UID :' + @CONTRACTOR_UID  

	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = @ErrorRecipients,
	@body =  @vErrStr,
	@subject = @ErrorSubject

	GOTO RollbackRtn
    END

END


-----------------------------------------------
-- Get new Identity seed ID
BEGIN

SET @ErrNum = 1

SELECT @vNewOlprrId = @@IDENTITY

-----------------------------------------------

--> Error Check
SET @ErrNum = @@ERROR
IF  @ErrNum <> 0
    BEGIN	
        SET @vErrStr = 'Error in OLPRR Reporting process.' +
                       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+   
                       '          Error in Stored Procedure apOLPRRInsertIncident'
                       + CHAR(13) + CHAR(10)+ 
                       '          At "SELECT @vNewOlprrId = @@IDENTITY" ' 
                       + CHAR(13) + CHAR(10)+ 
                       '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
		       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+
                       '          Company : ' + @strContractorName + '   ' + 'UID :' + @CONTRACTOR_UID  

	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = @ErrorRecipients,
	@body =  @vErrStr,
	@subject = @ErrorSubject

	GOTO RollbackRtn
    END
END


/*
-----------------------------------BDYER 4 AUG 2005 ----------------------------------------------------------

PART #2: NEW ASSESSMENT INSERT
--------------------------------------------------------------------------------------------------------------
*/

-- Load Assessment data
BEGIN

SET @ErrNum = 1

INSERT INTO dbo.OlprrAssessment
	   (OlprrId
       ,DiscoveryDate
	   ,ConfirmationCode
	   ,DiscoveryCode
	   ,ReleaseCauseCode
       ,ReleaseSourceId
       ,SLMediaInd
       ,GWMediaInd
       ,SWMediaInd
       ,DWMediaInd
       ,FVMediaInd
       ,FPMediaInd
       ,UGContamInd
       ,LGContamInd
       ,MGContamInd
       ,DSContamInd
       ,WOContamInd
       ,LBContamInd
       ,SVContamInd
       ,OPContamInd
       ,CHContamInd
       ,MTBEContamInd
       ,UNContamInd
       ,HOContamInd)
VALUES
     (@vNewOlprrId
      ,@DISCOVERY_DATE 
      ,UPPER(@CONFIRMATION_CODE)
	  ,UPPER(@DISCOVERY_CODE)
	  ,UPPER(@CAUSE_CODE)
      ,@SOURCEID
      ,@SOIL
      ,@GROUNDWATER
      ,@SURFACEWATER
      ,@DRINKINGWATER
      ,@VAPOR
      ,@FREEPRODUCT
      ,@UNLEADEDGAS
      ,@LEADEDGAS
      ,@MISCGAS
      ,@DIESEL
      ,@WASTEOIL
      ,@LUBRICANT
      ,@SOLVENT
      ,@OTHERPET
      ,@CHEMICAL
      ,@MTBE 
      ,@UNKNOWN 
      ,@HEATINGOIL)



--------------------------------------------------------------------------------
--> Error Check
SET @ErrNum = @@ERROR
IF  @ErrNum <> 0
    BEGIN	
        SET @vErrStr = 'Error in OLPRR Reporting process.' +
                       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+   
                       '          Error in Stored Procedure apOLPRRInsertIncident'
                       + CHAR(13) + CHAR(10)+ 
                       '          At "INSERT INTO dbo.OLPRR_ASSESSMENT" ' 
                       + CHAR(13) + CHAR(10)+ 
                       '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
		       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+
                       '          Company : ' + @strContractorName + '   ' + 'UID :' + @CONTRACTOR_UID  

	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = @ErrorRecipients,
	@body =  @vErrStr,
	@subject = @ErrorSubject

	GOTO RollbackRtn
    END
END


/*
-----------------------------------BDYER 4 AUG 2005 ----------------------------------------------------------
PART #3: NEW CONTACTS INSERT
--------------------------------------------------------------------------------------------------------------
*/
-- Load Contacts RESPONSIBLE PARTY data

BEGIN

SET @ErrNum = 1

INSERT INTO dbo.OlprrContacts
           (OlprrId 
           ,ContactType
           ,FirstName
           ,LastName
           ,Organization
           ,Address
           ,Address2
           ,City
           ,State
           ,Zipcode
           ,Phone
           ,EmailAddress)
VALUES
          (@vNewOlprrId
	   ,'RP'
	   ,@RP_FIRSTNAME
	   ,@RP_LASTNAME
	   ,@RP_ORGANIZATION
	   ,@RP_ADDRESS
	   ,@RP_ADDRESS2
	   ,@RP_CITY
	   ,@RP_STATE
	   ,@RP_ZIPCODE
	   ,@RP_PHONE
	   ,@RP_EMAIL)

--> Error Check
SET @ErrNum = @@ERROR
IF  @ErrNum <> 0
    BEGIN	
        SET @vErrStr = 'Error in OLPRR Reporting process.' +
                       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+   
                       '          Error in Stored Procedure apOLPRRInsertIncident'
                       + CHAR(13) + CHAR(10)+ 
                       '          At "INSERT Responsible Party Data INTO dbo.OLPRR_CONTACTS" ' 
                       + CHAR(13) + CHAR(10)+ 
                       '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
		       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+
                       '          Company : ' + @strContractorName + '   ' + 'UID :' + @CONTRACTOR_UID  

	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = @ErrorRecipients,
	@body =  @vErrStr,
	@subject = @ErrorSubject

	GOTO RollbackRtn
    END
END

---------------------------------------------------------------
-- Load Invoice Contact data for Site Types 'R' and 'U'
--
-- NO INVOICE CONTACT CREATED FOR HEATING OIL TANKS!
---------------------------------------------------------------

IF @RELEASE_TYPE <> 'H'

        BEGIN

        SELECT @ErrNum = 1

	INSERT INTO dbo.OlprrContacts
	           (OlprrId 
	           ,ContactType
	           ,FirstName
	           ,LastName
	           ,Organization
	           ,Address
	           ,Address2
	           ,City
	           ,State
	           ,Zipcode
	           ,Phone
	           ,EmailAddress)
	VALUES
	       (@vNewOlprrId
		   ,'IC'
		   ,@IC_FIRSTNAME
		   ,@IC_LASTNAME
		   ,@IC_ORGANIZATION
		   ,@IC_ADDRESS
		   ,@IC_ADDRESS2
		   ,@IC_CITY
		   ,@IC_STATE
		   ,@IC_ZIPCODE
		   ,@IC_PHONE
	           ,@IC_EMAIL)

        SELECT @ErrNum = @@ERROR

	IF  @ErrNum <> 0 
	    BEGIN	
	        SET @vErrStr = 'Error in OLPRR Reporting process.' +
	                       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+   
	                       '          Error in Stored Procedure apOLPRRInsertIncident'
	                       + CHAR(13) + CHAR(10)+ 
	                       '          At "INSERT Invoice Contact Data INTO dbo.OLPRR_CONTACTS" ' 
	                       + CHAR(13) + CHAR(10)+ 
	                       '          ERROR NUMBER : ' + CONVERT(VARCHAR(5),@ErrNum)  
			       + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)+
	                       '          Company : ' + @strContractorName + '   ' + 'UID :' + @CONTRACTOR_UID  


	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = @ErrorRecipients,
	@body =  @vErrStr,
	@subject = @ErrorSubject

		GOTO RollbackRtn
	    END
       END

------------- COMMIT THE TRANSACTION  ---------------------- 

COMMIT TRAN ReceiveOlprrIncident                                                    

------------------------------------------------------------ 


-- ALTER E-MAIL VALUES FOR CONTRACTOR DATA ACCEPTANCE CONFIRMATION AND DEQ STAFF NOTIFICATION
SET @vEmailCountyName = 
    CASE
	WHEN  @SITE_COUNTY = '01' THEN 'Baker'
	WHEN  @SITE_COUNTY = '02' THEN 'Benton'
	WHEN  @SITE_COUNTY = '03' THEN 'Clackamas'
	WHEN  @SITE_COUNTY = '04' THEN 'Clatsop'
	WHEN  @SITE_COUNTY = '05' THEN 'Columbia'
	WHEN  @SITE_COUNTY = '06' THEN 'Coos'
	WHEN  @SITE_COUNTY = '07' THEN 'Crook'
	WHEN  @SITE_COUNTY = '08' THEN 'Curry'
	WHEN  @SITE_COUNTY = '09' THEN 'Deschutes'
	WHEN  @SITE_COUNTY = '10' THEN 'Douglas'
	WHEN  @SITE_COUNTY = '11' THEN 'Gilliam'
	WHEN  @SITE_COUNTY = '12' THEN 'Grant'
	WHEN  @SITE_COUNTY = '13' THEN 'Harney'
	WHEN  @SITE_COUNTY = '14' THEN 'Hood River'
	WHEN  @SITE_COUNTY = '15' THEN 'Jackson'
	WHEN  @SITE_COUNTY = '16' THEN 'Jefferson'
	WHEN  @SITE_COUNTY = '17' THEN 'Josephine'
	WHEN  @SITE_COUNTY = '18' THEN 'Klamath'
	WHEN  @SITE_COUNTY = '19' THEN 'Lake'
	WHEN  @SITE_COUNTY = '20' THEN 'Lane'
	WHEN  @SITE_COUNTY = '21' THEN 'Lincoln'
	WHEN  @SITE_COUNTY = '22' THEN 'Linn'
	WHEN  @SITE_COUNTY = '23' THEN 'Malheur'
	WHEN  @SITE_COUNTY = '24' THEN 'Marion'
	WHEN  @SITE_COUNTY = '25' THEN 'Morrow'
	WHEN  @SITE_COUNTY = '26' THEN 'Multnomah'
	WHEN  @SITE_COUNTY = '27' THEN 'Polk'
	WHEN  @SITE_COUNTY = '28' THEN 'Sherman'
	WHEN  @SITE_COUNTY = '29' THEN 'Tillamook'
	WHEN  @SITE_COUNTY = '30' THEN 'Umatilla'
	WHEN  @SITE_COUNTY = '31' THEN 'Union'
	WHEN  @SITE_COUNTY = '32' THEN 'Wallowa'
	WHEN  @SITE_COUNTY = '33' THEN 'Wasco'
	WHEN  @SITE_COUNTY = '34' THEN 'Washington'
	WHEN  @SITE_COUNTY = '35' THEN 'Wheeler'
	WHEN  @SITE_COUNTY = '36' THEN 'Yamhill'
    END

SET @vEMAIL = '  New LUST Incident information submitted to State of Oregon DEQ for review.' 
		+ CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) +
	   --'     Contractor :    ' + ISNULL(RTRIM(@strContractorName),'')
    --    	+ CHAR(13) + CHAR(10) +
           '     Reported by:    ' + ISNULL(RTRIM(@REPORTED_BY) ,'')
		+ CHAR(13) + CHAR(10) +
           '     Phone Number:   ' + ISNULL(RTRIM(@REPORTED_BY_PHONE),'')
		+ CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) +
           '     Site Name:      ' + ISNULL(RTRIM(@SITE_NAME),'')
		+ CHAR(13) + CHAR(10) +
           '     Site Address:   ' + ISNULL(RTRIM(@strAddress),'')
		+ CHAR(13) + CHAR(10) +
           '     Site City:      ' + ISNULL(RTRIM(@SITE_CITY),'')
		+ CHAR(13) + CHAR(10) +
	   '     Site Zip Code:  ' + ISNULL(RTRIM(@SITE_ZIPCODE) ,'')
		+ CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) +
           '     Site County:    ' + ISNULL(RTRIM(@vEmailCountyName),'')
		+ CHAR(13) + CHAR(10)


SET @vEMAIL = @vEMAIL   + '  Received by State of Oregon DEQ : '
		+ RTRIM(@SUBMIT_DATETIME) + '.'
		+ CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) 

SELECT @MyRecipients = @strContractorEmail 

EXEC msdb.dbo.sp_send_dbmail
@Recipients = @MyRecipients,
@body =  @vEMAIL,
@subject = 'State of Oregon DEQ: Contractor LUST Data Submittal Confirmation'

    SELECT @ErrNum = @@ERROR

	IF  @ErrNum <> 0 
	    BEGIN	
	    SET @vErrStr = 'Error in OLPRR Contractor Submittal Confirmation.' 
        SET @ErrorSubject  = 'Error in OLPRR Contractor Submittal Confirmation.' 

		EXEC msdb.dbo.sp_send_dbmail
		@Recipients = @ErrorRecipients,
		@body =  @vErrStr,
		@subject = @ErrorSubject
		END


-- DEQ TANK STAFF NOTIFICATION E-MAIL
SELECT	@vEMAIL = @vEMAIL + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) + @INITIAL_COMMENT

SELECT @MyRecipients = RTRIM(EMAIL_ADDRESS)
FROM LUST.dbo.OLPRRDEQCONTACTS
WHERE DEQ_OFFICE = @DEQ_OFFICE
               
EXEC msdb.dbo.sp_send_dbmail
@Recipients = @MyRecipients,
@body = @vEMAIL,
@subject = 'OLPRR LUST Tank Start Notification for DEQ Staff'

    SELECT @ErrNum = @@ERROR

	IF  @ErrNum <> 0 
	    BEGIN	
	    SET @vErrStr = 'Error in OLPRR Tank Start Notification for DEQ Staff.' 
        SET @ErrorSubject  = 'Error in OLPRR Tank Start Notification for DEQ Staff.' 

		EXEC msdb.dbo.sp_send_dbmail
		@Recipients = @ErrorRecipients,
		@body =  @vErrStr,
		@subject = @ErrorSubject
		END


GOTO ExitRtn



RollbackRtn:
	ROLLBACK TRAN ReceiveOlprrIncident
   	RETURN @ErrNum



ExitRtn:
   RETURN @ErrNum

GO
GRANT EXECUTE ON [dbo].[apOLPRRInsertIncident] TO [DEQ\LUSTDataStewards] AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[apOLPRRInsertIncident] TO [DEQ\LUSTDataStewards] AS [dbo]
GO
GRANT EXECUTE ON  [dbo].[apOLPRRInsertIncident] TO [LUSTUser]
GO
GRANT EXECUTE ON  [dbo].[apOLPRRInsertIncident] TO [OLPRRENTRY]
GO
GRANT EXECUTE ON  [dbo].[apOLPRRInsertIncident] TO [OLPRRReview]
GO

/****** Object:  StoredProcedure [dbo].[apInsertOLPRRDownloadData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


/***********************************************************************************************************************/
/*
**		Name: apInsertOLPRRDownloadData
**		Desc: This procedure is intended to be temporary to load data from a download into LUST.
**		
** 
**		Called by:   User
**              
**		Auth: Art Knight
**
**		Date: 06/27/2017
************************************************************************************************************************
**		Change History
************************************************************************************************************************
**	   Date		Author		Description
**	----------	--------	--------------------------------------------------------------------------------------------
**  07-06-2017	aknight		Add WHERE clause to SELECT within the WHILE loop.
**	07-11-2017	aknight		Add CASE for @RELEASE_TYPE.
**	07-24-2017	aknight		Add the slash in the @CAUSE_CODE value "Physical/Mechanical Damage".
**	08-04-2017	aknight		Add improved messaging to ERROR message.
**    		
************************************************************************************************************************
*/

/***********************************************************************************************************************/
CREATE PROCEDURE [dbo].[apInsertOLPRRDownloadData]
	 
----	 @ErrMsg VarChar(500) = ''	OUTPUT
----,	 @Result Bit		  = 0	OUTPUT
AS


DECLARE	
		@ErrorNumber		INTEGER			= 0,
		@RecordID			INTEGER			= 0,
		@PrevRecordID		INTEGER			= 0,
		@CONTRACTOR_UID     VARCHAR(20),        
		@CONTRACTOR_PWD     VARCHAR(20),   
		@REPORTED_BY        VARCHAR(50),
		@REPORTED_BY_PHONE  VARCHAR(25),
		@RELEASE_TYPE       VARCHAR(1),
		@DATE_RECEIVED      DATETIME,
		@FACILITY_ID        NUMERIC,
		@SITE_NAME          VARCHAR(40), 
		@SITE_COUNTY        VARCHAR(2), 
		@SiteCounty         VARCHAR(25), 
		@STREET_NBR         VARCHAR(10),
		@STREET_QUAD        VARCHAR(2),
		@STREET_NAME        VARCHAR(30),
		@STREET_TYPE        VARCHAR(10),
		@SITE_ADDRESS       VARCHAR(40),
		@SITE_CITY          VARCHAR(25), 
		@SITE_ZIPCODE       VARCHAR(10),
		@SITE_PHONE         VARCHAR(15), 
		@INITIAL_COMMENT    VARCHAR(720),
		@DISCOVERY_DATE     DATETIME, 
		@CONFIRMATION_CODE  VARCHAR(2),
		@DISCOVERY_CODE     VARCHAR(2),
		@CAUSE_CODE         VARCHAR(2),
		@SOURCEID           NUMERIC, 
		@ReleaseType		VARCHAR(50),
		@RP_FIRSTNAME       VARCHAR(20),
		@RP_LASTNAME        VARCHAR(20),
		@RP_ORGANIZATION    VARCHAR(40),
		@RP_ADDRESS         VARCHAR(40),
		@RP_ADDRESS2        VARCHAR(40),
		@RP_CITY            VARCHAR(25),
		@RP_STATE           VARCHAR(2),
		@RP_ZIPCODE         VARCHAR(10),
		@RP_PHONE           VARCHAR(30),
		@RP_EMAIL           VARCHAR(30),
		@IC_FIRSTNAME       VARCHAR(20),
		@IC_LASTNAME        VARCHAR(20),
		@IC_ORGANIZATION    VARCHAR(40),
		@IC_ADDRESS         VARCHAR(40),
		@IC_ADDRESS2        VARCHAR(25),
		@IC_CITY            VARCHAR(25),
		@IC_STATE           VARCHAR(2),
		@IC_ZIPCODE         VARCHAR(10),
		@IC_PHONE           VARCHAR(30),
		@IC_EMAIL           VARCHAR(30),
		@GROUNDWATER        SMALLINT,
		@SURFACEWATER       SMALLINT,
		@DRINKINGWATER      SMALLINT,
		@SOIL               SMALLINT,
		@VAPOR              SMALLINT,
		@FREEPRODUCT        SMALLINT,
		@UNLEADEDGAS        SMALLINT,
		@LEADEDGAS          SMALLINT,
		@MISCGAS            SMALLINT,
		@DIESEL             SMALLINT,
		@WASTEOIL           SMALLINT,
		@HEATINGOIL         SMALLINT,
		@LUBRICANT          SMALLINT,
		@SOLVENT            SMALLINT,
		@OTHERPET           SMALLINT,
		@CHEMICAL           SMALLINT,
		@UNKNOWN            SMALLINT,
		@MTBE               SMALLINT,
		@SUBMIT_DATETIME    VARCHAR(30),
		@DEQ_OFFICE         VARCHAR(3)               

	,	@Counter			int	= 0
	,	@ErrNbr				INTEGER			= 0
	,	@ErrorMesage		VARCHAR(MAX)	= ''
 
 -----------------------------------------------------------------------------------------------------------------------

 SELECT	TOP 1
	@RecordID			= [RecordID]
,	@CONTRACTOR_UID     = 'INGRID'		--GOFF'
,	@CONTRACTOR_PWD     = 'GAFFNEY'		--Const'
,	@REPORTED_BY        = ISNULL([Reported by],'')
,	@REPORTED_BY_PHONE  = ISNULL([Reported by Phone],'')

--,	@RELEASE_TYPE       = LEFT(ISNULL([Site Type],''),1)
,	@RELEASE_TYPE       = CASE LEFT(ISNULL([Site Type],''),1)
							  WHEN 'N' THEN 'U'
							  ELSE LEFT(ISNULL([Site Type],''),1)
						  END

,	@DATE_RECEIVED      = [Date Reported]
,	@FACILITY_ID        = [Facility ID]
,	@SITE_NAME          = ISNULL([Site Name],'')
,	@SiteCounty         = ISNULL([Site County],'')
,	@STREET_NBR         = [Site Street Number]
,	@STREET_QUAD        = ISNULL([Site Quadrant],'')
,	@STREET_NAME        = ISNULL([Site Street Name],'')
,	@STREET_TYPE        = ISNULL([Street Type],'')
,	@SITE_ADDRESS		= ''
,	@SITE_CITY          = ISNULL([Site City],'')
,	@SITE_ZIPCODE       = [Site Zip Code]
,	@SITE_PHONE         = ISNULL([Site Phone],'')
,	@INITIAL_COMMENT    = ISNULL([Site Comments],'')
,	@DISCOVERY_DATE     = [Date Release Discovered]
,	@CONFIRMATION_CODE  = CASE ISNULL([Confirmation],'Other')
							  WHEN 'Contractor'	THEN 'CN'
							  WHEN 'Rp Report'	THEN 'RR'
							  WHEN 'Staff: DEQ'	THEN 'SI'
							  WHEN 'Lab: DEQ'	THEN 'LD'
							  WHEN 'Lab: RP'	THEN 'LR'
							  WHEN 'Lab: Other'	THEN 'LO'
							  WHEN 'Other'		THEN 'OT'
						  END
,	@DISCOVERY_CODE     = CASE ISNULL([Discovery],'Other')
							  WHEN 'Decommissioning'	THEN 'DC'
							  WHEN 'Routine Monitoring'	THEN 'RM'
							  WHEN 'Complaint'			THEN 'CP'
							  WHEN 'Leak Detection'		THEN 'IC'
							  WHEN 'Site Assessment'	THEN 'SA'
							  WHEN 'Tightness Test'		THEN 'TT'
							  WHEN 'Other'				THEN 'OT'
						  END
,	@CAUSE_CODE         = CASE ISNULL([Cause],'Unknown')
							  WHEN 'Overfill'					THEN 'OF'
							  WHEN 'Spill'						THEN 'SS'
							  WHEN 'Corrosion'					THEN 'CR'
							  WHEN 'Install Problem'			THEN 'IP'
							  WHEN 'Physical/Mechanical Damage'	THEN 'PM'
							  WHEN 'Other'						THEN 'OT'
							  WHEN 'Unknown'					THEN 'UN'
						  END
--,	@SOURCEID           = [Source]
,	@ReleaseType        = ISNULL([Source],'')
,	@RP_FIRSTNAME       = ISNULL([First Name],'')
,	@RP_LASTNAME        = ISNULL([Last Name],'')
,	@RP_ORGANIZATION    = ISNULL([Organization],'')
,	@RP_ADDRESS         = ISNULL([Contact Address],'')
,	@RP_ADDRESS2        = ''
,	@RP_CITY            = ISNULL([City],'')
,	@RP_STATE           = ISNULL([State],'')
,	@RP_ZIPCODE         = ISNULL([Zip Code],'')
,	@RP_PHONE           = ISNULL([Contact Phone],'')
,	@RP_EMAIL           = ISNULL([Contact Email],'')
,	@IC_FIRSTNAME       = ISNULL([First Name 2],'')
,	@IC_LASTNAME        = ISNULL([Last Name 2],'')
,	@IC_ORGANIZATION    = ISNULL([Organization 2],'')
,	@IC_ADDRESS         = ISNULL([Address 2],'')
,	@IC_ADDRESS2        = ''
,	@IC_CITY            = ISNULL([City 2],'')
,	@IC_STATE           = ISNULL([State 2],'')
,	@IC_ZIPCODE         = ISNULL([Zip Code 2],'')
,	@IC_PHONE           = ISNULL([Phone 2],'')
,	@IC_EMAIL           = ISNULL([Email 2],'')
,	@GROUNDWATER        = ISNULL([Groundwater],0)
,	@SURFACEWATER       = ISNULL([Surface Water],0)
,	@DRINKINGWATER      = ISNULL([Drinking Water],0)
,	@SOIL               = ISNULL([Soil],0)
,	@VAPOR              = ISNULL([Vapor],0)
,	@FREEPRODUCT        = ISNULL([Free Product],0)
,	@UNLEADEDGAS        = ISNULL([Unleaded Gasoline],0)
,	@LEADEDGAS          = ISNULL([Leaded Gasoline],0)
,	@MISCGAS            = ISNULL([Misc# Gasoline],0)
,	@DIESEL             = ISNULL([Diesel (Motor Fuel)],0)
,	@WASTEOIL           = ISNULL([Waste Oil],0)
,	@HEATINGOIL         = ISNULL([Heating Oil],0)
,	@LUBRICANT          = ISNULL([Lubricant],0)
,	@SOLVENT            = ISNULL([Solvent],0)
,	@OTHERPET           = ISNULL([Other Pet# Dist#],0)
,	@CHEMICAL           = ISNULL([Chemical],0)
,	@UNKNOWN            = ISNULL([Unknown Contaminant],0)
,	@MTBE               = ISNULL([MTBE],0)
,	@SUBMIT_DATETIME    = GETDATE()
,	@DEQ_OFFICE         = 'NWR'
FROM	dbo.Online_Petroleum_Release_Report$
ORDER BY RecordID

SELECT	@ErrNbr = @@ERROR

IF @ErrNbr > 0
BEGIN	
	SELECT @ErrorMesage = 'Error in initial SELECT.   '
	GOTO ErrorRoutine
END

SELECT @ErrorMesage = 'Initial SELECT had no error.   '

WHILE	ISNULL(@RecordID,0) <> 0
BEGIN
	SELECT	@SITE_COUNTY = (SELECT	CAST(COUNTY_CODE AS VARCHAR(2))
							FROM	AGENCY.dbo.COUNTIES
							WHERE	COUNTY_NAME = @SiteCounty)
	SELECT	@SOURCEID    = (SELECT	ReleaseSourceId
							FROM	dbo.AssessmentSourceType
							WHERE	ReleaseSourceDescription = @ReleaseType)

	EXEC dbo.apOLPRRInsertIncident
		@ErrorNumber
	,	@CONTRACTOR_UID
	,	@CONTRACTOR_PWD
	,	@REPORTED_BY
	,	@REPORTED_BY_PHONE
	,	NULL		--'Art.Knight@state.or.us'
	,	@RELEASE_TYPE
	,	@DATE_RECEIVED
	,	@FACILITY_ID
	,	@SITE_NAME
	,	@SITE_COUNTY
	,	@STREET_NBR
	,	@STREET_QUAD
	,	@STREET_NAME
	,	@STREET_TYPE
	,	@SITE_ADDRESS
	,	@SITE_CITY
	,	@SITE_ZIPCODE
	,	@SITE_PHONE
	,	@INITIAL_COMMENT
	,	@DISCOVERY_DATE
	,	@CONFIRMATION_CODE
	,	@DISCOVERY_CODE
	,	@CAUSE_CODE
	,	@SOURCEID
	,	@RP_FIRSTNAME
	,	@RP_LASTNAME
	,	@RP_ORGANIZATION
	,	@RP_ADDRESS
	,	@RP_ADDRESS2
	,	@RP_CITY
	,	@RP_STATE
	,	@RP_ZIPCODE
	,	@RP_PHONE
	,	@RP_EMAIL
	,	@IC_FIRSTNAME
	,	@IC_LASTNAME
	,	@IC_ORGANIZATION
	,	@IC_ADDRESS
	,	@IC_ADDRESS2
	,	@IC_CITY
	,	@IC_STATE
	,	@IC_ZIPCODE
	,	@IC_PHONE
	,	@IC_EMAIL
	,	@GROUNDWATER
	,	@SURFACEWATER
	,	@DRINKINGWATER
	,	@SOIL
	,	@VAPOR
	,	@FREEPRODUCT
	,	@UNLEADEDGAS
	,	@LEADEDGAS
	,	@MISCGAS
	,	@DIESEL
	,	@WASTEOIL
	,	@HEATINGOIL
	,	@LUBRICANT
	,	@SOLVENT
	,	@OTHERPET
	,	@CHEMICAL
	,	@UNKNOWN
	,	@MTBE
	,	@SUBMIT_DATETIME
	,	@DEQ_OFFICE
	SELECT	@ErrNbr = @@ERROR

	IF @ErrNbr > 0
		GOTO ErrorRoutine
    
	SELECT	@PrevRecordID = @RecordID
	SELECT	@RecordID     = 0

	 SELECT	TOP 1
		@RecordID			= [RecordID]
	,	@CONTRACTOR_UID     = 'INGRID'		--GOFF'
	,	@CONTRACTOR_PWD     = 'GAFFNEY'		--Const'
	,	@REPORTED_BY        = ISNULL([Reported by],'')
	,	@REPORTED_BY_PHONE  = ISNULL([Reported by Phone],'')
	,	@RELEASE_TYPE       = LEFT(ISNULL([Site Type],''),1)
	,	@DATE_RECEIVED      = [Date Reported]
	,	@FACILITY_ID        = [Facility ID]
	,	@SITE_NAME          = ISNULL([Site Name],'')
	,	@SiteCounty         = ISNULL([Site County],'')
	,	@STREET_NBR         = [Site Street Number]
	,	@STREET_QUAD        = ISNULL([Site Quadrant],'')
	,	@STREET_NAME        = ISNULL([Site Street Name],'')
	,	@STREET_TYPE        = ISNULL([Street Type],'')
	,	@SITE_ADDRESS		= ''
	,	@SITE_CITY          = ISNULL([Site City],'')
	,	@SITE_ZIPCODE       = [Site Zip Code]
	,	@SITE_PHONE         = ISNULL([Site Phone],'')
	,	@INITIAL_COMMENT    = ISNULL([Site Comments],'')
	,	@DISCOVERY_DATE     = [Date Release Discovered]
	,	@CONFIRMATION_CODE  = CASE ISNULL([Confirmation],'Other')
								  WHEN 'Contractor'	THEN 'CN'
								  WHEN 'Rp Report'	THEN 'RR'
								  WHEN 'Staff: DEQ'	THEN 'SI'
								  WHEN 'Lab: DEQ'	THEN 'LD'
								  WHEN 'Lab: RP'	THEN 'LR'
								  WHEN 'Lab: Other'	THEN 'LO'
								  WHEN 'Other'		THEN 'OT'
							  END
	,	@DISCOVERY_CODE     = CASE ISNULL([Discovery],'Other')
								  WHEN 'Decommissioning'	THEN 'DC'
								  WHEN 'Routine Monitoring'	THEN 'RM'
								  WHEN 'Complaint'			THEN 'CP'
								  WHEN 'Leak Detection'		THEN 'IC'
								  WHEN 'Site Assessment'	THEN 'SA'
								  WHEN 'Tightness Test'		THEN 'TT'
								  WHEN 'Other'				THEN 'OT'
							  END
	,	@CAUSE_CODE         = CASE ISNULL([Cause],'Unknown')
								  WHEN 'Overfill'					THEN 'OF'
								  WHEN 'Spill'						THEN 'SS'
								  WHEN 'Corrosion'					THEN 'CR'
								  WHEN 'Install Problem'			THEN 'IP'
								  WHEN 'PhysicalMechanical Damage'	THEN 'PM'
								  WHEN 'Other'						THEN 'OT'
								  WHEN 'Unknown'					THEN 'UN'
							  END
	--,	@SOURCEID           = [Source]
	,	@ReleaseType        = ISNULL([Source],'')
	,	@RP_FIRSTNAME       = ISNULL([First Name],'')
	,	@RP_LASTNAME        = ISNULL([Last Name],'')
	,	@RP_ORGANIZATION    = ISNULL([Organization],'')
	,	@RP_ADDRESS         = ISNULL([Contact Address],'')
	,	@RP_ADDRESS2        = ''
	,	@RP_CITY            = ISNULL([City],'')
	,	@RP_STATE           = ISNULL([State],'')
	,	@RP_ZIPCODE         = ISNULL([Zip Code],'')
	,	@RP_PHONE           = ISNULL([Contact Phone],'')
	,	@RP_EMAIL           = ISNULL([Contact Email],'')
	,	@IC_FIRSTNAME       = ISNULL([First Name 2],'')
	,	@IC_LASTNAME        = ISNULL([Last Name 2],'')
	,	@IC_ORGANIZATION    = ISNULL([Organization 2],'')
	,	@IC_ADDRESS         = ISNULL([Address 2],'')
	,	@IC_ADDRESS2        = ''
	,	@IC_CITY            = ISNULL([City 2],'')
	,	@IC_STATE           = ISNULL([State 2],'')
	,	@IC_ZIPCODE         = ISNULL([Zip Code 2],'')
	,	@IC_PHONE           = ISNULL([Phone 2],'')
	,	@IC_EMAIL           = ISNULL([Email 2],'')
	,	@GROUNDWATER        = ISNULL([Groundwater],0)
	,	@SURFACEWATER       = ISNULL([Surface Water],0)
	,	@DRINKINGWATER      = ISNULL([Drinking Water],0)
	,	@SOIL               = ISNULL([Soil],0)
	,	@VAPOR              = ISNULL([Vapor],0)
	,	@FREEPRODUCT        = ISNULL([Free Product],0)
	,	@UNLEADEDGAS        = ISNULL([Unleaded Gasoline],0)
	,	@LEADEDGAS          = ISNULL([Leaded Gasoline],0)
	,	@MISCGAS            = ISNULL([Misc# Gasoline],0)
	,	@DIESEL             = ISNULL([Diesel (Motor Fuel)],0)
	,	@WASTEOIL           = ISNULL([Waste Oil],0)
	,	@HEATINGOIL         = ISNULL([Heating Oil],0)
	,	@LUBRICANT          = ISNULL([Lubricant],0)
	,	@SOLVENT            = ISNULL([Solvent],0)
	,	@OTHERPET           = ISNULL([Other Pet# Dist#],0)
	,	@CHEMICAL           = ISNULL([Chemical],0)
	,	@UNKNOWN            = ISNULL([Unknown Contaminant],0)
	,	@MTBE               = ISNULL([MTBE],0)
	--,	@SUBMIT_DATETIME    = 
	,	@DEQ_OFFICE         = 'NWR'
	FROM	dbo.Online_Petroleum_Release_Report$
	WHERE	RecordID > @PrevRecordID
	ORDER BY RecordID

END

GOTO EndRoutine


ErrorRoutine:
	SELECT @ErrorMesage += 'An error occurred executing apOLPRRInsertIncident from apInsertOLPRRDownloadData.  @ErrNbr = ' + CAST(@ErrNbr AS VARCHAR(5)) 
																										 + '  @ErrorNumber = ' + CAST(@ErrorNumber AS VARCHAR(5))
																										 + '  @RecordID = ' + CAST(@RecordID AS VARCHAR(5))
	----EXEC msdb.dbo.sp_send_dbmail
	----@Recipients = 'McGovern.Patty@deq.state.or.us;Knight.Art@deq.state.or.us',
	----@body = 'An error occurred executing apOLPRRInsertIncident from apInsertOLPRRDownloadData.  @ErrNbr = ' ,
	----@subject = '*** ERROR ***'
	EXEC msdb.dbo.sp_send_dbmail
	@Recipients = 'QUAN.NGA@deq.state.or.us',
	@body = @ErrorMesage,
	@subject = '*** ERROR ***'
	

EndRoutine:

GO
GRANT EXECUTE ON [dbo].[apInsertOLPRRDownloadData] TO [DEQ\LUSTDataStewards] AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[apInsertOLPRRDownloadData] TO [DEQ\LUSTDataStewards] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apInsUpdAssessmentSiteScoreRangeData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdAssessment
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
 
declare @ErrorMessageHandler VARCHAR(1024), @SiteScoreIdOUT INT, @UpdateSiteScore INT, @LowScore INT, @AvgScore INT, @HighScore INT, @ScoreCount INT, @ScoreRange VARCHAR(10),
@DwReplmeasr INT, @DwImpmeasr INT, @DwImpLiklymeasr INT, @VprLvlmeasr INT, @PopExposdmeasr INT, @EnvTypmeasr INT, @EnvImpLilelymeasr INT, @NonDwSupTypmeasr INT, @UtImpmeasr INT
					,@RainfallAnnualmeasr INT, @SoilPermmeasr INT, @AqfrDepthmeasr INT, @SwDistmeasr INT

SET @DwReplmeasr = 0
SET @DwImpmeasr = 0
SET @DwImpLiklymeasr = 0
SET @VprLvlmeasr = 0
SET @PopExposdmeasr = 1
SET @EnvTypmeasr = 0
SET @EnvImpLilelymeasr = 0
SET @NonDwSupTypmeasr = 0
SET @UtImpmeasr = 0
SET @RainfallAnnualmeasr = 0
SET @SoilPermmeasr = 0
SET @AqfrDepthmeasr = 1
SET @SwDistmeasr = 0

EXEC apInsUpdAssessmentSiteScoreRangeData 51265, 51265, 51846, NULL, 1
					,1, 3, 1, 0, 0
					,0, 0, 1, 0, 0
					,0, 1, 0, 0, 0
					,0, 1, 0, 0, 1
					,0, 0, 1, 1, 0
					,0, 1, 1, 0, 0
					,0, 1, 0, 0, 460
					,NULL, NULL, 'agueda', @ErrorMessageHandler OUTPUT, 460
					,@SiteScoreIdOUT OUTPUT, @DwReplmeasr, @DwImpmeasr, @DwImpLiklymeasr, @VprLvlmeasr
					,@PopExposdmeasr, @EnvTypmeasr, @EnvImpLilelymeasr, @NonDwSupTypmeasr, @UtImpmeasr
					,@RainfallAnnualmeasr, @SoilPermmeasr, @AqfrDepthmeasr, @SwDistmeasr, @UpdateSiteScore OUTPUT
					,@LowScore OUTPUT, @AvgScore OUTPUT, @HighScore OUTPUT, @ScoreCount OUTPUT, @ScoreRange OUTPUT 
 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apInsUpdAssessmentSiteScoreRangeData]
     @AssessmentIdIN int 
	,@AssessmentIdOUT int OUTPUT --Primary Key
	,@LustId int
    ,@DiscoverDate datetime  -- todo bdyer 11 april 2007
	,@ConfirmationId int

	,@DiscoveryId int
	,@ReleaseCauseId int
	,@ReleaseSourceId int    -- todo bdyer 11 april 2007
	,@SLMediaInd bit
	,@GWMediaInd bit

	,@SWMediaInd bit
	,@DWMediaInd bit
	,@FVMediaInd bit
	,@FPMediaInd bit
	,@UNMediaInd bit

	,@UGContamInd bit
	,@LGContamInd bit
	,@MGContamInd bit
	,@DSContamInd bit
	,@WOContamInd bit

	,@LBContamInd bit
	,@SVContamInd bit
	,@OPContamInd bit
	,@CHContamInd bit
	,@UNContamInd bit

	,@MTBEContamInd bit
	,@HOContamInd bit
	,@CleanupNecessaryInd bit
	,@OffSiteMigrationInd bit
	,@FPRemovedInd bit

	,@VPRemovedInd bit
	,@DelineateSL bit
	,@DelineateGW bit
	,@SLDelineated bit
	,@GWDelineated bit

	,@GWCompMonitoring bit
	,@CAPRequested bit
	,@CAPSubmitted bit
	,@CAPApproved bit
    ,@CurrentSiteScore int

	,@AmntRelCmnt varchar(8000)
	,@ContamCmnt varchar(8000)
	,@LastChangeBy VARCHAR(64)
	,@ErrorMessageHandler VARCHAR(1024) OUTPUT
    ,@SiteScoreIdIn			INT

	,@SiteScoreIdOUT		INT OUTPUT
	,@DwReplmeasr			INT = 0
	,@DwImpmeasr			INT = 0 
	,@DwImpLiklymeasr		INT = 0
	,@VprLvlmeasr			INT  
	
	,@PopExposdmeasr		INT 
	,@EnvTypmeasr			INT 
	,@EnvImpLilelymeasr		INT 
	,@NonDwSupTypmeasr		INT 
	,@UtImpmeasr			INT 

	,@RainfallAnnualmeasr	INT 
	,@SoilPermmeasr			INT 
	,@AqfrDepthmeasr		INT 
	,@SwDistmeasr			INT 
	,@UpdateSiteScore		INT				OUTPUT

	,@LowScore				INT				OUTPUT 
    ,@AvgScore				INT				OUTPUT
    ,@HighScore				INT				OUTPUT 
    ,@ScoreCount			INT				OUTPUT	
    ,@ScoreRange			CHAR(10)        OUTPUT 




AS
DECLARE @Result INT
SELECT @Result = 0


-- Business Rules Validation ---------------------------------------------------------

-- Do not run this code without a pre-existing LUST ID.
IF NOT (@LustId > 0) 
       BEGIN
       SET @ErrorMessageHandler ='An Assessment record can''t be created without a LUST Incident.'
       SET @Result = @@Error
       GOTO ABORT
       END


 -- todo bdyer 11 april 2007

--A Discovery, Cause of Release, Source of Release, and Confirmation value must be present.
IF NOT ((@ConfirmationId > 0) AND (@DiscoveryId > 0) AND (@ReleaseCauseId > 0) AND (@ReleaseSourceId > 0))
       BEGIN
       SET @ErrorMessageHandler = 'A Discovery, Cause of Release, Source of Release, and Confirmation value must exist.'
       SET @Result = @@Error
       GOTO ABORT
       END

-- One or more Medias must be selected
-- Media VALUES COULD BE 1, 0 OR NULL.
IF ((@SLMediaInd <> 1) AND
    (@GWMediaInd <> 1) AND
    (@SWMediaInd <> 1) AND
	(@DWMediaInd <> 1) AND
	(@FVMediaInd <> 1) AND
	(@FPMediaInd <> 1) AND
	(@UNMediaInd <> 1))
        BEGIN
        SET @ErrorMessageHandler = 'One or more Medias must be selected.'
        Set @Result = @@Error
        GoTo ABORT
        END

-- One or more Contaminants must be selected
-- Contaminant VALUES COULD BE 1, 0 OR NULL.
IF ((@UGContamInd <> 1) AND
	(@LGContamInd <> 1) AND
	(@MGContamInd <> 1) AND
	(@DSContamInd <> 1) AND
	(@WOContamInd <> 1) AND
	(@LBContamInd <> 1) AND
	(@SVContamInd <> 1) AND
	(@OPContamInd <> 1) AND
	(@CHContamInd <> 1) AND
	(@UNContamInd <> 1) AND
	(@MTBEContamInd <> 1) AND
	(@HOContamInd <> 1))
        BEGIN
        SET @ErrorMessageHandler = 'One or more Contaminants must be selected.'
        Set @Result = @@Error
        GoTo ABORT
        END


-----------------------------------------------------------------------------------------

IF @AssessmentIdIn  = 0 --Primary Key 
	BEGIN
	INSERT INTO [dbo].[Assessment] 
		(
		 [LustId]

        ,DiscoverDate       -- todo bdyer 11 april 2007

		,[ConfirmationId]
		,[DiscoveryId]
		,[ReleaseCauseId]

        ,ReleaseSourceId    -- todo bdyer 11 april 2007

		,[SLMediaInd]
		,[GWMediaInd]
		,[SWMediaInd]
		,[DWMediaInd]
		,[FVMediaInd]
		,[FPMediaInd]
		,[UNMediaInd]
		,[UGContamInd]
		,[LGContamInd]
		,[MGContamInd]
		,[DSContamInd]
		,[WOContamInd]
		,[LBContamInd]
		,[SVContamInd]
		,[OPContamInd]
		,[CHContamInd]
		,[UNContamInd]
		,[MTBEContamInd]
		,[HOContamInd]
		,[CleanupNecessaryInd]
		,[MigrationInd]
		,[FPRemovedInd]
		,[VPRemovedInd]
		,[DelineateSL]
		,[DelineateGW]
		,[SLDelineated]
		,[GWDelineated]
		,[GWCompMonitoring]
		,[CAPRequested]
		,[CAPSubmitted]
		,[CAPApproved]
                ,CurrentSiteScore
		,[AmntReleaseComment] 
		,[ContamComment]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @LustId

        ,@DiscoverDate

		,@ConfirmationId
		,@DiscoveryId
		,@ReleaseCauseId

        ,@ReleaseSourceId

		,@SLMediaInd
		,@GWMediaInd
		,@SWMediaInd
		,@DWMediaInd
		,@FVMediaInd
		,@FPMediaInd
		,@UNMediaInd
		,@UGContamInd
		,@LGContamInd
		,@MGContamInd
		,@DSContamInd
		,@WOContamInd
		,@LBContamInd
		,@SVContamInd
		,@OPContamInd
		,@CHContamInd
		,@UNContamInd
		,@MTBEContamInd
		,@HOContamInd
		,@CleanupNecessaryInd
		,@OffSiteMigrationInd
		,@FPRemovedInd
		,@VPRemovedInd
		,@DelineateSL
		,@DelineateGW
		,@SLDelineated
		,@GWDelineated
		,@GWCompMonitoring
		,@CAPRequested
		,@CAPSubmitted
		,@CAPApproved
                ,@CurrentSiteScore
		,@AmntRelCmnt
		,@ContamCmnt
		,@LastChangeBy
		,GETDATE() 
		)
        SELECT @Result  = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
        IF     @Result  <> 0
               BEGIN
               GOTO ABORT
               END

	SELECT @AssessmentIdOut = SCOPE_IDENTITY() --scope_identity()
	
	SELECT @Result = @@ERROR
	IF     @Result <> 0
           BEGIN
	       GOTO ABORT
           END 

	END    -- END OF INSERT ROUTINE.

ELSE           -- BEGIN UPDATE ROUTINE
	BEGIN
		UPDATE [dbo].[Assessment] 
			SET
			  DiscoverDate = @DiscoverDate            -- todo bdyer 11 april 2007

			,[ConfirmationId] = @ConfirmationId 
			,[DiscoveryId] = @DiscoveryId 
			,[ReleaseCauseId] = @ReleaseCauseId 

			,ReleaseSourceId = @ReleaseSourceId      -- todo bdyer 11 april 2007

			,[SLMediaInd] = @SLMediaInd 
			,[GWMediaInd] = @GWMediaInd 
			,[SWMediaInd] = @SWMediaInd 
			,[DWMediaInd] = @DWMediaInd 
			,[FVMediaInd] = @FVMediaInd 
			,[FPMediaInd] = @FPMediaInd 
			,[UNMediaInd] = @UNMediaInd 
			,[UGContamInd] = @UGContamInd 
			,[LGContamInd] = @LGContamInd 
			,[MGContamInd] = @MGContamInd 
			,[DSContamInd] = @DSContamInd 
			,[WOContamInd] = @WOContamInd 
			,[LBContamInd] = @LBContamInd 
			,[SVContamInd] = @SVContamInd 
			,[OPContamInd] = @OPContamInd 
			,[CHContamInd] = @CHContamInd 
			,[UNContamInd] = @UNContamInd 
			,[MTBEContamInd] = @MTBEContamInd 
			,[HOContamInd] = @HOContamInd 
			,[CleanupNecessaryInd] = @CleanupNecessaryInd 
			,[MigrationInd] = @OffSiteMigrationInd
			,[FPRemovedInd] = @FPRemovedInd 
			,[VPRemovedInd] = @VPRemovedInd 
			,[DelineateSL] = @DelineateSL 
			,[DelineateGW] = @DelineateGW 
			,[SLDelineated] = @SLDelineated 
			,[GWDelineated] = @GWDelineated 
			,[GWCompMonitoring] = @GWCompMonitoring 
			,[CAPRequested] = @CAPRequested 
			,[CAPSubmitted] = @CAPSubmitted 
			,[CAPApproved] = @CAPApproved 
			,CurrentSiteScore = @CurrentSiteScore
			,[AmntReleaseComment] =  @AmntRelCmnt
			,[ContamComment] = @ContamCmnt
			,[LastChangeBy] = @LastChangeBy
			,[LastChangeDate] = GETDATE() 
		   WHERE    [AssessmentId] = @AssessmentIdIn --Primary Key
 
		   SELECT @Result  = @@ERROR
		   SET @ErrorMessageHandler = Error_Message()
		   IF     @Result  <> 0
				  BEGIN
					  GOTO ABORT
				  END

		   SELECT @AssessmentIdOut = @AssessmentIdIn --Primary Key  

		   SELECT @Result  = @@ERROR
		   SET @ErrorMessageHandler = Error_Message()
		   IF     @Result  <> 0
				  BEGIN
					  GOTO ABORT
				  END
	END 


	-- Update the Site Score Values (Lower section of Assessment UI drop down values)

	IF ISNULL(@SiteScoreIdIn, 0) = 0
		BEGIN
	       INSERT INTO [dbo].[SiteScoreValues] 
			(
			 [LustId]
	       	,[DwReplMeasure]
			,[DwImpMeasure]
			,[DwImpLiklyMeasure]
			,[VprLvlmeasure]
			,[PopExposdmeasure]
			,[EnvTypmeasure]
			,[EnvImpLilelymeasure]
			,[NonDwSupTypmeasure]
			,[UtImpmeasure]
			,[RainfallAnnualmeasure]
			,[SoilPermmeasure]
			,[AqfrDepthmeasure]
			,[SwDistmeasure]
			,[LastChangeBy]
			,[LastChangeDate]
			) 
		   VALUES 
			(
			 @LustId
			,@DwReplmeasr
			,@DwImpmeasr
			,@DwImpLiklymeasr
			,@VprLvlmeasr
			,@PopExposdmeasr
			,@EnvTypmeasr
			,@EnvImpLilelymeasr
			,@NonDwSupTypmeasr
			,@UtImpmeasr
			,@RainfallAnnualmeasr
			,@SoilPermmeasr
			,@AqfrDepthmeasr
			,@SwDistmeasr
            ,@LastChangeBy
			,GETDATE()
			)

			SET @SiteScoreIdOut = Scope_Identity()


			SET @ErrorMessageHandler = Error_Message()
			SELECT @Result = @@ERROR
			IF @Result <> 0
				BEGIN
					GOTO ABORT
				END

		END
	ELSE                            --<<<< ELSE UPDATE ROUTINE
		BEGIN
			UPDATE [dbo].[SiteScoreValues] 
					SET
				[LustId] = @LustId 
				,[DwReplmeasure] = @DwReplmeasr 
				,[DwImpmeasure] = @DwImpmeasr 
				,[DwImpLiklymeasure] = @DwImpLiklymeasr 
				,[VprLvlmeasure] = @VprLvlmeasr 
				,[PopExposdmeasure] = @PopExposdmeasr 
				,[EnvTypmeasure] = @EnvTypmeasr 
				,[EnvImpLilelymeasure] = @EnvImpLilelymeasr 
				,[NonDwSupTypmeasure] = @NonDwSupTypmeasr 
				,[UtImpmeasure] = @UtImpmeasr 
				,[RainfallAnnualmeasure] = @RainfallAnnualmeasr 
				,[SoilPermmeasure] = @SoilPermmeasr 
				,[AqfrDepthmeasure] = @AqfrDepthmeasr 
				,[SwDistmeasure] = @SwDistmeasr 
				,[LastChangeBy] = @LastChangeBy
				,[LastChangeDate] = GETDATE() 
			WHERE    [SiteScoreId] = @SiteScoreIdIn  --Primary Key

			SET @ErrorMessageHandler = Error_Message()
			SELECT @Result = @@ERROR
			IF @Result <> 0
				BEGIN
					GOTO ABORT
				END

			SET @SiteScoreIdOUT = @SiteScoreIdIn
		END



	-- Update the Score Data

	EXEC [apUpdateSiteScoreData] @LustId, @UpdateSiteScore OUTPUT, @ErrorMessageHandler OUTPUT,@LowScore OUTPUT, @AvgScore OUTPUT, 
		@HighScore OUTPUT, @ScoreCount OUTPUT, @ScoreRange OUTPUT 
	

	SELECT @Result  = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF     @Result  <> 0
			BEGIN
				GOTO ABORT
			END		

/* Or, in case of failure... */
ABORT:
      RETURN @Result




GO
GRANT EXECUTE ON [dbo].[apInsUpdAssessmentSiteScoreRangeData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdConsultantData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdConsultant
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apInsUpdConsultantData]
	 @ConsultantIDIn  		INT   
    ,@ConsultantIDOut 		INT 		= 0 OUTPUT
	,@CompanyName			VARCHAR(40)
	,@Address				VARCHAR(40)
	,@City					VARCHAR(20)
	,@State					VARCHAR(2)
	,@Zip					VARCHAR(10)
	,@Phone					VARCHAR(40)
	,@Fax					VARCHAR(40)	= NULL
	,@Email					VARCHAR(40)	= NULL
	,@LastChangeBy			VARCHAR(64)
	,@ErrorMessageHandler	VARCHAR(1024) OUTPUT
AS
DECLARE @Result int
SELECT  @Result = 0

-------------------------------------------------------------------------
-- Business Rules Validation 

-- Company Name is required
IF @CompanyName IS NULL OR LEN(RTRIM(@CompanyName)) = 0
	BEGIN
		SET @ErrorMessageHandler = 'Company Name is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Address is required
IF @Address IS NULL OR LEN(RTRIM(@Address)) = 0
	BEGIN
		SET @ErrorMessageHandler = 'Address is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- City is required
IF @City IS NULL OR LEN(RTRIM(@City)) = 0
	BEGIN
		SET @ErrorMessageHandler = 'City is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- State is required
IF @State IS NULL OR LEN(RTRIM(@State)) = 0
	BEGIN
		SET @ErrorMessageHandler = 'State is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Zip is required
IF @Zip IS NULL OR LEN(RTRIM(@Zip)) = 0
	BEGIN
		SET @ErrorMessageHandler = 'Zip Code is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Phone is required
IF @Phone IS NULL OR LEN(RTRIM(@Phone)) = 0
	BEGIN
		SET @ErrorMessageHandler = 'Phone is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-------------------------------------------------------------------------
-- Insert/Update

IF @consultantIDIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[Consultant] 
		(
		 [CompanyName]
		,[Address]
		,[City]
		,[State]
		,[ZipCode]
		,[Phone]
		,[Fax]
		,[EmailAddress]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @CompanyName
		,@Address 					
		,@City		 
		,@State	
		,@Zip			
		,@Phone	
		,@Fax	
		,@Email				
        ,@LastChangeBy
		,GETDATE()
             )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @ConsultantIDOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[Consultant] 
        SET
		 [CompanyName]		= @CompanyName
		,[Address]			= @Address
		,[City]				= @City
		,[State]			= @State
		,[ZipCode]			= @Zip
		,[Phone]			= @Phone
		,[Fax]				= @Fax
		,[EmailAddress]		= @Email
		,[LastChangeBy]		= @LastChangeBy
		,[LastChangeDate]		= GETDATE()

	WHERE [ID] = @ConsultantIDIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @ConsultantIDOut = @ConsultantIDIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------


/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	








GO
GRANT EXECUTE ON [dbo].[apInsUpdConsultantData] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apUpdLUSTAffilPartyData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[apUpdLUSTAffilPartyData](
				@AffilID		Integer			= 0,
				@StartDate		DateTime		= NULL,
				@EndDate		DateTime		= NULL,
				@Organization	VarChar(40)		= '',
				@SubOrg			VarChar(40)		= '',
				@JobTitle		VarChar(40)		= '',
				@FirstName		VarChar(40)		= '',
				@LastName		VarChar(40)		= '',
				@Phone			VarChar(40)		= '',
				@Email			VarChar(40)		= '',
				@Street			VarChar(56)		= '',
				@City			VarChar(25)		= '',
				@ZIP			VarChar(10)		= '',
				@State			VarChar(2)		= '',
				@Country		VarChar(25)		= '',
				@Comments		VarChar(2000)  	= 0,
				@LastChangeBy   VARCHAR(64)         ,
				@PartyID		Integer			= 0  OUTPUT,
				@ErrMsg			VarChar(1024)	= '' OUTPUT,
				@Result			Bit				= 0  OUTPUT
)AS
/* ===================================================================================
--	Author:			Lewis L0
--	Create date:	June 19,2006
--	Description:	This procedure is created to replace the original version, called
--					apUpdLUSTContactByAffilID.
--
--					- This procedure update an existing LUST Party record.
--					- Party ID might be changed when the key values of Organization/ 
--					  SubOrg/JobTitle/Last/First Name was changed.
--					- The Party record is assuming to associate with a Contact Person 
--					   and a Mailing Address record.
--					- Existing Party record might be over-rided if it was not 
--					  referenced by any program affiliation.
--					- See Decision Table in Sourcesafe. 
--					- LUST Invoicee record is not allowed to change after relevant
--					  entry was made in CRIS Database.
--
--					The following tables are updated:
--					-  ADDR.dbo.LUSTAffilCntcts
--					-  ADDR.dbo.AffilParty
--					-  ADDR.dbo.AffilContacts
--					-  ADDR.dbo.ContactPerson
--					-  ADDR.dbo.MailAddress		
--					-  ADDR.dbo.Organization
--
--	Input:			@AffilID
--					@StartDate
--					@EndDate
--					@Organization	
--					@SubOrg	
--					@JobTitle
--					@FirstName
--					@LastName
--					@Phone
--					@Email	
--					@Street	
--					@City		
--					@State		
--					@ZIP		
--					@Country
--					@Comments
--                                                     		   
--	Output:			@PartyID
--					@ErrMsg		
--					@Result		1 = Update successfully
--								0 = Failure
--
--	Modification:
--	Date	   Initials	Details
-- --------   --------	-------------------------------------------------------------------
--	06/17/05   llo		Use sub-stored procedure (i.e. bpChkAffilDates) to 
--						validates Affiliation Dates rather than inline codes.
--	08/24/05   llo		Bugs Fixed - Branch to incorrect label.
--	10/13/05   llo		Modifications - Replace sub-routine call of bpChkAffilDates
--						with bpChkDupAffilParty(ADDR) for validation of Affiliation
--						Dates.
--	05/10/06   llo		Modifcations - Add checking for JobTitle to require Organization
--						exist.
--	06/19/06   llo		Modifications - Add input parameter, SubOrg.
--	10/11/06   llo		Bugs Fixed - Procedure attempted to delete Party report event 
--						replaced record was not found.
--	10/12/06   llo		Modifications - Added sub-routine to check if LUST Incident was 
--						entered into CRIS System before allowing INVOICEE record to be 
--						changed.
--	10/16/06   llo		Modifications - Allowed LUST users to over-write and existing 
--						Contact record (change cases only - Upper-case to mixed-case).
------------------------------------------------------------------------------------------*/

BEGIN
	SET NOCOUNT ON

	DECLARE @ErrNum 			Integer, 
			@RowNum 			Integer,
			@SysErr				Integer,	
			@PgmRef				VarChar(10),
			@LustID				Integer,
			@IsActive			Bit,
			@AffilName			VarChar(40),
--			@SubOrg				VarChar(40),
			@Suffix				VarChar(15),
			@Phone2				VarChar(40),
			@Fax				VarChar(40),
			@MI					Char(1),
			@DBEmail			VarChar(40),
			@OwnshpCd			Char(1),
			@RevACId			Integer,
			@RevOrgID			Integer,
			@RevCPId			Integer,
			@RevMAId			Integer,
			@AffilType			VarChar(3),
			@AffilTypeDesc		VarChar(40),
			@CurPartyID			Integer,
			@CurACId			Integer,
			@CurPgmInt			VarChar(4),
			@CurOrgID			Integer,
			@CurCPId			Integer,
			@CurMAId			Integer,
			@IsIndv				Bit,
			@CurLegalNm			VarChar(40),
			@CurPartyComments	VarChar(2000),
			@CurPartyOwnshp		Char(1),
			@OrgChgd			Bit,
			@CPChgd				Int,
			@MAChgd				Bit,
			@ReplPartyFound		Bit,
			@ReplOrgFound		Bit,
			@ReplCPFound		Bit,
			@ReplMAFound		Bit,
			@ReqUpdAC			Bit,
			@ReqInsParty		Bit,
			@ReqUpdParty		Bit,
			@ReqDelParty		Bit,
			@ReqInsOrg			Bit,
			@ReqUpdOrg			Bit,
			@ReqDelOrg			Bit,
			@ReqInsCP			Bit,
			@ReqUpdCP			Bit,
			@ReqDelCP			Bit,
			@ReqInsMA			Bit,
			@ReqUpdMA			Bit,
			@ReqDelMA			Bit,
			@ReqDelPtyAddr		Bit,
	 		@MayDelCP 			Bit,
			@MayDelMA 			Bit,
			@MayDelOrg			Bit,
			@MayDelParty		Bit,
			@IsDupRec			Bit,
			@MA_LastUpdBy		Integer,
			@Dummy				Integer,
			@StaffID			Integer,
			@LUST				VarChar(4),
			@RESPARTY			Char(1),
			@INVOICEE			VarChar(3),
			@UNKNOWN			Char(1),
			@CMNFACID			Integer,
			@ORG_NAME			Char(1),
			@ADDR_ADMIN			Integer,		-- 10/16/2006 - Changed.
			@NOW				DateTime,
			@TRUE 				Bit, 
			@FALSE 				Bit
	SELECT  @ErrNum 			= 0, 
			@RowNum 			= 0,
			@SysErr				= 0,
			@PgmRef				= '',
			@LustID				= 0,
			@IsActive			= 0,
			@AffilName			= '',
--			@SubOrg				= '',
			@Suffix				= '',
			@Phone2				= '',
			@Fax				= '',
			@MI					= '',
			@DBEmail			= '',
			@OwnshpCd			= '',
			@PartyID			= 0,
			@RevACId			= 0,
			@AffilType			= '',
			@AffilTypeDesc		= '',
			@CurPartyID			= 0,
			@CurACId			= 0,
			@CurPgmInt			= '',
			@CurOrgID			= 0,
			@CurCPId			= 0,
			@CurMAId			= 0,
			@IsIndv				= 0,
			@CurLegalNm			= '',
			@CurPartyComments	= '',
			@CurPartyOwnshp		= ' ',
			@RevOrgID			= 0,
			@RevCPId			= 0,
			@RevMAId			= 0,
			@OrgChgd			= 0,
			@CPChgd				= 0,
			@MAChgd				= 0,
			@ReplPartyFound		= 0,
			@ReplOrgFound		= 0,
			@ReplCPFound		= 0,
			@ReplMAFound		= 0,
			@ReqUpdAC			= 0,
			@ReqInsParty		= 0,
			@ReqUpdParty		= 0,
			@ReqDelParty		= 0,
			@ReqInsOrg			= 0,
			@ReqUpdOrg			= 0,
			@ReqDelOrg			= 0,
			@ReqInsCP			= 0,
			@ReqUpdCP			= 0,
			@ReqDelCP			= 0,
			@ReqInsMA			= 0,
			@ReqUpdMA			= 0,
			@ReqDelMA			= 0,
			@ReqDelPtyAddr		= 0,
	 		@MayDelCP 			= 0,
			@MayDelMA 			= 0,
			@MayDelOrg			= 0,
			@MayDelParty		= 0,
			@IsDupRec			= 0,
			@MA_LastUpdBy		= 0,
			@Dummy				= 0,
			@StaffID			= 0,
			@Result 			= 0,
			@ErrMsg				= '',
			@LUST				= 'LUST',
			@INVOICEE			= 'INV',
			@RESPARTY			= 'R',
			@UNKNOWN			= 'U',
			@CMNFACID			= 0,
			@ORG_NAME			= 'O',
			@ADDR_ADMIN			= 499979,		-- 10/16/2006- changed.
			@NOW				= GETDATE(),
			@TRUE 				= 1, 
			@FALSE 				= 0

--	1.	Validates input parameters...
--	1a.	If relevant Affiliation/Party not found, 
--		don't continue...

	SELECT 	@LastName		= LTRIM(ISNULL(@LastName,'')),
			@Organization	= LTRIM(ISNULL(@Organization,'')),
			@SubOrg			= LTRIM(ISNULL(@SubOrg,'')),
			@JobTitle		= LTRIM(ISNULL(@JobTitle,'')),
			@OwnshpCd		= @UNKNOWN,
			@Email			= LTRIM(ISNULL(@Email,'')),
			@Street			= LTRIM(ISNULL(@Street,'')),
			@FirstName		= ISNULL(@FirstName,''),
			@City			= ISNULL(@City,''),
			@State			= ISNULL(@State,''),
			@ZIP			= ISNULL(@ZIP,''),
			@Country		= ISNULL(@Country,'')

	SELECT 	@AffilType		= af.fkAffilType,
			@LustID			= af.fkPgmRefID,
			@IsActive		= af.IsActive,
			@AffilTypeDesc	= ty.AffilTypeDesc,
			@CurPartyID		= ec.fkPartyID,
			@CurOrgID 		= cp.fkOrgID,
--			@SubOrg			= ISNULL(cp.SubOrg,''),
			@Suffix			= ISNULL(cp.Suffix,''),
			@MI				= CASE WHEN @LastName <> '' THEN ISNULL(cp.MI,'')
							  ELSE '' END,
			@Phone2			= ISNULL(cp.PhoneNbr2,''),
			@Fax			= ISNULL(cp.FaxNbr,''),
			@DBEmail		= ISNULL(cp.eMailAddr,''),
			@CurACId		= pc.AffilCntctID,
			@CurCPId		= pc.fkCntctPerID,
			@CurMAId		= pc.fkAddrID,
			@CurPgmInt		= pc.CreatedBy,
			@MA_LastUpdBy	= ISNULL(ma.LastUpdBy,0),
			@AffilName		= ISNULL(LTRIM(@Organization),'')
	FROM AGENCY.dbo.Affiliation af
	INNER JOIN AGENCY.dbo.AffilTypes ty
		ON ty.fkPgmInt 	  = @LUST
	       AND ty.AffilTypeCd = af.fkAffilType
	INNER JOIN ADDR.dbo.LUSTAffilCntcts ec
		ON af.AffilID = ec.fkAffilID
	INNER JOIN ADDR.dbo.vPartyCntct pc
		ON pc.PartyID = ec.fkPartyID
	INNER JOIN ADDR.dbo.ContactPerson cp
		ON pc.fkCntctPerID = cp.CntctPerID
	LEFT OUTER JOIN ADDR.dbo.MailAddress ma
		ON pc.fkAddrID = ma.AddrID
	WHERE af.AffilID   = @AffilID
	SELECT @ErrNum = @@ERROR, @RowNum = @@ROWCOUNT
	IF @ErrNum <> 0
		GOTO ExitRtn

	IF @RowNum = 0
	BEGIN
		SELECT	@ErrNum	= 51001,
				@ErrMsg = 'Affiliation record(ID#' + CAST(@AffilID AS VarChar(8)) + ') is not found.'
		GOTO ExitRtn
	END

--	1b.	If Contact Type is 'Invoicee', don't continue...
--		10/12/2006 - Changed.

	IF @AffilType <> @INVOICEE	
		GOTO ValidateOrgRtn

	IF EXISTS  (SELECT 1 FROM CRIS.dbo.Project
				WHERE LustID = @LustID)
	BEGIN
		SELECT	@ErrNum	= 51002,
				@ErrMsg = 'LUST Invoicee record(ID#' + CAST(@AffilID AS VarChar(8)) + ') is not allowed to change after LUST Incident entered into CRIS System.'
		GOTO ExitRtn
	END

--	1c.	If StartDate/EndDate is invalid/missing, don't continue...
--		10/13/2005 - Changed
/*
	IF @StartDate IS NULL
	BEGIN
		SELECT	@ErrNum	= 51003,
				@ErrMsg = 'Start Date of ''' + @AffilTypeDesc + ''' record is missing.'
		GOTO ExitRtn
	END

	IF  @EndDate IS NOT NULL
	AND @EndDate < @StartDate
	BEGIN
		SELECT	@ErrNum	= 51004,
				@ErrMsg = 'End Date of ''' + @AffilTypeDesc + ''' record is invalid.'
		GOTO ExitRtn
	END
*/

--	1d.	Organization and Contact Person info.
--		If something is missing/incorrect, don't continue...
--		5/10/2006 - Changed.

ValidateOrgRtn:
	IF (@Organization = '') AND (@JobTitle <> '')
	BEGIN
		SELECT	@ErrNum	= 51004,
				@ErrMsg = 'Organization is required when Title is entered.'
		GOTO ExitRtn
	END


	EXEC @ErrNum = ADDR.dbo.bpValidPartyInfo @LUST,
											 @LastName		OUTPUT,
											 @FirstName		OUTPUT,
											 @MI,
											 @Organization	OUTPUT,
											 @OwnshpCd,
											 @IsIndv    	OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @ErrNum = 0
		GOTO ValidAddrRtn

	SELECT @ErrMsg = ADDR.dbo.fnCntctPerErrMsg (@ErrNum)
	GOTO ExitRtn

--	1e.	Email and Mailing Address.
--		If something is missing/incorrect, don't continue...

ValidAddrRtn:
	IF @IsIndv = @TRUE
		SELECT @AffilName = @Organization

	IF (@Street = '')
	BEGIN
		SELECT	@ErrNum	= 51005,
				@ErrMsg = 'Address - Street Name or PO Box is missing.'
		GOTO ExitRtn 
	END
	
	EXEC @ErrNum = ADDR.dbo.bpValidAddrInfo @Email,
											@Street		OUTPUT,
											@City		OUTPUT,
											@State,
											@ZIP,
											@Country	OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr	
		GOTO ExitRtn
	END

	IF @ErrNum = 0
		GOTO  CompOrgRtn

	SELECT @ErrMsg = ADDR.dbo.fnMailAddrErrMsg (@ErrNum)
	GOTO ExitRtn

	
--	2.	Is Organization changed?
--		Compare Contact Person record with the input parameters
--		and determinate the further process...

CompOrgRtn:
	SELECT  @OrgChgd = ADDR.dbo.fnIsOrgChg (@CurOrgID, 
											@IsIndv, 
											@Organization)
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @OrgChgd IS NULL
	BEGIN
		SELECT	@ErrNum	= 51006,
			@ErrMsg = 'Comparison of Organization Names('
					   + CAST(@CurOrgID AS VarChar(8)) + '/'
					   + @Organization + ' failed.'
		GOTO ExitRtn
	END

	IF @OrgChgd = @FALSE
		SELECT @RevOrgID = @CurOrgID
	ELSE
	BEGIN
		SELECT	@CPChgd 	= @TRUE,
--				@SubOrg		= '',
				@Suffix    	= '',
				@MI	   		= '',
				@Phone2    	= '',
				@Fax	   	= ''
		GOTO CompMARtn
	END


--	3.	Is other Contact Person data changed?
--		Compare Contact Person key fields with the input parameters
--		and determinate the further process...

	SELECT @CPChgd = ADDR.dbo.fnIsCntctPerDiff(@CurCPId,
											   @SubOrg,
											   @JobTitle,
											   @LastName,
											   @FirstName,
											   @MI,
											   @Suffix,
											   @Phone)
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @CPChgd IS NULL
	BEGIN
		SELECT	@ErrNum	= 51007,
			@ErrMsg = 'Comparison of Contact Person('
			       + CAST(@CurCPId AS VarChar(8))
			       + ') failed.'
		GOTO ExitRtn
	END

--	10/11/2006 - Changed.

	IF @CPChgd = @FALSE
		SELECT 	@RevCPId = @CurCPId
	ELSE
		SELECT	@Suffix	= '',
--				@SubOrg	= '',
				@MI		= '',
				@Phone2	= '',
				@Fax	= ''
			
--	4.	Is Mailing Address change?
--		If associated Mailing Address record existed, compare it with 
--		the input parameters and determinate the further process...

CompMARtn:
	IF (@CurMAId IS NULL)
	BEGIN
		SELECT @MAChgd = @TRUE	
		GOTO FindReplOrgRtn
	END

	SELECT @MAChgd = ADDR.dbo.fnIsMailAddrChg(@CurMAId,
											  @Street,
											  @City,
											  @State,
											  @ZIP,
											  @Country)
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @MAChgd IS NULL
	BEGIN
		SELECT	@ErrNum	= 51008,
				@ErrMsg = 'Comparison of Mailing Address ('
					   + CAST(@CurMAId AS VarChar(8))
					   + ') failed.'
		GOTO ExitRtn
	END

	IF @MAChgd = @FALSE
		SELECT @RevMAId = @CurMAId

--	10/11/2006 - Changed.

	IF (@CPChgd = @FALSE) AND (@MAChgd = @FALSE)
		SELECT @PartyID = @CurPartyID
			

--	5.	If Organization/Contact Person/Mailing Address record key fields 
--		changed, need to confirm if the revised record(s) were created 
--		before...
--	5a.	In case the Organization key field changed...

FindReplOrgRtn:
	IF @OrgChgd = @FALSE
		GOTO FindReplCPRtn

	EXEC @ErrNum = ADDR.dbo.bpSrhOrgID @IsIndv,
									   @Organization,
									   @RevOrgID OUTPUT
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF (@ErrNum = 0)
	BEGIN
		SELECT @ReplOrgFound = CASE WHEN (@RevOrgID > 0) THEN @TRUE
							   ELSE @FALSE END
		GOTO FindReplCPRtn
	END

	SELECT @ErrMsg = ADDR.dbo.fnCntctPerErrMsg (@ErrNum)
	GOTO ExitRtn


--	5b.	In case the Contact Person key field(s) changed...
FindReplCPRtn:
	IF (@CPChgd = @FALSE) AND (@OrgChgd = @FALSE)
		GOTO FindReplMARtn

	IF (@OrgChgd = @TRUE) AND (@ReplOrgFound = @FALSE)
	BEGIN
		SELECT @RevCPId = 0
		GOTO FindReplMARtn
	END	

	EXEC @ErrNum = ADDR.dbo.bpSrhCntctPerID  @LUST,
											 @RevOrgID,
											 @SubOrg,
											 @JobTitle,
											 @LastName,
 											 @FirstName,
											 @MI		OUTPUT,
											 @Suffix	OUTPUT,
											 @Phone,
											 @RevCPId 	OUTPUT,
											 @Phone2	OUTPUT,
											 @Fax		OUTPUT,
											 @DBEmail	OUTPUT
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF (@ErrNum = 0)
	BEGIN
		SELECT @ReplCPFound = CASE WHEN (@RevCPId > 0) THEN @TRUE
							  ELSE @FALSE END
		GOTO FindReplMARtn
	END

	SELECT @ErrMsg = ADDR.dbo.fnCntctPerErrMsg (@ErrNum)
	GOTO ExitRtn


--	5c.	In case the Mailing Address key field(s) changed...

FindReplMARtn:
	IF (@MAChgd = @FALSE)
		GOTO FindReplPartyRtn

	EXEC @ErrNum = ADDR.dbo.bpSrhMailAddrID @Street,
											@City,
											@State,
											@ZIP,
											@Country,
											@RevMAId OUTPUT
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF (@ErrNum <> 0)
	BEGIN
		SELECT @ErrMsg = ADDR.dbo.fnMailAddrErrMsg (@ErrNum)
		GOTO ExitRtn
	END

	SELECT @ReplMAFound = CASE WHEN (@RevMAId > 0) THEN @TRUE
						  ELSE @FALSE END

	IF  (@RevMAId > 0)
	AND (@CurMAId = @RevMAId)
	BEGIN
		SELECT	@ErrNum = 51009,
				@ErrMsg = 'The ZIP Code you tried to change has been verifed and cannot be changed.'
		GOTO ExitRtn
	END

--	10/16/2006 - Changed

	IF @ReplMAFound = @FALSE
		GOTO FindReplPartyRtn


	IF EXISTS  (SELECT 1 FROM ADDR.dbo.MailAddress
				WHERE AddrID = @RevMAId 
				  AND LastUpdBy = @ADDR_ADMIN)
		SELECT	@MA_LastUpdBy = @ADDR_ADMIN
	ELSE
		SELECT	@MA_LastUpdBy = 0

--	5d.	If Revised Contact Person and Mailing Address records are created already,
--		see if an Revised Party record already created as well...
--		-- LUST doesn't save Legal Name, Ownership Type and Comments in AffilParty Table.   --

FindReplPartyRtn:
	IF (@CurMAId = @RevMAId)
		SELECT @MAChgd = @FALSE

	IF (@CPChgd = @FALSE) AND (@MAChgd = @FALSE)
	BEGIN
		SELECT @ReqUpdCP = CASE WHEN (@DBEmail <> @Email) THEN @TRUE
						   ELSE @FALSE END
		GOTO FindStaffRtn
	END

	IF (@CPChgd = @TRUE) AND (@ReplCPFound = @FALSE) 	
		GOTO ChkRecStatusRtn

	IF (@MAChgd = @TRUE) AND (@ReplMAFound = @FALSE) 
		GOTO ChkRecStatusRtn

	EXEC @ErrNum = ADDR.dbo.bpSrhPartyID @RevCPId,
										 @RevMAId,
										 @PartyId 	  OUTPUT,
										 @CurLegalNm,
										 @CurPartyOwnshp,
										 @CurPartyComments
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @ErrNum <> 0
		GOTO ExitRtn

	IF (@PartyID > 0)
		SELECT @ReplPartyFound = @TRUE
	ELSE
		GOTO ChkRecStatusRtn

--	6.	In case the modified Party record may conflict with the 
--		other LUST Contact record(s)...
--		06/17/2005 - changed (llo)
--		10/13/2005 - Bugs Fixed (llo)
/*
	EXEC @ErrNum = LUSTNew.dbo.bpChkAffilDates @LUST,
											   @LUSTID,
											   @AffilType,
											   @PartyID,
											   @StartDate,
											   @EndDate,
											   @AffilID
*/
	EXEC @ErrNum = ADDR.dbo.bpChkDupAffilParty	@LUST,
												@LUSTID,
												@AffilType,
												@AffilID,
												@PartyID,
												@StartDate,
												@EndDate,
												@IsDupRec	OUTPUT
	SELECT @SysErr = @@ERROR
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @ErrNum > 0
	BEGIN
		SELECT @ErrMsg = ADDR.dbo.fnAffilErrMsg(@ErrNum)
		GOTO ExitRtn
	END

	IF @IsDupRec = @TRUE
	BEGIN
		SELECT	@ErrNum	= 51010,
				@ErrMsg = 'Duplicate Affiliation/Party record is found.'
		GOTO ExitRtn
	END
	
--	7.	If Organization/Contact Person/Mailing Address key fields changed,
--		need to decide how to handle with the existing and newly created
--		records based on the usage count of the existing record...
--	7a.	Make sure no other Program/Affiliation records reference to the 
--		specified Party. Then this procedure may over-ride/delete it...

ChkRecStatusRtn:
	EXEC @ErrNum = ADDR.dbo.bpChkDelPartyRec @AffilID,
											 @CurPartyID,
											 @MayDelParty OUTPUT
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @ErrNum <> 0 
		GOTO ExitRtn

	IF @MayDelParty = @FALSE
	BEGIN
		SELECT 	@MayDelCP  = @FALSE,
				@MayDelOrg = @FALSE,
				@MayDelMA  = @FALSE
		GOTO AnalOrgRtn
	END
		
--	7b.	If Party record can be deleted/overrided, need to find out
--		if relevant record(s) can be overrided/deleted...

	EXEC @ErrNum = ADDR.dbo.bpChkDelCntctRec @CurPgmInt,
											 @CurPartyID,
											 @RESPARTY,
											 @CurACId 	OUTPUT,
											 @CurOrgID 	OUTPUT,
											 @CurCPId	OUTPUT,
											 @CurMAId	OUTPUT,
				 							 @MayDelCP 	OUTPUT,
											 @MayDelMA 	OUTPUT,
											 @MayDelOrg	OUTPUT
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END


	IF @ErrNum = 58001
	BEGIN
		SELECT @ErrMsg = 'Affiliation Contact record for Party ID#'
					   + CAST(@CurPartyID AS VarChar(8)) + ' not found.'
		GOTO ExitRtn
	END
--	7c.	What is next?
--		Update existing records/Create new records/Delete existing records?
--	7c1.Organization...

AnalOrgRtn:
	IF (@OrgChgd = @FALSE)
		GOTO AnalCPRtn

	IF (@MayDelOrg = @TRUE) AND (@ReplOrgFound = @TRUE)
	BEGIN
		SELECT  @ReqDelOrg = @TRUE
		GOTO AnalCPRtn
	END

	IF (@MayDelOrg = @TRUE) AND (@ReplOrgFound = @FALSE)
	BEGIN
		SELECT  @ReqUpdOrg = @TRUE,
				@RevOrgID  = @CurOrgID
		GOTO AnalCPRtn
	END

	IF (@MayDelOrg = @FALSE) AND (@ReplOrgFound = @FALSE)
		SELECT  @ReqInsOrg  = @TRUE

--	IF (@MayDelOrg = @FALSE) AND (@ReplOrgFound = @TRUE)
--		@RevOrgID is found and assigned at 5(a).

--	7c2.Contact Person...

AnalCPRtn:
	IF (@CPChgd = @FALSE) AND (@DBEmail = @Email)
		GOTO AnalMARtn

	IF (@CPChgd = @FALSE) AND (@DBEmail <> @Email)
	BEGIN
		SELECT @ReqUpdCP = @TRUE
		GOTO AnalMARtn
	END

	IF (@MayDelCP = @TRUE) AND (@ReplCPFound = @TRUE)
	BEGIN
		SELECT 	@ReqDelCP = @TRUE,
			@ReqUpdCP = CASE WHEN @Email <> '' THEN @TRUE
						ELSE @FALSE END
		GOTO AnalMARtn
	END

	IF (@MayDelCP = @TRUE) AND (@ReplCPFound = @FALSE)
	BEGIN
		SELECT	@RevCPId  = @CurCPId,
				@ReqUpdCP = @TRUE
		GOTO AnalMARtn
	END

	IF (@MayDelCP = @FALSE) AND (@ReplCPFound = @FALSE)
	BEGIN
		SELECT 	@ReqInsCP = @TRUE
		GOTO AnalMARtn
	END	IF (@MayDelCP = @FALSE) AND (@ReplCPFound = @TRUE)
		SELECT	@ReqUpdCP = CASE WHEN @Email <> '' THEN @TRUE
							ELSE @FALSE END

--		@RevCPID is found and assigned at 5(b).

--	7c3.Mailing Address...

AnalMARtn:
	IF (@MAChgd = @FALSE)
		GOTO AnalPartyRtn

	IF (@MayDelMA = @TRUE) AND (@ReplMAFound = @TRUE)
	BEGIN
		SELECT	@ReqDelMA = @TRUE
		GOTO AnalPartyRtn
	END

	IF (@MayDelMA = @TRUE) AND (@ReplMAFound = @FALSE)
	BEGIN
		SELECT	@ReqUpdMA = @TRUE,
				@RevMAId  = @CurMAId
		GOTO AnalPartyRtn
	END

	IF  (@MayDelMA = @FALSE) AND (@ReplMAFound = @FALSE)
		SELECT	@ReqInsMA = @TRUE

--	@RevMAID is found and assigned at 5(c).
--	In case ZIP Code in the database is different, use the one user has just entered.

	IF  (@MayDelMA = @FALSE) AND (@ReplMAFound = @TRUE)
	AND (@MA_LastUpdBy <> @ADDR_ADMIN)		
			SELECT @ReqUpdMA = @TRUE

--	7c4.Responsible Party...
--		08/24/05 - Change

AnalPartyRtn:
	IF (@MayDelParty = @TRUE) AND (@ReplPartyFound = @TRUE)
	BEGIN	
		SELECT  @ReqDelParty = @TRUE
		GOTO FindStaffRtn
	END

	IF (@MayDelParty = @TRUE) AND (@ReplPartyFound = @FALSE)
	BEGIN
		SELECT  @PartyID     = @CurPartyID,
				@ReqUpdParty = @TRUE
		GOTO FindStaffRtn
	END

	IF (@MayDelParty = @FALSE) AND (@ReplPartyFound = @FALSE)
		SELECT  @ReqInsParty = @TRUE

--	IF (@MayDelParty = @FALSE) AND (@ReplPartyFound = @TRUE)
--		@PartyID (Revised) is found and assigned at 5(d).

--	8.	Find Employee ID from user NT Login...

FindStaffRtn:
	--EXEC @ErrNum = AGENCY.dbo.apGetUserEmpID @StaffID OUTPUT
	SELECT @StaffID = EMP_ID
	FROM HRIS.dbo.vActiveEmpTbl
	WHERE NT_LOGIN = @LastChangeBy
	
	SELECT @SysErr = @@ERROR 
	IF @SysErr <> 0
	BEGIN
		SELECT @ErrNum = @SysErr
		GOTO ExitRtn
	END

	IF @ErrNum = 0 
		GOTO SaveRecRtn

	SELECT @ErrMsg = AGENCY.dbo.fnLoginErrMsg (@ErrNum)
	GOTO ExitRtn

--	9.	Base on the Organization/Contact Person/Mailing Address
--		Operation Flags, perform INSERT/UPDATE/DELETE of Organization,
--		Contact Person and Mailing Address record(s)...
--	9a.	Update Affiliation record...

SaveRecRtn:
	BEGIN TRAN
		EXEC @ErrNum = AGENCY.dbo.bpUpdAffiliation @AffilID,
												   @CMNFACID,
												   @LustID,
												   @AffilType,
												   @OwnshpCd,
												   @StartDate,
												   @EndDate,
												   @IsActive,
												   @Comments,
												   @StaffID,
												   @Dummy OUTPUT
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn
		
--	9b.	Perform INSERT/UPDATE of Organization record 
--		(if required)...

		IF @ReqInsOrg = @TRUE
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpInsOrg @Organization,
											 @IsIndv,
											 @RevOrgID OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr
	 
			IF @ErrNum <> 0
				GOTO RollbackRtn
		END
		ELSE	--IF @ReqUpdOrg = @TRUE		--	10/16/06 - Changed
		BEGIN

			EXEC @ErrNum = ADDR.dbo.bpUpdOrg @RevOrgID,
											 @Organization,
											 @IsIndv,
											 @Dummy
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn
		END

--		If Organization name changed, save the user input Organization Name in AffiliationName table
--		for internal database auditing purpose - 6/25/2004.

		IF @OrgChgd = @TRUE
		BEGIN
			EXEC @ErrNum = AGENCY.dbo.bpUpdAffilName @AffilID,
													 @ORG_NAME,
													 @LUST,
													 @AffilName,
													 @StaffID
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn
		END

							 
--	9c.	Perform INSERT/UPDATE of Contact Person record 
--		(if required)...

		IF @ReqInsCP = @TRUE
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpInsCntctPer @RevOrgID,
												  @SubOrg,
												  @JobTitle,
												  @LastName,
												  @FirstName,
												  @MI,
												  @Suffix,
												  @Email,
												  @Phone,
												  @Phone2,
												  @Fax,
												  @StaffID,
												  @RevCPId OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr
	
			IF @ErrNum <> 0
				GOTO RollbackRtn
		END
		ELSE	-- IF @ReqUpdCP = @TRUE		--	10/16/06 - Changed
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpUpdCntctPer @RevCPId,
												  @RevOrgID,	
												  @SubOrg,
												  @JobTitle,
												  @LastName,
												  @FirstName,
												  @MI,
												  @Suffix,
												  @Email,
												  @Phone,
												  @Phone2,
												  @Fax,
												  @StaffID,
												  @Dummy OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn
		END

--	9d.	Perform INSERT/UPDATE of Mailing Address record 
--		(if required)...

		IF @ReqInsMA = @TRUE
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpInsMailAddr @Street,
												  '',
												  @City,
												  @State,
												  @ZIP,
												  @Country,
												  @StaffID,
						      					  @RevMAId OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn

			GOTO InsUpdPartyRtn
		END

		IF	(@ReqUpdMA = @TRUE)			--	10/16/06 - Changed.
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpUpdMailAddr @RevMAId,
												  @Street,
												  '',
												  @City,
												  @State,
												  @ZIP,
												  @Country,
												  @StaffID,
												  @Dummy OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn
		END

--	9e.	Update/Insert Responsible Party record...

InsUpdPartyRtn:
		IF @ReqInsParty <> @TRUE
			GOTO UpdPartyRtn

		EXEC @ErrNum = ADDR.dbo.bpGenPartyID @PartyID OUTPUT
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn

		EXEC @ErrNum = ADDR.dbo.bpInsAffilParty @PartyID,
												'',
												'',
												''
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn


NewAffilCntctRtn:
		EXEC @ErrNum = ADDR.dbo.bpInsAffilCntct @LUST,
												@PartyID,
												@RESPARTY,
												@RevCPId,
												@RevMAId,
												@StaffID,
												@Dummy OUTPUT
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn


UpdPartyRtn:
		IF @ReqUpdParty <> @TRUE
			GOTO UpdAffilCntctRtn
/*
		EXEC @errNum = ADDR.dbo.bpUpdAffilParty @PartyID,
												'',
												@UNKNOWN,
												'',
												@Dummy OUTPUT
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn
*/

--	9f.	Update/Insert Affiliation Contact record...

UpdAffilCntctRtn:
		EXEC @ErrNum = ADDR.dbo.bpUpdPartyCntct @PartyID,
												@RevCPId,
												@RevMAId,
												@StaffID,
												@Dummy OUTPUT
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn

--	9g.	In case the PartyID was changed...

		EXEC @ErrNum = ADDR.dbo.bpUpdLUSTAffilCntcts @AffilID,
													  @PartyID
		SELECT @SysErr = @@ERROR 
		IF @SysErr <> 0
			SELECT @ErrNum = @SysErr

		IF @ErrNum <> 0
			GOTO RollbackRtn 


--	9h.	Delete Organization/Contact Person/Mailing Address record(s)
--		if required....
		 
DelRecRtn:
		IF @ReqDelParty = @TRUE
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpDelAffilParty @CurPartyID,
													@StaffID,
													@Dummy OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <>0
				GOTO RollbackRtn

			EXEC @ErrNum = ADDR.dbo.bpDelAffilCntct @CurACId,
													@StaffID,
													@Dummy OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn
		END

		IF @ReqDelCP = @TRUE
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpDelCntctPer @CurCPId,
												  @StaffID,
												  @Dummy
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr
	
			IF @ErrNum <> 0
				GOTO RollbackRtn			
		END

		IF @ReqDelOrg = @TRUE
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpDelOrg @CurOrgID,
											 @StaffID,
											 @Dummy OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn
		END

		IF @ReqDelMA = @TRUE
		BEGIN
			EXEC @ErrNum = ADDR.dbo.bpDelMailAddr @CurMAId,
												  0,
												  @StaffID,
												  @Dummy OUTPUT
			SELECT @SysErr = @@ERROR 
			IF @SysErr <> 0
				SELECT @ErrNum = @SysErr

			IF @ErrNum <> 0
				GOTO RollbackRtn
		END

--	10.	Save changes into the databases...	

	COMMIT TRAN
	SELECT @Result = @TRUE
	GOTO ExitRtn
	
--	11.	Discard changes in case something goes wrong...

RollbackRtn:
	ROLLBACK TRAN
ExitRtn:
	RETURN (@ErrNum)
END

GO
GRANT EXECUTE ON [dbo].[apUpdLUSTAffilPartyData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdLUSTAffilPartyData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[apInsUpdLUSTAffilPartyData]
(
		@LUSTID			Integer			= 0,
		@AffilType		VarChar(3)		= '',
		@StartDate		DateTime		= NULL,
		@EndDate		DateTime		= NULL,
		@Organization	Varchar(40)		= '',
		@SubOrg			VarChar(40)		= '',
		@JobTitle		VarChar(40)		= '',
		@FirstName		VarChar(40)		= '',
		@LastName		VarChar(40)		= '',
		@Phone			VarChar(40)		= '',
		@Email			VarChar(40)		= '',
		@Street			VarChar(56)		= '',
		@City			VarChar(25)		= '',
		@ZIP			VarChar(10)		= '',
		@State			VarChar(2)		= '',
		@Country		VarChar(25)		= '',
		@AffilComments	VarChar(2000)	= '',
		@AffilID		Integer			= 0 ,
		@LastChangeBy  VARCHAR(64)         ,
		@PartyID		Integer			= 0  OUTPUT,
		@AffiliationID	Integer			= 0  OUTPUT,
	    @ErrorMessageHandler   VARCHAR(1024) OUTPUT,
		@Result			Bit				= 0  OUTPUT
)AS


IF ISNULL(@AffilID, 0) != 0
	BEGIN

		EXEC [dbo].[apUpdLUSTAffilPartyData]
			@AffilID		
			,@StartDate	
			,@EndDate	
			,@Organization
			,@SubOrg
			,@JobTitle
			,@FirstName
			,@LastName
			,@Phone
			,@Email
			,@Street
			,@City
			,@ZIP
			,@State
			,@Country
			,@AffilComments
			,@LastChangeBy
			,@PartyID OUTPUT
			,@ErrorMessageHandler  OUTPUT
			,@Result OUTPUT

		  SELECT @Result  = @@ERROR
		  SET @ErrorMessageHandler = Error_Message()
		  IF @Result  <> 0
           BEGIN
				GOTO ABORT
           END
	END
ELSE IF ISNULL(@LustId, 0) != 0 
	BEGIN
		EXEC[dbo].[apInsLUSTAffilPartyData]
			@LUSTID
			,@AffilType
			,@StartDate
			,@EndDate
			,@Organization
			,@SubOrg
			,@JobTitle
			,@FirstName
			,@LastName
			,@Phone
			,@Email
			,@Street
			,@City
			,@ZIP
			,@State
			,@Country
			,@AffilComments
			,@LastChangeBy
			,@PartyID OUTPUT
			,@AffiliationID	OUTPUT
			,@ErrorMessageHandler OUTPUT
			,@Result OUTPUT
			SELECT @Result  = @@ERROR
			-- SET @ErrorMessageHandler = Error_Message()
			IF @Result  <> 0
			BEGIN
				SET @ErrorMessageHandler = @ErrorMessageHandler + ' ' + ISNULL(Error_Message(), '')
 				GOTO ABORT
			END
	END

ABORT:
return @Result
GO
GRANT EXECUTE ON [dbo].[apInsUpdLUSTAffilPartyData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdManagementData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdManagement
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

/*
 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
Feb 2007        B.Dyer          Modified to allow deletion of Final Invoice Request Date.
                                If in-coming @FinalInvcRqstDt is null, and there's an existing 
                                Final Invoice Request Date, activate re-opening of LUST Incident
                                using below transcation "ReOpenIncident"


DECLARE @managementIdOut INT, @ErrorMessageHandler VARCHAR(1024)
EXEC apInsUpdManagementData 47364, @managementIdOut OUTPUT, 51806, '04-02-2019', '04-01-2019', '04-02-2019', '04-02-2019', '04-02-2019', '', 'aguedea', @ErrorMessagehandler OUTPUT
SELECT @ErrorMessageHandler, @ManagementIdOut


selec
select * FROM management where lustid = 51809
delete FROM management where lustid = 51806


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apInsUpdManagementData]
	 @ManagementIdIn  int   
    ,@ManagementIdOut int = 0 OUTPUT
	,@LustId int = NULL 
	,@CleanupStartDt datetime 
	,@ReleaseStopDt datetime = NULL 
	,@FinalInvcRqstDt datetime = NULL 
	,@ClosedDt datetime = NULL 
	,@LetterOfAgreementDt datetime = NULL 
	,@LetterOfAgreementComment varchar(8000) = NULL 
	,@LastChangeBy			VARCHAR(64) 
	,@ErrorMessageHandler	VARCHAR(1024) OUTPUT 

AS

DECLARE @Result int
       ,@FIRDateEntered datetime 
       ,@ExistingFIRDateCheck datetime 

SELECT  @Result = 0
       ,@FIRDateEntered = NULL
       ,@ExistingFIRDateCheck = NULL
      

-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @CleanupStartDt      = CAST(CONVERT(varchar(8), @CleanupStartDt, 112) as datetime)
      ,@ReleaseStopDt       = CAST(CONVERT(varchar(8), @ReleaseStopDt, 112) as datetime)
      ,@FinalInvcRqstDt     = CAST(CONVERT(varchar(8), @FinalInvcRqstDt, 112) as datetime)
      ,@ClosedDt            = CAST(CONVERT(varchar(8), @ClosedDt, 112) as datetime)
      ,@LetterOfAgreementDt = CAST(CONVERT(varchar(8), @LetterOfAgreementDt, 112) as datetime)


SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

-------------------------------------------------------------------------
-- Business Rules Validation 

-- Cleanup Start Date can't be greater than today's date.
IF (@CleanupStartDt > getdate())
     	BEGIN
		SET @ErrorMessageHandler = 'Cleanup Start Date cannot be greater than today.'
		Set @Result = @@Error
		GOTO Abort
     	END

-- Release Stop Date can't be greater than today's date.
IF (@ReleaseStopDt > getdate())
     	BEGIN
        	SET @ErrorMessageHandler = 'Release Stop Date cannot be greater than today.'
		Set @Result = @@Error
		GOTO Abort
     	END

-- Letter Of Agreement Date can't be greater than today's date.
IF (@LetterOfAgreementDt > getdate())
     	BEGIN
        	SET @ErrorMessageHandler = 'Letter Of Agreement Date cannot be greater than today.'
		Set @Result = @@Error
		GOTO Abort
    	END

-- Final Invoice Request Date can't be greater than today's date.
IF (@FinalInvcRqstDt  > getdate())
     	BEGIN
        	SET @ErrorMessageHandler = 'Final Invoice Request Date cannot be greater than today.'
		Set @Result = @@Error
		GOTO Abort
     	END

-- Closed date can't be greater than today's date.
IF (@ClosedDt  > getdate())
     	BEGIN
        	SET @ErrorMessageHandler = 'Closed Date cannot be greater than today.'
		Set @Result = @@Error
		GOTO Abort 
     	END


-- A CLEANUP START DATE must exist for an FINAL INVOICE REQUEST DATE to exist.
IF ((@CleanupStartDt  IS NULL) AND (@FinalInvcRqstDt IS NOT NULL)) 
	BEGIN
		SET @ErrorMessageHandler = 'A Cleanup Start Date must exist for a Final Invoice Request Date.'
		Set @Result = @@Error
		GOTO Abort
	END


--   CLEANUP START DATE must be less than or equal to FINAL INVOICE REQUEST DATE

IF (@CleanupStartDt > @FinalInvcRqstDt)
	BEGIN
		SET @ErrorMessageHandler = 'Final Invoice Request Date cannot be before Cleanup Start Date.'
		Set @Result = @@Error
		GOTO Abort 
	END

-- TODO BDYER 16 JAN 2007 -- COMMENT OUT TO ALLOW RE-OPENING OF A CLOSED LUST INCIDENT.
-- For an CLEANUP CLOSED DATE to be Created or Updated,  an FINAL INVOICE REQUEST DATE must exist.
/*IF ((@FinalInvcRqstDt  IS NULL) AND (@ClosedDt IS NOT NULL)) 
	BEGIN
		RaisError('A Final Invoice Request Date must exist for a Cleanup Closed Date.', 11,1)
		Set @Result = @@Error
		GOTO Abort
	END
*/--   FINAL INVOICE REQUEST DATE must be less than or equal to CLEANUP CLOSED DATE
IF NOT(@FinalInvcRqstDt < = @ClosedDt)
	BEGIN
		SET @ErrorMessageHandler = 'Cleanup Closed Date cannot be before Final Invoice Request Date. '
		Set @Result = @@Error
		GOTO Abort
	END
/*
IF (@FinalInvcRqstDt > @ClosedDt)
	BEGIN
		RaisError('Cleanup Closed Date cannot be before Final Invoice Request Date. ', 11,1)
		Set @Result = @@Error
		GOTO Abort
	END
*/





-- TODO BDYER FEB 11 2007 -
--   PROVIDE PROCESS TO RE-OPEN CLOSED LUST INCIDENT
IF @FinalInvcRqstDt IS NULL              -- Check Incoming Value for Null

   	BEGIN
      	SELECT FinalInvcRqstDate FROM dbo.MANAGEMENT
      	WHERE  LustId = @LustId
      	AND    FinalInvcRqstDate IS NOT NULL -- Check Existing Value for Null

        -- ACTIVATE THIS CODE IF U/I FIR DATE EMPTY, DB FIR DATE EXISTS.
        -- LUST ADMIN DELETED THE FIR DATE TO RE-OPEN THE SITE.
      	IF @@ROWCOUNT > 0                  
      		BEGIN 	
  			SET @ClosedDt        = NULL 
			SET @FIRDateEntered  = NULL
      		END

/* 
commented out 16 Jan 2007 B.Dyer
				RaisError('Final Invoice Request Date cannot be Deleted.', 11,1)
				Set @Result = @@Error
				GOTO Abort
*/

   	END      


-------------------------------------------------------------------------
-- Insert/Update
PRINT 'Here at insert/update'
IF @ManagementIdIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine


   -- ---------------------------------------------------------------------------
   -- Check for in-coming FINAL INVOICE REQUEST DATE.
   -- Although pretty unlikely for an INSERT, it's certainly possible.
   -- If one exists, load the "FIR Date Updated" value.
   IF @FinalInvcRqstDt IS NOT NULL
      BEGIN
	     SELECT @FIRDateEntered = GETDATE()
      END
   -- ---------------------------------------------------------------------------



	INSERT INTO [dbo].[Management] 
		(
		 [LustId]
		,[CleanupStartDate]
		,[ReleaseStopDate]
		,[FinalInvcRqstDate]
        ,FinalInvcRqstDateEntered  
		,[ClosedDate]
		,[LetterOfAgreementDate]
		,[LetterOfAgreementComment]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @LustId
		,@CleanupStartDt
		,@ReleaseStopDt
		,@FinalInvcRqstDt
        ,@FIRDateEntered
		,@ClosedDt
		,@LetterOfAgreementDt
		,@LetterOfAgreementComment
        --,dbo.fn_CurrentUserName(SUSER_SNAME())
		,@LastChangeBy
		,GETDATE()
            )
	
	SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

	SELECT @ManagementIdOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT
END     
                        
ELSE                      -- <<< else begin UPDATE routine

BEGIN       

	

	/* --------------------------------------------------------------------------------------
	For Update:
	Check for an existing Final Invoice Request Date.
	If there IS NOT one, and there IS AN IN-COMING Final Invoice Request Date value,
	load up the FINAL INVOICE - DATE ENTERED - value.
	*/   

    BEGIN
	SELECT  @ExistingFIRDateCheck   =
		   (SELECT FinalInvcRqstDate FROM dbo.Management WHERE LustId = @LustId)
    END

-- NO existing DB fir date
	IF @ExistingFIRDateCheck IS NULL -- NO PRIOR EXISTING FIR DATE
	   BEGIN
	   IF (@FinalInvcRqstDt IS NOT NULL) 
		   BEGIN
			 SELECT @FIRDateEntered = GETDATE()
		   END

	   IF (@FinalInvcRqstDt IS  NULL) 
		   BEGIN
			 SELECT @FIRDateEntered = NULL
		   END
       END

-- existing DB fir date
	IF @ExistingFIRDateCheck IS NOT NULL -- FIR DATE ALREADY EXISTS IN DB
	   BEGIN
          -- if deleting the FirDate
          IF (@FinalInvcRqstDt IS NULL)
 		     BEGIN
			 SELECT @FIRDateEntered = NULL
		     END          

          -- if FirDate has been updated, re-set FinalInvcRqstDateEntered value.
          IF (@FinalInvcRqstDt IS NOT NULL) AND (@FinalInvcRqstDt <> @ExistingFIRDateCheck)
 		     BEGIN
			 SELECT @FIRDateEntered = GETDATE()
		     END          

          -- if FirDate has not been updated, retain existing FinalInvcRqstDateEntered value.
          IF (@FinalInvcRqstDt IS NOT NULL) AND (@FinalInvcRqstDt = @ExistingFIRDateCheck)
 		     BEGIN
			 SELECT @FIRDateEntered = 
                   (SELECT FinalInvcRqstDateEntered FROM dbo.Management WHERE LustId = @LustId)
		     END          
        END

    -- ----------------------------------------------------------------------------------------
                     
	UPDATE [dbo].[Management] 
        SET
	 [LustId] = @LustId 
	,[CleanupStartDate] = @CleanupStartDt 
	,[ReleaseStopDate] = @ReleaseStopDt 
	,[FinalInvcRqstDate] = @FinalInvcRqstDt 
    ,FinalInvcRqstDateEntered = @FIRDateEntered
	,[ClosedDate] = @ClosedDt 
	,[LetterOfAgreementDate] = @LetterOfAgreementDt 
	,[LetterOfAgreementComment] = @LetterOfAgreementComment 
	,[LastChangeBy] = @LastChangeBy -- dbo.fn_CurrentUserName(SUSER_SNAME())
	,[LastChangeDate] = GETDATE()

	WHERE [ManagementId] = @ManagementIdIn --Primary Key


	SELECT @Result = @@ERROR
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @ManagementIdOut = @ManagementIdIn

	SELECT @Result = @@ERROR
	IF @Result <> 0	
                GOTO ABORT 	
        -----------------------------------------------------------------------------
	ELSE	-- SUCCESS Completion. @ErrorCheck initialized = 0 in variable definition.
		RETURN @Result -- 0
        -----------------------------------------------------------------------------
END

/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	


GO
GRANT EXECUTE ON [dbo].[apInsUpdManagementData] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apInsUpdPCSData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdPCS
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apInsUpdPCSData]
	  	 @PCSIDIn  				INT   
        ,@PCSIDOut 				INT = 0 	OUTPUT		
       	,@LustID 				INT 			
	   	,@LandfillFacID 		INT 		= NULL		
		,@TreatmentFacID 		INT			= NULL
		,@OnSiteDisposalInd		BIT			= NULL		
		,@OffSiteDisposalAddr 	VARCHAR(50) = NULL	
		,@SoilStatusID 			INT 		= NULL		
		,@SoilStatusCd 			VARCHAR(6)  = NULL		
		,@LandfillAmtYrds		DECIMAL(10,1)  = NULL
		,@TreatmentAmtYrds		DECIMAL(10,1)  = NULL	
		,@OnSiteAmtYrds			DECIMAL(10,1)  = NULL	
		,@OffSiteAmtYrds		DECIMAL(10,1)  = NULL
 	  	,@DisposalDt 			DATETIME 	   = NULL
		,@PCSComment			VARCHAR(8000)  = NULL	
		,@LastChangeBy			VARCHAR(64) 
		,@ErrorMessageHandler	VARCHAR(1024)			OUTPUT
AS
DECLARE @Result int
SELECT  @Result = 0

-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @DisposalDt = CAST(CONVERT(varchar(8), @DisposalDt, 112) as datetime)

SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

-------------------------------------------------------------------------

-- Business Rules Validation 

-- Disposal Date is required
IF @DisposalDt IS NULL
	BEGIN
		RaisError('Disposal date is required.', 11,1)
		SET @ErrorMessageHandler = 'Disposal date is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Disposal amount is required
IF (@LandfillAmtYrds IS NULL AND 
    @TreatmentAmtYrds IS NULL AND
    @OnSiteAmtYrds IS NULL AND
    @OffSiteAmtYrds IS NULL AND
    @SoilStatusID <> 1)
	BEGIN
		RaisError('Disposal amount -or- a NO PCS MANAGED Soil Status is required.', 11,1)
		SET @ErrorMessageHandler = 'Disposal amount -or- a NO PCS MANAGED Soil Status is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Landfill facility required if landfill amount specified
IF @LandfillAmtYrds > 0 AND
   (@LandfillFacID IS NULL OR @LandfillFacID = 0) 
	BEGIN
		RaisError('Landfill facility is required if landfill amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'Landfill facility is required if landfill amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Landfill amount required if landfill facility specified
IF @LandfillFacID > 0 AND
   (@LandfillAmtYrds IS NULL OR @LandfillAmtYrds = 0) 
	BEGIN
		RaisError('Landfill amount is required if landfill facility is specified.', 11,1)
		SET @ErrorMessageHandler = 'Landfill amount is required if landfill facility is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Treatment facility required if treatment amount specified
IF @TreatmentAmtYrds > 0 AND
   (@TreatmentFacID IS NULL OR @TreatmentFacID = 0) 
	BEGIN
		RaisError('Treatment facility is required if treatment amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'Treatment facility is required if treatment amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Treatment amount required if treatment facility specified
IF @TreatmentFacID > 0 AND
   (@TreatmentAmtYrds IS NULL OR @TreatmentAmtYrds = 0) 
	BEGIN
		RaisError('Treatment amount is required if treatment facility is specified.', 11,1)
		SET @ErrorMessageHandler = 'Treatment amount is required if treatment facility is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Onsite disposal indicator should be set to true if onsite amount specified
IF @OnSiteAmtYrds > 0 AND
   (@OnSiteDisposalInd IS NULL OR @OnSiteDisposalInd = 0) 
	BEGIN
		RaisError('OnSite disposal indicator should be set to true if onsite amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'OnSite disposal indicator should be set to true if onsite amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Onsite amount required if onsite disposal indicator set to true
IF @OnSiteDisposalInd = 1 AND
   (@OnSiteAmtYrds IS NULL OR @OnSiteAmtYrds = 0) 
	BEGIN
		RaisError('Onsite amount is required if onsite disposal indicator is set to true.', 11,1)
		SET @ErrorMessageHandler = 'Onsite amount is required if onsite disposal indicator is set to true.'
		SET @Result = @@Error
		GOTO ABORT
	END


-- Offsite disposal address required if offsite amount specified
IF @OffsiteAmtYrds > 0 AND
   (@OffSiteDisposalAddr IS NULL OR LEN(@OffSiteDisposalAddr)= 0) 
	BEGIN
		RaisError('Offsite disposal address is required if offsite amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'Offsite disposal address is required if offsite amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END


-- Offsite amount required if offsite facility specified
IF LEN(@OffSiteDisposalAddr)> 0 AND
   (@OffsiteAmtYrds IS NULL OR @OffsiteAmtYrds = 0) 
	BEGIN
		RaisError('Offsite amount is required if offsite disposal address is specified.', 11,1)
		SET @ErrorMessageHandler = 'Offsite amount is required if offsite disposal address is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-------------------------------------------------------------------------
-- Insert/Update

IF @PCSIDIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[PetroContamSoil] 
		(
		 [LustID]
		,[DispLandfillFacID]
		,[DispThrmFacID]
		,[OnSiteDisposalInd]
		,[OffsiteDispAddr]
		,[SoilStatusID]
		,[SoilStatusCode]
		,[LandfillAmtYrds3]
		,[ThermalAmtYrds3]
		,[OnSiteAmtYrds3]
		,[OffSiteAmtYrds3]
		,[DisposalDate]
		,[PCSComment]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
       	 @LustID 						
	    ,@LandfillFacID 			
		,@TreatmentFacID 
		,@OnSiteDisposalInd			
		,@OffSiteDisposalAddr 	
		,@SoilStatusID 			
		,@SoilStatusCd 			
		,@LandfillAmtYrds		
		,@TreatmentAmtYrds	
		,@OnSiteAmtYrds		
		,@OffSiteAmtYrds		
 	   	,@DisposalDt
		,@PCSComment 		
        ,@LastChangeBy
		,GETDATE()
            )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @PCSIDOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[PetroContamSoil] 
        SET
	 	 [LustID]			= @LustID
		,[DispLandfillFacID]	= @LandfillFacID 	
		,[DispThrmFacID]		= @TreatmentFacID
		,[OnSiteDisposalInd]    = @OnSiteDisposalInd 		
		,[OffsiteDispAddr]	= @OffSiteDisposalAddr
		,[SoilStatusID]		= @SoilStatusID 
		,[SoilStatusCode]		= @SoilStatusCd 	
		,[LandfillAmtYrds3]	= @LandfillAmtYrds	
		,[ThermalAmtYrds3]	= @TreatmentAmtYrds	
		,[OnSiteAmtYrds3]		= @OnSiteAmtYrds
		,[OffSiteAmtYrds3]	= @OffSiteAmtYrds	
		,[DisposalDate]		= @DisposalDt
		,[PCSComment]		= @PCSComment
		,[LastChangeBy] 		= @LastChangeBy
		,[LastChangeDate] 		= GETDATE()

	WHERE [PCSID] = @PCSIDIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @PCSIDOut = @PCSIDIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------



/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	












GO
GRANT EXECUTE ON [dbo].[apInsUpdPCSData] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apInsUpdPCSPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdPCSPermit
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apInsUpdPCSPermitData]
	  	 @SWPermitIDIn  		INT   
       	,@SWPermitIDOut 		INT 		  = 0    OUTPUT		
 		,@PCSID		  	        INT  
		,@SWLAPermitNbr		    VARCHAR(20)   
		,@AppReceivedDt 		DATETIME 	  = NULL
		,@IssueDt 			    DATETIME 	  = NULL
 		,@ExpirationDt 		    DATETIME 	  = NULL
		,@PermitExtDt 		    DATETIME 	  = NULL
		,@SWFeeInd			    BIT		      = NULL
		,@LandUseApprovedInd    BIT		      = NULL
		,@PermitComment		    VARCHAR(8000) = NULL
		,@LastChangeBy		    VARCHAR(64) 
		,@ErrorMessageHandler		VARCHAR(1024)			OUTPUT
AS
DECLARE @Result 	int
	   ,@RecCount	int
SELECT  @Result   = 0
	   ,@RecCount = 0


-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @AppReceivedDt = CAST(CONVERT(varchar(8), @AppReceivedDt, 112) AS DATETIME)
SET @ErrorMessageHandler = 'Casting @AppReceivedDt'
SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

SELECT @IssueDt = CAST(CONVERT(varchar(8), @IssueDt, 112) AS DATETIME)
SET @ErrorMessageHandler = 'Casting @IssueDt'
SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

SELECT @ExpirationDt = CAST(CONVERT(varchar(8), @ExpirationDt, 112) AS DATETIME)
SET @ErrorMessageHandler = 'Casting @ExpirationDt'
SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

SELECT @PermitExtDt = CAST(CONVERT(varchar(8), @PermitExtDt, 112) AS DATETIME)
SET @ErrorMessageHandler = 'Casting @PermitExtDt'
SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

-------------------------------------------------------------------------

-- Business Rules Validation 

-- PCSID must match record in PetroContamSoil table
BEGIN
	SELECT @RecCount = Count(*)
	FROM dbo.PetroContamSoil
	WHERE PCSID = @PCSID

	IF @RecCount = 0 
	BEGIN
		-- RaisError('PCS Permit record cannot exist without a PCS record.', 11,1)
		SET @ErrorMessageHandler = 'PCS Permit record cannot exist without a PCS record.'
		SET @Result = @@Error
		GOTO ABORT
	END
END

-- SWLA Permit Number is required
IF @SWLAPermitNbr IS NULL OR @SWLAPermitNbr = ''
	BEGIN
		-- RaisError('SWLA Permit Number is required.', 11,1)
		PRINT 'SWLA Permit Number is required.'
		SET @ErrorMessageHandler = 'SWLA Permit Number is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Appl Received Date must be less than or equal to today's date
IF (@AppReceivedDt > GetDate())
	BEGIN
		-- RaisError('Application Received Date cannot be later then today.', 11,1) 
		SET @ErrorMessageHandler = 'Application Received Date cannot be later then today.'
		Set @Result = @@Error
		GOTO Abort
	END

-- Issue Date must be less than or equal to today's date
IF (@IssueDt > GetDate())
	BEGIN
		-- RaisError('Issue Date cannot be later then today.', 11,1) 
		SET @ErrorMessageHandler = 'Issue Date cannot be later then today.'
		Set @Result = @@Error
		GOTO Abort
	END

-- Issue Date must be greater than or equal to Appl Received date
IF (@AppReceivedDt > @IssueDt)
	BEGIN
		-- RaisError('Application Received Date cannot be greater than Issue Date.', 11,1) 
		SET @ErrorMessageHandler = 'Application Received Date cannot be greater than Issue Date.'
		Set @Result = @@Error
		GOTO Abort
	END

-- Expiration Date must be greater than or equal to Issue Date
IF (@IssueDt > @ExpirationDt)
	BEGIN
		-- RaisError('Issue Date cannot be greater than Expiration Date.', 11,1) 
		SET @ErrorMessageHandler = 'Issue Date cannot be greater than Expiration Date.'
		Set @Result = @@Error
		GOTO Abort
	END

-- Permit Ext Date must be greater than or equal to Issue Date
IF (@IssueDt > @PermitExtDt)
	BEGIN
		-- RaisError('Issue Date cannot be greater than Permit Extension Date.', 11,1) 
		SET @ErrorMessageHandler = 'Issue Date cannot be greater than Permit Extension Date.'
		Set @Result = @@Error
		GOTO Abort
	END

-------------------------------------------------------------------------
-- Insert/Update

IF @SWPermitIDIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[PCSSWPermit] 
		(
		 [PCSID]
		,[SWLAPermitNbr]
		,[ApplReceivedDate]
		,[IssueDate]
		,[ExpirationDate]
		,[PermitExtensionDate]
		,[SwFeeInd]
		,[LandUseApproveInd]
		,[TreatmentDescription]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
           	 @PCSID 		
		,@SWLAPermitNbr	
		,@AppReceivedDt 		
		,@IssueDt 			
 		,@ExpirationDt 		
		,@PermitExtDt 		
		,@SWFeeInd
		,@LandUseApprovedInd	
		,@PermitComment				
        ,@LastChangeBy
		,GETDATE()
            )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

-- Get return values
	SELECT @SWPermitIDOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[PCSSWPermit] 
        SET
		 [PCSID]			= @PCSID
		,[SWLAPermitNbr]		= @SWLAPermitNbr
		,[ApplReceivedDate]		= @AppReceivedDt
		,[IssueDate]			= @IssueDt
		,[ExpirationDate]		= @ExpirationDt
		,[PermitExtensionDate]	= @PermitExtDt
		,[SwFeeInd]			= @SWFeeInd
		,[LandUseApproveInd]	= @LandUseApprovedInd
		,[TreatmentDescription]		= @PermitComment
		,[LastChangeBy] 		= @LastChangeBy
		,[LastChangeDate] 		= GETDATE()

	WHERE [PCSSWPermitID] = @SWPermitIDIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

-- Get return values
	SELECT @SWPermitIDOut = @SWPermitIDIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
-- RETURN @Result -- 0
-----------------------------------------------------------------------------
RETURN @Result -- 0

/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	








GO
GRANT EXECUTE ON [dbo].[apInsUpdPCSPermitData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPCSAndPCSPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdPCS
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
 
DECLARE  @PCSIDIn  				INT    ,@PCSIDOut 	INT = 0 ,@LustID 				INT 			
	   	,@LandfillFacID 		INT 		= NULL		,@TreatmentFacID 		INT			= NULL
		,@OnSiteDisposalInd		BIT			= NULL		,@OffSiteDisposalAddr 	VARCHAR(50) = NULL	
		,@SoilStatusID 			INT 		= NULL		,@SoilStatusCd 			VARCHAR(6)  = NULL		
		,@LandfillAmtYrds		DECIMAL(10,1)  = NULL		,@TreatmentAmtYrds		DECIMAL(10,1)  = NULL	
		,@OnSiteAmtYrds			DECIMAL(10,1)  = NULL		,@OffSiteAmtYrds		DECIMAL(10,1)  = NULL
 	  	,@DisposalDt 			DATETIME 	   = NULL		,@PCSComment			VARCHAR(8000)  = NULL	
		,@LastChangeBy			Varchar(64) 
	 	
		
		,@SWPermitIDIn  		INT   
       	,@SWPermitIDOut 		INT 		  = 0    
 		,@PCSID		  	        INT  
		,@SWLAPermitNbr		    VARCHAR(20)   = NULL
		,@AppReceivedDt 		DATETIME 	  = NULL
		,@IssueDt 			    DATETIME 	  = NULL
 		,@ExpirationDt 		    DATETIME 	  = NULL
		,@PermitExtDt 		    DATETIME 	  = NULL
		,@SWFeeInd			    BIT		      = NULL
		,@LandUseApprovedInd    BIT		      = NULL
		,@PermitComment		    VARCHAR(8000) = NULL
		,@PCSPermitLastChangeBy VARCHAR(64)	  
		
		,@ErrorMessageHandler		VARCHAR(1024)	

SET @lustId = 2
SET @PcsIdIn = 171232
SET @SWPermitIDIn = 0
SET @DisposalDt = CONVERT(DATETIME, '11/19/2018')
SET @soilStatusId = 2
SET @lastChangeby = 'LUSTUSER'
SET @LandFillFacId = 1
SET @LandfillAmtYrds = 100
SET @PCSPermitLastChangeBy = 'Matt'
SET @SWLAPermitNbr = ''


--select @disposalDt

 EXEC apInsUpdPCSAndPCSPermitData @PCSIDIn, @PCSIDOut OUTPUT, @LustID, @LandFillFacId, @TreatmentFacId, @OnSiteDisposalInd, @OffSiteDisposalAddr, @SoilStatusID, @SoilStatusCd, @LandfillAmtYrds
		,@TreatmentAmtYrds, @OnSiteAmtYrds, @OffSiteAmtYrds, @DisposalDt, @PCSComment, @LastChangeBy

		
		,@SWPermitIDIn, @SWPermitIDOut OUTPUT, @PCSID, @SWLAPermitNbr, @AppReceivedDt, @IssueDt, @ExpirationDt, @PermitExtDt, @SWFeeInd, @LandUseApprovedInd
		,@PermitComment, @PCSPermitLastChangeBy, @ErrorMessageHandler OUTPUT
		

 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apInsUpdPCSAndPCSPermitData]
	  	 @PCSIDIn  				INT   
        ,@PCSIDOut 				INT = 0 	OUTPUT		
       	,@LustID 				INT 			
	   	,@LandfillFacID 		INT 		= NULL		
		,@TreatmentFacID 		INT			= NULL
		,@OnSiteDisposalInd		BIT			= NULL		
		,@OffSiteDisposalAddr 	VARCHAR(50) = NULL	
		,@SoilStatusID 			INT 		= NULL		
		,@SoilStatusCd 			VARCHAR(6)  = NULL		
		,@LandfillAmtYrds		DECIMAL(10,1)  = NULL
		,@TreatmentAmtYrds		DECIMAL(10,1)  = NULL	
		,@OnSiteAmtYrds			DECIMAL(10,1)  = NULL	
		,@OffSiteAmtYrds		DECIMAL(10,1)  = NULL
 	  	,@DisposalDt 			DATETIME 	   = NULL
		,@PCSComment			VARCHAR(8000)  = NULL	
		,@LastChangeBy			Varchar(64) 
	 	
		
		,@SWPermitIDIn  		INT   
       	,@SWPermitIDOut 		INT 		  = 0    OUTPUT		
 		,@PCSID		  	        INT  
		,@SWLAPermitNbr		    VARCHAR(20)
		,@AppReceivedDt 		DATETIME 	  = NULL
		,@IssueDt 			    DATETIME 	  = NULL
 		,@ExpirationDt 		    DATETIME 	  = NULL
		,@PermitExtDt 		    DATETIME 	  = NULL
		,@SWFeeInd			    BIT		      = NULL
		,@LandUseApprovedInd    BIT		      = NULL
		,@PermitComment		    VARCHAR(8000) = NULL
		,@PCSPermitLastChangeBy VARCHAR(64)	  
		
		,@ErrorMessageHandler		VARCHAR(1024)			OUTPUT

AS

DECLARE  @PCSIDInCheck INT, @LustIDCheck INT, @LandfillFacIDCheck INT, @TreatmentFacIDCheck INT, @OnSiteDisposalIndCheck BIT ,@OffSiteDisposalAddrCheck VARCHAR(50)
		,@SoilStatusIDCheck	INT	,@SoilStatusCdCheck VARCHAR(6), @LandfillAmtYrdsCheck DECIMAL(10,1), @TreatmentAmtYrdsCheck DECIMAL(10,1), @OnSiteAmtYrdsCheck DECIMAL(10,1)
		,@OffSiteAmtYrdsCheck DECIMAL(10,1), @DisposalDtCheck DATETIME, @PCSCommentCheck VARCHAR(8000), @LastChangeByCheck Varchar(64), @LastChangeDateCheck DATETIME

		
		,@SWPermitIDInCheck	INT, @PCSIDCheck INT, @SWLAPermitNbrCheck VARCHAR(20), @AppReceivedDtCheck DATETIME, @IssueDtCheck DATETIME, @ExpirationDtCheck DATETIME
		,@PermitExtDtCheck DATETIME, @SWFeeIndCheck	BIT, @LandUseApprovedIndCheck BIT, @PermitCommentCheck VARCHAR(8000), @TreatmentescriptionCheck VARCHAR(8000), @PCSPermitLastChangeByCheck VARCHAR(64)
		

PRINT '@pCSIdIn = ' + convert(varchar, @PCSIdIn)

BEGIN
	IF ISNULL(@PCSIDIn, 0) != 0
		-- PCS record Exists - Perform update IF values have changed
		BEGIN
			SELECT @LustIDCheck = ISNULL(LustId, 0), @LandFillFacIdCheck = ISNULL(DispLandFillFacID, 0), @TreatmentFacIDCheck = ISNULL(DispThrmFacID, 0), @OnSiteDisposalIndCheck = ISNULL(OnSiteDisposalInd, 0),
			@OffSiteDisposalAddrCheck = ISNULL(OffsiteDispAddr, ''), @SoilStatusIDCheck = ISNULL(SoilStatusID, 0), @SoilStatusCdCheck = ISNULL(SoilStatusCode, ''), @LandfillAmtYrdsCheck = ISNULL(LandfillAmtYrds3, 0),
			@TreatmentAmtYrdsCheck = ISNULL(ThermalAmtYrds3, 0), @OnSiteAmtYrdsCheck = ISNULL(OnSiteAmtYrds3, 0), @OffSiteAmtYrdsCheck = ISNULL(OffSiteAmtYrds3, 0), @DisposalDtCheck = ISNULL(DisposalDate, Convert(DateTime,'01/01/1900')),
			@PCSCommentCheck = ISNULL(PCSComment, ''), @LastChangeByCheck = ISNULL(LastChangeBy, ''), @LastChangeDateCheck = ISNULL(LastChangeDate, Convert(DateTime, '01/01/1900'))
			FROM PetroContamSoil
			WHERE @PCSIdIn = PcsId

			IF NOT (@LustIDCheck = @LustID AND @LandFillFacIdCheck = @LandfillFacID AND @TreatmentFacIDCheck = @TreatmentFacID AND @OnSiteDisposalIndCheck = @OnSiteDisposalInd 
					AND @OffSiteDisposalAddrCheck = @OffSiteDisposalAddr AND @SoilStatusIDCheck = @SoilStatusID AND @SoilStatusCdCheck = @SoilStatusCd
					AND @LandfillAmtYrdsCheck = @LandfillAmtYrds AND @TreatmentAmtYrdsCheck = @TreatmentAmtYrds AND @OnSiteAmtYrdsCheck = @OnSiteAmtYrds 
					AND @OffSiteAmtYrdsCheck = @OffSiteAmtYrds AND @DisposalDtCheck = @DisposalDt AND @PCSCommentCheck = @PCSComment AND @LastChangeByCheck = @LastChangeBy)
					BEGIN
						EXEC apInsUpdPCSData @PCSIDIn ,@PCSIDOut OUTPUT, @LustID, @LandfillFacID, @TreatmentFacID, @OnSiteDisposalInd, @OffSiteDisposalAddr, @SoilStatusID
							,@SoilStatusCd, @LandfillAmtYrds, @TreatmentAmtYrds, @OnSiteAmtYrds, @OffSiteAmtYrds, @DisposalDt, @PCSComment, @LastChangeBy, @ErrorMessageHandler OUTPUT
						IF ISNULL(@ErrorMessageHandler, '') != ''
							RETURN 
					END
			else
				Print 'No Update to ' +  convert(varchar, @PCSIdIn) + ' PetroContamSoil was performed - All Data same'
		END
	ELSE
		BEGIN
			Print 'Update to ' +  convert(varchar, @PCSIdIn) + ' was performed'
			-- PCS record does NOT exist - Perform insert
			EXEC apInsUpdPCSData @PCSIDIn ,@PCSIDOut OUTPUT, @LustID, @LandfillFacID, @TreatmentFacID, @OnSiteDisposalInd, @OffSiteDisposalAddr, @SoilStatusID
			,@SoilStatusCd, @LandfillAmtYrds, @TreatmentAmtYrds, @OnSiteAmtYrds, @OffSiteAmtYrds, @DisposalDt, @PCSComment, @LastChangeBy, @ErrorMessageHandler OUTPUT
			IF ISNULL(@ErrorMessageHandler, '') != ''
				RETURN 
		END



	-- If the PCS record is recreated or previously exists - update the PCSPermit record if the values have changed and it exists, otherwise insert the PCSPermit record
	Print '@PCSIDIn = ' + Convert(varchar, @PCSIDIn)
	Print '@PCSIDOut = ' + Convert(varchar, @PCSIDOut)
	IF ISNULL(@PCSID, 0) = 0
		BEGIN
			IF ISNULL(@PCSIDIn, 0) != 0
				SET @PCSID = @PCSIDIn
			IF ISNULL(@PCSID, 0) = 0
				IF ISNULL(@PCSIDOut, 0) != 0
					SET @PCSID = @PCSIDOut
		END
	PRINT '@PCSID = ' + Convert(varchar, @PCSID)
	print '@SWPermitIDIn = ' + Convert(varchar, @SWPermitIDIn)
	IF ISNULL(@PCSID, 0) != 0
		BEGIN
			IF ISNULL(@SWPermitIDIn, 0) != 0
				BEGIN
					SELECT @PCSIDInCheck = ISNULL(PCSID, 0), @SWLAPermitNbrCheck = ISNULL(SwlaPermitNbr, ''), @AppReceivedDtCheck = ISNULL(ApplReceivedDate, Convert(DateTime,'01/01/1900')),
					@IssueDtCheck = ISNULL(IssueDate, Convert(DateTime,'01/01/1900')), @ExpirationDtCheck = ISNULL(ExpirationDate, Convert(DateTime,'01/01/1900')), @PermitExtDtCheck = ISNULL(PermitExtensionDate, Convert(DateTime,'01/01/1900')),
					@SWFeeIndCheck = ISNULL(SwFeeInd, 0), @LandUseApprovedIndCheck = ISNULL(LandUseApproveInd, 0), @PermitCommentCheck = ISNULL(TreatmentDescription, ''),
					@PCSPermitLastChangeByCheck = ISNULL(LastChangeBy, '')
					FROM PCSSWPermit 
					WHERE PcsSwPermitId = @SWPermitIDIn
					Print '@SWLAPermitNbrCheck ' + ISNULL(@SWLAPermitNbrCheck, '')
					Print '@SWLAPermitNbr ' + ISNULL(@SWLAPermitNbr, '<blank>')
					
					IF NOT (CHECKSUM(@SWLAPermitNbrCheck) = CHECKSUM(@SWLAPermitNbr) AND CHECKSUM(@PermitCommentCheck) = CHECKSUM(@PermitComment) AND CHECKSUM(@PCSPermitLastChangeByCheck) = CHECKSUM(@PCSPermitLastChangeBy)
							AND CAST(@AppReceivedDtCheck AS DATE) = CAST(@AppReceivedDt AS DATE) AND  CAST(@IssueDtCheck AS DATE) = CAST(@IssueDt AS DATE) 
							AND CAST(@ExpirationDtCheck AS DATE) = CAST(@ExpirationDt AS DATE) AND CAST(@PermitExtDtCheck AS DATE) = CAST(@PermitExtDt AS DATE) 
							AND @SWFeeIndCheck = @SWFeeInd AND  @LandUseApprovedIndCheck = @LandUseApprovedInd AND CHECKSUM(@PCSPermitLastChangeByCheck) = CHECKSUM(@PCSPermitLastChangeBy))
										
					/*
					IF NOT (@PCSIDInCheck = @PCSID OR CHECKSUM(@SWLAPermitNbrCheck) = CHECKSUM(@SWLAPermitNbr) OR @AppReceivedDtCheck = @AppReceivedDt OR @IssueDtCheck = @IssueDt
							OR @ExpirationDtCheck = @ExpirationDt OR @PermitExtDtCheck = @PermitExtDt OR @SWFeeIndCheck = @SWFeeInd OR @LandUseApprovedIndCheck = @LandUseApprovedInd
							OR CHECKSUM(@PermitCommentCheck) = CHECKSUM(@PermitComment) OR CHECKSUM(@PCSPermitLastChangeByCheck) = CHECKSUM(@PCSPermitLastChangeBy))
					*/		
							BEGIN
								declare @PCSPermitErrorMessageHandler VARCHAR(1024)
								Print 'A difference in PCSSwPermit data was found'
								EXEC apInsUpdPCSPermitData @SWPermitIDIn, @SWPermitIDOut OUTPUT, @PCSID, @SWLAPermitNbr, @AppReceivedDt, @IssueDt
 									,@ExpirationDt, @PermitExtDt, @SWFeeInd, @LandUseApprovedInd, @PermitComment, @PcsPermitLastChangeBy, @PCSPermitErrorMessageHandler OUTPUT
									print '@PCSPermitErrorMessageHandler ' + ISNULL(@PCSPermitErrorMessageHandler, '<blank>')
									SET @ErrorMessageHandler = @PCSPermitErrorMessageHandler 
									IF ISNULL(@PCSPermitErrorMessageHandler, '') != ''
										BEGIN
											RETURN 
										END
							END
					ELSE
						BEGIN
							Print 'No Update to ' +  convert(varchar, @PCSIdIn) + ' PCSSwPermit was performed - All Data same'
						END 
				END
			ELSE
				BEGIN
				Print 'Inserting new PCSSwPermit Record'
					IF NOT (ISNULL(@SWLAPermitNbr, '') = '' 
							AND ISNULL(@AppReceivedDt, Convert(DateTime, '01/01/1900')) = Convert(DateTime, '01/01/1900') 
							AND ISNULL(@IssueDt, Convert(DateTime, '01/01/1900')) = Convert(DateTime, '01/01/1900')
 							AND ISNULL(@ExpirationDt, Convert(DateTime, '01/01/1900')) = Convert(DateTime, '01/01/1900') 
							AND ISNULL(@PermitExtDt, Convert(DateTime, '01/01/1900')) = Convert(DateTime, '01/01/1900') AND ISNULL(@SWFeeInd, 0) = 0
							AND ISNULL(@LandUseApprovedInd, 0) = 0 AND ISNULL(@PermitComment, '') = '' )
						BEGIN
							PRINT '@SWLAPermitNbr = ' + ISNULL(@SWLAPermitNbr, '') 
							PRINT '@AppReceivedDt = ' + Convert(varchar, ISNULL(@AppReceivedDt, '01/01/1900'))
							PRINT '@IssueDt = ' + Convert(varchar, ISNULL(@IssueDt, '01/01/1900'))
							PRINT '@ExpirationDt = ' + Convert(varchar, ISNULL(@ExpirationDt, '01/01/1900'))
							PRINT '@PermitExtDt = ' + Convert(varchar, ISNULL(@PermitExtDt, '01/01/1900'))
							PRINT '@SWFeeInd = ' + Convert(varchar, ISNULL(@SWFeeInd, 0))
							PRINT '@LandUseApprovedInd = ' + Convert(varchar, ISNULL(@LandUseApprovedInd, 0))
							PRINT '@PermitComment = ' + ISNULL(@PermitComment, '')
							PRINT '@PcsPermitLastChangeBy = ' + ISNULL(@PcsPermitLastChangeBy, '')
							Print 'Creating new PCSSwpermit Record - contains valid data'
							EXEC apInsUpdPCSPermitData @SWPermitIDIn, @SWPermitIDOut OUTPUT, @PCSID, @SWLAPermitNbr, @AppReceivedDt, @IssueDt
 							,@ExpirationDt, @PermitExtDt, @SWFeeInd, @LandUseApprovedInd, @PermitComment, @PcsPermitLastChangeBy, @ErrorMessageHandler OUTPUT
							IF ISNULL(@ErrorMessageHandler, '') != ''
								RETURN 
						END
					ELSE
						BEGIN
							PRINT '@SWLAPermitNbr = ' + ISNULL(@SWLAPermitNbr, '') 
							PRINT '@AppReceivedDt = ' + Convert(varchar, ISNULL(@AppReceivedDt, '01/01/1900'))
							PRINT '@IssueDt = ' + Convert(varchar, ISNULL(@IssueDt, '01/01/1900'))
							PRINT '@ExpirationDt = ' + Convert(varchar, ISNULL(@ExpirationDt, '01/01/1900'))
							PRINT '@PermitExtDt = ' + Convert(varchar, ISNULL(@PermitExtDt, '01/01/1900'))
							PRINT '@SWFeeInd = ' + Convert(varchar, ISNULL(@SWFeeInd, 0))
							PRINT '@LandUseApprovedInd = ' + Convert(varchar, ISNULL(@LandUseApprovedInd, 0))
							PRINT '@PermitComment = ' + ISNULL(@PermitComment, '')
							PRINT '@PcsPermitLastChangeBy = ' + ISNULL(@PcsPermitLastChangeBy, '')
							Print 'Creating new PCSSwpermit Record - contains valid data'
							PRINT 'No valid PCSSWPermit Data to insert'
						END
				END
		END

END

	

GO
GRANT EXECUTE ON [dbo].[apInsUpdPCSAndPCSPermitData] TO [LUSTUser] AS [dbo]
GO


/****** Object:  StoredProcedure [dbo].[apInsUpdPcsPcsPermitData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdPCS
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/
Create PROCEDURE [dbo].[apInsUpdPcsPcsPermitData]
	  	 @PCSIDIn  				INT   
        ,@PCSIDOut 				INT = 0 	OUTPUT		
       	,@LustID 				INT 			
	   	,@LandfillFacID 		INT 		= NULL		
		,@TreatmentFacID 		INT			= NULL
		,@OnSiteDisposalInd		INT			= NULL		
		,@OffSiteDisposalAddr 	VARCHAR(50) = NULL	
		,@SoilStatusID 			INT 		= NULL		
		,@SoilStatusCd 			VARCHAR(6)  = NULL		
		,@LandfillAmtYrds		DECIMAL(10,1)  = NULL
		,@TreatmentAmtYrds		DECIMAL(10,1)  = NULL	
		,@OnSiteAmtYrds			DECIMAL(10,1)  = NULL	
		,@OffSiteAmtYrds		DECIMAL(10,1)  = NULL
 	  	,@DisposalDt 			DATETIME 	   = NULL
		,@PCSComment			VARCHAR(8000)  = NULL	
		,@LastChangeBy			Varchar(64) 
		,@ErrorMessageHandler		VARCHAR(1024)			OUTPUT
AS
DECLARE @Result int
SELECT  @Result = 0

-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @DisposalDt = CAST(CONVERT(varchar(8), @DisposalDt, 112) as datetime)

SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

-------------------------------------------------------------------------

-- Business Rules Validation 

-- Disposal Date is required
IF @DisposalDt IS NULL
	BEGIN
		RaisError('Disposal date is required.', 11,1)
		SET @ErrorMessageHandler = 'Disposal date is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Disposal amount is required
IF (@LandfillAmtYrds IS NULL AND 
    @TreatmentAmtYrds IS NULL AND
    @OnSiteAmtYrds IS NULL AND
    @OffSiteAmtYrds IS NULL AND
    @SoilStatusID <> 1)
	BEGIN
		RaisError('Disposal amount -or- a NO PCS MANAGED Soil Status is required.', 11,1)
		SET @ErrorMessageHandler = 'Disposal amount -or- a NO PCS MANAGED Soil Status is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Landfill facility required if landfill amount specified
IF @LandfillAmtYrds > 0 AND
   (@LandfillFacID IS NULL OR @LandfillFacID = 0) 
	BEGIN
		RaisError('Landfill facility is required if landfill amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'Landfill facility is required if landfill amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Landfill amount required if landfill facility specified
IF @LandfillFacID > 0 AND
   (@LandfillAmtYrds IS NULL OR @LandfillAmtYrds = 0) 
	BEGIN
		RaisError('Landfill amount is required if landfill facility is specified.', 11,1)
		SET @ErrorMessageHandler = 'Landfill amount is required if landfill facility is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Treatment facility required if treatment amount specified
IF @TreatmentAmtYrds > 0 AND
   (@TreatmentFacID IS NULL OR @TreatmentFacID = 0) 
	BEGIN
		RaisError('Treatment facility is required if treatment amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'Treatment facility is required if treatment amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Treatment amount required if treatment facility specified
IF @TreatmentFacID > 0 AND
   (@TreatmentAmtYrds IS NULL OR @TreatmentAmtYrds = 0) 
	BEGIN
		RaisError('Treatment amount is required if treatment facility is specified.', 11,1)
		SET @ErrorMessageHandler = 'Treatment amount is required if treatment facility is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Onsite disposal indicator should be set to true if onsite amount specified
IF @OnSiteAmtYrds > 0 AND
   (@OnSiteDisposalInd IS NULL OR @OnSiteDisposalInd = 0) 
	BEGIN
		RaisError('OnSite disposal indicator should be set to true if onsite amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'OnSite disposal indicator should be set to true if onsite amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Onsite amount required if onsite disposal indicator set to true
IF @OnSiteDisposalInd = 1 AND
   (@OnSiteAmtYrds IS NULL OR @OnSiteAmtYrds = 0) 
	BEGIN
		RaisError('Onsite amount is required if onsite disposal indicator is set to true.', 11,1)
		SET @ErrorMessageHandler = 'Onsite amount is required if onsite disposal indicator is set to true.'
		SET @Result = @@Error
		GOTO ABORT
	END


-- Offsite disposal address required if offsite amount specified
IF @OffsiteAmtYrds > 0 AND
   (@OffSiteDisposalAddr IS NULL OR LEN(@OffSiteDisposalAddr)= 0) 
	BEGIN
		RaisError('Offsite disposal address is required if offsite amount is specified.', 11,1)
		SET @ErrorMessageHandler = 'Offsite disposal address is required if offsite amount is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END


-- Offsite amount required if offsite facility specified
IF LEN(@OffSiteDisposalAddr)> 0 AND
   (@OffsiteAmtYrds IS NULL OR @OffsiteAmtYrds = 0) 
	BEGIN
		RaisError('Offsite amount is required if offsite disposal address is specified.', 11,1)
		SET @ErrorMessageHandler = 'Offsite amount is required if offsite disposal address is specified.'
		SET @Result = @@Error
		GOTO ABORT
	END

-------------------------------------------------------------------------
-- Insert/Update

IF @PCSIDIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[PetroContamSoil] 
		(
		 [LustID]
		,[DispLandfillFacID]
		,[DispThrmFacID]
		,[OnSiteDisposalInd]
		,[OffsiteDispAddr]
		,[SoilStatusID]
		,[SoilStatusCode]
		,[LandfillAmtYrds3]
		,[ThermalAmtYrds3]
		,[OnSiteAmtYrds3]
		,[OffSiteAmtYrds3]
		,[DisposalDate]
		,[PCSComment]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
       	 @LustID 						
	    ,@LandfillFacID 			
		,@TreatmentFacID 
		,@OnSiteDisposalInd			
		,@OffSiteDisposalAddr 	
		,@SoilStatusID 			
		,@SoilStatusCd 			
		,@LandfillAmtYrds		
		,@TreatmentAmtYrds	
		,@OnSiteAmtYrds		
		,@OffSiteAmtYrds		
 	   	,@DisposalDt
		,@PCSComment 		
        ,@LastChangeBy
		,GETDATE()
            )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @PCSIDOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[PetroContamSoil] 
        SET
	 	 [LustID]			= @LustID
		,[DispLandfillFacID]	= @LandfillFacID 	
		,[DispThrmFacID]		= @TreatmentFacID
		,[OnSiteDisposalInd]    = @OnSiteDisposalInd 		
		,[OffsiteDispAddr]	= @OffSiteDisposalAddr
		,[SoilStatusID]		= @SoilStatusID 
		,[SoilStatusCode]		= @SoilStatusCd 	
		,[LandfillAmtYrds3]	= @LandfillAmtYrds	
		,[ThermalAmtYrds3]	= @TreatmentAmtYrds	
		,[OnSiteAmtYrds3]		= @OnSiteAmtYrds
		,[OffSiteAmtYrds3]	= @OffSiteAmtYrds	
		,[DisposalDate]		= @DisposalDt
		,[PCSComment]		= @PCSComment
		,[LastChangeBy] 		= @LastChangeBy
		,[LastChangeDate] 		= GETDATE()

	WHERE [PCSID] = @PCSIDIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @PCSIDOut = @PCSIDIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------



/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	












GO
GRANT EXECUTE ON [dbo].[apInsUpdPcsPcsPermitData] TO [LUSTUser] AS [dbo]
GO


/****** Object:  StoredProcedure [dbo].[apInsUpdPictureData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdPicture
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apInsUpdPictureData]
	   @SitePictureIDIn			int
	  ,@SitePictureIDOut		int	= 0					OUTPUT 
	  ,@LustId					int
	  ,@PictureIDIn				int
 	  ,@PictureIDOut			int = 0					OUTPUT 
	  ,@Caption					varchar(300)	= NULL
      ,@PictureDt				datetime		= NULL
	  ,@ErrorMessageHandler		VARCHAR(1024)			OUTPUT
	  ,@Image					image			= NULL  
	  ,@LastChangeBy			VARCHAR(60) 
AS

DECLARE @Result int
       ,@RecCount int

SELECT  @Result = 0
       ,@RecCount = 0


-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @PictureDt = CAST(CONVERT(varchar(8), @PictureDt, 112) as datetime)

SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT
/* 
---------------------------------------------------------------------------
 Validations 
---------------------------------------------------------------------------
*/

/*  LUST Image Business Rule:
    Picture date required*/

IF (@PictureDt IS NULL)
  	BEGIN
		SET @ErrorMessageHandler = 'Taken On Date is required.'
		Set @Result = @@Error
		GOTO Abort
   END


/*  LUST Image Business Rule:
    Picture date can't be greater than today's date */
IF (@PictureDt > GetDate())
   BEGIN
		SET @ErrorMessageHandler = 'You must select a Taken On Date that is less than or equal to today''s date.'
		Set @Result = @@Error
		GOTO Abort
   END


/*  LUST Image Business Rule:
    Caption required*/

IF (@Caption IS NULL)OR (LEN(RTRIM(@Caption)) = 0)
  	BEGIN
		SET @ErrorMessageHandler = 'Caption is required.'
		Set @Result = @@Error
		GOTO Abort
   END

/*  LUST Image Business Rule:
    If Insert then Image required */
IF @PictureIDIn  = 0 AND @Image IS NULL
  	BEGIN
		SET @ErrorMessageHandler = 'Image is required.'
		Set @Result = @@Error
		GOTO Abort
   	END


IF @PictureIDIn  = 0 --Primary Key 
	BEGIN           --Insert new record
		INSERT INTO [dbo].[Picture] 
			(
			[Caption]
			,[PictureDate]
			,[Image]
			,[LastChangeBy]
			,[LastChangeDate]
			) 
		VALUES 
			(
			@Caption
			,@PictureDt
			,@Image
	      	,@LastChangeBy
			,GETDATE()
			)

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT

		SELECT @PictureIDOut = @@IDENTITY -- New Primary Key  

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT	

		INSERT INTO [dbo].[SitePicture] 
			(
			[fkLustID]
			,[PictureID]
			,[LastChangeBy]
			,[LastChangeDate]
			,[IsAssociatedWithSite]
			) 
		VALUES 
			(
			@LustID
			,@PictureIDOut
	      	,@LastChangeBy
			,GETDATE()
			,1  -- indicates association with lust incident
			)

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT

		SELECT @SitePictureIDOut = @@IDENTITY -- New Primary Key  

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT	

	END
ELSE
	BEGIN           --Update existing record
		UPDATE [dbo].[Picture] SET
			[Caption] = @Caption 
			,[PictureDate] = @PictureDt 
			,[Image] = COALESCE(@Image,[Image])
			,[LastChangeBy]= @LastChangeBy
			,[LastChangeDate]= GETDATE()
	
		WHERE [PictureID] = @PictureIDIn --Primary Key

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT

		SELECT @PictureIDOut = @PictureIDIn  

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT

		UPDATE [dbo].[SitePicture] SET
	             [LastChangeBy] = @LastChangeBy
	            ,[LastChangeDate] = GETDATE()

		WHERE [PictureID] = @PictureIDIn --Primary Key

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT

		SELECT @SitePictureIDOut = @SitePictureIDIn  

		SELECT @Result = @@ERROR
		SET @ErrorMessageHandler = Error_Message()
		IF @Result <> 0
			GOTO ABORT

	END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------	


/* Or, in case of failure... */
ABORT:
	
	RETURN @Result  -- Return @@Error > 0








GO
GRANT EXECUTE ON [dbo].[apInsUpdPictureData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdProjMgrHistoryData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*****************************************************************************/
/*
**		Name: [dbo].[apInsUpdProjMgrHistory]
**		Desc: Inserts or Updates a Record in [dbo].[ProjectManagerHistory]
**		
**		Inputs:	@ProjMgrHistIdIn int --Primary Key 
**              --,@ProjMgrHistIdOut int = 0 OUTPUT
**	        --,@LustId int
**	        -- ,@PMLogin varchar(7)
**	        -- ,@AssignedDt datetime
**	        -- ,@EndDt datetime = NULL
**		-- ,@LastChgBy varchar(7)
**		-- ,@LastChgDt datetime
**              -- ,@OraPmHistId int      Used for migration purposes only
**		-- ,@OraIncNbr int        Used for migration purposes only  
**		  
**		Outputs:
**		New Primary Key(s) 
**		@ProjMgrHistIdOut int --Primary Key
**		@Result		  bit  0 = Update successfully 1 = Failure	
**		 
**		Return values: 
** 
**		Called by:  LUST
**              
**		Auth: Generated by CodeSmith and Bruce Dyer
**		Date: Thursday, August 19, 2004
*******************************************************************************
**		Change History
*******************************************************************************
**	Date:		Author:		Description:
**	--------	--------	---------------------------------------
**    	5/9/2005        Nina Wooster    Added validation code	
*******************************************************************************
*/

CREATE PROCEDURE [dbo].[apInsUpdProjMgrHistoryData]
	   @ProjMgrHistIdIn		int   
      ,@ProjMgrHistIdOut	int = 0 OUTPUT
	  ,@LustId				int
	  ,@PMLogin				varchar(7)
	  ,@AssignedDt			datetime
	  ,@EndDt				datetime = NULL
	  ,@LastChangeBy	 	VARCHAR(64)
	  ,@ErrorMessageHandler	VARCHAR(1024) OUTPUT
AS

DECLARE  @Result int
        ,@RecCount int

SELECT   @Result = 0
        ,@RecCount = 0


-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @AssignedDt = CAST(CONVERT(varchar(8), @AssignedDt, 112) as datetime)
      ,@EndDt      = CAST(CONVERT(varchar(8), @EndDt, 112) as datetime)

SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

/*  LUST Project Manager History Business Rule:
    PMLogin required */
IF (@PMLogin IS NULL)OR (@PMLogin = '')
	BEGIN
		SET @ErrorMessageHandler = 'Project Manager is required.'
		Set @Result = @@Error
		GOTO Abort
    	END

/*  LUST Project Manager History Business Rule:
    Assigned Date required */
IF (@AssignedDt IS NULL)
  	BEGIN
		SET @ErrorMessageHandler = 'Assigned Date is required.'
		Set @Result = @@Error
		GOTO Abort
  	END

/* LUST Project Manager History Business Rule:
   Assigned Date must be less than or equal to End Date
   If not, set return error value, and end stored procedure processing.
*/
IF (@AssignedDt > @EndDt)
	BEGIN
		SET @ErrorMessageHandler = 'End Date cannot be before Assigned Date.'
		Set @Result = @@Error
		GOTO Abort
 	END

/* LUST Project Manager History Business Rule:
   Assigned date can't be greater than today's date */
IF (@AssignedDt > GetDate())
 	BEGIN
		SET @ErrorMessageHandler = 'Assigned Date cannot be later than today.'
		Set @Result = @@Error
		GOTO Abort
 	END

/* LUST Project Manager History Business Rule:
   End date can't be greater than today's date */
IF (@EndDt > GetDate())
	BEGIN
		SET @ErrorMessageHandler = 'End Date cannot be later then today.'
		Set @Result = @@Error
		GOTO Abort
	END

/* LUST Project Manager History Business Rule:
   If same project manager specified, then only one can have no end date */

IF (@EndDt IS Null)
	BEGIN
		SELECT @RecCount = Count(*) 
		FROM [dbo].[ProjectManagerHistory] 
		WHERE PMLogin = @PMLogin
		AND LustID = @LustID
		AND EndDate IS NULL
		AND ProjMgrHistId <> @ProjMgrHistIdIn

		IF (@RecCount > 0)
			BEGIN
				SET @ErrorMessageHandler = 'Record for this Project Manager already exists.'
				SET @Result = @@Error
				GOTO ABORT
			END
	END

/* LUST Project Manager History Buiness Rule:
	If same project manager specified, then only one can have same 
	beginning and end date - Only on Upd. */

IF (@EndDt IS NOT NULL)
	BEGIN
		IF EXISTS(SELECT * FROM [dbo].[ProjectManagerHistory] 
					WHERE PMLogin = @PMLogin
					AND LustID = @LustID
					AND AssignedDate = @AssignedDt
					AND EndDate = @EndDt
					) 
			BEGIN
				SET @ErrorMessageHandler = 'Existing Project Management History Exists for this record'
				SET @Result = @@Error
				GOTO ABORT
			END

	END

-------------------------------------------------------------------------
-- Insert/Update

IF @ProjMgrHistIdIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[ProjectManagerHistory] 
		(
		 [LustId]
		,[PMLogin]
		,[AssignedDate]
		,[EndDate]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @LustId
		,@PMLogin
		,@AssignedDt
		,@EndDt
	    ,@LastChangeBy
		,GETDATE()
            )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @ProjMgrHistIdOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[ProjectManagerHistory] 
    SET
	 [LustId]    = @LustId 
	,[AssignedDate]= @AssignedDt
	,[EndDate]     = @EndDt
	,[LastChangeBy] = @LastChangeBy
	,[LastChangeDate] = GETDATE()

	WHERE [ProjMgrHistId] = @ProjMgrHistIdIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @ProjMgrHistIdOut = @ProjMgrHistIdIn

	SELECT @Result = @@ERROR
	IF @Result <> 0	
           	GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------


/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	








GO
GRANT EXECUTE ON [dbo].[apInsUpdProjMgrHistoryData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdPublicNoticeData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdPublicNotice
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apInsUpdPublicNoticeData]
	 @PublicNoticeIDIn  	INT   
    ,@PublicNoticeIDOut 	INT 		  = 0 OUTPUT
	,@LustId 				INT
	,@PublicNoticeTypeID 	INT 				
	,@PublicNoticeDt		DATETIME	 
	,@MeetingRqstInd		BIT			  = NULL
	,@MeetingDt				DATETIME      = NULL
	,@Comments				VARCHAR(8000) = NULL
	,@LastChangeBy			VARCHAR(64)
	,@ErrorMessageHandler	VARCHAR(1024)			OUTPUT		
AS

DECLARE @Result int
SELECT  @Result = 0


-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @PublicNoticeDt = CAST(CONVERT(varchar(8), @PublicNoticeDt, 112) as datetime)
SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

SELECT @MeetingDt = CAST(CONVERT(varchar(8), @MeetingDt, 112) as datetime)
SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT
-------------------------------------------------------------------------
-- Business Rules Validation 


-- Public Notice Type ID is required and can't be null or 0
IF (@PublicNoticeTypeID IS NULL) OR (@PublicNoticeTypeID = 0)
	BEGIN
		RaisError('Public Notice Type is required.', 11,1)
		SET @ErrorMessageHandler = 'Public Notice Type is required.'
		SET @Result = @@Error
		GOTO ABORT
	END


-- Public Notice Date is required
IF @PublicNoticeDt IS NULL
	BEGIN
		RaisError('Public Notice Date is required.', 11,1)
		SET @ErrorMessageHandler = 'Public Notice Date is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-------------------------------------------------------------------------
-- Insert/Update

IF @PublicNoticeIDIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[PublicNotice] 
		(
		 [LustId]
		,[PublicNoticeTypeID]
		,[PublicNoticeDate]
		,[MeetingRqstInd]
		,[MeetingDate]
		,[Comment]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @LustId 
		,@PublicNoticeTypeID 					
		,@PublicNoticeDt		 
		,@MeetingRqstInd		
		,@MeetingDt			
		,@Comments				
        --,dbo.fn_CurrentUserName(SUSER_SNAME())
		,@LastChangeBy
		,GETDATE()
             )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @PublicNoticeIDOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[PublicNotice] 
        SET
	 	 [LustId]             = @LustId 
		,[PublicNoticeTypeID] = @PublicNoticeTypeID
		,[PublicNoticeDate]   = @PublicNoticeDt
		,[MeetingRqstInd]     = @MeetingRqstInd
		,[MeetingDate]        = @MeetingDt
		,[Comment]            = @Comments
		--,[LastChangeBy]       = dbo.fn_CurrentUserName(SUSER_SNAME())
		,[LastChangeBy]       = @LastChangeBy
		,[LastChangeDate]     = GETDATE()

	WHERE [PublicNoticeID] = @PublicNoticeIDIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @PublicNoticeIDOut = @PublicNoticeIDIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------


/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	







GO
GRANT EXECUTE ON [dbo].[apInsUpdPublicNoticeData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdSiteAliasData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdSiteAlias
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apInsUpdSiteAliasData]
	 @SiteNameAliasIdIn		INT   
    ,@SiteNameAliasIdOut	INT		= 0		OUTPUT
	,@LustId				INT
	,@SiteNameAlias			VARCHAR(50) 
	,@LastChangeBy			VARCHAR(64)
	,@ErrorMessageHandler	VARCHAR(1024)	OUTPUT
AS

DECLARE @Result int
SELECT  @Result = 0

-------------------------------------------------------------------------
-- Business Rules Validation 

-- Site name is required 
IF (@SiteNameAlias IS NULL) OR (LEN(RTRIM(@SiteNameAlias)) = 0)
	BEGIN
		SET @ErrorMessageHandler = 'Site Name Alias cannot be null or blank.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Site name cannot exists in DB
IF EXISTS
    (SELECT *
     FROM [dbo].[SiteNameAlias] 
     WHERE LustId = @LustID
     AND SiteNameAlias = @SiteNameAlias)
	BEGIN
		SET @ErrorMessageHandler = 'Site Name Alias already exists.'
		SET @Result = @@Error
		GOTO ABORT
	END



-------------------------------------------------------------------------
-- Insert/Update

IF @SiteNameAliasIdIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[SiteNameAlias] 
		(
		 [LustId]
		,[SiteNameAlias]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @LustId
		,@SiteNameAlias
                ,@LastChangeBy
		,GETDATE()
                )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @SiteNameAliasIdOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[SiteNameAlias] 
    SET
	 [LustId] = @LustId 
	,[SiteNameAlias] = @SiteNameAlias 
	,[LastChangeBy] = @LastChangeBy
	,[LastChangeDate] = GETDATE()

	WHERE [SiteNameAliasId] = @SiteNameAliasIdIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @SiteNameAliasIdOut = @SiteNameAliasIdIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------


/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0
	












GO
GRANT EXECUTE ON [dbo].[apInsUpdSiteAliasData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdSiteControlData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdSiteControl
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 select * FROM [dbo].[SiteControl] 
 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apInsUpdSiteControlData]
	 @SiteControlIDIn		 INT 
	,@SiteControlIDOut		INT      		= 0 OUTPUT
	,@fkLustID 				INT 
	,@fkControlID			INT 
	,@ControlBeginDate 		DATETIME
 	,@ControlEndDate 		DATETIME 		= NULL
   	,@FrequencyOfReview		SMALLINT 		= NULL
   	,@ControlComment		VARCHAR(8000)	= NULL
   	,@LastReviewBy     		VARCHAR(7)		= NULL
   	,@LastReviewDt   		DATETIME 		= NULL
	,@ControlTypeId			INT				= NULL	-- NOT SAVED in SiteControl table -- ONLY USED in determining previous SiteControl record exists (???? NOT USED as a junction table)
	,@LastChangeBy			VARCHAR(64)	
	,@ErrorMessageHandler	VARCHAR(1024) OUTPUT
AS

DECLARE @Result int
SELECT  @Result = 0

-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @ControlBeginDate = CAST(CONVERT(varchar(8), @ControlBeginDate, 112) as datetime)
      ,@ControlEndDate   = CAST(CONVERT(varchar(8), @ControlEndDate, 112) as datetime)
      ,@LastReviewDt     = CAST(CONVERT(varchar(8), @LastReviewDt, 112) as datetime)


SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

-------------------------------------------------------------------------
-- Business Rules Validation 

/*  LUST Site Control Business Rule:
    Control required */
IF (@fkControlID IS NULL)OR (@fkControlID < 1)
	BEGIN
		--RaisError('Control is required.', 11,1) 
		SET @ErrorMessageHandler = 'Control is required.'
		Set @Result = @@Error
		GOTO Abort
    	END


/*
	Determine if an aci
*/

IF ISNULL(@SiteControlIDIn, 0) != 0
	BEGIN
		IF EXISTS (SELECT * 
					FROM   SiteControl a
					JOIN   SiteControlDesc b  ON a.fkControlId = b.ControlId
					JOIN   SiteControlGroup c ON b.fkGroupId = c.GroupId
					WHERE  a.fkLustId = @fkLustID
					AND    a.fkControlId = @fkControlID
					AND    c.fkTypeCodeId = @ControlTypeId
					AND    a.ControlBeginDate = @ControlBeginDate
					AND    a.ControlEndDate = @ControlEndDate)
			BEGIN
				SET @ErrorMessageHandler = 'An Active Site Control of this Type already exists for this Incident.'
				Set @Result = @@Error
				GOTO Abort
    		END
	END

/*  LUST Site Control Business Rule:
    Control required */
IF (@FrequencyOfReview IS NULL)OR (@FrequencyOfReview < 0)
	BEGIN
		--RaisError('Frequency of Review is required.', 11,1) 
		SET @ErrorMessageHandler = 'Frequency of Review is required.'
		Set @Result = @@Error
		GOTO Abort
    	END

/*  LUST Site Control Business Rule:
    Last Reviewed By required */
IF (@LastReviewBy IS NULL)OR (@LastReviewBy = '')
  	BEGIN
		--RaisError('Last Reviewed By is required.', 11,1) 
		SET @ErrorMessageHandler = 'Last Reviewed By is required.'
		Set @Result = @@Error
		GOTO Abort
   END

/*  LUST Site Control Business Rule:
    Control Begin Date required */
IF (@ControlBeginDate IS NULL)
  	BEGIN
		--RaisError('Control Begin Date is required.', 11,1) 
		SET @ErrorMessageHandler = 'Control Begin Date is required.'
		Set @Result = @@Error
		GOTO Abort
  	END

/* 
todo bdyer 20 June 2006 <-- disable this check per Workgroup direction.

LUST Site Control Business Rule:
   Control Begin Date can't be greater than today's date */

/*
IF (@ControlBeginDate > GetDate())
 	BEGIN
		RaisError('Control Begin Date cannot be later than today.', 11,1) 
		Set @Result = @@Error
		GOTO Abort
 	END
*/


/* LUST Site Control Business Rule:
   Control End Date can't be greater than today's date 
   todo bdyer 20 June 2006 <-- disable this check per Workgroup direction.

   Control End Date can't be before Control Begin date */

IF NOT @ControlEndDate Is NULL 
   	BEGIN
	IF (@ControlEndDate < @ControlBeginDate)
 		BEGIN
			--RaisError('Control End Date cannot be before than Control Begin Date.', 11,1) 
			SET @ErrorMessageHandler = 'Control End Date cannot be before than Control Begin Date.'
			Set @Result = @@Error
			GOTO Abort
 		END
	END  


/* LUST Site Control Business Rule:
   Last Review Date can't be greater than today's date 
   Last Review Date can't be before Control Begin date */

IF NOT @LastReviewDt Is NULL 
   	BEGIN
		IF (@LastReviewDt > GetDate())
 			BEGIN
				--RaisError('Last Review Date cannot be later than today.', 11,1) 
				SET @ErrorMessageHandler = 'Last Review Date cannot be later than today.'
				Set @Result = @@Error
				GOTO Abort
 			END

		IF (@LastReviewDt < @ControlBeginDate)
 			BEGIN
				--RaisError('Last Review Date cannot be before than Control Begin Date.', 11,1) 
				SET @ErrorMessageHandler = 'Last Review Date cannot be before than Control Begin Date.'
				Set @Result = @@Error
				GOTO Abort
 			END
	END  


-------------------------------------------------------------------------
-- Insert/Update

IF @SiteControlIdIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO [dbo].[SiteControl] 
		(
		 [fkLustId]
		,[fkControlID]
		,[ControlBeginDate]
		,[ControlEndDate]
		,[FrequencyOfReview]
		,[ControlComment]
		,[LastReviewBy]
		,[LastReviewDate]
		,[LastChangeBy]
		,[LastChangeDate]
		) 
	VALUES 
		(
		 @fkLustId
		,@fkControlID
		,@ControlBeginDate
		,@ControlEndDate
		,@FrequencyOfReview
		,@ControlComment
    	,@LastReviewBy  
    	,@LastReviewDt 
        ,@LastChangeBy
		,GETDATE()
            )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @SiteControlIdOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN                            
	UPDATE [dbo].[SiteControl] 
        SET
	 	[fkLustId] 			= @fkLustId 
		,[fkControlID] 		= @fkControlID
		,[ControlBeginDate]	= @ControlBeginDate
		,[ControlEndDate]		= @ControlEndDate
		,[FrequencyOfReview] 	= @FrequencyOfReview
		,[ControlComment]		= @ControlComment
		,[LastReviewBy] 		= @LastReviewBy 
		,[LastReviewDate] 	    = @LastReviewDt 
		,[LastChangeBy] 		= @LastChangeBy
		,[LastChangeDate] 		= GETDATE()

	WHERE [SiteControlId] = @SiteControlIdIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @SiteControlIdOut = @SiteControlIdIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------



/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0











GO
GRANT EXECUTE ON [dbo].[apInsUpdSiteControlData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdWorkReportedData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdWorkReported
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------


 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apInsUpdWorkReportedData]
	 @WorkReportedIdIn		int   
   	,@WorkReportedIdOut		int = 0					OUTPUT
	,@LustId				int
	,@WorkReportedTypeId	int
   	,@WorkReportedDate		datetime
   	,@Comment				varchar(8000) = NULL 
	,@OraREID				int = 0
   	,@OraConsultantId		int = 0
	,@LastChangeBy			VARCHAR(64)
	,@ErrorMessageHandler	VARCHAR(1024)			OUTPUT

AS

DECLARE @Result int
       ,@RecCount int

SELECT  @Result   = 0
       ,@RecCount = 0



-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @WorkReportedDate = CAST(CONVERT(varchar(8), @WorkReportedDate, 112) as datetime)


SELECT @Result = @@ERROR
	IF @Result <> 0
		GOTO ABORT

-------------------------------------------------------------------------
-- Business Rules Validation 

-- Work Type Id required
-- Work Begin Date required
-- Work Begin Date can't be greater than today
-- REID or CONSULTANT ID required
-- No duplicate record: WorkType, WorkBy and Date can't match existing record

-- Work Reported Type ID is required and can't be null or 0
IF ((@WorkReportedTypeId IS NULL) OR (@WorkReportedTypeId  = 0))
	BEGIN
		SET @ErrorMessageHandler = 'Work Reported Type is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Work Reported Date is required
IF @WorkReportedDate IS NULL
	BEGIN
		SET @ErrorMessageHandler = 'Work Reported Date is required.'
		SET @Result = @@Error
		GOTO ABORT
	END

-- Work Reported Date can't be greater than today
IF @WorkReportedDate > GetDate()
	BEGIN
		SET @ErrorMessageHandler = 'Work Reported date cannot be later then today.'
		Set @Result = @@Error
		GOTO Abort
	END


-- REID or CONSULTANT ID required 
IF (((@OraREID IS NULL) OR (@OraREID = 0)) AND ((@OraConsultantId IS NULL) OR (@OraConsultantId = 0)))
	BEGIN
		SET @ErrorMessageHandler = 'Service Provider or Consultant is required.'
		SET @Result = @@Error
		GOTO ABORT
	END


-- No duplicate record: WorkType, WorkBy and Date can't match existing record
SELECT @RecCount = Count(*) 
FROM [dbo].[WorkReported] 
WHERE LustID              = @LustID
  AND WorkReportedDate    = @WorkReportedDate
  AND WorkReportedTypeId  = @WorkReportedTypeId
  AND ServiceProviderId             = @OraREID
  AND ConsultantId     = @OraConsultantId
  AND WorkReportedID     <> @WorkReportedIDIn              

IF (@RecCount > 0)
	BEGIN
		SET @ErrorMessageHandler = 'Duplicate Work Reported record.'
		SET @Result = @@Error
		GOTO ABORT
	END
---------------------------------------------------------------------------
-- Insert/Update

IF @WorkReportedIdIn  = 0 --Primary Key   
BEGIN   --<<< Begin Insert Routine
	INSERT INTO dbo.WorkReported 
	(
	 LustId
	,WorkReportedTypeId
	,WorkReportedTypeCode
	,WorkReportedDate
	,ServiceProviderId
	,ConsultantId
	,Comment
	,LastChangeBy
	,LastChangeDate
        ) 
	VALUES 
	(
	 @LustId
	,@WorkReportedTypeId
    ,NULL
	,@WorkReportedDate
    ,@OraREID
    ,@OraConsultantId
	,@Comment
    ,@LastChangeBy
	,GETDATE()
        )
	
	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT

	SELECT @WorkReportedIdOut = @@IDENTITY -- New Primary Key  

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
		GOTO ABORT
END                             
ELSE                      -- <<< else begin UPDATE routine
BEGIN     

	UPDATE [dbo].[WorkReported] 
    SET
	 [LustId] = @LustId 
	,[WorkReportedTypeID] = @WorkReportedTypeID
	,[WorkReportedDate]= @WorkReportedDate
	,ServiceProviderId= @OraREId
	,ConsultantId = @OraConsultantId
	,[Comment]= @Comment
	,[LastChangeBy] = @LastChangeBy
	,[LastChangeDate] = GETDATE()
	WHERE [WorkReportedId] = @WorkReportedIdIn --Primary Key

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0
        	GOTO ABORT 	

	SELECT @WorkReportedIdOut = @WorkReportedIdIn

	SELECT @Result = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
	IF @Result <> 0	
                GOTO ABORT 	

END

-----------------------------------------------------------------------------
-- SUCCESS Completion. @Result initialized = 0 in variable definition.
RETURN @Result -- 0
-----------------------------------------------------------------------------


/* Or, in case of failure... */
ABORT:

      RETURN @Result  --  Return @@Error > 0













GO
GRANT EXECUTE ON [dbo].[apInsUpdWorkReportedData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRCheckPostalCountyData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/* ----------------------------------------------------------------------------
 	Name:    apCheckPostalCounty  		   
	Author:  B.Dyer	 Date: 12/19/2005
------------------------ DESCRIPTION ------------------------------------------
                                                     		    
1.	Compare User Interface County value ( from OLPRR or LUST ALTER  screen) 
	with County value from U.S. Postal ZP4 web-service address check.

        Return 0 if they are the same.
        Return 1 if they are differnt.
                                                     		    
    	Input:	1. U/I County value (01-36)
                2. ZP4 County value (last 3 digits of FIPS COUNTY)



TODO BDYER
12/20/2005 I DO NOT WANT TO RETURN A 1 OR ZERO.
i want to return the county_code value of the ZP4 value if it's different from the u/i value.



SO I NEED TO GET THE FIPS VALUE FOR THE U/I COUNTY!


	Output:	@ComparsonValue
		@ErrorValue
					    
	Modification:
    	Date	   Initials	Details
    	--------   --------	----------------------------------------------


------------------------------------------------------------------------------

Usage:
	
	DECLARE @IncidentCounty INT, @CountyName VARCHAR(10), @ErrorValue INT

	exec apOLPRRCheckPostalCountyData 34, '034', @IncidentCounty OUTPUT, @CountyName OUTPUT, @ErrorValue OUTPUT
	SELECT @IncidentCounty, @CountyName, @ErrorValue 

*/
CREATE PROCEDURE [dbo].[apOLPRRCheckPostalCountyData](
	@UICountyCode    Integer
   ,@ZP4FIPSCounty   Varchar(3)
   ,@IncidentCounty  Integer OUTPUT
   ,@CountyName		 VARCHAR(10) OUTPUT
   ,@ErrorValue      Integer OUTPUT)
AS 

BEGIN
SET NOCOUNT ON

DECLARE @iZP4County	  Integer
       ,@sFipsTemp        Varchar(5)
       ,@iFipsTemp        Integer
       ,@sUIFipsCounty    Varchar(5)
       ,@iUIFipsCounty    Integer
	   ,@sUICountyName	  VARCHAR(10)
	   ,@sZP4CountyName	  VARCHAR(10)



-- 1. get the u/i FIPS_COUNTY_CODE value for the in-coming @UICounty.
-- 2. turn the u/i FIPS_COUNTY_CODE into a varchar value.
-- 3. get the last 3 positions of the varchar u/i FIPS_COUNTY_CODE.

-- 4. get the integer COUNTY_CODE value for the in-coming "last 3 positions of" the ZP4 FIPS County. 

-- 5. compare -last 3 positions of u/i fips- to in-coming @ZP4County value.

-- 6. if the same, load @CheckedCounty output with input @UICounty value.

--    if different, load @CheckedCounty output with 
--                  integer COUNTY_CODE value for the in-coming "last 3 positions of" the ZP4 FIPS County. 


-- ------------------------------------------------------------------------------------------------
-- upon return to the u/i, i'm going to set the county combobox index w/ this value 
-- and use it for the Create Incident process.

-- If the U/I county is different that the ZP4 county, we use the ost office provided ZP4 county.
-- ------------------------------------------------------------------------------------------------

SELECT @ErrorValue = 0



-- 1. get the u/i FIPS_COUNTY_CODE value for the in-coming @UICounty.
SELECT @iUIFipsCounty = (SELECT FIPS_COUNTY_CODE
                         FROM   AGENCY.dbo.COUNTIES WITH (NOLOCK)
                         WHERE  COUNTY_CODE = @UICountyCode)

   SELECT @ErrorValue = @@ERROR
   IF @ErrorValue > 0
      BEGIN
      GOTO ExitRtn
      END


-- 2. turn the u/i FIPS_COUNTY_CODE into a varchar value.
SELECT @sUIFipsCounty = CAST(@iUIFipsCounty AS VARCHAR(5))

   SELECT @ErrorValue = @@ERROR
   IF @ErrorValue > 0
      BEGIN
      GOTO ExitRtn
      END


-- 3. get the last 3 positions of the u/i FIPS_COUNTY_CODE.
SELECT @sUIFipsCounty = SUBSTRING(@sUIFipsCounty,3,3)

   SELECT @ErrorValue = @@ERROR
   IF @ErrorValue > 0
      BEGIN
      GOTO ExitRtn
      END


-- 4. get the integer COUNTY_CODE value for the in-coming "last 3 positions of" the ZP4 FIPS County. 
SELECT @sFipsTemp = '41' + @ZP4FIPSCounty
   SELECT @ErrorValue = @@ERROR
   IF @ErrorValue > 0
      BEGIN
      GOTO ExitRtn
      END

SELECT @iFipsTemp = CAST(@sFipsTemp AS Integer)
   SELECT @ErrorValue = @@ERROR
   IF @ErrorValue > 0
      BEGIN
      GOTO ExitRtn
      END
                     
SELECT @iZP4County = (SELECT COUNTY_CODE
                      FROM   AGENCY.dbo.COUNTIES WITH (NOLOCK)
                      WHERE FIPS_COUNTY_CODE = @iFipsTemp)
   SELECT @ErrorValue = @@ERROR
   IF @ErrorValue > 0
      BEGIN
      GOTO ExitRtn
      END


SELECT @sZP4CountyName = (SELECT COUNTY_NAME
					FROM   AGENCY.dbo.COUNTIES WITH (NOLOCK)
                    WHERE FIPS_COUNTY_CODE = @iFipsTemp)
SELECT @sUICountyName = (SELECT COUNTY_NAME
                         FROM   AGENCY.dbo.COUNTIES WITH (NOLOCK)
                         WHERE  COUNTY_CODE = @UICountyCode)

-- 5. Now compare in-coming U/I County value to in-coming ZP4 County value.
   IF @UICountyCode = @iZP4County
   BEGIN
   SELECT @IncidentCounty = @UICountyCode
   SELECT @CountyName = @sUICountyName
   END
ELSE
   BEGIN
   SELECT @IncidentCounty = @iZP4County
   SELECT @CountyName = @sZP4CountyName
   END

   SELECT @ErrorValue = @@ERROR
   IF @ErrorValue > 0
      BEGIN
      GOTO ExitRtn
      END

ExitRtn:
-- just end processing --RETURN (@ErrorValue)
END







GO
GRANT EXECUTE ON [dbo].[apOLPRRCheckPostalCountyData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetIncidentDataByID]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apOLPRRGetContactByIdByContactType
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
	05/31/2018	Aguedea			Creation	
	06/08/2018  Aguedea			Added 
	6/10/2019	Aguedea			Removed refernce to OLPRRAcceptStatus Table, removed @InUseBy column from select

 -----------------------------------------------------------------------------------------------------------
 Usage

Declare @Result INT
EXEC apOLPRRGetIncidentDataByID 706,  @Result OUTPUT

 -----------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[apOLPRRGetIncidentDataByID]

	 @OlprrId       INT
	,@RESULT        INT         OUTPUT
AS


SET @RESULT = 1



SELECT incident.olprrid , incident.ReleaseType as 'ReleaseTypeCode'
	, 	CASE incident.ReleaseType 
	WHEN 'H' 
			THEN 'Heating Oil Tank'
	WHEN 'R'
			THEN 'Regulated UST'
	WHEN 'U'
			THEN 'Unregulated UST'
	END AS 'ReleaseType'
	, incident.ReceiveDate as 'DateReceived'
	, cast(incident.FacilityId as INT) facilityId , incident.SiteName , incident.SiteCounty, incident.SiteCounty as 'CountyCode'
	, incident.SiteAddress , incident.OtherAddress, incident.SiteCity
	, incident.SiteZipCode , incident.SitePhone  
	,incident.SiteComment , incident.ContractorId, incident.SiteStatus
	, incident.ReportedBy, incident.ReportedByPhone
	, contractors.COMPANY_NAME AS 'ContractorName', contractors.EMAIL_ADDRESS AS 'ContractorEmail'

	,contacts.FirstName AS 'RpFirstName', contacts.LastName 'RpLastName', contacts.Organization AS 'RpOrganization'
	, contacts.Address AS 'RpAddress', contacts.Address2 AS 'RpAddress2'
	,contacts.City AS 'RpCity', contacts.State AS 'RpState', contacts.Zipcode AS 'RpZipCode'
	,contacts.phone AS 'RpPhone', contacts.emailaddress AS 'RpEmail'

	,IContacts.FirstName AS 'IcFirstName', IContacts.LastName 'IcLastName', IContacts.Organization AS 'IcOrganization'
	, IContacts.Address AS 'IcAddress', IContacts.Address2 AS 'IcAddress2'
	,IContacts.City AS 'IcCity', IContacts.State AS 'IcState', IContacts.Zipcode AS 'IcZipCode'
	,IContacts.phone AS 'IcPhone', IContacts.emailaddress AS 'IcEmail'

	,ISNULL(assess.DiscoveryDate, ' ') AS 'DiscoveryDate' 
	,assess.ConfirmationCode AS 'ConfirmationCode', assessConfirmType.ConfirmationDescription AS 'ConfirmationDesc' 
	,assess.DiscoveryCode AS 'DiscoveryCode', assessDiscoveryType.DiscoveryDescription AS 'DiscoveryDesc'
	,assess.ReleaseSourceId AS 'SourceId', ISNULL(ast.ReleaseSourceDescription, '') AS 'SourceDesc'
	,assess.ReleaseCauseCode AS 'CauseCode', assessReleaseCauseType.ReleaseCauseDescription AS 'CauseDesc'

	,cast( ISNULL(assess.GWMediaInd,0) as INT) AS 'GroundWater'	,cast( ISNULL(assess.SWMediaInd,0) as INT) AS 'SurfaceWater'
	,cast( ISNULL(assess.DWMediaInd,0) as INT) AS 'DrinkingWater'	,cast(ISNULL(assess.SLMediaInd,0)  as INT) AS 'Soil'
	,cast( ISNULL(assess.FVMediaInd,0) as INT) AS 'Vapor',cast( ISNULL(assess.FPMediaInd,0)  as INT)AS 'FreeProduct'

	,cast( ISNULL(assess.UGContamInd,0) as INT) AS 'UnleadedGas',cast( ISNULL(assess.LGContamInd,0) as INT) AS 'LeadedGas'
	,cast( ISNULL(assess.MGContamInd,0) as INT) AS 'MisGas', cast( ISNULL(assess.DSContamInd,0)  as INT) AS 'Diesel'
	,cast( ISNULL(assess.WOContamInd,0) as INT) AS 'WasteOil', cast( ISNULL(assess.HOContamInd,0) as INT) AS 'HeatingOil'
	,cast(  ISNULL(assess.LBContamInd,0) as INT) AS 'Lubricant',cast( ISNULL(assess.SVContamInd,0) as INT) AS 'Solvent'
	,cast(  ISNULL(assess.OPContamInd,0) as INT) AS 'OtherPet',cast( ISNULL(assess.CHContamInd,9) as INT) AS 'Chemical' 
	,cast(  ISNULL(assess.UNContamInd,0) as INT) AS 'Unknown'	,cast( ISNULL(assess.MTBEContamInd,0) as INT) AS 'Mtbe'
FROM dbo.OlprrIncident incident WITH (NOLOCK)
	INNER  JOIN dbo.OlprrContractors contractors WITH (NOLOCK)
		ON contractors.OlprrContractorsId = incident.ContractorId 
	LEFT JOIN dbo.OlprrContacts contacts ON incident.OlprrID = contacts.Olprrid AND contacts.ContactType = 'RP'
	LEFT JOIn dbo.OlprrContacts IContacts ON incident.OlprrID = IContacts.Olprrid AND IContacts.ContactType = 'IC'
	INNER JOIN dbo.OlprrAssessment assess ON incident.OlprrID = assess.OlprrID 
	INNER JOIN dbo.AssessmentConfirmationType assessConfirmType ON assess.ConfirmationCode = assessConfirmType.ConfirmationCode
	LEFT JOIN dbo.AssessmentDiscoveryType assessDiscoveryType ON assess.DiscoveryCode = assessDiscoveryType.DiscoveryCode
	LEFT JOIN dbo.AssessmentReleaseType assessReleaseCauseType ON assess.ReleaseCauseCode = assessReleaseCauseType.ReleaseCauseCode
    LEFT JOIN dbo.AssessmentSourceType ast on assess.ReleaseSourceId = ast.ReleaseSourceId
	LEFT JOIN Agency.dbo.Counties Counties ON incident.SiteCounty = Counties.County_Code
WHERE  incident.OlprrId = @OlprrId



SELECT  @RESULT = @@ERROR

RETURN @RESULT
GO
GRANT EXECUTE ON [dbo].[apOLPRRGetIncidentDataByID] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetIncidents]    Script Date: 6/11/2019 5:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 -----------------------------------------------------------------------------------------------------------
  apOLPRRGetIncidentById
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description

  05/30/2018	aguedea			Added 
  05/31/2018	aguedea			Added default columns and sort order
								The default sort order will be by ReceiveDate in DESC order	
 06/11/2019		aguedea			Changed how OlprrId is searched, when null then not included in criteria, when -1 then search is on OlprrId = -1 else
								search on OlprrId = @OlprrId 
 06/18/2019	aguedea		Changed descending sort order to olprrId ASC, releaseType ASC

 -----------------------------------------------------------------------------------------------------------

 DECLARE @RESULT INT, @TotalRows INT, @TotalPages INT
 exec apOLPRRGetIncidents 'ACCEPT', 'NWR', NULL, 3, NULL, NULL, 1, 27, @RESULT OUTPUT, @TotalRows OUTPUT, @TotalPages OUTPUT
 SELECT @Result, @TotalRows, @TotalPages

DECLARE @RESULT INT, @TotalRows INT, @TotalPages INT
 exec apOLPRRGetIncidents 'ACCEPT', NULL, NULL, 27849, NULL, NULL, 1, 27, @RESULT OUTPUT, @TotalRows OUTPUT, @TotalPages OUTPUT
 SELECT @Result, @TotalRows, @TotalPages

 -----------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apOLPRRGetIncidents] 
        @OlprrStatus     varchar(10)	= NULL
       ,@OlprrOffice	 varchar(10)	= NULL
	   ,@SiteType		 char(1)		= NULL
	   ,@OlprrID		 int			= NULL
	   ,@SortCol		 int			= NULL
	   ,@SortOrder		 int		    = NULL
	   ,@PageNumber      int			= NULL
	   ,@RowsPerPage     int			= NULL
	   ,@TotalRows       int		  OUTPUT
	   ,@TotalPages 	 int		  OUTPUT 
       ,@RESULT          int          OUTPUT
	   
AS

DECLARE @RowsCalc DECIMAL 
DECLARE @SQLCounts AS NVARCHAR(MAX) 
DECLARE @WHERE VARCHAR(4096)
DECLARE @SQLColumns AS VARCHAR(1024)
DECLARE @SQLQuery AS VARCHAR(8000) 
DECLARE @OrderBy VARCHAR(1024)
DECLARE @Pagination VARCHAR(128)

SET @SQLQuery = '
'
SET @WHERE = ' 
WHERE 1 = 1 AND '
SET @Pagination = '
'

IF ISNULL(@PageNumber, 0) = 0
	SET @PageNumber = 1

IF ISNULL(@RowsPerPage, 0) = 0
	SET @RowsPerPage = 10

IF ISNULL(@SortCol, 0) = 0
	BEGIN
		SET @SortCol = 1
		SET @SortOrder = 1
	END 


IF ISNULL(@SortOrder, 0) = 0
	SET @SortOrder = 1




-- Print @OlprrId
SET @RESULT = 1 --< error value.

IF LEN(ISNULL(@OlprrOffice, '')) > 0
	SET @WHERE = @WHERE + ' ( a.DeqOffice = ''' + ISNULL(@OlprrOffice, '') + ''') AND '


IF LEN(ISNULL(@OlprrStatus, '')) > 0
	 SET @WHERE = @WHERE + ' ( a.SiteStatus = ''' + ISNULL(@OlprrStatus, '') + ''') AND '

IF LEN(ISNULL(@SiteType, '')) > 0
	 SET @WHERE = @WHERE + ' ( a.ReleaseType = ''' + ISNULL(@SiteType, '') + ''') AND '

IF ISNULL(@OlprrId, 1) = 1
	 SET @WHERE = @WHERE  -- Do nothing
ELSE IF @OlprrID = -1
	SET @WHERE = @WHERE + ' ( a.OlprrId = -1)'
ELSE
	 SET @WHERE = @WHERE + ' ( a.OlprrId = ' + CONVERT(VARCHAR, ISNULL(@OlprrId, 0)) + ') AND'

IF RIGHT(LTRIM(RTRIM(@WHERE)), 3) = 'AND'
       SET @WHERE = SUBSTRING(@WHERE, 1, LEN(LTRIM(RTRIM(@WHERE))) - 3)


SET @SQLCounts = 'SELECT @totals = COUNT (*)
       FROM   dbo.OlprrIncident a WITH (NOLOCK)
	   INNER JOIN dbo.OlprrContractors b WITH (NOLOCK)
	   ON     b.OlprrContractorsId = a.ContractorId
	   JOIN   AGENCY.dbo.COUNTIES c ON a.SiteCounty = c.County_Code AND a.SiteCounty != ''WA'''
	  
-- Print @SqlCounts + @Where
SET @SQLCounts = @SQLCounts  + @WHERE 

EXEC sp_executesql @SQLCounts, N'@totals INT OUTPUT', @TotalRows OUTPUT

SET @TotalPages = @TotalRows / @RowsPerPage

---Select @totalpages, @totalRows, @rowsperpage


-- This condition indicates the query returned data but did not fill a page so return 1
IF (@TotalPages = 0 AND @TotalRows <> 0)
	BEGIN
		--PRINT '@totalpages = 0 and @totalrows <> 0   ' + Convert(varchar, @totalPages) + ' ' + Convert(varchar, @totalRows)
		-- return 1 
		SET @TotalPages = @TotalPages + 1
	END
ELSE
	BEGIN
		-- this indicates the query did fill at least 1 page and now we need to see if there is a MOD Rows per Page value
		-- if so, increment the pages + 1
		SET @RowsCalc = @TotalRows % @RowsPerPage
		IF @RowsCalc > 0.0
			SET @Totalpages = @TotalPages + 1
	END





SET @SQLColumns  = 'SELECT a.OlprrId
	  ,a.ReleaseType
	  ,CASE WHEN a.ReleaseType = ''H'' THEN ''Heating Oil Tank''
			WHEN a.ReleaseType = ''R'' THEN ''Regulated UST''
			WHEN a.ReleaseType = ''U'' THEN ''Unregulated UST''
	  END AS ReleaseTypeName
      ,a.ReceiveDate  
      ,a.FacilityId 
      ,a.SiteName 
      ,a.SiteCounty 
      ,a.SiteAddress
      ,a.OtherAddress
      ,a.SiteCity 
      ,a.SiteZipCode 
      ,a.SitePhone 
      ,a.SiteComment
      ,a.ContractorId 
      ,a.SiteStatus 
      ,a.ReportedBy 
      ,a.ReportedByPhone 
      ,b.COMPANY_NAME AS CompanyName
      ,b.EMAIL_ADDRESS AS EmailAddress
	  ,c.County_Name AS CountyName '

SET @SQLQuery = '
         FROM   dbo.OlprrIncident a WITH (NOLOCK)
	   INNER JOIN dbo.OlprrContractors b WITH (NOLOCK)
	   ON     b.OlprrContractorsId = a.ContractorId
	   JOIN   AGENCY.dbo.COUNTIES c ON a.SiteCounty = c.County_Code AND a.SiteCounty != ''WA''' 


SET @OrderBy = ' 
ORDER BY '

IF @SortOrder = 1
	BEGIN
		IF @SortCol = 1
				SET @OrderBy  = @OrderBy  + ' a.OlprrId DESC, a.ReleaseType ASC'
		ELSE IF @SortCol = 2 
				SET @OrderBy = @OrderBy + ' + a.ReleaseType ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 3
				SET @OrderBy = @OrderBy + ' a.SiteName ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 4
				SET @OrderBy = @OrderBy + ' a.SiteAddress ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 5
				SET @OrderBy = @OrderBy + ' a.SiteCity ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 6
				SET @OrderBy = @OrderBy + ' a.SiteStatus ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 7
				SET @OrderBy = @OrderBy + ' a.ReportedBy ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 8
				SET @OrderBy = @OrderBy + ' b.Company_Name, ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 9
				SET @OrderBy = @OrderBy + ' a.SiteCounty ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 10
				SET @OrderBy = @OrderBy + ' a.ReceiveDate ASC, a.OlprrId DESC'
	END
ELSE IF @SortOrder = -1
	BEGIN
		IF @SortCol = 1
				SET @OrderBy  = @OrderBy  + ' a.OlprrId ASC, a.ReleaseType ASC'
		ELSE IF @SortCol = 2 
				SET @OrderBy = @OrderBy + ' + a.ReleaseType ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 3
				SET @OrderBy = @OrderBy + ' a.SiteName ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 4
				SET @OrderBy = @OrderBy + ' a.SiteAddress ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 5
				SET @OrderBy = @OrderBy + ' a.SiteCity ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 6
				SET @OrderBy = @OrderBy + ' a.SiteStatus ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 7
				SET @OrderBy = @OrderBy + ' a.ReportedBy ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 8
				SET @OrderBy = @OrderBy + ' b.Company_Name, ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 9
				SET @OrderBy = @OrderBy + ' a.SiteCounty ASC, a.OlprrId DESC'
		ELSE IF @SortCol = 10
				SET @OrderBy = @OrderBy + ' a.ReceiveDate ASC, a.OlprrId DESC'
	END

SET @SQLQuery = @SQLQuery + ' '


SET @Pagination  = @Pagination + ' 
       OFFSET ((' + CONVERT(VARCHAR, @PageNumber) + ' -1 ) * ' + CONVERT(VARCHAR, @RowsPerPage) + ') ROWS'
SET @Pagination = @Pagination + ' 
       FETCH NEXT ' + CONVERT(VARCHAR, @RowsPerPage) + ' ROWS ONLY;'



--------------------------------------------------------------
--     MAIN QUERY
--------------------------------------------------------------
SET @SQLQuery = @SQLColumns + @SQLQuery + @Where + @OrderBy + @Pagination

--Print @SQLQuery

--run the query
EXEC(@SQLQuery)


SELECT @RESULT = @@ERROR

RETURN @RESULT





GO
GRANT EXECUTE ON [dbo].[apOLPRRGetIncidents] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetLustLookupData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apOLPRRGetLustLookupData
  
  

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------
 07/02/2018		aguedea			Create

 -----------------------------------------------------------------------------------------------------------

 Example:
 DECLARE 
   @SortCol	INT
  ,@SortOrder INT
  ,@PageNumber INT
  ,@RowsPerPage	INT
  ,@TotalRows INT 
  ,@TotalPages INT	
  ,@Result INT	

EXEC [apOLPRRGetLustLookupData]
'A', 
NULL,
NULL,
NULL,
1,
1,
3,
20,
@TotalRows OUTPUT,
@TotalPages OUTPUT, 
@Result OUTPUT 

SELECT @TotalRows, @TotalPages, @Result



*/

CREATE PROCEDURE [dbo].[apOLPRRGetLustLookupData]

   @SiteName			varchar(40)
  ,@SiteAddress			varchar(40)
  ,@SiteCity			varchar(25)
  ,@SiteZip				varchar(5)
  ,@SortCol				int		    = NULL
  ,@SortOrder			int			= NULL
  ,@PageNumber			int			= NULL
  ,@RowsPerPage			int			= NULL
  ,@TotalRows			int			OUTPUT
  ,@TotalPages 			int			OUTPUT 
  ,@Result				int			OUTPUT
AS

DECLARE @WhereClauseCount int
        ,@SQL             varchar(8000)
        ,@OrderByValue    varchar(400)
		,@SQLColumns	  VARCHAR(512)
		,@SQLWHERE		  VARCHAR(128)
		,@RowsCalc		  DECIMAL 
		,@Pagination VARCHAR(128)


SET @Result = 1 --<< ERROR VALUE
SET @WhereClauseCount = 0
SET @SQLColumns = ''
SET @SQL = ''
SET @OrderByValue = ''
SET @SQLWhere = ''
SET @Pagination = ''

-- ISDATE() function and FinalInvcRqstDate:
-- return of 1 means there is an existing date. The Incident is closed.
-- return of 0 means there is not an existing date. The Incident is active.

SELECT @SQLColumns = 
      'SELECT a.LustId
      ,a.LogNumber
      ,a.SiteName
      ,a.SiteAddress
      ,a.SiteCity
      ,a.SiteZip
      ,STATUS = CASE ISDATE(b.FinalInvcRqstDate) 
                WHEN 0  THEN ''ACTIVE''
	        WHEN 1  THEN ''CLOSED''
                END'

SELECT @SQL = '
FROM  LUST.dbo.Incident a WITH (NOLOCK)
LEFT JOIN LUST.dbo.Management b WITH (NOLOCK) ON a.LustId = b.LustId
WHERE ' 


SELECT  @OrderByValue = 
       	CASE @SortCol
	     WHEN 0 THEN ' ORDER BY a.LogNumber'
	     WHEN 1 THEN ' ORDER BY a.SiteName'
	     WHEN 2 THEN ' ORDER BY a.SiteAddress'
	     WHEN 3 THEN ' ORDER BY a.SiteCity'
	     WHEN 4 THEN ' ORDER BY a.SiteZip'
	     WHEN 5 THEN ' ORDER BY STATUS'
        END


IF LEN(RTRIM(@SiteName)) > 0 
   BEGIN
   SELECT @SQLWhere = @SQLWhere + 'a.SiteName LIKE ' + '''' + RTRIM(@SiteName) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END

IF LEN(RTRIM(@SiteAddress)) > 0 
   BEGIN
   IF @WhereClauseCount > 0
   SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
   SELECT @SQLWHERE = @SQLWHERE + 'a.SiteAddress LIKE ' + '''' + RTRIM(@SiteAddress) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END


IF LEN(RTRIM(@SiteCity)) > 0 
   BEGIN
   IF @WhereClauseCount > 0
   SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
   SELECT @SQLWHERE = @SQLWHERE + 'a.SiteCity LIKE ' + '''' + RTRIM(@SiteCity) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END


IF LEN(RTRIM(@SiteZip)) > 0 
   BEGIN
   IF @WhereClauseCount > 0
   SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
   SELECT @SQLWHERE = @SQLWHERE + 'a.SiteZip LIKE ' + '''' + RTRIM(@SiteZip) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END



--------------------------------------------------------------
--	Counts Query
--------------------------------------------------------------


DECLARE @SQLCounts AS NVARCHAR(MAX) = 'SELECT @totals = COUNT (DISTINCT  a.LustId)
	FROM  LUST.dbo.Incident a WITH (NOLOCK)
LEFT JOIN LUST.dbo.Management b WITH (NOLOCK) ON a.LustId = b.LustId
WHERE ' 

SET @SQLCounts = @SQLCounts  + @SQLWHERE 

--PRINT @SQLCounts
EXEC sp_executesql @SQLCounts, N'@totals INT OUTPUT', @TotalRows OUTPUT




SET @TotalPages = @TotalRows / @RowsPerPage

-- This condition indicates the query returned data but did not fill a page so return 1
IF (@TotalPages = 0 AND @TotalRows <> 0)
	BEGIN
		--PRINT '@totalpages = 0 and @totalrows <> 0   ' + Convert(varchar, @totalPages) + ' ' + Convert(varchar, @totalRows)
		-- return 1 
		SET @TotalPages = @TotalPages + 1
	END
ELSE
	BEGIN
		-- this indicates the query did fill at least 1 page and now we need to see if there is a MOD Rows per Page value
		-- if so, increment the pages + 1
		SET @RowsCalc = @TotalRows % @RowsPerPage
		IF @RowsCalc > 0.0
			SET @Totalpages = @TotalPages + 1
	END


SET @Pagination  = @Pagination + ' 
	OFFSET ((' + CONVERT(VARCHAR, @PageNumber) + ' -1 ) * ' + CONVERT(VARCHAR, @RowsPerPage) + ') ROWS'
SET @Pagination = @Pagination + ' 
	FETCH NEXT ' + CONVERT(VARCHAR, @RowsPerPage) + ' ROWS ONLY;'

--@OrderByValue
IF @SortOrder = -1
	SET @OrderByValue = @OrderByValue + ' DESC'



--@OrderByValue
SELECT @SQL = @SQLColumns + @SQL + @SQLWhere +  @OrderByValue + @Pagination
PRINT @SQL

--> run the query
EXEC(@SQL)

--> error check
SELECT @Result = @@ERROR

RETURN @Result




GO
GRANT EXECUTE ON [dbo].[apOLPRRGetLustLookupData] TO [LUSTUser] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apOLPRRGetUstLookupData]    Script Date: 6/11/2019 3:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apOLPRRGetUstLookup
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
 -----------------------------------------------------------------------------------------------------------

 06/11/2018		aguedea			Create	
 06/14/2018		aguedea			added pagination
 05/24/2019		aguedea			added @facilityID parameter
 06/11/2019		aguedea			Changed how facilityId is search, when null then not included in criteria, when -1 then search is on facilityId = -1 else
								search on FacilityId = @FacilityId 
 -----------------------------------------------------------------------------------------------------------
 Usage:

DECLARE @TotalRows INT	,@TotalPages INT, @Result INT
exec [apOLPRRGetUstLookupData]
NULL
,NULL
,NULL
,NULL
, NULL
, NULL
,1
,1
,1
,40
,@TotalRows			OUTPUT
,@TotalPages 		OUTPUT 
,@Result			OUTPUT
SELECT @TotalRows ,@TotalPages , @Result 


	SELECT a.FacilityId
               ,a.Name AS FacilityName
	       ,b.line_1_addr AS FacilityAddress
	       ,b.city_txt AS FacilityCity
	       ,b.zip_cd AS FacilityZip
		   ,c.county_name AS CountyName
		   ,CONVERT(int, c.county_code) AS CountyCode 
	FROM    UST.dbo.FACILITY a WITH (NOLOCK)
	JOIN    AGENCY.dbo.FACA_GEO_LOC b WITH (NOLOCK) ON a.GeoLocId = b.Identifier
	JOIN	AGENCY.dbo.Counties c WITH (NOLOCK) ON b.FIPS_COUNTY_CD = c.FIPS_COUNTY_CODE AND  a.FacilityId = 0)
WHERE 1 = 1  
ORDER BY a.FacilityId 
 
	OFFSET ((1 - 1 ) * 40) ROWS 
	FETCH NEXT 40 ROWS ONLY;


*/
CREATE PROCEDURE [dbo].[apOLPRRGetUstLookupData]
   @FacilityName		varchar(40) = NULL
  ,@FacilityAddress		varchar(40) = NULL
  ,@FacilityCity		varchar(25) = NULL
  ,@FacilityZip	       varchar(5)  = NULL
  ,@FacilityCounty		varchar(10) = NULL
  ,@FacilityId		int         = NULL
  ,@SortCol			integer     = NULL
  ,@SortOrder			int	     = NULL
  ,@PageNumber		int	     = NULL
  ,@RowsPerPage		int	     = NULL
  ,@TotalRows			int	     OUTPUT
  ,@TotalPages 		int	     OUTPUT 
  ,@Result			int         OUTPUT
AS
DECLARE @WhereClauseCount int
        ,@SQL             varchar(1000)
		,@SQLColumns	  VARCHAR(512)
		,@SQLWHERE		  VARCHAR(256)
        ,@OrderByValue    varchar(400)
		,@RowsCalc		  DECIMAL 
		,@Pagination VARCHAR(128)

SET @Result = 1 --<< ERROR VALUE
SET @WhereClauseCount = 1
SET @SQLWHERE = '
WHERE 1 = 1 '
SET @Pagination = '
'
SET @TotalPages = 0



IF ISNULL(@PageNumber, 0) = 0
	SET @PageNumber = 1

IF ISNULL(@RowsPerPage, 0) = 0
	SET @RowsPerPage = 10

IF ISNULL(@SortCol, 0) = 0
	BEGIN
		SET @SortCol = 2
		SET @SortOrder = -1
	END 

IF ISNULL(@SortOrder, 0) = 0
	SET @SortOrder = 1


SET @SQLColumns = '	SELECT a.FacilityId
               ,a.Name AS FacilityName
	       ,b.line_1_addr AS FacilityAddress
	       ,b.city_txt AS FacilityCity
	       ,b.zip_cd AS FacilityZip
		   ,c.county_name AS CountyName
		   ,CONVERT(int, c.county_code) AS CountyCode'


SELECT @SQL = ' 
	FROM    UST.dbo.FACILITY a WITH (NOLOCK)
	JOIN    AGENCY.dbo.FACA_GEO_LOC b WITH (NOLOCK) ON a.GeoLocId = b.Identifier
	JOIN	AGENCY.dbo.Counties c WITH (NOLOCK) ON b.FIPS_COUNTY_CD = c.FIPS_COUNTY_CODE'
	
IF @SortOrder = 1
	BEGIN
		IF @SortCol = 1
			SET @OrderByValue = ' ORDER BY a.FacilityId '
		ELSE IF @SortCol = 2
			SET @OrderByValue = ' ORDER BY a.Name '
		ELSE IF @SortCol = 3
			SET @OrderByValue = ' ORDER BY b.line_1_addr '
		ELSE IF @SortCol = 4
			SET @OrderByValue = ' ORDER BY b.city_txt '
		ELSE IF @SortCol = 5
			SET @OrderByValue = ' ORDER BY b.zip_cd '
		ELSE IF @SortCol = 6
			SET @OrderByValue = ' ORDER BY c.county_name '
	END
ELSE IF @SortOrder = -1
	BEGIN
		IF @SortCol = 1 
			SET @OrderByValue = ' ORDER BY a.FacilityId DESC '
		ELSE IF @SortCol = 2
			SET @OrderByValue = ' ORDER BY a.Name DESC '
		ELSE IF @SortCol = 3
			SET @OrderByValue = ' ORDER BY b.line_1_addr DESC '
		ELSE IF @SortCol = 4
			SET @OrderByValue = ' ORDER BY b.city_txt DESC '
		ELSE IF @SortCol = 5
			SET @OrderByValue = ' ORDER BY b.zip_cd DESC '
		ELSE IF @SortCol = 6
			SET @OrderByValue = ' ORDER BY c.county_name DESC '

	END

--SELECT  @OrderByValue = 
--       	CASE @SortCol
--	     WHEN 0 THEN ' ORDER BY a.FacilityId'
--	     WHEN 1 THEN ' ORDER BY a.Name'
--	     WHEN 2 THEN ' ORDER BY b.line_1_addr'
--	     WHEN 3 THEN ' ORDER BY b.city_txt'
--	     WHEN 4 THEN ' ORDER BY b.zip_cd'
--		 WHEN 5 then ' ORDER BY c.county_name'
--        END

IF LEN(RTRIM(@FacilityName)) > 0 
   BEGIN
     IF @WhereClauseCount > 0
	   BEGIN
		SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
	   END
   SELECT @SQLWHERE = @SQLWHERE + ' a.Name LIKE ' + '''' + RTRIM(@FacilityName) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END

IF LEN(RTRIM(@FacilityAddress)) > 0 
   BEGIN
   IF @WhereClauseCount > 0
	   BEGIN
	   SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
	   END
   SELECT @SQLWHERE = @SQLWHERE + ' b.line_1_addr LIKE ' + '''' + RTRIM(@FacilityAddress) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END


IF LEN(RTRIM(@FacilityCity)) > 0 
   BEGIN
   IF @WhereClauseCount > 0
	   BEGIN
	   SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
	   END
   SELECT @SQLWHERE = @SQLWHERE + ' b.city_txt LIKE ' + '''' + RTRIM(@FacilityCity) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END


IF LEN(RTRIM(@FacilityZip)) > 0 
   BEGIN
   IF @WhereClauseCount > 0
	   BEGIN
	   SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
	   END
   SELECT @SQLWHERE = @SQLWHERE + ' b.zip_cd LIKE ' + '''' + RTRIM(@FacilityZip) + '%' + ''''
   SELECT @WhereClauseCount = @WhereClauseCount + 1
   END

IF LEN(RTRIM(@FacilityCounty)) > 0
	BEGIN
	IF @WhereClauseCount > 0
		BEGIN
		SELECT @SQLWHERE = @SQLWHERE + ' AND '
		END
	SELECT @SQLWHERE = @SQLWHERE + ' c.county_name LIKE ' + '''' +  RTRIM(@FacilityCounty)  + '%' + ''''
	SELECT @WhereClauseCount = @WhereClauseCount + 1
	END


IF ISNULL(@FacilityId, 1) = 1
	SELECT @SQL = @SQL 
ELSE IF @FacilityId = -1
	BEGIN
		IF @WhereClauseCount > 0
		   BEGIN
			SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
		   END
	   SELECT @SQLWHERE = @SQLWHERE + ' a.FacilityId = -1'
	   SELECT @WhereClauseCount = @WhereClauseCount + 1
	END
ELSE
	BEGIN
		IF @WhereClauseCount > 0
		   BEGIN
			SELECT @SQLWHERE = @SQLWHERE +  ' AND ' 
		   END
	   SELECT @SQLWHERE = @SQLWHERE + ' a.FacilityId = + CONVERT(VARCHAR, ' + CONVERT(VARCHAR, @FacilityId) + ')'
	   SELECT @WhereClauseCount = @WhereClauseCount + 1
	END


--------------------------------------------------------------
--	Counts Query
--------------------------------------------------------------


DECLARE @SQLCounts AS NVARCHAR(MAX) = 'SELECT @totals = COUNT (DISTINCT  a.FacilityId)
	FROM    UST.dbo.FACILITY a WITH (NOLOCK)
	JOIN    AGENCY.dbo.FACA_GEO_LOC b WITH (NOLOCK) ON a.GeoLocId = b.Identifier
	JOIN	AGENCY.dbo.Counties c WITH (NOLOCK) ON b.FIPS_COUNTY_CD = c.FIPS_COUNTY_CODE'

SET @SQLCounts = @SQLCounts  + @SQLWHERE 

--PRINT @SQLCounts
EXEC sp_executesql @SQLCounts, N'@totals INT OUTPUT', @TotalRows OUTPUT



SET @TotalPages = @TotalRows / @RowsPerPage

-- This condition indicates the query returned data but did not fill a page so return 1
IF (@TotalPages = 0 AND @TotalRows <> 0)
	BEGIN
		--PRINT '@totalpages = 0 and @totalrows <> 0   ' + Convert(varchar, @totalPages) + ' ' + Convert(varchar, @totalRows)
		-- return 1 
		SET @TotalPages = @TotalPages + 1
	END
ELSE
	BEGIN
		-- this indicates the query did fill at least 1 page and now we need to see if there is a MOD Rows per Page value
		-- if so, increment the pages + 1
		SET @RowsCalc = @TotalRows % @RowsPerPage
		IF @RowsCalc > 0.0
			SET @Totalpages = @TotalPages + 1
	END



SET @Pagination  = @Pagination + ' 
	OFFSET ((' + CONVERT(VARCHAR, @PageNumber) + ' -1 ) * ' + CONVERT(VARCHAR, @RowsPerPage) + ') ROWS'
SET @Pagination = @Pagination + ' 
	FETCH NEXT ' + CONVERT(VARCHAR, @RowsPerPage) + ' ROWS ONLY;'


----@OrderByValue
--IF @SortOrder = -1
--	SET @OrderByValue = @OrderByValue + ' DESC'


SELECT @SQL = @SQLColumns + @SQL + @SQLWHERE + @OrderByValue + @Pagination

--Print @SQL
--> run the query
EXEC(@SQL)

--> error check
SELECT @Result = @@ERROR

RETURN @Result








GO
GRANT EXECUTE ON [dbo].[apOLPRRGetUstLookupData] TO [LUSTUser] AS [dbo]
GO

GRANT EXECUTE ON [dbo].[apOLPRRInsertIncident] TO [LUSTUser] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apRetrieveGeoLocIDData]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- this is a direct exact copy of wqsis.apRetrieveGeoLocID
CREATE PROCEDURE [dbo].[apRetrieveGeoLocIDData] 
(
@appID varchar(25),
@GeoLocId INT OUTPUT
)
/*****************************************************************************
***    Name:    apRetrieveGeoLocID	   
***    Author:  Beccy Kirk		Date: 09/11/2001        	   
******************************* DESCRIPTION **********************************
***
***	1.	After GeoLoc Record was created by LIT.
***	2.	This stored procedure retieved the new GeoLoc record by
***		specifying User ID (i.e. 'SIS' + Emp_ID)
***
***	10/4/2010	llo	-	Modified procedure to be run on any DEQ SQL Server 
***						instances.
                                         
******************************************************************************/
AS


DECLARE @rc int, @Today DateTime, @Complete Char(1), @SessionID INT

-- STAGE
--exec @rc=[DEQSQL1\STAGE].LIT.dbo.apRetrieveGeoLocID @appID

SET @Today		= CAST(CONVERT (VARCHAR(30), GETDATE(),101) AS DateTime)
SET @Complete	= 'C'


-- PROD AND DEV !!!!
--exec [DEQSQL1\GIS].LIT.dbo.apRetrieveGeoLocID @appID

exec @GeoLocID = LIT.dbo.apRetrieveGeoLocID @appId


SELECT	TOP 1 @SessionID	= SessionID
FROM LIT.dbo.FacilityLocation 
WHERE CallerCode = @appId
	AND InsertDT	>= @TODAY
	AND Statuscode = @Complete
ORDER BY InsertDT DESC		

SELECT	@GeoLocID = l.FacilityID
	FROM Lit.dbo.FacilityLocation l 
	WHERE SessionID = @SessionID

GO
GRANT EXECUTE ON [dbo].[apRetrieveGeoLocIDData] TO [LUSTUser] AS [dbo]
GO


/****** Object:  StoredProcedure [dbo].[apUpdIncidentData]    Script Date: 4/10/2019 12:44:28 PM ******/
/****** Object:  StoredProcedure [dbo].[apUpdIncidentData]    Script Date: 7/10/2019 2:29:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 -----------------------------------------------------------------------------------------------------------
  apInsUpdIncident
  B.Dyer
  OCT 2006

 Revision History:
 -----------------------------------------------------------------------------------------------------------
  Date        	Name        	Description
  07/09/2019	aguedea			modified section that updates management data.  Initially was calling the original SP and changed the call to use the 
								HOL *data version.  Added code to only call apUpdManagementData if a change to a management column occured
 -----------------------------------------------------------------------------------------------------------


declare @LogNumberOUT VARCHAR(10) ,@LustIdOUT INT, @ErrorMessageHandler  Varchar(1000), @ResultSP INT


EXEC [dbo].[apUpdIncidentData]
9913
,8541
,24
,'1997-10-27 00:00:00.000'
,'Reasonable Richards(former'

,'120 SW HWY 22 (PREVIOUSLY 115 MAIN ST)'
,'IDANHA'
,'97350'
,'(503) 854-3621'
,0 

,1
,4
,1
,0
,0

,0
,1
,0
,0
,0

,0
,'(5/11/2017 cjb) Conditional NFA approved in 2015, waiting for new property owners (Northwest Investments) to pay off DEQ cost recovery charges before issuing NFA letter. *** SEQUENT LUST COMMENTS : ORIGINALLY REPORTED AS 115 MAIN ST; CITY CHANGED ADDRESS TO 120 SW HWY 22 (AT MAIN ST)...GAD 4/4/06. *** CR Agreement 2/24/06.  Pjt Mgr = CPJ.  Originally reported as 115 Main St; city changed address to 120 SW Hwy 22 (at Main St)...gad 4/4/06.'
,''
,'The property was used as a fuel service station and part of a lumber mill operation. Petroleum contamination was identified in October 1997 when the property owner removed one 10,000-gallon gasoline and an 8,000-gallon diesel tank. Two pump islands and most of the product lines were apparently decommissioned iwith the tanks. Following tank removal, 10 cubic yards of petroleum contaminated soil was stockpiled onsite. In March 1998, a sample from the stockpiled soil had diesel at 7,500 ppm, so it was taken to a landfill for disposal. The property owner collected a soil sample in July 1999 from 3 feet below the former diesel fuel dispenser. Diesel was 12,600 ppm and heavy oil was 23,300 ppm. Assessment in 2000 found diesel at 8,700 ppm and heavy oil at 2,550 ppm. In 2005, contractors collected four soil samples to assess diesel  contamination. At the dispensers, diesel was 58.7 ppm and heavy oil was 217 ppm, but no BTEX was detected. Contractors investigated further in 2006 and excavated soil at the tanks that did not exhibit signs of contamination. Analysis showed no petroleum, but lead (1.86 ppm) and chromium (9.98 ppm) were present. Clean soil was returned to the excavation. A detached product line was found 1-ft below surface at the west edge of the tank cavity. The line was removed and contamination in soil was not evident, but 11.3 cy PCS was removed based on previous testing. petroleum staining and odors in soil at 6 feet bgs. Excavating 35.7 cy of PCS to 14 feet bgs, groundwater was encountered. A soil and water sample  were obtained from the dispenser island excavation. Soil contained gasoline (243 ppm), diesel (5,370 ppm), and PAHs (anthracene at 0.259 ppm and phenanthrene at 0.813 ppm). Chromium (14.7 ppm) and lead (1.97 ppm) were also detected. No VOCs were in soil but the groundwater sample had gasoline at 1,240 ppb, diesel at 1,100,000 ppb, anthracene at 5.76 ppb, and phenanthrene at 14.1 ppb. There was no documentation in the report that contractors had purged the pit before collecting the water sample. In 2010 and 2012, contractors completed additional investigation attempting to confirm soil and groundwater contamination. Results found some petroleum remaining in soil, though groundwater was not encountered in borings. DEQ asked for follow-up testing in 2013 due to inconsistent sample data. Based on likely future use of the site, DEQ agreed to conditional closure, requiring certain precautions for occupants or construction workers.'
,23784

,0
,'1997-10-27 00:00:00.000'
,7788
,'1997-10-25 00:00:00.000'
,'1997-10-25 00:00:00.000'

,NULL 
,NULL 
,'2006-02-24 00:00:00.000' 
,'CRA signed by Marvin Walker 2/24/2006 3333'
,@LogNumberOUT OUTPUT

,@LustIdOUT OUTPUT
,@ErrorMessageHandler  OUTPUT
,@ResultSP OUTPUT

SELECT @LogNumberOut, @LustIdOut, @ErrorMessageHandler, @ResultSp



 -----------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apUpdIncidentData]
	 @LustIdIN INTEGER 
	,@FacilityId INTEGER = 0
	,@CountyId INTEGER
	,@ReceivedDate DATETIME
	,@SiteName VARCHAR(40)

	,@SiteAddress VARCHAR(40)
	,@SiteCity VARCHAR(20)
	,@SiteZip VARCHAR(5)
	,@SitePhone VARCHAR(25)
	,@NoValidAddress BIT

	,@SiteTypeId INTEGER
	,@FileStatusId INTEGER
	,@RegTankInd BIT
	,@HotInd BIT
	,@NonRegTankInd BIT

	,@BrownfieldCodeId INTEGER
	,@PropertyTranPendingInd BIT
    ,@ProgramTransferInd BIT
	,@HotAuditRejectInd BIT
    ,@ActiveReleaseInd BIT

    ,@OptionLetterSentInd BIT
    ,@SiteComment VARCHAR(8000)
	,@SeeAlsoComment VARCHAR(8000)
    ,@PublicSummaryComment VARCHAR(2500)
	,@GeolocId INTEGER

	,@OlprrId INTEGER
	,@DiscoverDate DATETIME
	,@ManagementIdIn  int   
	,@CleanupStartDt datetime 
	,@ReleaseStopDt datetime = NULL 

	,@FinalInvcRqstDt datetime = NULL 
	,@ClosedDt datetime = NULL 
	,@LetterOfAgreementDt datetime = NULL 
	,@LetterOfAgreementComment varchar(8000) = NULL 
	,@LastChangeby VARCHAR(64)
	,@LogNumberOUT VARCHAR(10) OUTPUT

	,@LustIdOUT INTEGER OUTPUT

	,@ErrorMessageHandler VARCHAR(1024) OUTPUT
	,@ResultSP INT OUTPUT



	

AS

SET XACT_ABORT ON


DECLARE @_Result INTEGER
       ,@_FacilityIdCheck INTEGER
       ,@_PreviousSiteCounty VARCHAR(2)
       ,@_PreviousReceivedDateYear VARCHAR(4)
       ,@_SiteCounty VARCHAR(2)           --<< use this value for table LogNbrCounty inserts.
       ,@_strLogNumber VARCHAR(10)
       ,@_SystemChar2DigitYear VARCHAR(2)
       ,@_InputChar2DigitYear VARCHAR(2)  --<< use this value for table LogNbrYear inserts.      
       ,@_NewLogNumberSeq INTEGER
       ,@_NewLogNumberSeqChar VARCHAR(4)  --<< use this value for table LogNbrSeq inserts.
       ,@_LogNbrYearHasChanged BIT
	   ,@AssessmentID INT
	   ,@ManagementIdOut INT
	   

-- initialize working variables
SELECT @_Result = 0
      ,@_FacilityIdCheck = 0 
      ,@_PreviousSiteCounty = ''
      ,@_PreviousReceivedDateYear = '' 
      ,@_strLogNumber = ''
      ,@_SystemChar2DigitYear = ''
      ,@_InputChar2DigitYear = ''
      ,@_NewLogNumberSeq = 0
      ,@_NewLogNumberSeqChar = ''
      ,@_LogNbrYearHasChanged = 0
	  ,@ManagementIdOut = 0

-- ---------------------------------------------------------------------------------
-- Strip time from dates and then recast so time portion is set to all zeros
SELECT @ReceivedDate = CAST(CONVERT(varchar(8), @ReceivedDate, 112) as datetime)

SELECT @_Result = @@ERROR
IF @_Result <> 0
   BEGIN
   GOTO ABORT
   END 


-- ---------------------------------------------------------------------------------
-- TURN INCOMING COUNTY VALUE INTO A CHAR, AND FRONT-PAD WITH A ZERO WHEN NECESSARY
SELECT @_SiteCounty = CAST(@CountyId AS varchar(2))
IF LEN(@_SiteCounty) = 1
   BEGIN
   SELECT @_SiteCounty = '0' +  @_SiteCounty
   END

SELECT @_Result  = @@ERROR
IF @_Result  <> 0
   BEGIN
   GOTO ABORT
   END


-- ---------------------------------------------------------------------------------
-- 21 March 2005 B.Dyer
-- Business Rules Validation 
/*
        '1. Cant DELETE Received date.
        '2. Received date not > today.
        '3. Can't DELETE the SiteName.

        todo bdyer 18 apr 2006: disable this check.
        '4. If Regulated Tank is checked, there must be a -valid- Facility ID.

        '5. Can't set County to zero
        '6. There must be a Street, and a City, and a County, and a Zip value,
        '   -or- the No Valid Address must be checked.
        '
        '7. RegulatedTankInd OR HotInd OR NonRegTankInd must be checked... one of them.
*/


--Received Date can't be null
IF (@ReceivedDate IS NULL)
    BEGIN
    SET @ErrorMessageHandler = 'Can''t DELETE Received Date.'
    SET @_Result = @@Error
    GOTO ABORT
    END 

--Received Date can't be > today
IF (@ReceivedDate > getdate())
    BEGIN
    SET @ErrorMessageHandler = 'Received Date cannot be greater than today.'
    SET @_Result = @@Error
    GOTO ABORT
    END 

--Site Name can't be null
IF (LEN(RTRIM(@SiteName)) = 0)
    BEGIN
    SET @ErrorMessageHandler = 'cannot DELETE Site Name.'
    SET @_Result = @@Error
    GOTO ABORT
    END 

--  todo bdyer 18 apr 2006: disable this check.
--If Regulated Tank is selected, there must be a  Facility ID
/*
IF ((@RegTankInd = 1) AND (@FacilityId IS NULL))
     BEGIN
     RAISERROR('If regulated Tank, must have a Facility Id.', 11,1) 
     SET @_Result = @@Error
     GOTO ABORT
     END 
*/

-- In-Coming FACILITY ID must exist in the UST database.
/*SELECT @_FacilityIdCheck = (SELECT COUNT(*) FROM UST.dbo.Facility where FacilityId = @FacilityId)
IF   @_FacilityIdCheck = 0
     BEGIN
     RAISERROR('Entered Facility Id does not exist in the UST database.', 11,1) 
     SET @_Result = @@Error
     GOTO ABORT
     END */


-- If Regulated Tank is selected, there must be a Facility ID value, and it must be valid 
-- in the UST database.


-- todo bdyer 28 dec 2006
-- remove this requirement.
-- a Reg Tank w/o a Facility Id is now acceptable.

-- IF ((@RegTankInd = 1) AND (@FacilityId IS NOT NULL)) <-- original
IF ((@RegTankInd = 1) AND ((@FacilityId IS NOT NULL) AND (@FacilityId > 0) ))

   BEGIN
   SELECT @_FacilityIdCheck = (SELECT COUNT(*) FROM UST.dbo.Facility where FacilityId = @FacilityId)
   IF   @_FacilityIdCheck = 0
        BEGIN
        --RaisError('Entered Facility Id does not exist in the UST database.', 11, 1)
		SET @ErrorMessageHandler = 'Entered Facility Id does not exist in the UST database.'
        SET @_Result = @@Error
		SET @ResultSP = -1
        GOTO ABORT
        END 
   END

--County can't be null
IF   @CountyId IS NULL
     BEGIN
     SET @ErrorMessageHandler = 'County must be selected.'
     SET @_Result = @@Error
     GOTO ABORT
     END 

-- Must be an Address-City-County-Zip combination, or No Valid Address must be checked.
IF ((LEN(RTRIM(@SiteAddress)) = 0)OR
   (@SiteCity IS NULL) OR
   (@SiteZip IS NULL) OR
   (@CountyId IS NULL))AND
   (@NoValidAddress <> 1)
     
    BEGIN
    SET @ErrorMessageHandler = 'Address, City, County, and Zip - or - No Valid Address, must be selected.'
    SET @_Result = @@Error
    GOTO ABORT 
    END 


--  RegulatedTankInd OR HotInd OR NonRegTankInd must be checked... one of them.

IF ((@RegTankInd <> 1) AND (@HotInd <> 1) AND (@NonRegTankInd <> 1))
    BEGIN
    SET @ErrorMessageHandler = 'Regulated, Non-Regulated, or Heating Oil Tank must be selected.'
    SET @_Result = @@Error
    GOTO ABORT 
    END 


---  END VALIDATION--------------------------------------------------------------------------------







---------------------------------------------------------------------------------------------------
/*
  LOG NUMBER CREATE -or- UPDATE SECTION

  THE FOLLOWING CODE BLOCK DOES THE FOLLOWING:

  1. Create a Log Number value for a new (INSERT) Lust Incident,
     based upon the input County and input ReceivedDate YEAR value.
  2. Update an existing Incident's Log Number value if the County value changes.
     This affects dbo.Incident.LogNumber
                  dbo.Incident.LogNbrCounty
  3. Update an existing Incident's Log Number value if the ReceivedDate YEAR value changes.
     This affects dbo.Incident.LogNumber
                  dbo.Incident.LogNbrYear
                  dbo.Incident.LogNbrSeq
*/

---------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------
---- CREATE NEW LOG NUMBER

--IF @LustIdIN  = 0 

--   BEGIN 
--   -- Get system year, converted to char and chopped to last 2 positions.
--   SELECT @_SystemChar2DigitYear = SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR(4)),3,2)
--   SELECT @_Result = @@ERROR
--   IF @_Result <> 0
--      BEGIN
--      GOTO ABORT
--      END

	  	  

--   -- Get Input year, converted to char and chopped to last 2 positions.
--   SELECT @_InputChar2DigitYear = SUBSTRING(CAST(DATEPART(YEAR, @ReceivedDate) AS VARCHAR(4)),3,2)
--   SELECT @_Result = @@ERROR
--   IF @_Result <> 0
--      BEGIN
--      GOTO ABORT
--      END

	  

--   -- System Year and Received Date Year the same or different?
--   -- Same Year: INSERT into Sequence Nbr table, retrieve new Identity Seed value.
--   -- Different Year: Get max Sequence Nbr for that year, and add one to it.
--   IF @_InputChar2DigitYear = @_SystemChar2DigitYear

--      --PRINT 'INSERT CHECK 1 SAME YEAR'

--      BEGIN
--		INSERT INTO LUST.dbo.LogNbrSequence (HoldingTank) VALUES ('X')
--		SELECT @_Result = @@ERROR
--		IF @_Result <> 0
--			 BEGIN
--				GOTO ABORT
--			END

--		SELECT @_NewLogNumberSeq = SCOPE_IDENTITY()



	         
--		SELECT @_Result = @@ERROR
--		IF @_Result <> 0
--			BEGIN
--				GOTO ABORT
--			 END
--     END

--   ELSE
--      -- OTHER YEAR THAN CURRENT. GET MAX VALUE, AND ADD ONE TO IT.
--      BEGIN

	


--      SELECT @_NewLogNumberSeq = (SELECT MAX(CONVERT(INT, LogNbrSeq )) 
--                                 FROM LUST.dbo.INCIDENT 
--                                 WHERE LogNbrYear = @_InputChar2DigitYear)
--      SELECT @_Result = @@ERROR
--      IF @_Result <> 0
--	 BEGIN
--	 GOTO ABORT
--         END

--      SELECT @_NewLogNumberSeq = (@_NewLogNumberSeq + 1)
--      SELECT @_Result = @@ERROR
--      IF @_Result <> 0
--	 BEGIN
--	 GOTO ABORT
--	 END

 

--      END
--   END 
---- END OF "CREATE NEW LOG NUMBER"

-----------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------
-- UPDATE EXISTING LOG NUMBER
-- WHEN COUNTY OR YEAR VALUES ARE MODIFIED.

IF @LustIdIN  > 0 

BEGIN

-- UPDATE COUNTY CHECK
   SELECT @_PreviousSiteCounty = (SELECT LogNbrCounty FROM dbo.Incident WHERE LustId = @LustIdIN)
   SELECT @_strLogNumber = (SELECT LogNumber FROM dbo.Incident WHERE LustId = @LustIdIN)

   IF (@_PreviousSiteCounty <> @_SiteCounty) -- I NEED TO UPDATE THE LOG NUMBER.
       BEGIN

       UPDATE [dbo].[Incident] 
       SET LogNumber = @_SiteCounty + SUBSTRING(@_strLogNumber, 3,8),
           LogNbrCounty = @_SiteCounty
       WHERE LustId = @LustIdIN  
 
       SELECT @_strLogNumber = (SELECT LogNumber FROM dbo.Incident WHERE LustId = @LustIdIN)

       END 

---------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------
-- UPDATE YEAR CHECK


SELECT @_PreviousReceivedDateYear = (SELECT substring(convert(varchar(10),datepart(year,ReceivedDate)),3,2) 
                                     FROM dbo.Incident WHERE LustId = @LustIdIN)

   SELECT @_InputChar2DigitYear = SUBSTRING(CAST(DATEPART(YEAR, @ReceivedDate) AS VARCHAR(4)),3,2)	

  -- HAS A RECEIVED DATE YEAR VALUE CHANGE OCCURED?



   IF (@_InputChar2DigitYear <> @_PreviousReceivedDateYear)

   BEGIN 


      -- WHEN A RECEIVED DATE YEAR VALUE CHANGE HAS OCCURED:
      -- IS THE NEW VALUE THE CURRENT YEAR, OR ANOTHER YEAR?
      -- 
      -- "CURRENT OR OTHER YEAR" CHECK 

  

      IF @_InputChar2DigitYear <> @_SystemChar2DigitYear

         -- "OTHER YEAR" ACTIVITY 
         BEGIN
			SELECT @_NewLogNumberSeq = (SELECT MAX(CONVERT(INT, LogNbrSeq )) 
                                    FROM LUST.dbo.INCIDENT 
                                    WHERE LogNbrYear = @_InputChar2DigitYear)
			SELECT @_Result = @@ERROR
			IF @_Result <> 0
				BEGIN
					GOTO ABORT
				END
	
			SELECT @_NewLogNumberSeq = (@_NewLogNumberSeq + 1)
			SELECT @_Result = @@ERROR
			IF @_Result <> 0
				BEGIN
					GOTO ABORT
				END
         END

      ELSE     -- "CURRENT YEAR" ACTIVITY  
         BEGIN

			INSERT INTO LUST.dbo.LogNbrSequence (HoldingTank) VALUES ('X')

			SELECT @_Result = @@ERROR
			IF @_Result <> 0
				BEGIN
					GOTO ABORT
				END
	
			SELECT @_NewLogNumberSeq = SCOPE_IDENTITY()
			SELECT @_Result = @@ERROR
			IF @_Result <> 0
			BEGIN
				GOTO ABORT
			END

		END  

    SET @_LogNbrYearHasChanged = 1
    END

END

-------END OF YEAR UPDATE CHECK -------------------------------------------------------------------



---------------------------------------------------------------------------------------------------
-- IF NEW LOG NUMBER IS CREATED,
-- OR EXISTING LOG NUMBER YEAR UPDATED, FORMAT THE NEW LOG NUMBER.
-- IF ((@LustIdIN = 0) OR (@_LogNbrYearHasChanged = 1))
IF (@_LogNbrYearHasChanged = 1)
   
   BEGIN

	

   -- Convert Integer Sequence Number to CHAR.
   SELECT @_NewLogNumberSeqChar = CONVERT(VARCHAR(4),@_NewLogNumberSeq)
   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END


   -- Ensure that CHAR Sequence Number is length of 4.
   SELECT @_NewLogNumberSeqChar = 
	CASE 
	WHEN (LEN(RTRIM(@_NewLogNumberSeqChar)) = 1) THEN '000'+ @_NewLogNumberSeqChar
	WHEN (LEN(RTRIM(@_NewLogNumberSeqChar)) = 2) THEN '00'+ @_NewLogNumberSeqChar
	WHEN (LEN(RTRIM(@_NewLogNumberSeqChar)) = 3) THEN '0'+ @_NewLogNumberSeqChar
        ELSE @_NewLogNumberSeqChar
        END 

   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END

   -- Put new Log Number together.
   SELECT @_strLogNumber = @_SiteCounty + '-' + @_InputChar2DigitYear + '-' + @_NewLogNumberSeqChar
   SELECT @_Result = @@ERROR
   IF @_Result <> 0
      BEGIN
      GOTO ABORT
      END
   END

---------------------------------------------------------------------------------------------------   




---------------------------------------------------------------------------------------------------

-- IF LOG NUMBER YEAR - SEQ UPDATE, DO ALL RELATED INCIDENT TABLE LOG NUMBER FIELD UPDATES NOW. 
IF @_LogNbrYearHasChanged = 1 -- THIS WILL ONLY HAPPEN DURING AN UPDATE OF COUNTY OR RECEIVED DATE.
 
   BEGIN 
   UPDATE [dbo].[Incident] 
   SET LogNumber =    @_strLogNumber
      --,LogNbrCounty = @_SiteCounty
      ,LogNbrYear =   @_InputChar2DigitYear
      ,LogNbrSeq =    @_NewLogNumberSeqChar
   WHERE LustId =     @LustIdIN
   END 

---------------------------------------------------------------------------------------------------
-- END OF "PROCESS LOG NUMBER" CODE BLOCK
-- ------------------------------------------------------------------



-----------------------------------------------------------------------
-- INSERT / UPDATE SECTION.
-----------------------------------------------------------------------


IF @LustIdIN  != 0 --Primary Key 
--IF @LustIdIN  = 0 --Primary Key 
--   BEGIN
--   INSERT INTO [dbo].[Incident] 
--       -- DB identity seed will create new LustId
--	(
--	 LogNumber
--    ,LogNbrCounty      
--    ,LogNbrYear
--    ,LogNbrSeq
--	,FacilityId
--	,ReceivedDate
--	,CreateDate
--	,SiteName
--	,SiteAddress
--	,SiteCity
-- 	,SiteZip
--	,SitePhone
--	,NoValidAddress
--	,SiteTypeId
--	,FileStatusId
--	,RegulatedTankInd
--	,HotInd
--	,NonRegTankInd
--	,BrownfieldCodeId
--  	,PropertyTranPendingInd
--    ,ProgramTransferInd
--    ,HotAuditRejectInd
--    ,ActiveReleaseInd
--    ,OptionLetterSentInd
--	,SiteComment
--	,SeeAlsoComment
--    ,PublicSummaryComment   
--	,GeolocId        -- 22 sep 2005 after talking with Beccy: Geoloc Id is created stand-alone.
--                                 -- i should make this - if desired, before i run this process, so it's available when i get here..
--                                 -- for the moment, ignore to get up and running!
--	,OlprrId
--	,LastChangeBy
--	,LastChangeDate
--	) 
--    VALUES 
--        (
--	 @_strLogNumber
--        ,@_SiteCounty 
--        ,@_InputChar2DigitYear 
--        ,@_NewLogNumberSeqChar 
--	,@FacilityId
--	,@ReceivedDate
--	,GETDATE()
--	,@SiteName
--	,@SiteAddress
--	,@SiteCity
--	,@SiteZip
--	,@SitePhone
--	,@NoValidAddress
--	,@SiteTypeId
--	,@FileStatusId
--	,@RegTankInd 
--	,@HotInd
--	,@NonRegTankInd
--	,@BrownfieldCodeId
--	,@PropertyTranPendingInd
-- 	,@ProgramTransferInd
--	,@HotAuditRejectInd
--    ,@ActiveReleaseInd
--    ,@OptionLetterSentInd 
--	,@SiteComment
--	,@SeeAlsoComment
--    ,@PublicSummaryComment      
--	,@GeolocId
--	,@OlprrId
--    ,Substring(dbo.fn_CurrentUserName(SUSER_SNAME()), 1, 7)
--	,GETDATE()
--	)
	
--   SELECT @_Result  = @@ERROR
--   SET @ErrorMessageHandler = Error_Message()



--   IF     @_Result  <> 0
--          BEGIN
--          GOTO ABORT
--          END

--   SELECT @LustIdOUT = SCOPE_IDENTITY() --@@IDENTITY --GET THE NEW IDENTITY SEED VALUE! Primary Key  
--   SELECT @_Result  = @@ERROR
--   IF     @_Result  <> 0
--          BEGIN
--          GOTO ABORT
--          END	

--   END  --<<< END OF INSERT ROUTINE.

--ELSE    -- <<<<<<<<<<<<< -- BEGIN UPDATE ROUTINE
   BEGIN   
        
   UPDATE [dbo].[Incident] 
   SET
	FacilityId = @FacilityId 
   ,ReceivedDate = @ReceivedDate 
   ,SiteName = @SiteName 
   ,SiteAddress = @SiteAddress 
   ,SiteCity = @SiteCity 
   ,SiteZip = @SiteZip 
   ,SitePhone = @SitePhone 
   ,NoValidAddress = @NoValidAddress
   ,SiteTypeId = @SiteTypeId 
   ,FileStatusId = @FileStatusId 
   ,RegulatedTankInd = @RegTankInd
   ,HotInd = @HotInd 
   ,NonRegTankInd = @NonRegTankInd
   ,BrownfieldCodeId = @BrownfieldCodeId 
   ,PropertyTranPendingInd = @PropertyTranPendingInd 
   ,ProgramTransferInd = @ProgramTransferInd
   ,HotAuditRejectInd = @HotAuditRejectInd 
   ,ActiveReleaseInd = @ActiveReleaseInd
   ,OptionLetterSentInd = @OptionLetterSentInd
   ,SiteComment = @SiteComment
   ,SeeAlsoComment = @SeeAlsoComment 
   ,PublicSummaryComment = @PublicSummaryComment -- TODO BDYER 30 MAY 2007 
   ,GeolocId = @GeolocId 
   ,OlprrId = @OlprrId 
   ,LastChangeBy = @LastChangeby 
   -- ,LastChangeBy = dbo.fn_CurrentUserName(SUSER_SNAME())
   ,LastChangeDate = GETDATE() 
    WHERE LustId = @LustIdIN --Primary Key

    SELECT @_Result  = @@ERROR
	SET @ErrorMessageHandler = Error_Message()
    IF     @_Result  <> 0
           BEGIN
           GOTO ABORT
           END

    SELECT @LustIdOUT = @LustIdIN --Primary Key  
    SELECT @_Result  = @@ERROR
    IF     @_Result  <> 0
           BEGIN
           GOTO ABORT
           END	

	/*

	Assessment.DiscoveryDate is a nullable column, however, UI forces the update only upon a DiscoveryDate Change.
	The UI will also not allow the DiscoveryDate to be removed (Set to NULL).  Older records contain null values.

	*/	

		SELECT @AssessmentID = AssessmentId FROM Assessment WHERE LustId = @LustIdIN
		BEGIN
			IF @DiscoverDate IS NOT NULL AND @AssessmentID IS NOT NULL
				BEGIN
					EXEC dbo.apUpdAssessmentDiscoverDate
						@AssessmentID
						,@LustIdIN
						,@DiscoverDate -- todo bdyer 11 april 2007

				END
		END

		IF ISNULL(@ManagementIdIn, 0) != 0
			BEGIN
				IF EXISTS(SELECT * FROM Management m WHERE m.ManagementId = @ManagementIdIn
					AND (m.CleanupStartDate != @CleanupStartDt 
						OR m.ReleaseStopDate != @ReleaseStopDt
						OR m.FinalInvcRqstDate != @FinalInvcRqstDt
						OR m.ClosedDate != @ClosedDt
						OR m.LetterOfAgreementDate != @LetterOfAgreementDt
						OR m.LetterOfAgreementComment != @LetterOfAgreementComment))

						BEGIN
							EXEC apInsUpdManagementData
							 @ManagementIdIn  
							,@ManagementIdOut OUTPUT
							,@LustIdIn
							,@CleanupStartDt 
							,@ReleaseStopDt 
							,@FinalInvcRqstDt 
							,@ClosedDt 
							,@LetterOfAgreementDt 
							,@LetterOfAgreementComment 
							,@LastChangeBy
							,@ErrorMessageHandler OUTPUT

							IF ISNULL(@ErrorMessageHandler, '') != ''		
								BEGIN
									GOTO ABORT
								END
					END
		END

		

    END --<<< END OF UPDATE ROUTINE.

-- LogNumber Output set by either INSERT or UPDATE

SELECT @LogNumberOUT = @_strLogNumber
SELECT @_Result  = @@ERROR
IF     @_Result  <> 0
   BEGIN
   GOTO ABORT
   END	

-- EXIT STORED PROCEDURE WITH SUCCESS VALUE
RETURN @_Result


ABORT:
-- EXIT STORED PROCEDURE WITH ERROR VALUE

RETURN @_Result



GO
GRANT EXECUTE ON [dbo].[apUpdIncidentData] TO [LUSTUser] AS [dbo]
GO


/****** Object:  StoredProcedure [dbo].[apWorkReportedBySearch]    Script Date: 4/10/2019 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apWorkReportedBySearch]
		 @SearchValue        varchar(40) = NULL
AS


IF NULLIF(@SearchValue, '') IS NULL
	BEGIN
				select 
					   UPPER(d.LicenseStatus)+ ': ' 
					   + LTRIM(RTRIM(b. FullName)) + ' ' 
					   + isnull(b. AddressCity,'NO ADDRESS') + ' ' 
					   + isnull(b. AddressState,' ')
					   + ' (RE' + CAST(b. PersonID as varchar) +')'
					   as Descript 

				from   Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
				join   Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

				--from   [deqsql1\audit].Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
				--join   [deqsql1\audit].Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

				where  b. PersonType  = 'SP'
				and    b. FullName is not null  
				UNION
				select 
					   'CONSULTANT: ' + LTRIM(RTRIM(c.CompanyName))  + ' ' 
					   + isnull(c.CITY,'NO ADDRESS')+ ' ' 
					   + isnull(c.STATE,' ') 
					   + ' (CN' + CAST(c.ID as varchar) +')'
					   as Descript 
				from   LUST.dbo.CONSULTANT c WITH (NOLOCK)
				ORDER BY Descript  
END
ELSE
	BEGIN

		with s1 as (
				select 
					   UPPER(d.LicenseStatus)+ ': ' 
					   + LTRIM(RTRIM(b. FullName)) + ' ' 
					   + isnull(b. AddressCity,'NO ADDRESS') + ' ' 
					   + isnull(b. AddressState,' ')
					   + ' (RE' + CAST(b. PersonID as varchar) +')'
					   as Descript 

				from   Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
				join   Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

				--from   [deqsql1\audit].Licensing.dbo.vUST_PersonInfo b WITH (NOLOCK)
				--join   [deqsql1\audit].Licensing.dbo.vUST_LicenseInfo d WITH (NOLOCK) on b.PersonID = d.PersonID

				where  b. PersonType  = 'SP'
				and    b. FullName is not null  
				UNION
				select 
					   'CONSULTANT: ' + LTRIM(RTRIM(c.CompanyName))  + ' ' 
					   + isnull(c.CITY,'NO ADDRESS')+ ' ' 
					   + isnull(c.STATE,' ') 
					   + ' (CN' + CAST(c.ID as varchar) +')'
					   as Descript 
				from   LUST.dbo.CONSULTANT c WITH (NOLOCK) 
		
		)
		select descript from s1
		where  lower(s1.descript) like '%' + lower(@SearchValue) + '%';

	END
GO
GRANT EXECUTE ON [dbo].[apWorkReportedBySearch] TO [LUSTUser] AS [dbo]
GO



/* 
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************

*/ 

USE [HOTC]
GO

IF NOT EXISTS (SELECT * FROM sysusers WHERE name = N'LUSTUser')
	CREATE USER [LUSTUser] FOR LOGIN [lustuser]
GO



/****** Object:  StoredProcedure [dbo].[apValidateLUSTLogNumberData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apValidateLUSTLogNumberData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apValidateLUSTLogNumberData]
GO
/****** Object:  StoredProcedure [dbo].[apValidateLogNumberAndManagementData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apValidateLogNumberAndManagementData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apValidateLogNumberAndManagementData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdLustManagementData]    Script Date: 4/23/2019 4:52:50 PM ******/
-- 06/03/2019 - Removed reference to this object because it is not required
-- This object is not dependent on HOL 
IF OBJECT_ID('apInsUpdLustManagementData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdLustManagementData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdHotcManagementData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apInsUpdHotcManagementData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdHotcManagementData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdHotcLustData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apInsUpdHotcLustData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdHotcLustData]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdHotcCleanDecommData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apInsUpdHotcCleanDecommData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apInsUpdHotcCleanDecommData]
GO
/****** Object:  StoredProcedure [dbo].[apGetSearchHOTC_LUSTData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apGetSearchHOTC_LUSTData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetSearchHOTC_LUSTData]
GO
/****** Object:  StoredProcedure [dbo].[apGetLustManagementData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apGetLustManagementData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetLustManagementData]
GO
/****** Object:  StoredProcedure [dbo].[apGetHOTServiceProviderData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apGetHOTServiceProviderData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetHOTServiceProviderData]
GO
/****** Object:  StoredProcedure [dbo].[apGetCleanDecommByHotIdData]    Script Date: 4/23/2019 4:52:50 PM ******/
IF OBJECT_ID('apGetCleanDecommByHotIdData', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[apGetCleanDecommByHotIdData]
GO
/****** Object:  StoredProcedure [dbo].[apGetCleanDecommByHotIdData]    Script Date: 4/23/2019 4:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*




   Auth: B.DYER

   Date: Wednesday, November 26, 2003
------------------------------------------------------------------------------------------------------------------------
		Change History
------------------------------------------------------------------------------------------------------------------------
   Date:	           Author:                     Description:
   ------------------   ------------------------------  -------------------------------------------
   6-03-2019		   aguedea				  	   Added columns @LastChangeBy, @LastChangeDATe
------------------------------------------------------------------------------------------------------------------------



DECLARE @RESULT INT
exec apGetCleanDecommByHotIdData 61, @RESULT OUTPUT


*/


CREATE PROCEDURE [dbo].[apGetCleanDecommByHotIdData]
    @HotId INT
  , @RESULT INT OUTPUT
AS 
    DECLARE @error INT

    SELECT  @RESULT = 1 --< error value.

    SELECT 
	a.hot_id,
	RTRIM(a.dhot_county) AS dhot_county, RTRIM(a.dhot_year) AS dhot_year, RTRIM(a.hot_street_nbr) AS hot_street_nbr, RTRIM(a.hot_street_quad) AS hot_street_quad,
			RTRIM(a.hot_street_nm) AS hot_street_nm, RTRIM(a.hot_street_type) AS hot_street_type, RTRIM(a.hot_addr_cmnt) AS hot_addr_cmnt, 
			RTRIM(a.hot_city) AS hot_city, RTRIM(a.hot_zip) AS hot_zip, RTRIM(a.rp_first_nm) AS rp_first_nm,
            RTRIM(a.rp_last_nm) AS rp_last_nm, RTRIM(a.rp_company_nm) AS rp_company_nm, RTRIM(a.rp_street_nbr) AS rp_street_nbr, 
			RTRIM(a.rp_street_quad) AS rp_street_quad, RTRIM(a.rp_street_nm) AS rp_street_nm,
            RTRIM(a.rp_street_type) AS rp_street_type, RTRIM(a.rp_addr_cmnt) AS rp_addr_cmnt, RTRIM(a.rp_city) AS rp_city, RTRIM(a.rp_state) AS rp_state, 
			RTRIM(a.rp_zip) AS rp_zip, a.decommission_date AS decommission_date, a.file_closed_date, RTRIM(b.hot_sp_id) AS hot_sp_id, 
			(b.Check_received_date) , RTRIM(b.decomm_type) AS decomm_type, RTRIM(b.check_nbr) AS check_nbr,
            --RTRIM(b.fee_amt) AS fee_amt, audit_date, RTRIM(b.report_rejected) AS report_rejected, RTRIM(b.hot_comments) AS hot_comments
			CAST(b.fee_amt AS DECIMAL(15, 2)) AS fee_amt, audit_date, RTRIM(b.report_rejected) AS report_rejected, RTRIM(b.hot_comments) AS hot_comments
			, licPersonId.personId, licPersonId.fullName
			, CASE WHEN licInfo.LicenseStatus = 'Active' THEN 'Active' ELSE CASE WHEN hot_sp_id = 'HOWNR' THEN '' ELSE 'Expired' END END AS licenseStatus
--			, licInfo.LicenseStatus
                --    , a.LastChangeBy
			--    , a.LastChangeDate
	FROM    HOTC.dbo.HOT_DECOMMISSION a WITH ( NOLOCK )
            JOIN HOTC.dbo.HOT_MANAGEMENT b WITH ( NOLOCK ) ON a.hot_id = b.hot_id
			
			LEFT JOIN (SELECT DISTINCT licL.personId, licL.LicenseNbr, licP.FullName
					FROM licensing.dbo.vUST_LicenseInfo licL 
					JOIN licensing.dbo.vUST_PersonInfo licP ON licL.PersonId = licP.PersonId
					WHERE licL.LicenseType = 'Service Provider, Heating Oil Tanks') AS licPersonId ON licPersonId.licenseNbr = LTRIM(RTRIM(b.hot_sp_id))
			LEFT JOIN (SELECT DISTINCT licL.LicenseNbr, licP.fullName, licL.LicenseStatus, licL.PersonId
					FROM licensing.dbo.vUST_LicenseInfo licL 
					JOIN licensing.dbo.vUST_PersonInfo licP ON licL.PersonId = licP.PersonId 
					WHERE licL.LicenseStatus = 'Active') AS licInfo ON licInfo.PersonId = licPersonId.PersonId AND b.hot_sp_id = licInfo.licenseNbr
	 WHERE   a.hot_id = @HotId


    SELECT  @error = @@ERROR
    IF @error = 0 
        SELECT  @RESULT = 0


GO
GRANT EXECUTE ON [dbo].[apGetCleanDecommByHotIdData] TO [LUSTUSER] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetHOTServiceProviderData]    Script Date: 4/23/2019 4:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

    SELECT  a.FullName, b.LicenseStatus, b.LicenseNbr
    FROM    licensing.dbo.vUST_PersonInfo a WITH ( NOLOCK )
            JOIN licensing.dbo.vUST_LicenseInfo b WITH ( NOLOCK ) ON a.PersonID = b.PersonID

    WHERE   LicenseType = 'Service Provider, Heating Oil Tanks'
			AND LicenseStatus = 'Active'
			AND b.LicenseNbr = @LicenseNbr


DECLARE @Result INT
exec apGetHOTServiceProviderData2 16516, @Result OUTPUT

*/

CREATE PROCEDURE [dbo].[apGetHOTServiceProviderData]
    @LicenseNbr INT
  , @RESULT INT OUTPUT
AS 
    DECLARE @error INT

    SET @RESULT = 0

	DECLARE @LicenseStatus VARCHAR(12), @FullName VARCHAR(135)

    SELECT  @FullName = a.FullName, @LicenseStatus = b.LicenseStatus
    FROM    licensing.dbo.vUST_PersonInfo a WITH ( NOLOCK )
            JOIN licensing.dbo.vUST_LicenseInfo b WITH ( NOLOCK ) ON a.PersonID = b.PersonID

    WHERE   b.LicenseNbr = @LicenseNbr
			AND LicenseType = 'Service Provider, Heating Oil Tanks'
			AND LicenseStatus = 'Active'

	IF @LicenseStatus IS NULL
		BEGIN
			SET @LicenseStatus = 'Expired'
		END
			SELECT @LicenseNbr as LicenseNbr, ISNULL(@FullName, '') AS FullName, @LicenseStatus AS LicenseStatus 




/*
SELECT @HOTServiceProvider = a.FullName
from   licensing.dbo.vUST_PersonInfo a
join   licensing.dbo.vUST_LicenseInfo b
on     a.PersonID = b.PersonID
where  b.PersonID = @LicenseNbr
*/

/*
todo bdyer 29 June 2006 swap-out to correct key.
where  b.LicenseNbr = @LicenseNbr

*/
    SELECT  @error = @@error
    IF @error = 0 
        SET @RESULT = 0
    ELSE 
        SET @RESULT = 1




GO
GRANT EXECUTE ON [dbo].[apGetHOTServiceProviderData] TO [LUSTUSER] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apGetLustManagementData]    Script Date: 4/23/2019 4:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[apGetLustManagementData]
    @LustId INT
  , @ManagementId INT 
  , @ReleaseStopDt DATETIME 
  , @FinalInvcRqstDt DATETIME 
  , @RESULT INT OUTPUT
AS 
    SET @RESULT = 1

    SELECT  ManagementId, ReleaseStopDate, FinalInvcRqstDate
    FROM    LUST.dbo.Management WITH ( NOLOCK )
    WHERE   LustId = @LustId

    SET @RESULT = @@ERROR

    RETURN @RESULT

GO
GRANT EXECUTE ON [dbo].[apGetLustManagementData] TO [LUSTUSER] AS [dbo]
GO

/****** Object:  StoredProcedure [dbo].[apGetSearchHOTC_LUSTData]    Script Date: 6/11/2019 5:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*
Revision History:
-----------------------------------------------------------------------------------------------------------
  Date               Name          Description
-----------------------------------------------------------------------------------------------------------
06-08-2018          aguedea        Creation
06-10-2019          aguedea        Removed RTRIM from @StreetNbr seek.
06/11/2019			aguedea		   Changed how Hot_id and LustId is search, when null then not included in criteria, when -1 then search is on Hot_id/LustId = -1 else
								   search on Hot_id/LustId = @Id 
6/13/2019			aguedea		Changed the ID search from incident.LustId to incident.LogNbrSeq


*/


CREATE PROCEDURE [dbo].[apGetSearchHOTC_LUSTData]


/*
Purpose: Perform dynamic HOTC search activity.
Return data to populate HOTC Clean Decomm FlexGrid after SEARCH activity is performed.

declare @Result INT, @TotalRows INT, @TotalPages INT
exec apGetSearchHOTC_LUSTData NULL, '72 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 1, 1, 300, @TotalRows OUTPUT, @TotalPages OUTPUT, @Result OUTPUT
SELECT @TotalRows , @TotalPages, @Result 

declare @Result INT, @TotalRows INT, @TotalPages INT
exec apGetSearchHOTC_LUSTData 18541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 1, 1, 300, @TotalRows OUTPUT, @TotalPages OUTPUT, @Result OUTPUT
SELECT @TotalRows , @TotalPages, @Result 

declare @Result INT, @TotalRows INT, @TotalPages INT
exec apGetSearchHOTC_LUSTData 43036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 1, 1, 300, @TotalRows OUTPUT, @TotalPages OUTPUT, @Result OUTPUT
SELECT @TotalRows , @TotalPages, @Result 

declare @Result INT, @TotalRows INT, @TotalPages INT
exec apGetSearchHOTC_LUSTData -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 1, 1, 300, @TotalRows OUTPUT, @TotalPages OUTPUT, @Result OUTPUT
SELECT @TotalRows , @TotalPages, @Result 


*/  @Id			INTEGER
  , @StreetNbr	VARCHAR(7)
  , @StreetQuad VARCHAR(2)
  , @StreetName VARCHAR(30)
  , @StreetType VARCHAR(10)
  , @OtherAddr	VARCHAR(40)
  , @City		VARCHAR(30)
  , @Zip		VARCHAR(10)
  , @County		VARCHAR(2)
  , @Year		VARCHAR(2)
  , @SearchType INT						-- (1 = Lust, 2 = HOTC, 3 = BOTH)
  , @SortColumn                  INT             = NULL
  , @SortOrder                   INT             = NULL
  , @PageNumber                  INT             = NULL
  , @RowsPerPage                 INT             = NULL
  , @TotalRows                   INT             OUTPUT
  , @TotalPages                  INT             OUTPUT 
  , @RESULT		INTEGER			OUTPUT
AS 
    DECLARE							@error INT
       --,@HOTCQueryString varchar(800)
      , @HOTCQueryString			VARCHAR(800)
      , @LUSTQueryString			VARCHAR(800)
      , @LUSTCriteriaCount			INTEGER
      , @CombinedQueryString		VARCHAR(1600)
	  , @HOTCSQLColumns				VARCHAR(1024)
	  , @HOTCWHERE					VARCHAR(2048)
	  , @LUSTSQLColumns				VARCHAR(1024)
	  , @LUSTWHERE					VARCHAR(2048)
	  , @HOTCTotalRows				INT
	  , @LUSTTotalRows				INT
	  , @HOTCSQLCounts				NVARCHAR(MAX)
	  , @LUSTSQLCounts				NVARCHAR(MAX)
	  , @RowsCalc					DECIMAL 
	  , @Pagination					VARCHAR(128)
	  , @OrderBy					VARCHAR(128)

	   
	  IF ISNULL(@SearchType, 0) = 0
		SET @SearchType = 1
	PRINT 'StreetNbr = x' + @StreetNbr + 'x'
	  
    SET @RESULT = 1 --< error value.
    SET @LUSTCriteriaCount = 0
    SET @HOTCWhere = ' 
	WHERE '
	SET @Pagination = '
		'
	SET @OrderBy = ''
	SET @RowsCalc = 0	
    SET @HOTCSQLColumns = 'SELECT CASE WHEN ISNULL(HOT_DECOMMISSION.HOT_ID, 0) = 0 THEN ''LUST'' ELSE ''HOTC'' END AS Type,
	HOT_DECOMMISSION.HOT_ID AS Id, 
	CASE WHEN HOT_management.log_number IS NULL THEN CONVERT(VARCHAR, HOT_Decommission.hot_id) ELSE hot_management.log_number END AS LogNumber,
	   NULL AS finalInvcRqstDate, HOT_Management.check_received_date AS ClosedDate,
       CASE 
           WHEN (LEN(RTRIM(hot_street_nbr)) > 0) OR (LEN(RTRIM(hot_street_nm)) > 0) THEN

                ( RTRIM(hot_street_nbr) + '' '' + UPPER(RTRIM(hot_street_nm)) )
           ELSE
                 RTRIM(hot_addr_cmnt)
        END AS HotAddress ,
       UPPER(hot_city) as City ,
       hot_zip  as ZipCode ,
       dhot_county as County ,
       RTRIM(dhot_year) as Year
FROM    HOTC.dbo.HOT_DECOMMISSION WITH (NOLOCK)
		LEFT JOIN HOTC.dbo.HOT_Management ON HOTC.dbo.HOT_DECOMMISSION.hot_Id = HOT_Management.hot_Id'

		-- ISNULL(finalInvcRqstDate, '' '') AS finalInvcRqstDate, ISNULL(ClosedDate, '' '') AS ClosedDate,

    SET @LUSTSQLColumns = 'SELECT ''LUST'' AS Type,
	incident.LustId AS Id,
	LogNumber AS LogNumber,
	   finalInvcRqstDate, ClosedDate,
       SiteAddress AS HotAddress,
       SiteCity as City ,
       SiteZip as ZipCode ,
       LogNbrCounty as County,
       CASE WHEN CONVERT(INT, LogNbrYear) >= 50 THEN ''19'' + LogNbrYear ELSE ''20'' + LogNbrYear END as Year
FROM LUST.dbo.Incident WITH (NOLOCK)
	LEFT JOIN LUST.dbo.Management ON Incident.LustId = Management.LustId'


    SET  @LUSTWHERE = ' 
		WHERE 1 = 1 AND ' 
	SET @HOTCWhere = ' 
		WHERE 1 = 1 AND ' 


/*
now build WHERE clause for both HOTC and LUST.
I'm going to be testing this for a while...
*/


-- LUST and HOTC_ID

	IF ISNULL(@Id, 1) = 1
		BEGIN
			    SET @HOTCWhere = @HOTCWhere 
				SET @LUSTWhere = @LUSTWhere 
		END
	ELSE IF @Id = -1
	    BEGIN
            SET @HOTCWhere = @HOTCWhere + 'HOT_DECOMMISSION.hot_id = -1 AND '
      -- begin building the LUST Address string.
            SET @LUSTWhere = @LUSTWhere + ' incident.LogNbrSeq = -1 AND '
        END
	ELSE
	    BEGIN
            SET @HOTCWhere = @HOTCWhere + 'HOT_DECOMMISSION.hot_id = ' + Convert(VARCHAR, @Id) + ' AND '
      -- begin building the LUST Address string.
            SET @LUSTWhere = @LUSTWhere + ' incident.LogNbrSeq = ' + Convert(VARCHAR, @Id) + ' AND '
        END

-- STREET NBR
    IF LEN(RTRIM(@StreetNbr)) > 0 
        BEGIN
            SET @HOTCWhere = @HOTCWhere + 'hot_street_nbr LIKE ' + '''' + @StreetNbr + '%' + ''' AND '
      -- begin building the LUST Address string.
            SET @LUSTWhere = @LUSTWhere + ' SiteAddress LIKE ''' + @StreetNbr + '%' + ''' + '
        END



-- STREET QUAD
    IF LEN(RTRIM(@StreetQuad)) > 0 
        BEGIN
            SELECT  @HOTCWhere = @HOTCWhere + 'hot_street_quad = ' + '''' + RTRIM(@StreetQuad) + ''' AND '
			IF CHARINDEX('SiteAddress LIKE', @LUSTWhere) = 0 
				SELECT  @LUSTWhere = @LUSTWhere + ' SiteAddress LIKE ''' + RTRIM(@StreetQuad) + '%' + ''' + '
			ELSE
				SELECT  @LUSTWhere = @LUSTWhere + '''' + RTRIM(@StreetQuad) + '%' + ''' + '
        END


-- STREET NAME
    IF LEN(RTRIM(@StreetName)) > 0 
        BEGIN
            SELECT  @HOTCWhere = @HOTCWhere + 'hot_street_nm  LIKE  ' + '''' + RTRIM(@StreetName) + '%' + ''' AND '
			IF CHARINDEX('SiteAddress LIKE', @LUSTWhere) = 0 
				SELECT  @LUSTWhere = @LUSTWhere + ' SiteAddress LIKE ''' + RTRIM(@StreetName) + '%' + ''' + '
			ELSE
				SELECT  @LUSTWhere = @LUSTWhere + '''' + RTRIM(@StreetName) + '%' + ''' + '
        END





-- STREET TYPE
    IF LEN(RTRIM(@StreetType)) > 0 
        BEGIN
            
            SELECT  @HOTCWhere = @HOTCWhere + 'hot_street_type = ' + '''' + RTRIM(@StreetType) + ''' AND '
			IF CHARINDEX('SiteAddress LIKE', @LUSTWhere) = 0 
				SELECT  @LUSTWhere = @LUSTWhere + ' SiteAddress LIKE ''' + RTRIM(@StreetType) + '%' + ''' + '
			ELSE
				SELECT  @LUSTWhere = @LUSTWhere + '''' + RTRIM(@StreetType) + '%' + ''' + '
        END


/* todo bdyer 25 july 2006

i'm going to open with the approach that the LUST address will be made by the "pieces" approach, or 
entirely from the "Other Address"...
*/

-- OTHER ADDRESS
    IF LEN(RTRIM(@OtherAddr)) > 0 
        BEGIN
            SELECT  @HOTCWhere = @HOTCWhere + 'hot_addr_cmnt LIKE ' + '''' + RTRIM(@OtherAddr) + '%' + ''' AND '
--   PRINT 'OTHER ADDRESS CHECK ' + @WhereClause

        END




/*
------------------------------------------------------------------------------
*/

	IF RIGHT(LTRIM(RTRIM(@LUSTWhere)), 1) = '+'
		SET @LUSTWHERE = SUBSTRING(@LUSTWHERE, 1, LEN(LTRIM(RTRIM(@LUSTWHERE))) - 1)

	IF RIGHT(LTRIM(RTRIM(@LUSTWhere)), 3) != 'AND'
		SET @LUSTWhere = @LUSTWhere + ' AND '

	
-- CITY
    IF LEN(RTRIM(@City)) > 0 
        BEGIN
            
            SELECT  @HOTCWhere = @HOTCWhere + 'hot_city LIKE ' + '''' + RTRIM(@City) + '%' + ''' AND '
   --PRINT 'CITY CHECK ' + @WhereClause

            
            SELECT  @LUSTWhere = @LUSTWhere + 'SiteCity LIKE ' + '''' + RTRIM(@City) + '%' + ''' AND '
        END



/*
------------------------------------------------------------------------------
*/

-- ZIP
    IF LEN(RTRIM(@Zip)) > 0 
        BEGIN
            SELECT  @HOTCWhere = @HOTCWhere + ' hot_zip LIKE ' + '''' + RTRIM(@Zip) + '%' + ''' AND '
            SELECT  @LUSTWhere = @LUSTWhere + 'SiteZip LIKE ' + '''' + RTRIM(@Zip) + '%' + ''' AND '

--   PRINT 'ZIP CHECK ' + @WhereClause
        END




/*
------------------------------------------------------------------------------
*/



-- Add SEARCH Criteria 
  
-- COUNTY
    IF LEN(RTRIM(@County)) > 0 
        BEGIN
            SELECT  @HOTCWhere = @HOTCWhere + ' dhot_County = ' + '''' + RTRIM(@County) + ''' AND '
			SELECT  @LUSTWhere = @LUSTWhere + ' LogNbrCounty = ' + '''' + RTRIM(@County) + ''' AND '
        END



/*
------------------------------------------------------------------------------
*/

-- YEAR
    IF LEN(RTRIM(@Year)) > 0 
        BEGIN
            SELECT  @HOTCWhere = @HOTCWhere + ' dhot_year = ' + '''' + '20' + RTRIM(@Year) + ''''
 
            SELECT  @LUSTWhere = @LUSTWhere + ' LogNbrYear = ' + '''' + RTRIM(@Year) + ''''
 

        END

IF RIGHT(LTRIM(RTRIM(@LUSTWHERE)), 3) = 'AND'
       SET @LUSTWHERE = SUBSTRING(@LUSTWHERE, 1, LEN(LTRIM(RTRIM(@LUSTWHERE))) - 3)
       
IF RIGHT(LTRIM(RTRIM(@HOTCWHERE)), 3) = 'AND'
       SET @HOTCWHERE = SUBSTRING(@HOTCWHERE, 1, LEN(LTRIM(RTRIM(@HOTCWHERE))) - 3)
       




IF ISNULL(@SearchType, 0) = 3 
	BEGIN
		SET @HOTCSQLCounts = 'SELECT @totals = COUNT (DISTINCT hot_id)
			FROM HOTC.dbo.HOT_Decommission'
		SET @HOTCSQLCounts = @HOTCSQLCounts  + @HOTCWhere
		 EXEC sp_executesql @HOTCSQLCounts, N'@totals INT OUTPUT', @HOTCTotalRows OUTPUT
		--PRINT @HOTCSQLCounts

		SET @LUSTSQLCounts = 'SELECT @totals = COUNT (DISTINCT LustId)
		FROM LUST.dbo.Incident'
		SET @LUSTSQLCounts = @LUSTSQLCounts  + @LUSTWhere
		EXEC sp_executesql @LUSTSQLCounts, N'@totals INT OUTPUT', @LUSTTotalRows OUTPUT
		--PRINT @LUSTSQLCounts 
		
		
		
	END
ELSE IF ISNULL(@SearchType, 0) = 2
	BEGIN
		SET @HOTCSQLCounts = 'SELECT @totals = COUNT (DISTINCT hot_id)
			FROM HOTC.dbo.HOT_Decommission'
		SET @HOTCSQLCounts = @HOTCSQLCounts  + @HOTCWhere
		EXEC sp_executesql @HOTCSQLCounts, N'@totals INT OUTPUT', @HOTCTotalRows OUTPUT
		--PRINT @HOTCSQLCounts

	END
ELSE IF ISNULL(@SearchType, 0) = 1 
	BEGIN
		SET @LUSTSQLCounts = 'SELECT @totals = COUNT (DISTINCT LustId)
		FROM LUST.dbo.Incident'
		SET @LUSTSQLCounts = @LUSTSQLCounts  + @LUSTWhere
		EXEC sp_executesql @LUSTSQLCounts, N'@totals INT OUTPUT', @LUSTTotalRows OUTPUT
		--PRINT @LUSTSQLCounts 
	END

SET @TotalRows = ISNULL(@HOTCTotalRows, 0) + ISNULL(@LUSTTotalRows, 0)





/*

PRINT @HOTCWhere
PRINT @LUSTWhere
PRINT 'HOTC Rows = ' + convert(varchar, @HotCTotalRows)
PRINT 'LUST Rows = ' + convert(varchar, @LUSTTotalRows)
PRINT 'TOTAL Rows = ' + convert(varchar, @TotalRows)


*/


SET @TotalPages = @TotalRows / @RowsPerPage






SET @Pagination  = @Pagination + ' 
       OFFSET ((' + CONVERT(VARCHAR, @PageNumber) + ' -1 ) * ' + CONVERT(VARCHAR, @RowsPerPage) + ') ROWS'
SET @Pagination = @Pagination + ' 
       FETCH NEXT ' + CONVERT(VARCHAR, @RowsPerPage) + ' ROWS ONLY;'


-- This condition indicates the query returned data but did not fill a page so return 1
IF (@TotalPages = 0 AND @TotalRows <> 0)
       BEGIN
              --PRINT '@totalpages = 0 and @totalrows <> 0   ' + Convert(varchar, @totalPages) + ' ' + Convert(varchar, @totalRows)
              -- return 1 
              SET @TotalPages = @TotalPages + 1
       END
ELSE
       BEGIN
              -- this indicates the query did fill at least 1 page and now we need to see if there is a MOD Rows per Page value
              -- if so, increment the pages + 1
              SET @RowsCalc = @TotalRows % @RowsPerPage
              IF @RowsCalc > 0.0
                     SET @Totalpages = @TotalPages + 1
       END

/*

	Order by

*/




SET @OrderBy = ' 
	ORDER BY '


IF @SortOrder = 1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy  = @OrderBy  + 'Type, LogNumber ASC'
              ELSE IF @SortColumn = 2 
					 SET @OrderBy = @OrderBy + ' LogNumber ASC'
              ELSE IF @SortColumn = 3
                     SET @OrderBy = @OrderBy + ' finalInvcRqstDate ASC'
              ELSE IF @SortColumn = 4
                     SET @OrderBy = @OrderBy + ' ClosedDate ASC'
              ELSE IF @SortColumn = 5
                     SET @OrderBy = @OrderBy + ' HotAddress ASC'
              ELSE IF @SortColumn = 6
                     SET @OrderBy = @OrderBy + ' City ASC'
              ELSE IF @SortColumn = 7
                     SET @OrderBy = @OrderBy + ' ZipCode ASC'
              ELSE IF @SortColumn = 8
                     SET @OrderBy = @OrderBy + ' County ASC'
			  ELSE IF @SortColumn = 9
                     SET @OrderBy = @OrderBy + ' Year ASC'
       END
ELSE IF @SortOrder = -1
       BEGIN
              IF @SortColumn = 1
                     SET @OrderBy  = @OrderBy  + 'Type DESC'
              ELSE IF @SortColumn = 2 
					 SET @OrderBy = @OrderBy + ' LogNumber DESC'
              ELSE IF @SortColumn = 3
                     SET @OrderBy = @OrderBy + ' finalInvcRqstDate DESC'
              ELSE IF @SortColumn = 4
                     SET @OrderBy = @OrderBy + ' ClosedDate DESC'
              ELSE IF @SortColumn = 5
                     SET @OrderBy = @OrderBy + ' HotAddress DESC'
              ELSE IF @SortColumn = 6
                     SET @OrderBy = @OrderBy + ' City DESC'
              ELSE IF @SortColumn = 7
                     SET @OrderBy = @OrderBy + ' ZipCode DESC'
              ELSE IF @SortColumn = 8
                     SET @OrderBy = @OrderBy + ' County DESC'
			  ELSE IF @SortColumn = 9
                     SET @OrderBy = @OrderBy + ' Year DESC'
       END
              



		
DECLARE @SQLQuery varchar(4096)
IF ISNULL(@SearchType, 0) = 3 
	SET @SQLQuery = @HOTCSQLColumns + @HOTCWhere + ' 
UNION 
' + @LUSTSQLColumns + @LUSTWhere +  @OrderBy + @Pagination
ELSE IF ISNULL(@SearchType, 0) = 2
 	SET @SQLQuery = @HOTCSQLColumns + @HOTCWhere +  @OrderBy + @Pagination
ELSE IF ISNULL(@SearchType, 0) = 1
	SET @SQLQuery =  @LUSTSQLColumns + @LUSTWhere +  @OrderBy + @Pagination

--Print @SQLQuery

EXEC ( @SQLQuery )

SELECT  @RESULT = @@ERROR

-- RETURN @RESULT



GO
GRANT EXECUTE ON [dbo].[apGetSearchHOTC_LUSTData] TO [LUSTUSER] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdHotcCleanDecommData]    Script Date: 4/23/2019 4:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[apInsUpdHotcCleanDecommData]
/*
apInsUpdHotcCleanDecomm

B.Dyer July 2005
Insert and Update of Clean - not in LUST - Decommissions of Heating Oil Tanks.

Primary Key HOT_ID is an identity seed field in table HOT_MANAGEMENT.
*/

--	       ,Cast(Convert(varchar,@DecommDate ,101) AS DateTime)    

-- HOTC HOT_MANAGEMENT values:
    @HotId INTEGER
  , @NewHotId INTEGER OUTPUT
  , @CheckNbr VARCHAR(12)
  , @CheckReceivedDate DATETIME
  , @FeeAmount DECIMAL(15, 2)
  , @AuditDate DATETIME
  , @DecommType VARCHAR(8)
  , @ReportRejected VARCHAR(1)
  , @HotServiceProviderId VARCHAR(6)
  , @HotComment VARCHAR(240)

-- HOTC HOT_DECOMMISSION values:
  , @County VARCHAR(2)
  , @Year VARCHAR(4)
  , @DecommDate DATETIME
  , @FileCloseDate DATETIME
  , @HotStreetNbr VARCHAR(10)
  , @HotStreetQuad VARCHAR(2)
  , @HotStreetName VARCHAR(30)
  , @HotStreetType VARCHAR(10)
  , @HotOtherAddress VARCHAR(40)
  , @HotCity VARCHAR(30)
  , @HotZipCode VARCHAR(10)
  , @RpFname VARCHAR(20)
  , @RpLname VARCHAR(30)
  , @RpOrgName VARCHAR(40)
  , @RpStreetNbr VARCHAR(10)
  , @RpStreetQuad VARCHAR(2)
  , @RpStreetName VARCHAR(30)
  , @RpStreetType VARCHAR(10)
  , @RpOtherAddress VARCHAR(40)
  , @RpCity VARCHAR(30)
  , @RpState VARCHAR(2)
  , @RpZipCode VARCHAR(10)  
  , @ErrorMessageHandler VARCHAR(1024) OUTPUT
-- UTILITY VALUES:
  , @Result INTEGER OUTPUT
AS 
    SET XACT_ABORT ON

    BEGIN TRAN HotcCleanDecommission


    SET @Result = 1
    SET @NewHotId = 0

/*
----------------------------------------------------------------------------------
PART #1: INSERT to DATA TO HOTC.dbo.HOT_MANAGEMENT and HOTC.dbo.HOT_DECOMMISSION
----------------------------------------------------------------------------------
*/

    IF @HotId = 0 
        BEGIN
            INSERT  INTO HOTC.dbo.HOT_MANAGEMENT
                    (
                      -- Hot_Id DB Identity Seed value
                -- log_number <-- only for LUST Decommissions.
                      check_nbr
                    , Check_received_date
                    , fee_amt
                    , audit_date
                    , decomm_type
                    , report_rejected
                    , hot_sp_id
                    , hot_comments
                    )
            VALUES  (
                      @CheckNbr
                    , CAST(CONVERT(VARCHAR, @CheckReceivedDate, 101) AS DATETIME)
                    , @FeeAmount
                    , @AuditDate
                    , @DecommType
                    , @ReportRejected
                    , @HotServiceProviderId
                    , @HotComment
                    )  
  
            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT

       -- Get the newly created ID
            SELECT  @HotId = SCOPE_IDENTITY()

            SELECT  @Result = @@ERROR
            IF @Result <> 0 
                GOTO ABORT


            SELECT  @NewHotId = @HotId

            SELECT  @Result = @@ERROR
            IF @Result <> 0 
                GOTO ABORT


            INSERT  INTO HOTC.dbo.HOT_DECOMMISSION
                    (
                      hot_id
                    , dhot_county
                    , dhot_year
                    , decommission_date
                    , file_closed_date
                    , hot_street_nbr
                    , hot_street_quad
                    , hot_street_nm
                    , hot_street_type
                    , hot_addr_cmnt
                    , hot_city
                    , hot_zip
                    , rp_first_nm
                    , rp_last_nm
                    , rp_company_nm
                    , rp_street_nbr
                    , rp_street_quad
                    , rp_street_nm
                    , rp_street_type
                    , rp_addr_cmnt
                    , rp_city
                    , rp_state
                    , rp_zip
                    )
            VALUES  (
                      @HotId
                    , @County
                    , @Year
                    , @DecommDate
                    , @FileCloseDate
                    , @HotStreetNbr
                    , @HotStreetQuad
                    , @HotStreetName
                    , @HotStreetType
                    , @HotOtherAddress
                    , @HotCity
                    , @HotZipCode
                    , @RpFname
                    , @RpLname
                    , @RpOrgName
                    , @RpStreetNbr
                    , @RpStreetQuad
                    , @RpStreetName
                    , @RpStreetType
                    , @RpOtherAddress
                    , @RpCity
                    , @RpState
                    , @RpZipCode               
                    )

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT

        END


    ELSE  -- Existing HOT_ID > 0
    ----------------------------------------------------------------------------------------------
    -- PART #2: UPDATE of  DATA TO HOTC.dbo.HOT_MANAGEMENT and HOTC.dbo.HOT_DECOMMISSION
    ---------------------------------------------------------------------------------------------
        BEGIN                            
            UPDATE  HOTC.dbo.HOT_MANAGEMENT
            SET     -- log_number  <<<  No Log Number for non-LUST decommissions
                    check_nbr = @CheckNbr
                  , Check_received_date = @CheckReceivedDate
                  , fee_amt = @FeeAmount
                  , audit_date = @AuditDate
                  , decomm_type = @DecommType
                  , report_rejected = @ReportRejected
                  , hot_sp_id = @HotServiceProviderId
                  , hot_comments = @HotComment
            WHERE   hot_id = @HotId                

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT 	


            UPDATE  HOTC.dbo.HOT_DECOMMISSION
            SET     dhot_county = @County
                  , dhot_year = @Year
                  , decommission_date = @DecommDate
                  , file_closed_date = @FileCloseDate
                  , hot_street_nbr = @HotStreetNbr
                  , hot_street_quad = @HotStreetQuad
                  , hot_street_nm = @HotStreetName
                  , hot_street_type = @HotStreetType
                  , hot_addr_cmnt = @HotOtherAddress
                  , hot_city = @HotCity
                  , hot_zip = @HotZipCode
                  , rp_first_nm = @RpFname
                  , rp_last_nm = @RpLname
                  , rp_company_nm = @RpOrgName
                  , rp_street_nbr = @RpStreetNbr
                  , rp_street_quad = @RpStreetQuad
                  , rp_street_nm = @RpStreetName
                  , rp_street_type = @RpStreetType
                  , rp_addr_cmnt = @RpOtherAddress
                  , rp_city = @RpCity
                  , rp_state = @RpState
                  , rp_zip = @RpZipCode
            WHERE   hot_id = @HotId              

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT 	




	-- TODO BDYER 28 JUNE 2006 BUG FIX
	
            SELECT  @NewHotId = @HotId
            SELECT  @Result = @@ERROR
            IF @Result <> 0 
                GOTO ABORT 	


        END       


--SUCCESS Completion--------------------------------
    COMMIT TRAN HotcCleanDecommission
    RETURN @Result 


--FAILURE Completion--------------------------------
-- "SET XACT_ABORT ON" Will automatically ROLLBACK if an error is encountered. 
    ABORT:

    RETURN @Result  




GO
GRANT EXECUTE ON [dbo].[apInsUpdHotcCleanDecommData] TO [LUSTUSER] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdHotcLustData]    Script Date: 4/23/2019 4:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
------------------------------------------------------------------------------------------------------------------------
   Name: apInsUpdHotcLust
   Desc: 

   Inputs:       @LogNumber VARCHAR(10)
				  , @HotId INTEGER
				  , @HotIdNew INTEGER OUTPUT
				  , @LustId INTEGER
				  , @LustManagementId INTEGER
				  , @DecommDate DATETIME
				  , @FileCloseDate DATETIME

				-- HOTC HOT_MANAGEMENT values:
				  , @CheckNbr VARCHAR(12)
				  , @CheckReceivedDt DATETIME
				  , @FeeAmount INTEGER
				  , @AuditDt DATETIME
				  , @DecommType VARCHAR(8)
				  , @ReportRejected VARCHAR(1)
				  , @HotServiceProviderId VARCHAR(6)
				  , @HotComment VARCHAR(240)

				-- UTILITY VALUES:
				  , @Result INTEGER OUTPUT
   Outputs:   

   Called by:   HOTC

   Auth: B.DYER

   Date: Wednesday, November 26, 2003
------------------------------------------------------------------------------------------------------------------------
		Change History
------------------------------------------------------------------------------------------------------------------------
   Date:	           Author:                     Description:
   ------------------   ------------------------------  -------------------------------------------
   1-12-2010 L.Shaver Changed to SCOPE_IDENTITY() From @@IDENTITY -- New Primary Key  		
------------------------------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[apInsUpdHotcLustData]
    @LogNumber VARCHAR(10)
  , @HotId INTEGER
  , @HotIdNew INTEGER OUTPUT
  , @LustId INTEGER
  , @LustManagementId INTEGER
  , @DecommDate DATETIME
  , @FileCloseDate DATETIME

-- HOTC HOT_MANAGEMENT values:
  , @CheckNbr VARCHAR(12)
  , @CheckReceivedDt DATETIME
  , @FeeAmount DECIMAL(15, 2)
  , @AuditDt DATETIME
  , @DecommType VARCHAR(8)
  , @ReportRejected VARCHAR(1)
  , @HotServiceProviderId VARCHAR(6)
  , @HotComment VARCHAR(240)
  , @LastChangeBy VARCHAR(64)
  , @ErrorMessageHandler VARCHAR(1024) OUTPUT
-- UTILITY VALUES:
  , @Result INTEGER OUTPUT
AS 
    SET XACT_ABORT ON

    BEGIN TRAN HotcUpdate

    SET @Result = 1
    SET @HotIdNew = 0

/*
-------------------------------------------
PART #1: DATA TO LUST.dbo.MANAGEMENT
-------------------------------------------
*/

    IF @LustManagementId = 0 
        BEGIN
 
            INSERT  INTO LUST.dbo.MANAGEMENT
                    (
                      -- ManagementId DB Identity Seed value
                      LustId
                    , ReleaseStopDate
                    , FinalInvcRqstDate  --> Both LUST Management FinalInvcRqstDt and ClosedDt
                    , ClosedDate         --> are set to the same HOTC-provided @FileCloseDate value.
                    , LastChangeBy
                    , LastChangeDate
                    )
            VALUES  (
                      @LustId
                    , CAST(CONVERT(VARCHAR, @DecommDate, 101) AS DATETIME)
                    , CAST(CONVERT(VARCHAR, @FileCloseDate, 101) AS DATETIME)
                    , CAST(CONVERT(VARCHAR, @FileCloseDate, 101) AS DATETIME)
                    , @LastChangeBy
                    , CAST(CONVERT(VARCHAR, GETDATE(), 101) AS DATETIME)     
	              )    
        -- Will XACT_ABORT handle this automatically?       
            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT

        END       

-->     -------------------------------------------------------------
    ELSE    --> else existing @LustManagementId value > 0. Update routine.
-->     -------------------------------------------------------------
        BEGIN                            
            UPDATE  LUST.dbo.MANAGEMENT
            SET     ReleaseStopDate = CAST(CONVERT(VARCHAR, @DecommDate, 101) AS DATETIME)
                  , FinalInvcRqstDate = CAST(CONVERT(VARCHAR, @FileCloseDate, 101) AS DATETIME)
                  , ClosedDate = CAST(CONVERT(VARCHAR, @FileCloseDate, 101) AS DATETIME)
                  , LastChangeBy = @LastChangeBy
                  , LastChangeDate = CAST(CONVERT(VARCHAR, GETDATE(), 101) AS DATETIME)
            WHERE   ManagementId = @LustManagementId

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT
        END

/*
-------------------------------------------
PART #2: DATA TO HOTC.dbo.HOT_MANAGEMENT
-------------------------------------------
*/


    IF ISNULL(@HotId, 0) = 0 
        BEGIN            
            INSERT  INTO HOTC.dbo.HOT_MANAGEMENT
                    (
                      log_number
                    , check_nbr
                    , Check_received_date
                    , fee_amt
                    , audit_date
                    , decomm_type
                    , report_rejected
                    , hot_sp_id
                    , hot_comments
                    )
            VALUES  (
                      @LogNumber
                    , RTRIM(@CheckNbr)
                    , @CheckReceivedDt
                    , @FeeAmount
                    , @AuditDt
                    , @DecommType
                    , @ReportRejected
                    , @HotServiceProviderId
                    , @HotComment
	              )           

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT

            SELECT  @HotIdNew = SCOPE_IDENTITY() --) @@IDENTITY -- New Primary Key  

            SELECT  @Result = @@ERROR
            IF @Result <> 0 
                GOTO ABORT
        END        

-->      --------------------------------------------------------
    ELSE    --> existing HotId > 0, run update routine.
-->      --------------------------------------------------------
        BEGIN                            
            UPDATE  dbo.HOT_MANAGEMENT
            SET     --log_number = @LogNumber WILL NOT EVER CHANGE ON UPDATE!
                    check_nbr = @CheckNbr
                  , Check_received_date = @CheckReceivedDt
                  , fee_amt = @FeeAmount
                  , audit_date = @AuditDt
                  , decomm_type = @DecommType
                  , report_rejected = @ReportRejected
                  , hot_sp_id = @HotServiceProviderId
                  , hot_comments = @HotComment
            WHERE   hot_id = @HotId                -->> Primary Key << 

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT 	

        END


--SUCCESS Completion--------------------------------
    COMMIT TRAN HotcUpdate
    RETURN @Result -- 0

--FAILURE Completion--------------------------------
    ABORT:

    RETURN @Result

GO
GRANT EXECUTE ON [dbo].[apInsUpdHotcLustData] TO [LUSTUSER] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apInsUpdHotcManagementData]    Script Date: 6/3/2019 10:04:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
------------------------------------------------------------------------------------------------------------------------
   Name: apInsUpdHotcManagementdata
   Desc: 

   Inputs:       @HotIdIn              int
			   ,@HotIdOut             int OUTPUT
			   ,@LogNumber            varchar(10)
			   ,@CheckNbr             varchar(12)
			   ,@CheckReceivedDt      datetime
			   ,@FeeAmount            float 
			   ,@AuditDt              datetime
			   ,@DecommType           varchar(8) 
			   ,@ReportRejected       varchar(1)
			   ,@HotServiceProviderId varchar(6)
			   ,@HotComment           varchar(240)
			   ,@Result               int OUTPUT
		       
   Outputs:   

   Called by:   HOTC

   Auth: B.DYER

   Date: Wednesday, November 26, 2003
------------------------------------------------------------------------------------------------------------------------
		Change History
------------------------------------------------------------------------------------------------------------------------
   Date:	           Author:                     Description:
   ------------------   ------------------------------  -------------------------------------------
   6-03-2019			aguedea							Added parameter @LastChangeBy.  Added column values for LastChangeBy and LastChangeDate
------------------------------------------------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[apInsUpdHotcManagementData]
    @HotIdIn INT
  , @HotIdOut INT OUTPUT
  , @LogNumber VARCHAR(10)
  , @CheckNbr VARCHAR(12)
  , @CheckReceivedDt DATETIME
  , @FeeAmount FLOAT
  , @AuditDt DATETIME
  , @DecommType VARCHAR(8)
  , @ReportRejected VARCHAR(1)
  , @HotServiceProviderId VARCHAR(6)
  , @HotComment VARCHAR(240)
  , @ErrorMessageHandler VARCHAR(1024) OUTPUT
  , @Result INT OUTPUT
AS 
    SET @Result = 1

    IF @HotIdIn = 0 
        BEGIN            
            INSERT  INTO HOTC.dbo.HOT_MANAGEMENT
                    (
                      log_number
                    , check_nbr
                    , Check_received_date
                    , fee_amt
                    , audit_date
                    , decomm_type
                    , report_rejected
                    , hot_sp_id
                    , hot_comments
                    )
            VALUES  (
                      @LogNumber
                    , @CheckNbr
                    , @CheckReceivedDt
                    , @FeeAmount
                    , @AuditDt
                    , @DecommType
                    , @ReportRejected
                    , @HotServiceProviderId
                    , @HotComment
	              )           

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT

            SELECT  @HotIdOut = SCOPE_IDENTITY() --) @@IDENTITY -- New Primary Key  

            SELECT  @Result = @@ERROR
            IF @Result <> 0 
                GOTO ABORT
        END        


    ELSE

------------------------ UPDATE ROUTINE --------------------------
        BEGIN                            
            UPDATE  dbo.HOT_MANAGEMENT
            SET     --log_number = @LogNumber WILL NOT EVER CHANGE ON UPDATE!
                    check_nbr = @CheckNbr
                  , Check_received_date = @CheckReceivedDt
                  , fee_amt = @FeeAmount
                  , audit_date = @AuditDt
                  , decomm_type = @DecommType
                  , report_rejected = @ReportRejected
                  , hot_sp_id = @HotServiceProviderId
                  , hot_comments = @HotComment
            WHERE   hot_id = @HotIdIn                -->> Primary Key << 

            SELECT  @Result = @@ERROR
			SET @ErrorMessageHandler = Error_Message()
            IF @Result <> 0 
                GOTO ABORT 	

            SELECT  @HotIdOut = @HotIdIn

            SELECT  @Result = @@ERROR
            IF @Result <> 0 
                GOTO ABORT 	
        END

--SUCCESS Completion--------------------------------
    RETURN @Result -- 0


--FAILURE Completion--------------------------------
    ABORT:
    RETURN @Result  






GO
GRANT EXECUTE ON  [dbo].[apInsUpdHotcManagementData] TO [LUSTUSER]
GO

/****** Object:  StoredProcedure [dbo].[apValidateLogNumberAndManagementData]    Script Date: 4/23/2019 4:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

	SELECT  management.lustId, ManagementId, ReleaseStopDate, FinalInvcRqstDate  , Hot_Management.log_number, incident.logNumber, 
			Hot_Management.hot_id, Hot_Management.check_nbr, Hot_Management.check_received_date, Hot_Management.fee_amt, 
			Hot_Management.decomm_type, Hot_Management.report_rejected, Hot_Management.hot_sp_id, Hot_Management.hot_comments,
			contact.AffilID, contact.Organization AS ORGANIZATION, 
            RTRIM(contact.FirstName) AS FNAME, RTRIM(contact.LastName) AS LNAME,
            RTRIM(contact.Street) AS STREET, RTRIM(contact.City) AS CITY, RTRIM(contact.State) AS STATE, RTRIM(contact.ZIP) AS ZIP

			FROM    LUST.dbo.incident 
					LEFT JOIN LUST.dbo.Management WITH ( NOLOCK ) ON incident.lustId = Management.lustId
					LEFT JOIN HOTC.dbo.Hot_Management ON Hot_management.log_number = incident.logNumber
					JOIN LUST.dbo.vwLUSTParty contact WITH ( NOLOCK ) ON contact.LustId = incident.LustId AND contact.AffilTypeCd = 'CON'

		WHERE  incident.lustid = 13639

	--WHERE incident.logNumber =  '36-98-4082'

select * FROM lust.dbo.management
select * FROM HOTC.dbo.Hot_Management WHERE log_number = '26-05-0346' 
select * FROM lust.dbo.incident where lustid = 13639




declare @ErrorMessageHandler VARCHAR(1024), @Result INT
Exec [apValidateLogNumberAndManagementData] 21814, @Result Output
SELECT @ErrorMessageHandler, @Result

*/

CREATE PROCEDURE [dbo].[apValidateLogNumberAndManagementData]
    @LustId INT
  , @RESULT INT OUTPUT
AS 
	DECLARE @Incident_LustId INT, @ManagementId INT, @ReleaseStopDate Date, @FinalInvcRqstDate Date, @ManagementLustId INT, @HotManagementLogNumber VARCHAR(10), 
	 @SiteAddress VARCHAR(40), @SiteName VARCHAR(40), @SiteCity VARCHAR(20), @SiteZip VARCHAR(5), @Hot_Management_hot_id INT, @Hot_Management_check_nbr VARCHAR(12), 
	 @Hot_Management_check_received_date DATETIME, @Hot_Management_fee_amt DECIMAL(15, 2), @Hot_Management_audit_date DATETIME, @Hot_Management_decomm_type CHAR(8), 
	 @Hot_Management_report_rejected CHAR(1), @Hot_Management_hot_sp_id CHAR(6), @Hot_Management_hot_comments VARCHAR(1000),
	 @Contact_AffilId INT, @Contact_FirstName VARCHAR(40), @Contact_LastName VARCHAR(40), @Contact_Organization VARCHAR(40), 
	 @Contact_Street VARCHAR(40), @Contact_City VARCHAR(25), @Contact_State VARCHAR(2), @Contact_Zip VARCHAR(10), @Status VARCHAR(128), @Incident_LogNumber VARCHAR(10)
	 ,@ServiceOwnerFullName VARCHAR(135),@ServiceOwnerLicenseStatus VARCHAR(7), @ManagementLastChangeBy VARCHAR(64), @ManagementLastChangeDate DATE

	 


	
    SET @RESULT = 1
	BEGIN

		

		SELECT  @Incident_LustId = incident.lustId, @ManagementLustId = management.lustId, @ManagementId = Management.ManagementId, @ReleaseStopDate = Management.ReleaseStopDate, 
				@FinalInvcRqstDate = Management.FinalInvcRqstDate, @HotManagementLogNumber = Hot_Management.log_number,
				@SiteAddress = incident.SiteAddress, @SiteName = Incident.SiteName, @SiteCity = Incident.SiteCity, @SiteZip = Incident.SiteZip,
				@Hot_Management_hot_id  = Hot_Management.hot_id, @Hot_Management_check_nbr = Hot_Management.check_nbr, 
				@Hot_Management_check_received_date = Hot_Management.check_received_date, @Hot_Management_fee_amt = Hot_Management.fee_amt,
				@Hot_Management_audit_date = Hot_Management.audit_date, 
				@Hot_Management_decomm_type = Hot_Management.decomm_type, @Hot_Management_report_rejected = Hot_Management.report_rejected, 
				@Hot_Management_hot_sp_id = Hot_Management.hot_sp_id, @Hot_Management_hot_comments = Hot_Management.hot_comments,
				@Contact_AffilID = contact.AffilID, @Contact_Organization = contact.Organization, 
				@Contact_FirstName = RTRIM(contact.FirstName), @Contact_LastName = RTRIM(contact.LastName),
				@Contact_Street = RTRIM(contact.Street) , @Contact_City = RTRIM(contact.City) , @Contact_State = RTRIM(contact.State), @Contact_Zip = RTRIM(contact.ZIP)
				, @Incident_LogNumber = incident.LogNumber
				, @ServiceOwnerFullName = ISNULL(a.FullName, '')
				-- ,@ServiceOwnerLicenseStatus = ISNULL(b.LicenseStatus, 'Expired') 
				, @ServiceOwnerLicenseStatus = CASE WHEN a.FullName IS NULL THEN '' ELSE  ISNULL(b.LicenseStatus, 'Expired') END
				, @ManagementLastChangeBy = management.lastchangeby, @ManagementLastChangeDate = management.lastchangedate


		FROM    LUST.dbo.incident 
				LEFT JOIN LUST.dbo.Management WITH ( NOLOCK ) ON incident.lustId = Management.lustId
				LEFT JOIN HOTC.dbo.Hot_Management ON Log_Number = incident.logNumber
				LEFT JOIN LUST.dbo.vwLUSTParty contact WITH ( NOLOCK ) ON contact.LustId = incident.LustId AND contact.AffilTypeCd = 'CON'
				LEFT JOIN licensing.dbo.vUST_LicenseInfo b WITH ( NOLOCK ) ON b.LicenseNbr = Hot_Management.hot_sp_id
				LEFT JOIN licensing.dbo.vUST_PersonInfo a WITH ( NOLOCK ) ON a.PersonID = b.PersonID
		WHERE   incident.lustId = @LustId
		IF ISNULL(@ManagementLustId, 0) = 0
			BEGIN
				SET @Status = 'Management Data does not exist'
			END
		ELSE
			BEGIN
				IF (@ReleaseStopDate IS NULL AND @FinalInvcRqstDate IS NULL)
					SET @Status = 'Management Data Still Open'
				ELSE
					IF ISNULL(@HotManagementLogNumber, '') = '' 
						SET @Status = 'Management Data Exists'
					ELSE
						SET @Status = 'You Have Entered a HOT Log Number Which Was Previously Closed In LUST.'
			END
		IF @Contact_AffilID IS NULL
			BEGIN
				IF DATALENGTH(@Status) > 2
					SET @Status = @Status + CHAR(9) + 'Contact information does not exist for this LUST Incident'
			END
	END	


	IF (@Incident_LustId IS NOT NULL)
		SELECT @Incident_LustId AS Lust_Incident_LustId, @ManagementLustId AS Lust_Management_LustId,  @ManagementId AS Lust_Management_MangementId, @ReleaseStopDate AS LUST_Management_ReleaseStopDate , 
		@FinalInvcRqstDate AS LUST_Management_FinalInvcRqstDate, @HotManagementLogNumber AS HOTC_HotManagement_LogNumber, 
		@SiteAddress AS LUST_Incident_SiteAddress, @SiteName AS LUST_Incident_SiteName, @SiteCity AS LUST_Incident_SiteCity, @SiteZip AS LUST_Incident_SiteZip, 

		@Hot_Management_hot_id AS HOTC_HOTManagement_hotId, @Hot_Management_check_nbr AS HOTC_HOTMangement_check_nbr, 
		@Hot_Management_check_received_date AS HOTC_HotManagement_check_received_date, @Hot_Management_fee_amt AS HOTC_HotManagement_fee_amt, 
		@Hot_Management_audit_date AS HOTC_HotManagement_audit_date,
		@Hot_Management_decomm_type AS HOTC_HotManagement_decomm_type, @Hot_Management_report_rejected AS HOTC_HotManagement_report_rejected, 
		@Hot_Management_hot_sp_id AS HOTC_HotManagement_hot_sp_id, @Hot_Management_hot_comments AS HOTC_HotManagement_hot_comments, 

		@Contact_AffilID AS Contact_AffilID, @Contact_Organization AS Contact_Organization, 
		@Contact_FirstName AS Contact_FirstName , @Contact_LastName AS Contact_LastName,
		@Contact_Street AS Contact_Street, @Contact_City AS Contact_City, @Contact_State AS Contact_State, @Contact_Zip AS Contact_Zip,
		@Status AS Status
		,@Incident_LogNumber as Lust_Incident_LogNumber
		,@ServiceOwnerFullName  as ServiceOwnerFullName
		,@ServiceOwnerLicenseStatus  as ServiceOwnerLicenseStatus
		,@ManagementLastChangeBy AS Lust_Management_LastChangeBy
		,@ManagementLastChangeDate AS Lust_Management_LastChangeDate



    SET @RESULT = @@ERROR

    RETURN @RESULT

	
GO
GRANT EXECUTE ON [dbo].[apValidateLogNumberAndManagementData] TO [LUSTUSER] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[apValidateLUSTLogNumberData]    Script Date: 4/23/2019 4:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

EXEC [apValidateLUSTLogNumberData] '03-18-0157'


*/

CREATE PROCEDURE [dbo].[apValidateLUSTLogNumberData]
    @LogNumber VARCHAR(10)
  , @RESULT INT OUTPUT
AS 
    SET @RESULT = 1

    BEGIN
        SELECT  @RESULT = 0
        WHERE   EXISTS ( SELECT LOGNUMBER
                         FROM   LUST.dbo.INCIDENT WITH ( NOLOCK )
                         WHERE  LOGNUMBER = @LogNumber )

    END
GO
GRANT EXECUTE ON [dbo].[apValidateLUSTLogNumberData] TO [LUSTUSER] AS [dbo]
GO

