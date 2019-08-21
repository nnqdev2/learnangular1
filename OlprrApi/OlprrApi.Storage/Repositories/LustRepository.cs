using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using OlprrApi.Storage.Entities;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System;
using OlprrApi.Common.Exceptions;
using Newtonsoft.Json;


namespace OlprrApi.Storage.Repositories
{
    public class LustRepository : ILustRepository
    {
        private LustDbContext _dbContext;
        private ILogger<LustRepository> _logger;
        public LustRepository(ILogger<LustRepository> logger, LustDbContext dbContext)
        {
            _dbContext = dbContext;
            _logger = logger;
        }
        public async Task<IEnumerable<ApGetSiteAliasByLustId2>> ApGetSiteAliasByLustId(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            if (lustIdParam.Value == null)
                lustIdParam.Value = DBNull.Value;
            var exeSp = "execute dbo.ApGetSiteAliasByLustIdData  @LustId ";
            var results = await _dbContext.Set<ApGetSiteAliasByLustId2>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            var resultList = new List<ApGetSiteAliasByLustId2>();
            foreach (var result in results)
            {
                resultList.Add(new ApGetSiteAliasByLustId2
                {
                    LustId = lustId,
                    SiteNameAlias = result.SiteNameAlias,
                    LastChangeBy = result.LastChangeBy,
                    LastChangeDate = result.LastChangeDate,
                    SiteNameAliasId = result.SiteNameAliasId,
                    LogNumber = result.LogNumber
                });
            }
            return resultList;
        }

        public async Task<ApGetSiteAliasByLustId2> ApGetSiteAliasBySiteNameAliasIdData(int siteNameAliasId)
        {
            var siteNameAliasIdParam = new SqlParameter("@SiteNameAliasId", siteNameAliasId);
            if (siteNameAliasIdParam.Value == null)
                siteNameAliasIdParam.Value = DBNull.Value;
            var exeSp = "execute dbo.ApGetSiteAliasBySiteNameAliasIdData  @SiteNameAliasId ";
            var results = await _dbContext.Set<ApGetSiteAliasByLustId2>().AsNoTracking().FromSql(exeSp, siteNameAliasIdParam).ToListAsync();
            return results[0];
        }

        public async Task<ApGenericResult> ApInsUpdSiteAlias(ApInsUpdSiteAlias apInsUpdSiteAlias)
        {
            var lustIdParam = new SqlParameter("@LustId", apInsUpdSiteAlias.LustId);
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdSiteAlias.LastChangeBy);
            var siteNameAliasParam = new SqlParameter("@SiteNameAlias", apInsUpdSiteAlias.SiteNameAlias);
            var siteNameAliasIdInParam = new SqlParameter("@SiteNameAliasIdIn", apInsUpdSiteAlias.SiteNameAliasIdIn);
            var siteNameAliasIdOutParam = new SqlParameter { ParameterName = "@SiteNameAliasIdOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apInsUpdSiteAliasData @SiteNameAliasIdIn, @SiteNameAliasIdOut OUTPUT, @LustId, @SiteNameAlias, @LastChangeBy, @ErrorMessageHandler OUTPUT";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, siteNameAliasIdInParam, siteNameAliasIdOutParam, lustIdParam, siteNameAliasParam, lastChangeByParam, errorMsgOutParam);

            // return (Int32)(siteNameAliasIdOutParam.Value);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(apInsUpdSiteAlias);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = apInsUpdSiteAlias.LustId,
                Id = (siteNameAliasIdOutParam.Value == DBNull.Value) ? 0 : (Int32)siteNameAliasIdOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task ApDltSiteNameAlias(int siteNameAliasId)
        {
            var siteNameAliasIdParam = new SqlParameter("@SiteNameAliasId", siteNameAliasId);
            var bitParam = new SqlParameter { ParameterName = "@Bit", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltSiteNameAlias @SiteNameAliasId, @Bit OUTPUT ";
            await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, siteNameAliasIdParam, bitParam);
        }
        public async Task<IEnumerable<ContactsStats>> ApGetPartyByFirstLastOrgName(string fname, string lname, string org, int sortColumn, int sortOrder, int pageNumber, int rowsPerPage)
        {
            var fNameParam = new SqlParameter("@FirstName", fname);
            var lNameParam = new SqlParameter("@LastName", lname);
            var orgParam = new SqlParameter("@PartyOrg", org);
            var sortColParam = new SqlParameter("@SortCol", sortColumn);
            var sortOrderParam = new SqlParameter("@SortOrder", sortOrder);
            var pageNumberParam = new SqlParameter("@PageNumber", pageNumber);
            var rowsPerPageParam = new SqlParameter("@RowsPerPage", rowsPerPage);
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.SmallInt, Direction = ParameterDirection.Output };
            var totalRowsOutParam = new SqlParameter { ParameterName = "@TotalRows", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var totalPagesOutParam = new SqlParameter { ParameterName = "@TotalPages", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            if (String.IsNullOrEmpty((string) fNameParam.Value)) fNameParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) lNameParam.Value)) lNameParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) orgParam.Value)) orgParam.Value = DBNull.Value;
            var exeSp = "execute dbo.apGetPartyByFirstLastOrgNameData  @FirstName, @LastName, @PartyOrg, @SortCol, @SortOrder, @PageNumber, @RowsPerPage, @TotalRows OUTPUT, @TotalPages OUTPUT ";
            var result = await _dbContext.Set<Contact>().AsNoTracking().FromSql(exeSp, fNameParam, lNameParam, orgParam, sortColParam, sortOrderParam, pageNumberParam, rowsPerPageParam, totalRowsOutParam, totalPagesOutParam).ToListAsync();
            //var result = await _dbContext.Set<Contact>().AsNoTracking().FromSql(exeSp, fNameParam, lNameParam, orgParam, sortColParam, sortOrderParam, pageNumberParam, rowsPerPageParam, resultOutParam, totalRowsOutParam, totalPagesOutParam).ToListAsync();
            //var resultCode = (Int16)(resultOutParam.Value);
            //if (resultCode != 0)
            //{
            //    var errorMsg = $"{exeSp} returned status code = {resultCode} for Contact Search filters: FirstName {fname}  LastName {lname} Org {org}.";
            //    _logger.LogError(errorMsg);
            //    throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            //}
            var contactsStats = new List<ContactsStats>();
            foreach (var res in result)
            {
                contactsStats.Add(
                    new ContactsStats()
                    {
                        ReqFirstName = fname,
                        ReqLastName = lname,
                        ReqOrganization = org,
                        ReqPageNumber = pageNumber,
                        ReqRowsPerPage = rowsPerPage,
                        ReqSortColumn = sortColumn,
                        ReqSortOrder = sortOrder,
                        TotalPages = (Int32)(totalPagesOutParam.Value),
                        TotalRows = (Int32)(totalRowsOutParam.Value),
                        PartyId = res.PartyId,
                        Organization = res.Organization,
                        FirstName = res.FirstName,
                        LastName = res.LastName,
                        PersonName = res.PersonName,
                        Phone = res.Phone,
                        Street = res.Street,
                        City = res.City,
                        State = res.State,
                        Zipcode = res.Zipcode,
                        Address = res.Address,
                        Country = res.Country,
                        Email = res.Email,
                        SubOrganization = res.SubOrganization
                    }
                );
            }
            return contactsStats;
        }

        public async Task<ApGetCountyIdAndNameFromZP4Fips> ApGetCountyIdAndNameFromZP4Fips(int usPostalCountyCodeFips)
        {
            var usPostalCountyCodeFipsCodeParam = (new SqlParameter("@ZP4FIPSCounty", usPostalCountyCodeFips));
            var countyCodeParam = new SqlParameter { ParameterName = "@IncidentCounty", SqlDbType = SqlDbType.SmallInt, Direction = ParameterDirection.Output };
            var countyNameParam = new SqlParameter { ParameterName = "@CountyName", SqlDbType = SqlDbType.VarChar, Size = 10, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apGetCountyIdAndNameFromZP4Fips  @ZP4FIPSCounty, @IncidentCounty OUTPUT, @CountyName OUTPUT";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, usPostalCountyCodeFipsCodeParam, countyCodeParam, countyNameParam);

            int countyCode;
            if (countyCodeParam.Value == DBNull.Value)
                countyCode = 0;
            else
                countyCode = (Int16)countyCodeParam.Value;
            return new ApGetCountyIdAndNameFromZP4Fips()
            {
                UsPostalCountyCodeFips = usPostalCountyCodeFips,
                CountyCode = countyCode,
                CountyName = (countyNameParam.Value == DBNull.Value) ? null : (string)countyNameParam.Value
            };
        }

        public async Task<IEnumerable<LustIncident>> ApGetIncidentByIdData (int lustId)
        {
            var lustIdParam = (new SqlParameter("@LustId", lustId));
            //var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.SmallInt, Direction = ParameterDirection.Output };
            //var exeSp = "execute dbo.apGetIncidentByIdData  @lustId, @RESULT OUTPUT ";
            //var result = await _dbContext.Set<LustIncident>().AsNoTracking().FromSql(exeSp, lustIdParam, resultOutParam).ToListAsync();
            var exeSp = "execute dbo.apGetIncidentByIdData  @lustId ";
            var result = await _dbContext.Set<LustIncident>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();

            //var resultCode = (Int16)(resultOutParam.Value);
            //if (resultCode != 0)
            //{
            //    var errorMsg = $"{exeSp} returned status code = {resultCode} for LustId {lustId}.";
            //    _logger.LogError(errorMsg);
            //    throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            //}
            if (result.Count == 0)
            {
                throw new ResourceNotFoundException($"Resource requested - LustId {lustId} not found.");
            }
            return result; 
        }


        public async Task<IEnumerable<ProjectManagerIncident>> ApGetCurrentProjMgr(int lustId)
        {
            var lustIdParam = (new SqlParameter("@LustId", lustId));
            var exeSp = "execute dbo.apGetCurrentProjMgr  @lustId ";
            return await _dbContext.Set<ProjectManagerIncident>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
        }

        public async Task<ApInsUpdIncidentDataResult> ApInsUpdIncidentData(ApInsUpdIncidentData apInsUpdIncidentData)
        {
            var lustIdInParam = new SqlParameter("@LustIdIN", apInsUpdIncidentData.LustIdIn);
            var facilityIdParam = new SqlParameter("@FacilityId", apInsUpdIncidentData.FacilityId);
            var countyIdParam = new SqlParameter("@CountyId", apInsUpdIncidentData.CountyId);
            var receivedDateParam = new SqlParameter("@ReceivedDate", apInsUpdIncidentData.DateReceived);
            var siteNameParam = new SqlParameter("@SiteName", apInsUpdIncidentData.SiteName);
            var siteAddressParam = new SqlParameter("@SiteAddress", apInsUpdIncidentData.SiteAddress);
            var siteCityParam = new SqlParameter("@SiteCity", apInsUpdIncidentData.SiteCity);
            var siteZipParam = new SqlParameter("@SiteZip", apInsUpdIncidentData.SiteZipcode);
            var sitePhoneParam = new SqlParameter("@SitePhone", apInsUpdIncidentData.SitePhone);
            var noValidAddressParam = new SqlParameter("@NoValidAddress", apInsUpdIncidentData.NoValidAddress);
            var siteTypeIdParam = new SqlParameter("@SiteTypeId", apInsUpdIncidentData.SiteTypeId);
            var fileStatusIdParam = new SqlParameter("@FileStatusId", apInsUpdIncidentData.FileStatusId);
            var regTankIndParam = new SqlParameter("@RegTankInd", apInsUpdIncidentData.RegTankInd);
            var hotIndParam = new SqlParameter("@HotInd", apInsUpdIncidentData.HotInd);
            var nonRegTankIndParam = new SqlParameter("@NonRegTankInd", apInsUpdIncidentData.NonRegTankInd);
            var brownfieldCodeIdParam = new SqlParameter("@BrownfieldCodeId", apInsUpdIncidentData.BrownfieldCodeId);
            var propertyTranPendingIndParam = new SqlParameter("@PropertyTranPendingInd", apInsUpdIncidentData.PropertyTranPendingInd);
            var programTransferIndParam = new SqlParameter("@ProgramTransferInd", apInsUpdIncidentData.ProgramTransferInd);
            var hotAuditRejectIndParam = new SqlParameter("@HotAuditRejectInd", apInsUpdIncidentData.HotAuditRejectInd);
            var activeReleaseIndParam = new SqlParameter("@ActiveReleaseInd", apInsUpdIncidentData.ActiveReleaseInd);
            var optionLetterSentIndParam = new SqlParameter("@OptionLetterSentInd", apInsUpdIncidentData.OptionLetterSentInd);
            var siteCommentParam = new SqlParameter("@SiteComment", apInsUpdIncidentData.SiteComment);
            var seeAlsoCommentParam = new SqlParameter("@SeeAlsoComment", apInsUpdIncidentData.SeeAlsoComment);
            var publicSummaryCommentParam = new SqlParameter("@PublicSummaryComment", apInsUpdIncidentData.PublicSummaryComment);
            var geoLocIdParam = new SqlParameter("@GeolocId", apInsUpdIncidentData.GeoLocId);
            var olprrIdParam = new SqlParameter("@OlprrId", apInsUpdIncidentData.OlprrId);
            var discoverDateParam = new SqlParameter("@DiscoverDate", apInsUpdIncidentData.DiscoveryDate);
            var managementIdInParam = new SqlParameter("@ManagementIdIn", apInsUpdIncidentData.ManagementIdIn);
            var cleanupStartDtParam = new SqlParameter("@CleanupStartDt", apInsUpdIncidentData.CleanupStartDt);
            var releaseStopDtParam = new SqlParameter("@ReleaseStopDt", apInsUpdIncidentData.ReleaseStopDt);
            var closedDtParam = new SqlParameter("@ClosedDt", apInsUpdIncidentData.ClosedDt);
            var finalInvcRqstDtParam = new SqlParameter("@FinalInvcRqstDt", apInsUpdIncidentData.FinalInvcRqstDt);
            var letterOfAgreementDtParam = new SqlParameter("@LetterOfAgreementDt", apInsUpdIncidentData.LetterOfAgreementDt);
            var letterOfAgreementCommentParam = new SqlParameter("@LetterOfAgreementComment", apInsUpdIncidentData.LetterOfAgreementComment);
            var lastChangebyParam = new SqlParameter("@LastChangeby", apInsUpdIncidentData.LastChangeBy);


            var logNumberOutParam = new SqlParameter{ ParameterName = "@LogNumberOUT", SqlDbType = SqlDbType.VarChar, Size = 10, Direction = ParameterDirection.Output };
            var lustIdOutParam = new SqlParameter { ParameterName = "@LustIdOUT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var errorMessageHandlerParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultSpParam = new SqlParameter { ParameterName = "@ResultSP", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };

            if (seeAlsoCommentParam.Value == null) seeAlsoCommentParam.Value = DBNull.Value;
            if (siteCommentParam.Value == null) siteCommentParam.Value = DBNull.Value;
            if (publicSummaryCommentParam.Value == null) publicSummaryCommentParam.Value = DBNull.Value;
            if (olprrIdParam.Value == null) olprrIdParam.Value = DBNull.Value;
            if (facilityIdParam.Value == null) facilityIdParam.Value = DBNull.Value;
            if (publicSummaryCommentParam.Value == null) publicSummaryCommentParam.Value = DBNull.Value;
            if (geoLocIdParam.Value == null) geoLocIdParam.Value = DBNull.Value;
            if (brownfieldCodeIdParam.Value == null) brownfieldCodeIdParam.Value = DBNull.Value;
            if (fileStatusIdParam.Value == null) fileStatusIdParam.Value = DBNull.Value;
            if (siteTypeIdParam.Value == null) siteTypeIdParam.Value = DBNull.Value;
            if (cleanupStartDtParam.Value == null) cleanupStartDtParam.Value = DBNull.Value;
            if (releaseStopDtParam.Value == null) releaseStopDtParam.Value = DBNull.Value;
            if (finalInvcRqstDtParam.Value == null) finalInvcRqstDtParam.Value = DBNull.Value;
            if (closedDtParam.Value == null) closedDtParam.Value = DBNull.Value;
            if (letterOfAgreementDtParam.Value == null) letterOfAgreementDtParam.Value = DBNull.Value;
            if (letterOfAgreementCommentParam.Value == null) letterOfAgreementCommentParam.Value = DBNull.Value;
            if (discoverDateParam.Value == null) discoverDateParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apUpdIncidentData " +
            "  @LustIdIN, @FacilityId, @CountyId,@ReceivedDate,@SiteName,@SiteAddress,@SiteCity,@SiteZip,@SitePhone,@NoValidAddress" +
            "  ,@SiteTypeId,@FileStatusId,@RegTankInd,@HotInd,@NonRegTankInd,@BrownfieldCodeId,@PropertyTranPendingInd,@ProgramTransferInd,@HotAuditRejectInd " +
            "  ,@ActiveReleaseInd,@OptionLetterSentInd,@SiteComment,@SeeAlsoComment,@PublicSummaryComment,@GeolocId,@OlprrId,@DiscoverDate" +
            "  ,@ManagementIdIn,@CleanupStartDt,@ReleaseStopDt,@FinalInvcRqstDt,@ClosedDt,@LetterOfAgreementDt,@LetterOfAgreementComment,@LastChangeby" +
            "  ,@LogNumberOUT OUTPUT ,@LustIdOUT  OUTPUT ,@ErrorMessageHandler OUTPUT ,@ResultSP OUT";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, lustIdInParam, facilityIdParam, countyIdParam
                , receivedDateParam, siteNameParam, siteAddressParam, siteCityParam, siteZipParam, sitePhoneParam, noValidAddressParam
                , siteTypeIdParam, fileStatusIdParam, regTankIndParam, hotIndParam, nonRegTankIndParam
                , brownfieldCodeIdParam, propertyTranPendingIndParam, programTransferIndParam, hotAuditRejectIndParam, activeReleaseIndParam
                , optionLetterSentIndParam, siteCommentParam, seeAlsoCommentParam, publicSummaryCommentParam, geoLocIdParam, olprrIdParam, discoverDateParam
                , managementIdInParam, cleanupStartDtParam, releaseStopDtParam, finalInvcRqstDtParam, closedDtParam, letterOfAgreementDtParam, letterOfAgreementCommentParam, lastChangebyParam
                , logNumberOutParam, lustIdOutParam, errorMessageHandlerParam, resultSpParam);

            if ((errorMessageHandlerParam.Value != DBNull.Value) && (((string)errorMessageHandlerParam.Value).Length > 0))
            {
                var errorMsg = $"{exeSp} returned @ErrorMessage = {errorMessageHandlerParam.Value} Result = {result} for lustId {apInsUpdIncidentData.LustIdIn} site name {apInsUpdIncidentData.SiteName}";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApInsUpdIncidentDataResult
            {
                LustIdIn = apInsUpdIncidentData.LustIdIn,
                ErrorMessageHandler = (errorMessageHandlerParam.Value == DBNull.Value) ? null : (string)errorMessageHandlerParam.Value,
                LogNumberOut = (logNumberOutParam.Value == DBNull.Value) ? null : (string)logNumberOutParam.Value,
                LustIdOut = (lustIdOutParam.Value == DBNull.Value) ? 0 : (Int32)lustIdOutParam.Value,
                OlprrId = (olprrIdParam.Value == DBNull.Value) ? 0 : (Int32)olprrIdParam.Value,
                ResultSp = (resultSpParam.Value == DBNull.Value) ? 0 : (Int32)resultSpParam.Value,
            };
        }

        public async Task<ApGetLogNumber> ApGetLogNumber(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            if (lustIdParam.Value == null)
                lustIdParam.Value = DBNull.Value;
            var exeSp = "execute dbo.ApGetLogNumber  @LustId ";
            var results = await _dbContext.Set<ApGetLogNumber>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            } else
            {
                throw new ResourceNotFoundException($"Resource requested - LustId {lustId} not found.");
            }
        }

        public async Task<ApGetAffilById> ApGetAffilById(int affilId)
        {
            var affilIdParam = new SqlParameter("@AffilId", affilId);
            if (affilIdParam.Value == null)
                affilIdParam.Value = DBNull.Value;
            var exeSp = "execute dbo.apGetAffilByIdData  @AffilId ";
            var results = await _dbContext.Set<ApGetAffilById>().AsNoTracking().FromSql(exeSp, affilIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - AffilId {affilId} not found.");
            }
        }

        public async Task<ApInsUpdLustAffilPartyDataResult> ApInsUpdLustAffilPartyData(ApInsUpdLustAffilPartyData apInsUpdLustAffilPartyData)
        {
            var lustIdInParam = new SqlParameter("@LUSTID", apInsUpdLustAffilPartyData.LustId);
            var affilTypeParam = new SqlParameter("@AffilType", apInsUpdLustAffilPartyData.AffilType);
            var startDtParam = new SqlParameter("@StartDate", apInsUpdLustAffilPartyData.StartDt);
            var endDtParam = new SqlParameter("@EndDate", apInsUpdLustAffilPartyData.EndDt);
            var organizationParam = new SqlParameter("@Organization", apInsUpdLustAffilPartyData.Organization);
            var subOrgParam = new SqlParameter("@SubOrg", apInsUpdLustAffilPartyData.SubOrg);
            var jobTitleParam = new SqlParameter("@JobTitle", apInsUpdLustAffilPartyData.Jobtitle);
            var firstNameParam = new SqlParameter("@FirstName", apInsUpdLustAffilPartyData.FirstName);
            var lastNameParam = new SqlParameter("@LastName", apInsUpdLustAffilPartyData.LastName);
            var phoneParam = new SqlParameter("@Phone", apInsUpdLustAffilPartyData.Phone);
            var emailParam = new SqlParameter("@Email", apInsUpdLustAffilPartyData.Email);
            var streetParam = new SqlParameter("@Street", apInsUpdLustAffilPartyData.Street);
            var cityParam = new SqlParameter("@City", apInsUpdLustAffilPartyData.City);
            var zipParam = new SqlParameter("@ZIP", apInsUpdLustAffilPartyData.Zip);
            var stateParam = new SqlParameter("@State", apInsUpdLustAffilPartyData.State);
            var countryParam = new SqlParameter("@Country", apInsUpdLustAffilPartyData.Country);
            var affilCommentsParam = new SqlParameter("@AffilComments", apInsUpdLustAffilPartyData.AffilComments);
            var lastChangedByParam = new SqlParameter("@LastChangedBy", apInsUpdLustAffilPartyData.LastChangedBy);
            var affilIdParam = new SqlParameter("@AffilId", apInsUpdLustAffilPartyData.AffilId);

            var partyIdOutParam = new SqlParameter { ParameterName = "@PartyID", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var affilIdOutParam = new SqlParameter { ParameterName = "@AffiliationID", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 100, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@Result", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };

            if (subOrgParam.Value == null) subOrgParam.Value = DBNull.Value;
            if (affilCommentsParam.Value == null) affilCommentsParam.Value = DBNull.Value;
            if (affilTypeParam.Value == null) affilTypeParam.Value = DBNull.Value;
            if (startDtParam.Value == null) startDtParam.Value = DBNull.Value;
            if (endDtParam.Value == null) endDtParam.Value = DBNull.Value;
            if (organizationParam.Value == null) organizationParam.Value = DBNull.Value;
            if (jobTitleParam.Value == null) jobTitleParam.Value = DBNull.Value;
            if (firstNameParam.Value == null) firstNameParam.Value = DBNull.Value;
            if (lastNameParam.Value == null) lastNameParam.Value = DBNull.Value;
            if (phoneParam.Value == null) phoneParam.Value = DBNull.Value;
            if (emailParam.Value == null) emailParam.Value = DBNull.Value;
            if (streetParam.Value == null) streetParam.Value = DBNull.Value;
            if (cityParam.Value == null) cityParam.Value = DBNull.Value;
            if (zipParam.Value == null) zipParam.Value = DBNull.Value;
            if (stateParam.Value == null) stateParam.Value = DBNull.Value;
            if (countryParam.Value == null) countryParam.Value = DBNull.Value;
            if (affilCommentsParam.Value == null) affilCommentsParam.Value = DBNull.Value;
            if (affilIdParam.Value == null) affilIdParam.Value = DBNull.Value;
            if (lastChangedByParam.Value == null) lastChangedByParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdLUSTAffilPartyData " +
            "  @LUSTID, @AffilType,@StartDate,@EndDate,@Organization,@SubOrg,@JobTitle,@FirstName,@LastName,@Phone" +
            "  ,@Email,@Street,@City,@ZIP,@State,@Country,@AffilComments,@AffilID, @LastChangedBy " +
            "  ,@PartyID OUTPUT ,@AffiliationID  OUTPUT ,@ErrorMessageHandler OUTPUT ,@Result OUT";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, lustIdInParam, affilTypeParam, startDtParam
                , endDtParam, organizationParam, subOrgParam, jobTitleParam, firstNameParam, lastNameParam, phoneParam, emailParam
                , streetParam, cityParam, zipParam, stateParam, countryParam, affilCommentsParam, affilIdParam
                , lastChangedByParam, partyIdOutParam, affilIdOutParam, errorMsgOutParam, resultOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var errorMsg = $"{exeSp} returned @ErrorMessage = {errorMsgOutParam.Value} Result = {result} for lustId {apInsUpdLustAffilPartyData.LustId} organization {apInsUpdLustAffilPartyData.Organization} name {apInsUpdLustAffilPartyData.FirstName} {apInsUpdLustAffilPartyData.LastName} ";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApInsUpdLustAffilPartyDataResult
            {
                LustId = apInsUpdLustAffilPartyData.LustId,
                AffilIdIn = apInsUpdLustAffilPartyData.AffilId,
                ErrMsg  = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value,
                PartyId = (partyIdOutParam.Value == DBNull.Value) ? 0 : (Int32)partyIdOutParam.Value,
                AffilId = (affilIdOutParam.Value == DBNull.Value) ? 0 : (Int32)affilIdOutParam.Value,
                Result  = (resultOutParam.Value == DBNull.Value) ? 0 : (Int32)resultOutParam.Value
            };
        }

        public async Task<IEnumerable<ApGetAffilById>> ApGetPartyGridByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetPartyGridByLustIdData  @LustId ";
            var results = await _dbContext.Set<ApGetAffilById>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task ApDltIncidentByLustId(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var resultOutParam = new SqlParameter { ParameterName = "@Result", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltIncidentByLustId  @LustId, @Result OUT";
            await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, lustIdParam, resultOutParam);
        }

        public async Task<ApGenericResult> ApDltLustContactByAffilId(int affilId, string ntId)
        {
            var affilIdParam = new SqlParameter("@AffilID", affilId);
            var lastChangeByParam = new SqlParameter("@LastChangeBy", ntId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@Result", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.ApDltLustContactByAffilIdData @AffilID, @LastChangeBy, @ErrorMessageHandler OUT, @Result OUT";
            await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, affilIdParam, lastChangeByParam, errorMsgOutParam, resultOutParam);
            return new ApGenericResult
            {
                LustId = affilId,
                Id = affilId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value,
            };
        }

        public async Task<ApGetAssessmentSiteScoreValuesByLustId> ApGetAssessmentSiteScoreValuesByLustId(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.ApGetAssessmentSiteScoreValuesByLustId  @LustId";
            var results = await _dbContext.Set<ApGetAssessmentSiteScoreValuesByLustId>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - Assessment not found for lustid  {lustId} not found.");
            }
        }

        public async Task<ApGetAssessmentSiteScoreValuesRangesByLustId> ApGetAssessmentSiteScoreValuesRangesByLustId(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            //var exeSp = "execute dbo.ApGetAssessmentSiteScoreValuesRangesByLustId  @LustId";
            var exeSp = "execute dbo.ApGetAssessmentAllByLustId  @LustId";
            var results = await _dbContext.Set<ApGetAssessmentSiteScoreValuesRangesByLustId>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - ApGetAssessmentSiteScoreValuesRangesByLustId not found for lustid  {lustId} not found.");
            }
        }

        public async Task<ApInsUpdAssessmentResult> ApInsUpdAssessmentData(ApInsUpdAssessmentData apInsUpdAssessmentData)
        {
            var assessmentIdInParam = new SqlParameter("@AssessmentIdIN", apInsUpdAssessmentData.AssessmentId);
            var assessmentIdOutParam = new SqlParameter { ParameterName = "@AssessmentIdOUT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustId", apInsUpdAssessmentData.LustId);
            var discoverDateParam = new SqlParameter("@DiscoverDate", apInsUpdAssessmentData.DiscoverDate);
            var confirmationIdParam = new SqlParameter("@ConfirmationId", apInsUpdAssessmentData.ConfirmationId);
            var discoveryIdParam = new SqlParameter("@DiscoveryId", apInsUpdAssessmentData.DiscoveryId);
            var releaseCauseIdParam = new SqlParameter("@ReleaseCauseId", apInsUpdAssessmentData.ReleaseCauseId);
            var releaseSourceIdParam = new SqlParameter("@ReleaseSourceId", apInsUpdAssessmentData.ReleaseSourceId);
            var slMediaIndParam = new SqlParameter("@SLMediaInd", apInsUpdAssessmentData.SLMediaInd);
            var gwMediaIndParam = new SqlParameter("@GWMediaInd", apInsUpdAssessmentData.GWMediaInd);
            var swMediaIndParam = new SqlParameter("@SWMediaInd", apInsUpdAssessmentData.SWMediaInd);
            var dwMediaIndParam = new SqlParameter("@DWMediaInd", apInsUpdAssessmentData.DWMediaInd);
            var fvMediaIndParam = new SqlParameter("@FVMediaInd", apInsUpdAssessmentData.FVMediaInd);
            var fpMediaIndParam = new SqlParameter("@FPMediaInd", apInsUpdAssessmentData.FPMediaInd);
            var unMediaIndParam = new SqlParameter("@UNMediaInd", apInsUpdAssessmentData.UNMediaInd);
            var ugContamIndParam = new SqlParameter("@UGContamInd", apInsUpdAssessmentData.UGContamInd);
            var lgContamIndParam = new SqlParameter("@LGContamInd", apInsUpdAssessmentData.LGContamInd);
            var mgContamIndParam = new SqlParameter("@MGContamInd", apInsUpdAssessmentData.MGContamInd);
            var dsContamIndParam = new SqlParameter("@DSContamInd", apInsUpdAssessmentData.DSContamInd);
            var woContamIndParam = new SqlParameter("@WOContamInd", apInsUpdAssessmentData.WOContamInd);
            var lbContamIndParam = new SqlParameter("@LBContamInd", apInsUpdAssessmentData.LBContamInd);
            var svContamIndParam = new SqlParameter("@SVContamInd", apInsUpdAssessmentData.SVContamInd);
            var opContamIndParam = new SqlParameter("@OPContamInd", apInsUpdAssessmentData.OPContamInd);
            var chContamIndParam = new SqlParameter("@CHContamInd", apInsUpdAssessmentData.CHContamInd);
            var unContamIndParam = new SqlParameter("@UNContamInd", apInsUpdAssessmentData.UNContamInd);
            var mtbeContamIndParam = new SqlParameter("@MTBEContamInd", apInsUpdAssessmentData.MTBEContamInd);
            var hoContamIndParam = new SqlParameter("@HOContamInd", apInsUpdAssessmentData.HOContamInd);
            var cleanupNecessaryIndParam = new SqlParameter("@CleanupNecessaryInd", apInsUpdAssessmentData.CleanupNecessaryInd);
            var offSiteMigrationIndParam = new SqlParameter("@OffSiteMigrationInd", apInsUpdAssessmentData.OffSiteMigrationInd);

            var fpRemovedIndParam = new SqlParameter("@FPRemovedInd", apInsUpdAssessmentData.FPRemovedInd);
            var vpRemovedIndParam = new SqlParameter("@VPRemovedInd", apInsUpdAssessmentData.VPRemovedInd);
            var delineateSlParam = new SqlParameter("@DelineateSL", apInsUpdAssessmentData.DelineateSL);
            var delineateGwParam = new SqlParameter("@DelineateGW", apInsUpdAssessmentData.DelineateGW);

            var slDelineatedParam = new SqlParameter("@SLDelineated", apInsUpdAssessmentData.SLDelineated);
            var gwDelineatedParam = new SqlParameter("@GWDelineated", apInsUpdAssessmentData.GWDelineated);

            var gwCompMonitoringParam = new SqlParameter("@GWCompMonitoring", apInsUpdAssessmentData.GWCompMonitoring);
            var capRequestedParam = new SqlParameter("@CAPRequested", apInsUpdAssessmentData.CAPRequested);
            var capSubmittedParam = new SqlParameter("@CAPSubmitted", apInsUpdAssessmentData.CAPSubmitted);
            var capApprovedParam = new SqlParameter("@CAPApproved", apInsUpdAssessmentData.CAPApproved);

            var currentSiteScoreParam = new SqlParameter("@CurrentSiteScore", apInsUpdAssessmentData.CurrentSiteScore);
            var amntRelCmntParam = new SqlParameter("@AmntRelCmnt", apInsUpdAssessmentData.AmntReleaseComment);
            var contamCmntParam = new SqlParameter("@ContamCmnt", apInsUpdAssessmentData.ContamComment);
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdAssessmentData.LastChangeBy);
            var errorMessageHandlerOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (amntRelCmntParam.Value == null) amntRelCmntParam.Value = DBNull.Value;
            if (contamCmntParam.Value == null) contamCmntParam.Value = DBNull.Value;
            if (discoverDateParam.Value == null) discoverDateParam.Value = DBNull.Value;
            if (lastChangeByParam.Value == null) lastChangeByParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdAssessmentData " +
                    "@AssessmentIdIN	,@AssessmentIdOUT OUTPUT,@LustId ,@DiscoverDate  	,@ConfirmationId	,@DiscoveryId " +
                    ",@ReleaseCauseId	,@ReleaseSourceId  ,@SLMediaInd	,@GWMediaInd	,@SWMediaInd	,@DWMediaInd	,@FVMediaInd " +
                    ",@FPMediaInd	,@UNMediaInd	,@UGContamInd	,@LGContamInd	,@MGContamInd	,@DSContamInd	,@WOContamInd " +
                    ",@LBContamInd	,@SVContamInd	,@OPContamInd	,@CHContamInd	,@UNContamInd	,@MTBEContamInd	,@HOContamInd " + 
                    ",@CleanupNecessaryInd	,@OffSiteMigrationInd	,@FPRemovedInd	,@VPRemovedInd	,@DelineateSL	,@DelineateGW " + 
                    ",@SLDelineated	,@GWDelineated	,@GWCompMonitoring	,@CAPRequested	,@CAPSubmitted	,@CAPApproved " +
                    ",@CurrentSiteScore	,@AmntRelCmnt ,@ContamCmnt ,@LastChangeBy , @ErrorMessageHandler";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, assessmentIdInParam, assessmentIdOutParam, lustIdParam
                , discoverDateParam, confirmationIdParam, discoveryIdParam, releaseCauseIdParam, releaseSourceIdParam, slMediaIndParam
                , gwMediaIndParam, swMediaIndParam, dwMediaIndParam, fvMediaIndParam, fpMediaIndParam, unMediaIndParam, ugContamIndParam
                , lgContamIndParam, mgContamIndParam, dsContamIndParam, woContamIndParam, lbContamIndParam, svContamIndParam, opContamIndParam
                , chContamIndParam, unContamIndParam, mtbeContamIndParam, hoContamIndParam, cleanupNecessaryIndParam, offSiteMigrationIndParam
                , fpRemovedIndParam, vpRemovedIndParam, delineateSlParam, delineateGwParam, slDelineatedParam, gwDelineatedParam,  gwCompMonitoringParam, capRequestedParam
                , capSubmittedParam, capApprovedParam, currentSiteScoreParam, amntRelCmntParam, contamCmntParam, lastChangeByParam
                , errorMessageHandlerOutParam);

            if ((errorMessageHandlerOutParam.Value != DBNull.Value) && (((string)errorMessageHandlerOutParam.Value).Length > 0))
            {
                var errorMsg = $"{exeSp} returned @ErrorMessage = {errorMessageHandlerOutParam.Value} Result = {result} for lustId {apInsUpdAssessmentData.LustId} assementId {apInsUpdAssessmentData.AssessmentId} ";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApInsUpdAssessmentResult
            {
                LustId = apInsUpdAssessmentData.LustId,
                AssessmentIdIn = apInsUpdAssessmentData.AssessmentId,
                AssessmentIdOut = (assessmentIdOutParam.Value == DBNull.Value) ? 0 : (Int32)assessmentIdOutParam.Value,
                ErrorMessageHandler = (errorMessageHandlerOutParam.Value == DBNull.Value) ? null : (string)errorMessageHandlerOutParam.Value,
            };
        }



        public async Task<ApInsUpdAssessmentSiteScoreRangeResult> ApInsUpdAssessmentSiteScoreRangeData(ApInsUpdAssessmentSiteScoreRangeData apInsUpdAssessmentSiteScoreRangeData)
        {
            var assessmentIdInParam = new SqlParameter("@AssessmentIdIN", apInsUpdAssessmentSiteScoreRangeData.AssessmentId);
            var assessmentIdOutParam = new SqlParameter { ParameterName = "@AssessmentIdOUT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustId", apInsUpdAssessmentSiteScoreRangeData.LustId);
            var discoverDateParam = new SqlParameter("@DiscoverDate", apInsUpdAssessmentSiteScoreRangeData.DiscoverDate);
            var confirmationIdParam = new SqlParameter("@ConfirmationId", apInsUpdAssessmentSiteScoreRangeData.ConfirmationId);
            var discoveryIdParam = new SqlParameter("@DiscoveryId", apInsUpdAssessmentSiteScoreRangeData.DiscoveryId);
            var releaseCauseIdParam = new SqlParameter("@ReleaseCauseId", apInsUpdAssessmentSiteScoreRangeData.ReleaseCauseId);
            var releaseSourceIdParam = new SqlParameter("@ReleaseSourceId", apInsUpdAssessmentSiteScoreRangeData.ReleaseSourceId);
            var slMediaIndParam = new SqlParameter("@SLMediaInd", apInsUpdAssessmentSiteScoreRangeData.SLMediaInd);
            var gwMediaIndParam = new SqlParameter("@GWMediaInd", apInsUpdAssessmentSiteScoreRangeData.GWMediaInd);
            var swMediaIndParam = new SqlParameter("@SWMediaInd", apInsUpdAssessmentSiteScoreRangeData.SWMediaInd);
            var dwMediaIndParam = new SqlParameter("@DWMediaInd", apInsUpdAssessmentSiteScoreRangeData.DWMediaInd);
            var fvMediaIndParam = new SqlParameter("@FVMediaInd", apInsUpdAssessmentSiteScoreRangeData.FVMediaInd);
            var fpMediaIndParam = new SqlParameter("@FPMediaInd", apInsUpdAssessmentSiteScoreRangeData.FPMediaInd);
            var unMediaIndParam = new SqlParameter("@UNMediaInd", apInsUpdAssessmentSiteScoreRangeData.UNMediaInd);
            var ugContamIndParam = new SqlParameter("@UGContamInd", apInsUpdAssessmentSiteScoreRangeData.UGContamInd);
            var lgContamIndParam = new SqlParameter("@LGContamInd", apInsUpdAssessmentSiteScoreRangeData.LGContamInd);
            var mgContamIndParam = new SqlParameter("@MGContamInd", apInsUpdAssessmentSiteScoreRangeData.MGContamInd);
            var dsContamIndParam = new SqlParameter("@DSContamInd", apInsUpdAssessmentSiteScoreRangeData.DSContamInd);
            var woContamIndParam = new SqlParameter("@WOContamInd", apInsUpdAssessmentSiteScoreRangeData.WOContamInd);
            var lbContamIndParam = new SqlParameter("@LBContamInd", apInsUpdAssessmentSiteScoreRangeData.LBContamInd);
            var svContamIndParam = new SqlParameter("@SVContamInd", apInsUpdAssessmentSiteScoreRangeData.SVContamInd);
            var opContamIndParam = new SqlParameter("@OPContamInd", apInsUpdAssessmentSiteScoreRangeData.OPContamInd);
            var chContamIndParam = new SqlParameter("@CHContamInd", apInsUpdAssessmentSiteScoreRangeData.CHContamInd);
            var unContamIndParam = new SqlParameter("@UNContamInd", apInsUpdAssessmentSiteScoreRangeData.UNContamInd);
            var mtbeContamIndParam = new SqlParameter("@MTBEContamInd", apInsUpdAssessmentSiteScoreRangeData.MTBEContamInd);
            var hoContamIndParam = new SqlParameter("@HOContamInd", apInsUpdAssessmentSiteScoreRangeData.HOContamInd);
            var cleanupNecessaryIndParam = new SqlParameter("@CleanupNecessaryInd", apInsUpdAssessmentSiteScoreRangeData.CleanupNecessaryInd);
            var offSiteMigrationIndParam = new SqlParameter("@OffSiteMigrationInd", apInsUpdAssessmentSiteScoreRangeData.OffSiteMigrationInd);

            var fpRemovedIndParam = new SqlParameter("@FPRemovedInd", apInsUpdAssessmentSiteScoreRangeData.FPRemovedInd);
            var vpRemovedIndParam = new SqlParameter("@VPRemovedInd", apInsUpdAssessmentSiteScoreRangeData.VPRemovedInd);
            var delineateSlParam = new SqlParameter("@DelineateSL", apInsUpdAssessmentSiteScoreRangeData.DelineateSL);
            var delineateGwParam = new SqlParameter("@DelineateGW", apInsUpdAssessmentSiteScoreRangeData.DelineateGW);

            var slDelineatedParam = new SqlParameter("@SLDelineated", apInsUpdAssessmentSiteScoreRangeData.SLDelineated);
            var gwDelineatedParam = new SqlParameter("@GWDelineated", apInsUpdAssessmentSiteScoreRangeData.GWDelineated);

            var gwCompMonitoringParam = new SqlParameter("@GWCompMonitoring", apInsUpdAssessmentSiteScoreRangeData.GWCompMonitoring);
            var capRequestedParam = new SqlParameter("@CAPRequested", apInsUpdAssessmentSiteScoreRangeData.CAPRequested);
            var capSubmittedParam = new SqlParameter("@CAPSubmitted", apInsUpdAssessmentSiteScoreRangeData.CAPSubmitted);
            var capApprovedParam = new SqlParameter("@CAPApproved", apInsUpdAssessmentSiteScoreRangeData.CAPApproved);

            var currentSiteScoreParam = new SqlParameter("@CurrentSiteScore", apInsUpdAssessmentSiteScoreRangeData.CurrentSiteScore);
            var amntRelCmntParam = new SqlParameter("@AmntRelCmnt", apInsUpdAssessmentSiteScoreRangeData.AmntReleaseComment);
            var contamCmntParam = new SqlParameter("@ContamCmnt", apInsUpdAssessmentSiteScoreRangeData.ContamComment);
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdAssessmentSiteScoreRangeData.LastChangeBy);
            var errorMessageHandlerOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            var siteScoreIdInParam = new SqlParameter("@SiteScoreIdIn", apInsUpdAssessmentSiteScoreRangeData.SiteScoreIdIn);
            var siteScoreIdOutParam = new SqlParameter { ParameterName = "@SiteScoreIdOUT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var dwReplmeasrParam = new SqlParameter("@DwReplmeasr", apInsUpdAssessmentSiteScoreRangeData.DwReplmeasr);
            var dwImpmeasrParam = new SqlParameter("@DwImpmeasr", apInsUpdAssessmentSiteScoreRangeData.DwImpmeasr);
            var dwImpLiklymeasrParam = new SqlParameter("@DwImpLiklymeasr", apInsUpdAssessmentSiteScoreRangeData.DwImpLiklymeasr);
            var vprLvlmeasrParam = new SqlParameter("@VprLvlmeasr", apInsUpdAssessmentSiteScoreRangeData.VprLvlmeasr);
            var popExposdmeasrParam = new SqlParameter("@PopExposdmeasr", apInsUpdAssessmentSiteScoreRangeData.PopExposdmeasr);
            var envTypmeasrParam = new SqlParameter("@EnvTypmeasr", apInsUpdAssessmentSiteScoreRangeData.EnvTypmeasr);
            var envImpLilelymeasrParam = new SqlParameter("@EnvImpLilelymeasr", apInsUpdAssessmentSiteScoreRangeData.EnvImpLilelymeasr);
            var nonDwSupTypmeasrParam = new SqlParameter("@NonDwSupTypmeasr", apInsUpdAssessmentSiteScoreRangeData.NonDwSupTypmeasr);
            var utImpmeasrParam = new SqlParameter("@UtImpmeasr", apInsUpdAssessmentSiteScoreRangeData.UtImpmeasr);
            var rainfallAnnualmeasrParam = new SqlParameter("@RainfallAnnualmeasr", apInsUpdAssessmentSiteScoreRangeData.RainfallAnnualmeasr);
            var soilPermmeasrParam = new SqlParameter("@SoilPermmeasr", apInsUpdAssessmentSiteScoreRangeData.SoilPermmeasr);
            var aqfrDepthmeasrParam = new SqlParameter("@AqfrDepthmeasr", apInsUpdAssessmentSiteScoreRangeData.AqfrDepthmeasr);
            var swDistmeasrParam = new SqlParameter("@SwDistmeasr", apInsUpdAssessmentSiteScoreRangeData.SwDistmeasr);

            var updateSiteScoreOutParam = new SqlParameter { ParameterName = "@UpdateSiteScore", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lowScoreOutParam = new SqlParameter { ParameterName = "@LowScore", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var avgScoreOutParam = new SqlParameter { ParameterName = "@AvgScore", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var highScoreOutParam = new SqlParameter { ParameterName = "@HighScore", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var scoreCountOutParam = new SqlParameter { ParameterName = "@ScoreCount", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var scoreRangeOutParam = new SqlParameter { ParameterName = "@ScoreRange", SqlDbType = SqlDbType.VarChar, Size = 10, Direction = ParameterDirection.Output };

            if (amntRelCmntParam.Value == null) amntRelCmntParam.Value = DBNull.Value;
            if (contamCmntParam.Value == null) contamCmntParam.Value = DBNull.Value;
            if (discoverDateParam.Value == null) discoverDateParam.Value = DBNull.Value;
            if (lastChangeByParam.Value == null) lastChangeByParam.Value = DBNull.Value;
            if (assessmentIdInParam.Value == null) assessmentIdInParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdAssessmentSiteScoreRangeData " +
                    "@AssessmentIdIN	,@AssessmentIdOUT OUTPUT,@LustId ,@DiscoverDate  	,@ConfirmationId	,@DiscoveryId " +
                    ",@ReleaseCauseId	,@ReleaseSourceId  ,@SLMediaInd	,@GWMediaInd	,@SWMediaInd	,@DWMediaInd	,@FVMediaInd " +
                    ",@FPMediaInd	,@UNMediaInd	,@UGContamInd	,@LGContamInd	,@MGContamInd	,@DSContamInd	,@WOContamInd " +
                    ",@LBContamInd	,@SVContamInd	,@OPContamInd	,@CHContamInd	,@UNContamInd	,@MTBEContamInd	,@HOContamInd " +
                    ",@CleanupNecessaryInd	,@OffSiteMigrationInd	,@FPRemovedInd	,@VPRemovedInd	,@DelineateSL	,@DelineateGW " +
                    ",@SLDelineated	,@GWDelineated	,@GWCompMonitoring	,@CAPRequested	,@CAPSubmitted	,@CAPApproved " +
                    ",@CurrentSiteScore	,@AmntRelCmnt ,@ContamCmnt ,@LastChangeBy , @ErrorMessageHandler output" +
                    ",@SiteScoreIdIn,@SiteScoreIdOUT output,@DwReplmeasr,@DwImpmeasr,@DwImpLiklymeasr,@VprLvlmeasr,@PopExposdmeasr,@EnvTypmeasr,@EnvImpLilelymeasr  " +
                    ",@NonDwSupTypmeasr,@UtImpmeasr,@RainfallAnnualmeasr,@SoilPermmeasr,@AqfrDepthmeasr,@SwDistmeasr	 " +
                    ",@UpdateSiteScore output, @LowScore output, @AvgScore output, @HighScore output, @ScoreCount output, @ScoreRange output";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, assessmentIdInParam, assessmentIdOutParam, lustIdParam
                , discoverDateParam, confirmationIdParam, discoveryIdParam, releaseCauseIdParam, releaseSourceIdParam, slMediaIndParam
                , gwMediaIndParam, swMediaIndParam, dwMediaIndParam, fvMediaIndParam, fpMediaIndParam, unMediaIndParam, ugContamIndParam
                , lgContamIndParam, mgContamIndParam, dsContamIndParam, woContamIndParam, lbContamIndParam, svContamIndParam, opContamIndParam
                , chContamIndParam, unContamIndParam, mtbeContamIndParam, hoContamIndParam, cleanupNecessaryIndParam, offSiteMigrationIndParam
                , fpRemovedIndParam, vpRemovedIndParam, delineateSlParam, delineateGwParam, slDelineatedParam, gwDelineatedParam, gwCompMonitoringParam, capRequestedParam
                , capSubmittedParam, capApprovedParam, currentSiteScoreParam, amntRelCmntParam, contamCmntParam, lastChangeByParam
                , errorMessageHandlerOutParam
                , siteScoreIdInParam, siteScoreIdOutParam, dwReplmeasrParam, dwImpmeasrParam, dwImpLiklymeasrParam, vprLvlmeasrParam, popExposdmeasrParam, envTypmeasrParam, envImpLilelymeasrParam
                , nonDwSupTypmeasrParam, utImpmeasrParam, rainfallAnnualmeasrParam, soilPermmeasrParam, aqfrDepthmeasrParam, swDistmeasrParam
                , updateSiteScoreOutParam, lowScoreOutParam, avgScoreOutParam, highScoreOutParam, scoreCountOutParam, scoreRangeOutParam);

            if ((errorMessageHandlerOutParam.Value != DBNull.Value) && (((string)errorMessageHandlerOutParam.Value).Length > 0))
            {
                var errorMsg = $"{exeSp} returned @ErrorMessage = {errorMessageHandlerOutParam.Value} Result = {result} for lustId {apInsUpdAssessmentSiteScoreRangeData.LustId} assementId {apInsUpdAssessmentSiteScoreRangeData.AssessmentId} ";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApInsUpdAssessmentSiteScoreRangeResult
            {
                LustId = apInsUpdAssessmentSiteScoreRangeData.LustId,
                AssessmentIdIn = apInsUpdAssessmentSiteScoreRangeData.AssessmentId,
                AssessmentIdOut = (assessmentIdOutParam.Value == DBNull.Value) ? 0 : (Int32)assessmentIdOutParam.Value,
                SiteScoreIdIn = (siteScoreIdInParam.Value == DBNull.Value) ? 0 : (Int32)siteScoreIdInParam.Value,
                SiteScoreIdOut = (siteScoreIdOutParam.Value == DBNull.Value) ? 0 : (Int32)siteScoreIdOutParam.Value,
                ErrorMessageHandler = (errorMessageHandlerOutParam.Value == DBNull.Value) ? null : (string)errorMessageHandlerOutParam.Value,
                UpdateSiteScore = (updateSiteScoreOutParam.Value == DBNull.Value) ? 0 : (Int32)updateSiteScoreOutParam.Value,
                LowScore = (lowScoreOutParam.Value == DBNull.Value) ? 0 : (Int32)lowScoreOutParam.Value,
                AvgScore = (avgScoreOutParam.Value == DBNull.Value) ? 0 : (Int32)avgScoreOutParam.Value,
                HighScore = (highScoreOutParam.Value == DBNull.Value) ? 0 : (Int32)highScoreOutParam.Value,
                ScoreCount = (scoreCountOutParam.Value == DBNull.Value) ? 0 : (Int32)scoreCountOutParam.Value,
                ScoreRange = (scoreRangeOutParam.Value == DBNull.Value) ? null : (string)scoreRangeOutParam.Value,
            };
        }












        public async Task<ApGetScoringRangeData> ApGetScoringRangeData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.ApGetScoringRangeData  @LustId";
            var results = await _dbContext.Set<ApGetScoringRangeData>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.ApGetScoringRangeData not found for lustid  {lustId} not found.");
            }
        }

        public async Task<ApGetScoringValuesByLustIdData> ApGetScoringValuesByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.ApGetScoringValuesByLustIdData  @LustId";
            var results = await _dbContext.Set<ApGetScoringValuesByLustIdData>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.ApGetScoringValuesByLustIdData not found for lustid  {lustId}.");
            }
        }

        public async Task<ApUpdateSiteScoreResult> ApUpdateSiteScore(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var currentSiteScoreOutParam = new SqlParameter { ParameterName = "@CurrentSiteScore", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apUpdateSiteScoreData @LustId, @CurrentSiteScore OUT, @ErrorMessageHandler OUT";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, lustIdParam, currentSiteScoreOutParam, errorMsgOutParam);
            return new ApUpdateSiteScoreResult
            {
                LustId = lustId,
                CurrentSiteScore = (currentSiteScoreOutParam.Value == DBNull.Value) ? 0 : (Int32)currentSiteScoreOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<IEnumerable<ApGetConsultantsDataStats>> ApGetConsultantsData(ConsultantSearchFilter consultantSearchFilter)
        {
            var companyNameParam = new SqlParameter("@companyName", consultantSearchFilter.CompanyName);
            var addressParam = new SqlParameter("@address", consultantSearchFilter.Address);
            var cityParam = new SqlParameter("@city", consultantSearchFilter.City);
            var zipCodeParam = new SqlParameter("@zipCode", consultantSearchFilter.ZipCode);
            var sortColParam = new SqlParameter("@SortColumn", consultantSearchFilter.SortColumn);
            var sortOrderParam = new SqlParameter("@SortOrder", consultantSearchFilter.SortOrder);
            var pageNumberParam = new SqlParameter("@PageNumber", consultantSearchFilter.PageNumber);
            var rowsPerPageParam = new SqlParameter("@RowsPerPage", consultantSearchFilter.RowsPerPage);
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var totalRowsOutParam = new SqlParameter { ParameterName = "@TotalRows", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var totalPagesOutParam = new SqlParameter { ParameterName = "@TotalPages", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };

            if (companyNameParam.Value == null) companyNameParam.Value = DBNull.Value;
            if (addressParam.Value == null) addressParam.Value = DBNull.Value;
            if (cityParam.Value == null) cityParam.Value = DBNull.Value;
            if (zipCodeParam.Value == null) zipCodeParam.Value = DBNull.Value;
            if (sortColParam.Value == null) sortColParam.Value = DBNull.Value;
            if (sortOrderParam.Value == null) sortOrderParam.Value = DBNull.Value;
            if (pageNumberParam.Value == null) pageNumberParam.Value = DBNull.Value;
            if (rowsPerPageParam.Value == null) rowsPerPageParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apGetConsultantsData  @companyName, @address, @city, @zipCode "
                + " ,@SortColumn, @SortOrder, @PageNumber, @RowsPerPage, @TotalRows OUTPUT, @TotalPages OUTPUT, @RESULT OUTPUT ";

            var result = await _dbContext.Set<Consultant>().AsNoTracking().FromSql(exeSp, companyNameParam, addressParam, cityParam, zipCodeParam, sortColParam, sortOrderParam, pageNumberParam, rowsPerPageParam, totalRowsOutParam, totalPagesOutParam, resultOutParam).ToListAsync();

            var resultCode = (Int32)(resultOutParam.Value);

            if (resultCode != 0)
            {
                var json = JsonConvert.SerializeObject(consultantSearchFilter);
                var errorMsg = $"{exeSp} returned status code = {resultCode}. Post payload {json}.";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }

            var rList = new List<ApGetConsultantsDataStats>();
            foreach (var res in result)
            {
                rList.Add(
                    new ApGetConsultantsDataStats()
                    {
                        ReqCompanyName = consultantSearchFilter.CompanyName,
                        ReqAddress = consultantSearchFilter.Address,
                        ReqCity = consultantSearchFilter.City,
                        ReqZipCode = consultantSearchFilter.ZipCode,
                        ReqPageNumber = consultantSearchFilter.PageNumber,
                        ReqRowsPerPage = consultantSearchFilter.RowsPerPage,
                        ReqSortColumn = consultantSearchFilter.SortColumn,
                        ReqSortOrder = consultantSearchFilter.SortOrder,
                        TotalPages = (Int32)(totalPagesOutParam.Value),
                        TotalRows = (Int32)(totalRowsOutParam.Value),
                        ConsultantId = res.ConsultantId,
                        CompanyName = res.CompanyName,
                        Address = res.Address,
                        City = res.City,
                        State = res.State,
                        ZipCode = res.ZipCode,
                        Phone = res.Phone,
                        Fax = res.Fax,
                        Email = res.Email,
                        LastChangeBy = res.LastChangeBy,
                        LastChangeDate = res.LastChangeDate
                    }
                );
            }
            return rList;
        }

        public async Task<Consultant> ApGetConsultantById(int consultantId)
        {
            var consultantIdParam = new SqlParameter("@consultantId", consultantId);
            var exeSp = "execute dbo.apGetConsultantByIdData  @ConsultantId";
            var results = await _dbContext.Set<Consultant>().AsNoTracking().FromSql(exeSp, consultantIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetConsultantByIdData not found for consultant id  {consultantId} not found.");
            }
        }

        public async Task<ApConsultantResult> ApInsUpdConsultantData(Consultant consultant)
        {
            var consultantIdInParam = new SqlParameter("@ConsultantIDIn", consultant.ConsultantId);
            var companyNameParam = new SqlParameter("@CompanyName", consultant.CompanyName);
            var addressParam = new SqlParameter("@Address", consultant.Address);
            var cityParam = new SqlParameter("@City", consultant.City);
            var stateParam = new SqlParameter("@State", consultant.State);
            var zipParam = new SqlParameter("@Zip", consultant.ZipCode);
            var phoneParam = new SqlParameter("@Phone", consultant.Phone);
            var faxParam = new SqlParameter("@Fax", consultant.Fax);
            var emailParam = new SqlParameter("@Email", consultant.Email);
            var lastChangeByParam = new SqlParameter("@LastChangeBy", consultant.LastChangeBy);

            var consultantIdOutParam = new SqlParameter { ParameterName = "@ConsultantIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@Result", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };

            if (consultantIdInParam.Value == null) consultantIdInParam.Value = DBNull.Value;
            if (companyNameParam.Value == null) companyNameParam.Value = DBNull.Value;
            if (addressParam.Value == null) addressParam.Value = DBNull.Value;
            if (cityParam.Value == null) cityParam.Value = DBNull.Value;
            if (stateParam.Value == null) stateParam.Value = DBNull.Value;
            if (zipParam.Value == null) zipParam.Value = DBNull.Value;
            if (phoneParam.Value == null) phoneParam.Value = DBNull.Value;
            if (faxParam.Value == null) faxParam.Value = DBNull.Value;
            if (emailParam.Value == null) emailParam.Value = DBNull.Value;
            if (lastChangeByParam.Value == null) lastChangeByParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdConsultantData " +
            "  @ConsultantIDIn, @ConsultantIdOut out,@CompanyName,@Address,@City,@State,@Zip,@Phone,@Fax,@Email,@LastChangeBy " +
            "  ,@ErrorMessageHandler out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, consultantIdInParam, consultantIdOutParam, companyNameParam
                , addressParam, cityParam, stateParam, zipParam, phoneParam, faxParam, emailParam, lastChangeByParam
                , errorMsgOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(consultant);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApConsultantResult
            {
                ConsultantIdIn = consultant.ConsultantId,
                ConsultantIdOut = (consultantIdOutParam.Value == DBNull.Value) ? 0 : (Int32)consultantIdOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApConsultantResult> ApDltConsultantData(int consultantId)
        {
            var consultantIdParam = new SqlParameter("@ConsultantId", consultantId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltConsultantData @ConsultantId, @ErrorMessageHandler OUT, @RESULT OUT";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, consultantIdParam,  errorMsgOutParam, resultOutParam);
            return new ApConsultantResult
            {
                ConsultantIdIn = consultantId,
                ConsultantIdOut = consultantId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }
        public async Task<ApGetWorkReportedByLustIdData> ApGetWorkReportedByWrIdData(int wrId)
        {
            //var lustIdParam = new SqlParameter("@LustId", lustId);
            var wrIdParam = new SqlParameter("@WorkReportedId", wrId);
            var exeSp = "execute dbo.apGetWorkReportedByWrIdData   @WorkReportedId";
            var results = await _dbContext.Set<ApGetWorkReportedByLustIdData>().AsNoTracking().FromSql(exeSp,  wrIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetWorkReportedByWrIdData not found for work reported id  {wrId} not found.");
            }
        }
        public async Task<IEnumerable<ApGetWorkReportedByLustIdData>> ApGetWorkReportedByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            //var wrIdParam = new SqlParameter("@WorkReportedId", wrId);
            var exeSp = "execute dbo.apGetWorkReportedByLustIdData  @LustId ";
            var results = await _dbContext.Set<ApGetWorkReportedByLustIdData>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task<ApGenericResult> ApInsUpdWorkReportedData(ApInsUpdWorkReportedData apInsUpdWorkReportedData)
        {
            var workReportedIdInParam = new SqlParameter("@WorkReportedIdIn", apInsUpdWorkReportedData.WorkReportedId);
            var lustIdParam = new SqlParameter("@LustId", apInsUpdWorkReportedData.LustId);
            var workReportedTypeIdParam = new SqlParameter("@WorkReportedTypeId", apInsUpdWorkReportedData.WorkReportedTypeId);
            var workReportedDateParam = new SqlParameter("@WorkReportedDate", apInsUpdWorkReportedData.WorkReportedDate);
            var commentParam = new SqlParameter("@Comment", apInsUpdWorkReportedData.Comment);
            var oraReidParam = new SqlParameter("@OraREID", apInsUpdWorkReportedData.OraReid);
            var oraConsultantIdParam = new SqlParameter("@OraConsultantId", apInsUpdWorkReportedData.OraConsultantId);
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdWorkReportedData.LastChangeBy);

            var workReportedIdOutParam = new SqlParameter { ParameterName = "@WorkReportedIdOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
 
            if (commentParam.Value == null) commentParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdWorkReportedData " +
            "  @WorkReportedIdIn, @WorkReportedIdOut out,@LustId,@WorkReportedTypeId,@WorkReportedDate,@Comment,@OraREID,@OraConsultantId,@LastChangeBy " +
            "  ,@ErrorMessageHandler out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, workReportedIdInParam, workReportedIdOutParam, lustIdParam
                , workReportedTypeIdParam, workReportedDateParam, commentParam, oraReidParam, oraConsultantIdParam, lastChangeByParam
                , errorMsgOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(apInsUpdWorkReportedData);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = apInsUpdWorkReportedData.LustId,
                Id = (workReportedIdOutParam.Value == DBNull.Value) ? 0 : (Int32)workReportedIdOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApGenericResult> ApDltWorkReportedData(int wrId)
        {
            var wrIdParam = new SqlParameter("@WorkReportedId", wrId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltWorkReportedData @WorkReportedId, @ErrorMessageHandler OUT, @RESULT OUT";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, wrIdParam, errorMsgOutParam, resultOutParam);
            return new ApGenericResult
            {
                LustId = 0,
                Id = wrId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApGetImageByIdData> ApGetImageByIdData(int pictureId)
        {
            var pictureIdParam = new SqlParameter("@PictureID", pictureId);
            var exeSp = "execute dbo.apGetImageByIdData  @PictureID";
            var results = await _dbContext.Set<ApGetImageByIdData>().AsNoTracking().FromSql(exeSp, pictureIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetImageByIdData not found for pictureId  {pictureId} not found.");
            }
        }

        public async Task<IEnumerable<ApGetImageByLustIdData>> ApGetImageByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetImageByLustIdData  @LustId ";
            var results = await _dbContext.Set<ApGetImageByLustIdData>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task<ApImageResult> ApDltPictureData(int pictureId)
        {
            var pictureIdParam = new SqlParameter("@PictureId", pictureId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltPictureData @PictureId, @ErrorMessageHandler OUT, @RESULT OUT";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, pictureIdParam, errorMsgOutParam, resultOutParam);
            return new ApImageResult
            {
                LustId = 0,
                PictureId = pictureId,
                SitePictureId = 0,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApImageResult> ApInsUpdPictureData(ApInsUpdPictureData apInsUpdPictureData)
        {
            var sitePictureIdInParam = new SqlParameter("@SitePictureIDIn", apInsUpdPictureData.SitePictureId);
            var sitePictureIdOutParam = new SqlParameter { ParameterName = "@SitePictureIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustId", apInsUpdPictureData.LustId);
            var pictureIdInParam = new SqlParameter("@PictureIDIn", apInsUpdPictureData.PictureId);
            var pictureIdOutParam = new SqlParameter { ParameterName = "@PictureIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };

            var captionParam = new SqlParameter("@Caption", apInsUpdPictureData.Caption);
            var pictureDateParam = new SqlParameter("@PictureDt", apInsUpdPictureData.PictureDate);
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdPictureData.LastChangeBy);
            var pictureParam = new SqlParameter("@Image", apInsUpdPictureData.Picture);;
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (captionParam.Value == null) captionParam.Value = DBNull.Value;
            if (pictureParam.Value == null) pictureParam.Value = DBNull.Value;
            if (pictureDateParam.Value == null) pictureDateParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdPictureData " +
            "  @SitePictureIDIn, @SitePictureIDOut out,@LustId,@PictureIDIn,@PictureIDOut,@Caption,@PictureDt " +
            "  ,@ErrorMessageHandler out, @Image, @LastChangeBy";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, sitePictureIdInParam, sitePictureIdOutParam, lustIdParam
                , pictureIdInParam, pictureIdOutParam, captionParam, pictureDateParam, errorMsgOutParam, pictureParam
                , lastChangeByParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(apInsUpdPictureData);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApImageResult
            {
                LustId = apInsUpdPictureData.LustId,
                PictureId = (pictureIdOutParam.Value == DBNull.Value) ? 0 : (Int32)pictureIdOutParam.Value,
                SitePictureId = (sitePictureIdOutParam.Value == DBNull.Value) ? 0 : (Int32)sitePictureIdOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ProjectManagerHistory> ApGetProjMgrHistoryByPmhIdData(int pmhId)
        {
            var idParam = new SqlParameter("@ProjMgrHistId", pmhId);
            var exeSp = "execute dbo.apGetProjMgrHistoryByPMHIDData  @ProjMgrHistId";
            var results = await _dbContext.Set<ProjectManagerHistory>().AsNoTracking().FromSql(exeSp, idParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetProjMgrHistoryByPMHIDData not found for ProjMgrHistId  {pmhId}.");
            }
        }

        public async Task<IEnumerable<ProjectManagerHistory>> ApGetProjMgrHistoryByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetProjMgrHistoryByLustIdData  @LustId ";
            var results = await _dbContext.Set<ProjectManagerHistory>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task<ApGenericResult> ApInsUpdProjMgrHistoryData(ApInsUpdProjMgrHistoryData apInsUpdProjMgrHistoryData)
        {
            var projMgrHistIdInParam = new SqlParameter("@ProjMgrHistIdIn", apInsUpdProjMgrHistoryData.ProjMgrHistId);
            var projMgrHistIdOutParam = new SqlParameter { ParameterName = "@ProjMgrHistIdOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustId", apInsUpdProjMgrHistoryData.LustId);
            var pmLoginParam = new SqlParameter("@PMLogin", apInsUpdProjMgrHistoryData.PmLogin);
            var assignedDateParam = new SqlParameter("@AssignedDt", apInsUpdProjMgrHistoryData.AssignedDate);
            var endDateParam = new SqlParameter("@EndDt", apInsUpdProjMgrHistoryData.EndDate);
            var resultOutParam = new SqlParameter { ParameterName = "@ResultOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdProjMgrHistoryData.LastChangeBy);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (endDateParam.Value == null) endDateParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdProjMgrHistoryData " +
            "  @ProjMgrHistIdIn, @ProjMgrHistIdOut out,@LustId,@PMLogin,@AssignedDt,@EndDt " +
            "  , @LastChangeBy, @ErrorMessageHandler out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, projMgrHistIdInParam, projMgrHistIdOutParam, lustIdParam
                , pmLoginParam, assignedDateParam, endDateParam, lastChangeByParam, errorMsgOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(apInsUpdProjMgrHistoryData);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = apInsUpdProjMgrHistoryData.LustId,
                Id = (projMgrHistIdOutParam.Value == DBNull.Value) ? (Int32)projMgrHistIdInParam.Value : (Int32)projMgrHistIdOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApGenericResult> ApDltProjMgrHistoryData(int pmhId)
        {
            var projMgrHistIdParam = new SqlParameter("@ProjMgrHistId", pmhId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltProjMgrHistoryData @ProjMgrHistId, @RESULT OUT, @ErrorMessageHandler OUT";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, projMgrHistIdParam, resultOutParam, errorMsgOutParam);
            return new ApGenericResult
            {
                LustId = 0,
                Id = pmhId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<PublicNotice> ApGetPublicNoticeByPnIdData(int pnId)
        {
            var idParam = new SqlParameter("@PublicNoticeId", pnId);
            var exeSp = "execute dbo.apGetPublicNoticeByPNIDData  @PublicNoticeId";
            var results = await _dbContext.Set<PublicNotice>().AsNoTracking().FromSql(exeSp, idParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetPublicNoticeByPNIDData not found for PublicNoticeId  {pnId}.");
            }
        }

        public async Task<IEnumerable<PublicNotice>> ApGetPublicNoticeByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetPublicNoticeByLustIdData  @LustId ";
            var results = await _dbContext.Set<PublicNotice>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task<ApGenericResult> ApInsUpdPublicNoticeData(ApInsUpdPublicNoticeData apInsUpdPublicNoticeData)
        {
            var idInParam = new SqlParameter("@PublicNoticeIDIn", apInsUpdPublicNoticeData.PublicNoticeId);
            var idOutParam = new SqlParameter { ParameterName = "@PublicNoticeIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustId", apInsUpdPublicNoticeData.LustId);
            var publicNoticeTypeIdParam = new SqlParameter("@PublicNoticeTypeID", apInsUpdPublicNoticeData.PublicNoticeTypeId);
            var publicNoticeDtParam = new SqlParameter("@PublicNoticeDt", apInsUpdPublicNoticeData.PublicNoticeDate);
            var meetingRqstIndParam = new SqlParameter("@MeetingRqstInd", apInsUpdPublicNoticeData.MeetingRqstInd);
            var meetingDateParam = new SqlParameter("@MeetingDt", apInsUpdPublicNoticeData.MeetingDate);
            var commentsParam = new SqlParameter("@Comments", apInsUpdPublicNoticeData.Comment);
            //var resultOutParam = new SqlParameter { ParameterName = "@ResultOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdPublicNoticeData.LastChangeBy);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (publicNoticeDtParam.Value == null) publicNoticeDtParam.Value = DBNull.Value;
            if (meetingDateParam.Value == null) meetingDateParam.Value = DBNull.Value;
            if (commentsParam.Value == null) commentsParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdPublicNoticeData " +
            "  @PublicNoticeIDIn, @PublicNoticeIDOut out,@LustId,@PublicNoticeTypeID,@PublicNoticeDt,@MeetingRqstInd " +
            "  , @MeetingDt, @Comments, @LastChangeBy, @ErrorMessageHandler out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idInParam, idOutParam, lustIdParam
                , publicNoticeTypeIdParam, publicNoticeDtParam, meetingRqstIndParam, meetingDateParam
                , commentsParam, lastChangeByParam, errorMsgOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(apInsUpdPublicNoticeData);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = apInsUpdPublicNoticeData.LustId,
                Id = (idOutParam.Value == DBNull.Value) ? (Int32)idInParam.Value : (Int32)idOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApGenericResult> ApDltPublicNoticeData(int pnId)
        {
            var idParam = new SqlParameter("@PublicNoticeId", pnId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltPublicNoticeData @PublicNoticeId, @Result out, @ErrorMessageHandler out";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idParam, resultOutParam, errorMsgOutParam);
            return new ApGenericResult
            {
                LustId = 0,
                Id = pnId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<Inspection> ApGetInspectionByInspectionIdData(int inspectionId)
        {
            var idParam = new SqlParameter("@InspectionId", inspectionId);
            var exeSp = "execute dbo.apGetInspectionByInspectionIdData  @InspectionId";
            var results = await _dbContext.Set<Inspection>().AsNoTracking().FromSql(exeSp, idParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetInspectionByInspectionIdData not found for inspectionId  {inspectionId}.");
            }
        }

        public async Task<IEnumerable<Inspection>> ApGetInspectionByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetInspectionByLustIdData  @LustId ";
            var results = await _dbContext.Set<Inspection>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task<IEnumerable<Pcs>> ApGetPcsByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetPcsByLustIdData  @LustId ";
            var results = await _dbContext.Set<Pcs>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task<Pcs> ApGetPcsByPcsIdData(int pcsId)
        {
            var idParam = new SqlParameter("@PCSID", pcsId);
            var exeSp = "execute dbo.apGetPcsByPcsIdData  @PCSID";
            var results = await _dbContext.Set<Pcs>().AsNoTracking().FromSql(exeSp, idParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetPcsByPcsIdData not found for pcsId  {pcsId}.");
            }
        }

        public async Task<PcsPermit> ApGetPcsPermitByPcsIdData(int pcsId)
        {
            var idParam = new SqlParameter("@PCSID", pcsId);
            var exeSp = "execute dbo.apGetPcsPermitByPcsIdData  @PCSID";
            var results = await _dbContext.Set<PcsPermit>().AsNoTracking().FromSql(exeSp, idParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetPcsPermitByPcsIdData not found for pcsId  {pcsId}.");
            }
        }

        public async Task<ApGenericResult> ApInsUpdPcsData(Pcs pcs)
        {
            var idInParam = new SqlParameter("@PCSIDIn", pcs.PcsId);
            var idOutParam = new SqlParameter { ParameterName = "@PCSIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustId", pcs.LustId);
            var landfillFacIdParam = new SqlParameter("@LandfillFacID", pcs.DispLandfillFacId);
            var treatmentFacIdParam = new SqlParameter("@TreatmentFacID", pcs.DispThrmFacId);
            var onSiteDisposalIndParam = new SqlParameter("@OnSiteDisposalInd", pcs.OnSiteDisposalInd);
            var offSiteDisposalAddrParam = new SqlParameter("@OffSiteDisposalAddr", pcs.OffSiteDispAddr);

            var soilStatusIdParam = new SqlParameter("@SoilStatusID", pcs.SoilStatusId);
            var soilStatusCdParam = new SqlParameter("@SoilStatusCd", pcs.SoilStatusCode);
            var landfillAmtYrdsParam = new SqlParameter("@LandfillAmtYrds", pcs.LandfillAmtYrds3);
            var treatmentAmtYrdsParam = new SqlParameter("@TreatmentAmtYrds", pcs.ThermalAmtYrds3);
            var onSiteAmtYrdsParam = new SqlParameter("@OnSiteAmtYrds", pcs.OnSiteAmtYrds3);
            var offSiteAmtYrdsParam = new SqlParameter("@OffSiteAmtYrds", pcs.OffSiteAmtYrds3);
            var disposalDateParam = new SqlParameter("@DisposalDt", pcs.DisposalDate);
            var commentsParam = new SqlParameter("@Comments", pcs.PcsComment);
            //var resultOutParam = new SqlParameter { ParameterName = "@ResultOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lastChangeByParam = new SqlParameter("@LastChangeBy", pcs.LastChangeBy);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (landfillFacIdParam.Value == null) landfillFacIdParam.Value = DBNull.Value;
            if (treatmentFacIdParam.Value == null) treatmentFacIdParam.Value = DBNull.Value;
            if (onSiteDisposalIndParam.Value == null) onSiteDisposalIndParam.Value = DBNull.Value;
            if (offSiteDisposalAddrParam.Value == null) offSiteDisposalAddrParam.Value = DBNull.Value;
            if (soilStatusIdParam.Value == null) soilStatusIdParam.Value = DBNull.Value;
            if (soilStatusCdParam.Value == null) soilStatusCdParam.Value = DBNull.Value;
            if (landfillAmtYrdsParam.Value == null) landfillAmtYrdsParam.Value = DBNull.Value;
            if (treatmentAmtYrdsParam.Value == null) treatmentAmtYrdsParam.Value = DBNull.Value;
            if (onSiteAmtYrdsParam.Value == null) onSiteAmtYrdsParam.Value = DBNull.Value;
            if (offSiteAmtYrdsParam.Value == null) offSiteAmtYrdsParam.Value = DBNull.Value;
            if (disposalDateParam.Value == null) disposalDateParam.Value = DBNull.Value;
            if (commentsParam.Value == null) commentsParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdPcsData " +
            "  @PCSIDIn, @PCSIDOut out,@LustId,@LandfillFacID,@TreatmentFacID,@OnSiteDisposalInd " +
            "  , @OffSiteDisposalAddr,@SoilStatusID , @SoilStatusCd,@LandfillAmtYrds,@TreatmentAmtYrds" +
            "  , @OnSiteAmtYrds, @OffSiteAmtYrds,  @DisposalDt,@PCSComment" +
            "  , @LastChangeBy, @ErrorMessageHandler out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idInParam, idOutParam, lustIdParam
                , landfillFacIdParam, treatmentFacIdParam, onSiteDisposalIndParam, offSiteDisposalAddrParam
                , soilStatusIdParam, soilStatusCdParam, landfillAmtYrdsParam, treatmentAmtYrdsParam, onSiteAmtYrdsParam
                , disposalDateParam, commentsParam, lastChangeByParam, errorMsgOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(pcs);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = pcs.LustId,
                Id = (idOutParam.Value == DBNull.Value) ? (Int32)idInParam.Value : (Int32)idOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApGenericResult> ApInsUpdPcsPermitData(PcsPermit pcsPermit)
        {
            var idInParam = new SqlParameter("@SWPermitIDIn", pcsPermit.PcsSwPermitId);
            var idOutParam = new SqlParameter { ParameterName = "SWPermitIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var pcsIdParam = new SqlParameter("@PCSID", pcsPermit.PcsId);
            var sWLAPermitNbrParam = new SqlParameter("@SWLAPermitNbr", pcsPermit.SwlaPermitNbr);
            var appReceivedDtParam = new SqlParameter("@AppReceivedDt", pcsPermit.ApplReceivedDate);
            var issueDtParam = new SqlParameter("@IssueDt", pcsPermit.IssueDate);
            var expirationDtParam = new SqlParameter("@ExpirationDt", pcsPermit.ExpirationDate);
            var permitExtDtParam = new SqlParameter("@PermitExtDt", pcsPermit.PermitExtensionDate);
            var sWFeeIndParam = new SqlParameter("@SWFeeInd", pcsPermit.SwFeeInd);
            var landUseApprovedIndParam = new SqlParameter("@LandUseApprovedInd", pcsPermit.LandUseApproveInd);
            var permitCommentParam = new SqlParameter("@PermitComment", pcsPermit.TreatmentDescription);
            //var resultOutParam = new SqlParameter { ParameterName = "@ResultOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lastChangeByParam = new SqlParameter("@LastChangeBy", pcsPermit.LastChangeBy);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (sWLAPermitNbrParam.Value == null) sWLAPermitNbrParam.Value = DBNull.Value;
            if (appReceivedDtParam.Value == null) appReceivedDtParam.Value = DBNull.Value;
            if (issueDtParam.Value == null) issueDtParam.Value = DBNull.Value;
            if (expirationDtParam.Value == null) expirationDtParam.Value = DBNull.Value;
            if (permitExtDtParam.Value == null) permitExtDtParam.Value = DBNull.Value;
            if (sWFeeIndParam.Value == null) sWFeeIndParam.Value = DBNull.Value;
            if (landUseApprovedIndParam.Value == null) landUseApprovedIndParam.Value = DBNull.Value;
            if (permitCommentParam.Value == null) permitCommentParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdPcsPermitData " +
                "  @SWPermitIDIn, @SWPermitIDOut  out,@PCSID,@SWLAPermitNbr,@AppReceivedDt,@IssueDt " +
                "  , @ExpirationDt,@PermitExtDt , @SWFeeInd,@LandUseApprovedInd,@PermitComment" +
                "  , @LastChangeBy, @ErrorMessageHandler out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idInParam, idOutParam, pcsIdParam
                , sWLAPermitNbrParam, appReceivedDtParam, issueDtParam, expirationDtParam
                , permitExtDtParam, sWFeeIndParam, landUseApprovedIndParam, permitCommentParam
                , lastChangeByParam, errorMsgOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(pcsPermit);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = pcsPermit.PcsId,
                Id = (idOutParam.Value == DBNull.Value) ? (Int32)idInParam.Value : (Int32)idOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }


        public async Task<ApGenericResult> ApInsUpdPcsPcsPermitData(PcsPcsPermit pcsPcsPermit)
        {
            var pcsIdInParam = new SqlParameter("@PCSIDIn", pcsPcsPermit.PcsId);
            var pcsIdOutParam = new SqlParameter { ParameterName = "@PCSIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustId", pcsPcsPermit.LustId);
            var landfillFacIdParam = new SqlParameter("@LandfillFacID", pcsPcsPermit.DispLandfillFacId);
            var treatmentFacIdParam = new SqlParameter("@TreatmentFacID", pcsPcsPermit.DispThrmFacId);
            var onSiteDisposalIndParam = new SqlParameter("@OnSiteDisposalInd", pcsPcsPermit.OnSiteDisposalInd);
            var offSiteDisposalAddrParam = new SqlParameter("@OffSiteDisposalAddr", pcsPcsPermit.OffSiteDispAddr);

            var soilStatusIdParam = new SqlParameter("@SoilStatusID", pcsPcsPermit.SoilStatusId);
            var soilStatusCdParam = new SqlParameter("@SoilStatusCd", pcsPcsPermit.SoilStatusCode);
            var landfillAmtYrdsParam = new SqlParameter("@LandfillAmtYrds", pcsPcsPermit.LandfillAmtYrds3);
            var treatmentAmtYrdsParam = new SqlParameter("@TreatmentAmtYrds", pcsPcsPermit.ThermalAmtYrds3);
            var onSiteAmtYrdsParam = new SqlParameter("@OnSiteAmtYrds", pcsPcsPermit.OnSiteAmtYrds3);
            var offSiteAmtYrdsParam = new SqlParameter("@OffSiteAmtYrds", pcsPcsPermit.OffSiteAmtYrds3);
            var disposalDateParam = new SqlParameter("@DisposalDt", pcsPcsPermit.DisposalDate);
            var commentsParam = new SqlParameter("@PCSComment", pcsPcsPermit.PcsComment);
            //var resultOutParam = new SqlParameter { ParameterName = "@ResultOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var pcsLastChangeByParam = new SqlParameter("@LastChangeBy", pcsPcsPermit.LastChangeBy);
            var permitIdInParam = new SqlParameter("@SWPermitIDIn", pcsPcsPermit.PcsSwPermitId);
            var permitIdOutParam = new SqlParameter { ParameterName = "SWPermitIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var pcsIdParam = new SqlParameter("@PCSID", pcsPcsPermit.PcsId);
            var sWLAPermitNbrParam = new SqlParameter("@SWLAPermitNbr", pcsPcsPermit.SwlaPermitNbr);
            var appReceivedDtParam = new SqlParameter("@AppReceivedDt", pcsPcsPermit.ApplReceivedDate);
            var issueDtParam = new SqlParameter("@IssueDt", pcsPcsPermit.IssueDate);
            var expirationDtParam = new SqlParameter("@ExpirationDt", pcsPcsPermit.ExpirationDate);
            var permitExtDtParam = new SqlParameter("@PermitExtDt", pcsPcsPermit.PermitExtensionDate);
            var sWFeeIndParam = new SqlParameter("@SWFeeInd", pcsPcsPermit.SwFeeInd);
            var landUseApprovedIndParam = new SqlParameter("@LandUseApprovedInd", pcsPcsPermit.LandUseApproveInd);
            var permitCommentParam = new SqlParameter("@PermitComment", pcsPcsPermit.TreatmentDescription);
            //var resultOutParam = new SqlParameter { ParameterName = "@ResultOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var permitLastChangeByParam = new SqlParameter("@PCSPermitLastChangeBy", pcsPcsPermit.LastChangeBy);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (landfillFacIdParam.Value == null) landfillFacIdParam.Value = DBNull.Value;
            if (treatmentFacIdParam.Value == null) treatmentFacIdParam.Value = DBNull.Value;
            if (onSiteDisposalIndParam.Value == null) onSiteDisposalIndParam.Value = DBNull.Value;
            if (offSiteDisposalAddrParam.Value == null) offSiteDisposalAddrParam.Value = DBNull.Value;
            if (soilStatusIdParam.Value == null) soilStatusIdParam.Value = DBNull.Value;
            if (soilStatusCdParam.Value == null) soilStatusCdParam.Value = DBNull.Value;
            if (landfillAmtYrdsParam.Value == null) landfillAmtYrdsParam.Value = DBNull.Value;
            if (treatmentAmtYrdsParam.Value == null) treatmentAmtYrdsParam.Value = DBNull.Value;
            if (onSiteAmtYrdsParam.Value == null) onSiteAmtYrdsParam.Value = DBNull.Value;
            if (offSiteAmtYrdsParam.Value == null) offSiteAmtYrdsParam.Value = DBNull.Value;
            if (disposalDateParam.Value == null) disposalDateParam.Value = DBNull.Value;
            if (commentsParam.Value == null) commentsParam.Value = DBNull.Value;
            if (sWLAPermitNbrParam.Value == null) sWLAPermitNbrParam.Value = DBNull.Value;
            if (appReceivedDtParam.Value == null) appReceivedDtParam.Value = DBNull.Value;
            if (issueDtParam.Value == null) issueDtParam.Value = DBNull.Value;
            if (expirationDtParam.Value == null) expirationDtParam.Value = DBNull.Value;
            if (permitExtDtParam.Value == null) permitExtDtParam.Value = DBNull.Value;
            if (sWFeeIndParam.Value == null) sWFeeIndParam.Value = DBNull.Value;
            if (landUseApprovedIndParam.Value == null) landUseApprovedIndParam.Value = DBNull.Value;
            if (permitCommentParam.Value == null) permitCommentParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdPcsAndPcsPermitData " +
            "  @PCSIDIn, @PCSIDOut out,@LustId,@LandfillFacID,@TreatmentFacID,@OnSiteDisposalInd " +
            "  , @OffSiteDisposalAddr,@SoilStatusID , @SoilStatusCd,@LandfillAmtYrds,@TreatmentAmtYrds" +
            "  , @OnSiteAmtYrds, @OffSiteAmtYrds,  @DisposalDt,@PCSComment" +
            "  , @LastChangeBy" +
            "  , @SWPermitIDIn, @SWPermitIDOut  out,@PCSID,@SWLAPermitNbr,@AppReceivedDt,@IssueDt " +
            "  , @ExpirationDt,@PermitExtDt , @SWFeeInd,@LandUseApprovedInd,@PermitComment" +
            "  , @PCSPermitLastChangeBy, @ErrorMessageHandler out";
            ;

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, pcsIdInParam, pcsIdOutParam, lustIdParam
                , landfillFacIdParam, treatmentFacIdParam, onSiteDisposalIndParam, offSiteDisposalAddrParam
                , soilStatusIdParam, soilStatusCdParam, landfillAmtYrdsParam, treatmentAmtYrdsParam, onSiteAmtYrdsParam, offSiteAmtYrdsParam
                , disposalDateParam, commentsParam, pcsLastChangeByParam
                , permitIdInParam, permitIdOutParam, pcsIdParam
                , sWLAPermitNbrParam, appReceivedDtParam, issueDtParam, expirationDtParam
                , permitExtDtParam, sWFeeIndParam, landUseApprovedIndParam, permitCommentParam
                , permitLastChangeByParam, errorMsgOutParam);
    
            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(pcsPcsPermit);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = (pcsIdOutParam.Value == DBNull.Value) ? (Int32)pcsIdInParam.Value : (Int32)pcsIdOutParam.Value,
                Id = (permitIdOutParam.Value == DBNull.Value) ? (Int32)permitIdInParam.Value : (Int32)permitIdOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApGenericResult> ApDltPcsData(int pcsId)
        {
            var idParam = new SqlParameter("@PCSID", pcsId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltAllPCSData @PCSID, @Result out, @ErrorMessageHandler out";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idParam, resultOutParam, errorMsgOutParam);
            return new ApGenericResult
            {
                LustId = 0,
                Id = pcsId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApGenericResult> ApDltPcsPermitData(int pcsPermitId)
        {
            var idParam = new SqlParameter("@SWPermitID", pcsPermitId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltPCSPermitData @SWPermitID, @Result out, @ErrorMessageHandler out";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idParam, resultOutParam, errorMsgOutParam);
            return new ApGenericResult
            {
                LustId = 0,
                Id = pcsPermitId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<PcsPcsPermit> ApGetPcsPcsPermitByPcsIdData(int pcsId)
        {
            var idParam = new SqlParameter("@PCSID", pcsId);
            var exeSp = "execute dbo.apGetPcsPcsPermitByPcsIdData  @PCSID";
            var results = await _dbContext.Set<PcsPcsPermit>().AsNoTracking().FromSql(exeSp, idParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetPcsPcsPermitByPcsIdData not found for pcsId  {pcsId}.");
            }
        }

        public async Task<IEnumerable<SiteControl>> ApGetSiteControlByLustIdData(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetSiteControlsByLustIdData  @LustId ";
            var results = await _dbContext.Set<SiteControl>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            return results;
        }

        public async Task<SiteControl> ApGetSiteControlByScIdData(int scId)
        {
            var idParam = new SqlParameter("@SiteControlId", scId);
            var exeSp = "execute dbo.apGetSiteControlByscIdData  @SiteControlId";
            var results = await _dbContext.Set<SiteControl>().AsNoTracking().FromSql(exeSp, idParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetSiteControlByscIdData not found for scId  {scId}.");
            }
        }


        public async Task<ApGenericResult> ApInsUpdSiteControlData(SiteControl siteControl)
        {
            var idInParam = new SqlParameter("@SiteControlIDIn", siteControl.SiteControlId);
            var idOutParam = new SqlParameter { ParameterName = "@SiteControlIDOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@fkLustID", siteControl.LustId);
            var controlIdParam = new SqlParameter("@fkControlID", siteControl.ControlId);
            var controlBeginDateParam = new SqlParameter("@ControlBeginDate", siteControl.ControlBeginDate);
            var controlEndDateParam = new SqlParameter("@ControlEndDate", siteControl.ControlEndDate);
            var frequencyOfReviewParam = new SqlParameter("@FrequencyOfReview", siteControl.FrequencyOfReview);
            var controlCommentParam = new SqlParameter("@ControlComment", siteControl.ControlComment);
            var lastReviewByParam = new SqlParameter("@LastReviewBy", siteControl.LastReviewBy);
            var lastReviewDtParam = new SqlParameter("@LastReviewDt", siteControl.LastReviewDate);
            var controlTypeIdParam = new SqlParameter("@TypeId", siteControl.TypeId);
           
            //var resultOutParam = new SqlParameter { ParameterName = "@ResultOut", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lastChangeByParam = new SqlParameter("@LastChangeBy", siteControl.LastChangeBy);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (controlEndDateParam.Value == null) controlEndDateParam.Value = DBNull.Value;
            if (frequencyOfReviewParam.Value == null) frequencyOfReviewParam.Value = DBNull.Value;
            if (controlCommentParam.Value == null) controlCommentParam.Value = DBNull.Value;
            if (lastReviewByParam.Value == null) lastReviewByParam.Value = DBNull.Value;
            if (lastReviewDtParam.Value == null) lastReviewDtParam.Value = DBNull.Value;
            if (controlTypeIdParam.Value == null) controlTypeIdParam.Value = DBNull.Value;

            var exeSp = "execute dbo.apInsUpdSiteControlData " +
                "   @SiteControlIDIn, @SiteControlIDOut  out,@fkLustID,@fkControlID,@ControlBeginDate,@ControlEndDate " +
                "  , @FrequencyOfReview,@ControlComment , @LastReviewBy,@LastReviewDt,@TypeId" +
                "  , @LastChangeBy, @ErrorMessageHandler out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idInParam, idOutParam, lustIdParam
                , controlIdParam, controlBeginDateParam, controlEndDateParam, frequencyOfReviewParam
                , controlCommentParam, lastReviewByParam, lastReviewDtParam, controlTypeIdParam
                , lastChangeByParam, errorMsgOutParam);

            if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            {
                var json = JsonConvert.SerializeObject(siteControl);
                var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
                _logger.LogError(errorMsg);
                //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return new ApGenericResult
            {
                LustId = siteControl.LustId,
                Id = (idOutParam.Value == DBNull.Value) ? (Int32)idInParam.Value : (Int32)idOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }


        public async Task<ApGenericResult> ApDltSiteControlData(int scId)
        {
            var idParam = new SqlParameter("@SiteControlId", scId);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute dbo.apDltSiteControlData @SiteControlId, @Result out, @ErrorMessageHandler out";
            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idParam, resultOutParam, errorMsgOutParam);
            return new ApGenericResult
            {
                LustId = 0,
                Id = scId,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApLustCris> ApGetCrisCheck(int lustId)
        {
            var lustIdParam = new SqlParameter("@LustId", lustId);
            var exeSp = "execute dbo.apGetCrisCheckByLustIdData  @LustId ";
            var results= await _dbContext.Set<ApLustCris>().AsNoTracking().FromSql(exeSp, lustIdParam).ToListAsync();
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - dbo.apGetCrisCheckByLustIdData not found for lustId  {lustId}.");
            }
        }
    }
}
