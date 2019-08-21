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
    public class HotcRepository : IHotcRepository
    {
        private LustDbContext _dbContext;
        private ILogger<HotcRepository> _logger;
        public HotcRepository(ILogger<HotcRepository> logger, LustDbContext dbContext)
        {
            _dbContext = dbContext;
            _logger = logger;
        }

        public async Task<IEnumerable<HotcContact>> ApGetHotcContacts(int lustId)
        {
            var idParam = new SqlParameter("@LustId", lustId);
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute hotc.dbo.apGetHotcContacts  @LustId, @RESULT OUTPUT ";

            var result = await _dbContext.Set<HotcContact>().AsNoTracking().FromSql(exeSp, idParam, resultOutParam).ToListAsync();

            var resultCode = (Int32)(resultOutParam.Value);

            if (resultCode != 0)
            {
                var errorMsg = $"{exeSp} for {lustId} returned status code = {resultCode}.";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            return result;
        }

        public async Task<IEnumerable<HotcSearchFilterResultStats>> ApGetHotcData(HotcSearchFilter hotcSearchFilter)
        {
            var idParam = new SqlParameter("@Id", hotcSearchFilter.Id);
            var streetNbrParam = new SqlParameter("@StreetNbr", hotcSearchFilter.StreetNbr);
            var streetQuadParam = new SqlParameter("@StreetQuad", hotcSearchFilter.StreetQuad);
            var streetNameParam = new SqlParameter("@StreetName", hotcSearchFilter.StreetName);
            var streetTypeParam = new SqlParameter("@StreetType", hotcSearchFilter.StreetType);
            var otherAddrParam = new SqlParameter("@OtherAddr", hotcSearchFilter.OtherAddr);
            var cityParam = new SqlParameter("@City", hotcSearchFilter.City);
            var zipParam = new SqlParameter("@Zip", hotcSearchFilter.ZipCode);
            var countyParam = new SqlParameter("@County", hotcSearchFilter.County);
            var yearParam = new SqlParameter("@Year", hotcSearchFilter.Year);
            var searchTypeParam = new SqlParameter("@SearchType", hotcSearchFilter.SearchType);
            var sortColParam = new SqlParameter("@SortColumn", hotcSearchFilter.SortColumn);
            var sortOrderParam = new SqlParameter("@SortOrder", hotcSearchFilter.SortOrder);
            var pageNumberParam = new SqlParameter("@PageNumber", hotcSearchFilter.PageNumber);
            var rowsPerPageParam = new SqlParameter("@RowsPerPage", hotcSearchFilter.RowsPerPage);
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var totalRowsOutParam = new SqlParameter { ParameterName = "@TotalRows", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var totalPagesOutParam = new SqlParameter { ParameterName = "@TotalPages", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };

            if (idParam.Value == null) idParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) streetNbrParam.Value)) streetNbrParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) streetQuadParam.Value)) streetQuadParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) streetNameParam.Value)) streetNameParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) streetTypeParam.Value)) streetTypeParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) otherAddrParam.Value)) otherAddrParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) cityParam.Value)) cityParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) zipParam.Value)) zipParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) countyParam.Value)) countyParam.Value = DBNull.Value;
            if (String.IsNullOrEmpty((string) yearParam.Value)) yearParam.Value = DBNull.Value;
            if (searchTypeParam.Value == null) searchTypeParam.Value = DBNull.Value;
            if (sortColParam.Value == null) sortColParam.Value = DBNull.Value;
            if (sortOrderParam.Value == null) sortOrderParam.Value = DBNull.Value;
            if (pageNumberParam.Value == null) pageNumberParam.Value = DBNull.Value;
            if (rowsPerPageParam.Value == null) rowsPerPageParam.Value = DBNull.Value;

            var exeSp = "execute hotc.dbo.apGetSearchHOTC_LUSTData  @Id, @StreetNbr, @StreetQuad, @StreetName, @StreetType "
                + " , @OtherAddr,  @City, @Zip, @County, @Year, @SearchType "
                + " ,@SortColumn, @SortOrder, @PageNumber, @RowsPerPage, @TotalRows OUTPUT, @TotalPages OUTPUT, @RESULT OUTPUT ";

            var result = await _dbContext.Set<HotcSearchFilterResult>().AsNoTracking().FromSql(exeSp
                , idParam, streetNbrParam, streetQuadParam, streetNameParam, streetTypeParam, otherAddrParam, cityParam
                , zipParam, countyParam, yearParam, searchTypeParam
                , sortColParam, sortOrderParam, pageNumberParam, rowsPerPageParam
                , totalRowsOutParam, totalPagesOutParam, resultOutParam).ToListAsync();

            var resultCode = (Int32)(resultOutParam.Value);

            if (resultCode != 0)
            {
                var json = JsonConvert.SerializeObject(hotcSearchFilter);
                var errorMsg = $"{exeSp} returned status code = {resultCode}. Post payload {json}.";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }

            var rList = new List<HotcSearchFilterResultStats>();
            foreach (var res in result)
            {
                rList.Add(
                    new HotcSearchFilterResultStats()
                    {
                        ReqPageNumber = hotcSearchFilter.PageNumber,
                        ReqRowsPerPage = hotcSearchFilter.RowsPerPage,
                        ReqSortColumn = hotcSearchFilter.SortColumn,
                        ReqSortOrder = hotcSearchFilter.SortOrder,
                        TotalPages = (Int32)(totalPagesOutParam.Value),
                        TotalRows = (Int32)(totalRowsOutParam.Value),
                        SearchType = res.Type,
                        Id = res.Id,
                        LogNumber = res.LogNumber,
                        FinalInvRqstDate = res.FinalInvcRqstDate,
                        ClosedDate = res.ClosedDate,
                        HotAddress = res.HotAddress,
                        City = res.City,
                        ZipCode = res.ZipCode,
                        County = res.County,
                        Year = res.Year,
                    }
                );
            }
            return rList;
        }

        public async Task<ApGenericResult> ApInsUpdHotcLustData(ApInsUpdHotcLustData apInsUpdHotcLustData)
        {
            var logNumberParam = new SqlParameter("@LogNumber", apInsUpdHotcLustData.HotcHotManagementLogNumber);
            var idParam = new SqlParameter ( "@HotId", apInsUpdHotcLustData.HotcHotManagementHotId );
            var idOutParam = new SqlParameter { ParameterName = "@HotIdNew", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lustIdParam = new SqlParameter("@LustID", apInsUpdHotcLustData.LustManagementLustId);
            var lustManagementIdParam = new SqlParameter("@LustManagementId", apInsUpdHotcLustData.LustManagementMangementId);
            var decommDateParm = new SqlParameter("@DecommDate", apInsUpdHotcLustData.LustManagementReleaseStopDate);
            var fileCloseDateParam = new SqlParameter("@FileCloseDate", apInsUpdHotcLustData.LustManagementFinalInvcRqstDate);
            var checkNbrParam = new SqlParameter("@CheckNbr", apInsUpdHotcLustData.HotcHotMangementCheckNbr);
            var checkReceivedDateParam = new SqlParameter("@CheckReceivedDt", apInsUpdHotcLustData.HotcHotManagementCheckReceivedDate);
            var feeAmountParam = new SqlParameter("@FeeAmount", apInsUpdHotcLustData.HotcHotManagementFeeAmt);
            var auditDateParam = new SqlParameter("@AuditDt", apInsUpdHotcLustData.HotcHotManagementAuditDate);
            var decommTypeParam = new SqlParameter("@DecommType", apInsUpdHotcLustData.HotcHotManagementDecommType);
            var reportRejectedParam = new SqlParameter("@ReportRejected", apInsUpdHotcLustData.HotcHotManagementReportRejected);
            var hotServiceProviderIdParam = new SqlParameter("@HotServiceProviderId", apInsUpdHotcLustData.HotcHotManagementHotSpId);
            var hotCommentParam = new SqlParameter("@HotComment", apInsUpdHotcLustData.HotcHotManagementHotComments);
            var resultOutParam = new SqlParameter { ParameterName = "@Result", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var lastChangeByParam = new SqlParameter("@LastChangeBy", apInsUpdHotcLustData.LustManagementLastChangeBy);
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };

            if (logNumberParam.Value == null) logNumberParam.Value = DBNull.Value;
            if (idParam.Value == null) idParam.Value = DBNull.Value;
            if (lustIdParam.Value == null) lustIdParam.Value = DBNull.Value;
            if (lustManagementIdParam.Value == null) lustManagementIdParam.Value = DBNull.Value;
            if (decommDateParm.Value == null) decommDateParm.Value = DBNull.Value;
            if (fileCloseDateParam.Value == null) fileCloseDateParam.Value = DBNull.Value;
            if (checkNbrParam.Value == null) checkNbrParam.Value = DBNull.Value;
            if (checkReceivedDateParam.Value == null) checkReceivedDateParam.Value = DBNull.Value;
            if (auditDateParam.Value == null) auditDateParam.Value = DBNull.Value;
            if (decommTypeParam.Value == null) decommTypeParam.Value = DBNull.Value;
            if (reportRejectedParam.Value == null) reportRejectedParam.Value = DBNull.Value;
            if (hotServiceProviderIdParam.Value == null) hotServiceProviderIdParam.Value = DBNull.Value;
            if (hotCommentParam.Value == null) hotCommentParam.Value = DBNull.Value;

            var exeSp = "execute hotc.dbo.apInsUpdHotcLustData " +
                "   @LogNumber,  @HotId,@HotIdNew out,@LustId ,@LustManagementId,@DecommDate " +
                "  , @FileCloseDate,@CheckNbr , @CheckReceivedDt,@FeeAmount, @AuditDt, @DecommType" +
                "  , @ReportRejected, @HotServiceProviderId, @HotComment, @LastChangeBy, @ErrorMessageHandler out, @Result out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, logNumberParam, idParam, idOutParam 
                , lustIdParam, lustManagementIdParam, decommDateParm, fileCloseDateParam
                , checkNbrParam, checkReceivedDateParam, feeAmountParam, auditDateParam, decommTypeParam, reportRejectedParam, hotServiceProviderIdParam
                , hotCommentParam, lastChangeByParam, errorMsgOutParam, resultOutParam);

            var resultCode = (Int32)(resultOutParam.Value);

            if (resultCode != 0)
            {
                var json = JsonConvert.SerializeObject(apInsUpdHotcLustData);
                var errorMsg = $"{exeSp} returned status code = {resultCode}. Post payload {json}.";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }

            //if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            //{
            //    var json = JsonConvert.SerializeObject(apGetCleanDecommByHotIdData);
            //    var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
            //    _logger.LogError(errorMsg);
            //    //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            //}

            return new ApGenericResult
            {
                LustId = apInsUpdHotcLustData.LustManagementLustId,
                Id = (idOutParam.Value == DBNull.Value) ? (Int32)idParam.Value : (Int32)idOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ApValidateLogNumberAndManagementData> ApValidateLogNumberAndManagementData(int lustId)
        {
            var idParam = new SqlParameter("@LustId", lustId);
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute hotc.dbo.ApValidateLogNumberAndManagementData  @LustId, @RESULT OUTPUT ";
            var results = await _dbContext.Set<ApValidateLogNumberAndManagementData>().AsNoTracking().FromSql(exeSp, idParam, resultOutParam).ToListAsync();
            var resultCode = (Int32)(resultOutParam.Value);
            if (resultCode != 0) {
                var errorMsg = $"{exeSp} for lustId {lustId} returned status code = {resultCode} .";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            if (results.Count > 0) {
                return results[0];
            }
            else {
                throw new ResourceNotFoundException($"Resource requested - hotc.dbo.ApValidateLogNumberAndManagementData not found for lustId  {lustId}.");
            }
        }


        public async Task<ApGetCleanDecommByHotIdData> ApGetCleanDecommByHotIdData(int hotId)
        {
            var idParam = new SqlParameter("@HotId", hotId);
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute hotc.dbo.ApGetCleanDecommByHotIdData  @HotId, @RESULT OUTPUT ";
            var results = await _dbContext.Set<ApGetCleanDecommByHotIdData>().AsNoTracking().FromSql(exeSp, idParam, resultOutParam).ToListAsync();
            var resultCode = (Int32)(resultOutParam.Value);
            if (resultCode != 0)
            {
                var errorMsg = $"{exeSp} for {hotId} returned status code = {resultCode} .";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - hotc.dbo.ApGetCleanDecommByHotIdData not found for hotId  {hotId}.");
            }
        }

        public async Task<ApGenericResult> ApInsUpdHotcCleanDecommData(ApGetCleanDecommByHotIdData apGetCleanDecommByHotIdData)
        {

            var idParam = new SqlParameter("@HotId", apGetCleanDecommByHotIdData.HotId);
            var idOutParam = new SqlParameter { ParameterName = "@NewHotId", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var checkNumberParam = new SqlParameter("@CheckNbr", apGetCleanDecommByHotIdData.CheckNbr);
            var checkReceivedDateParam = new SqlParameter("@CheckReceivedDate", apGetCleanDecommByHotIdData.CheckReceivedDate);
            var feeAmountParam = new SqlParameter("@FeeAmount", apGetCleanDecommByHotIdData.FeeAmt);
            var auditDateParam = new SqlParameter("@AuditDate", apGetCleanDecommByHotIdData.AuditDate);
            var decommTypeParam = new SqlParameter("@DecommType", apGetCleanDecommByHotIdData.DecommType);
            var reportRejectedParam = new SqlParameter("@ReportRejected", apGetCleanDecommByHotIdData.ReportRejected);
            var hotServiceProviderIdParam = new SqlParameter("@HotServiceProviderId", apGetCleanDecommByHotIdData.HotSpId);
            var hotCommentParam = new SqlParameter("@HotComment", apGetCleanDecommByHotIdData.HotComments);
            var countyParam = new SqlParameter("@County", apGetCleanDecommByHotIdData.DhotCounty);
            var yearParam = new SqlParameter("@Year", apGetCleanDecommByHotIdData.DhotYear);
            var decommDateParam = new SqlParameter("@DecommDate", apGetCleanDecommByHotIdData.DecommissionDate);
            var fileCloseDateParam = new SqlParameter("@FileCloseDate", apGetCleanDecommByHotIdData.FileClosedDate);
            var hotStreetNbrParam = new SqlParameter("@HotStreetNbr", apGetCleanDecommByHotIdData.HotStreetNbr);
            var hotStreetQuadParam = new SqlParameter("@HotStreetQuad", apGetCleanDecommByHotIdData.HotStreetQuad);
            var hotStreetNameParam = new SqlParameter("@HotStreetName", apGetCleanDecommByHotIdData.HotStreetNm);
            var hotStreetTypeParam = new SqlParameter("@HotStreetType", apGetCleanDecommByHotIdData.HotStreetType);
            var hotOtherAddressParam = new SqlParameter("@HotOtherAddress", apGetCleanDecommByHotIdData.HotAddrCmnt);
            var hotCityParam = new SqlParameter("@HotCity", apGetCleanDecommByHotIdData.HotCity);
            var hotZipCodeParam = new SqlParameter("@HotZipCode", apGetCleanDecommByHotIdData.HotZip);
            var rpFnameParam = new SqlParameter("@RpFname", apGetCleanDecommByHotIdData.RpFirstNm);
            var rpLnameParam = new SqlParameter("@RpLname", apGetCleanDecommByHotIdData.RpLastNm);
            var rpOrgNameParam = new SqlParameter("@RpOrgName", apGetCleanDecommByHotIdData.RpCompanyNm);
            var rpStreetNbrParam = new SqlParameter("@RpStreetNbr", apGetCleanDecommByHotIdData.RpStreetNbr);
            var rpStreetQuadParam = new SqlParameter("@RpStreetQuad", apGetCleanDecommByHotIdData.RpStreetQuad);
            var rpStreetNameParam = new SqlParameter("@RpStreetName", apGetCleanDecommByHotIdData.RpStreetNm);
            var rpStreetTypeParam = new SqlParameter("@RpStreetType", apGetCleanDecommByHotIdData.RpStreetType);
            var rpOtherAddressParam = new SqlParameter("@RpOtherAddress", apGetCleanDecommByHotIdData.HotAddrCmnt);
            var rpCityParam = new SqlParameter("@RpCity", apGetCleanDecommByHotIdData.RpCity);
            var rpStateParam = new SqlParameter("@RpState", apGetCleanDecommByHotIdData.RpState);
            var rpZipCodeParam = new SqlParameter("@RpZipCode", apGetCleanDecommByHotIdData.RpZip);
            var resultOutParam = new SqlParameter { ParameterName = "@Result", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var errorMsgOutParam = new SqlParameter { ParameterName = "@ErrorMessageHandler", SqlDbType = SqlDbType.VarChar, Size = 1024, Direction = ParameterDirection.Output };


            if (idParam.Value == null) idParam.Value = DBNull.Value;
            if (checkNumberParam.Value == null) checkNumberParam.Value = DBNull.Value;
            if (checkReceivedDateParam.Value == null) checkReceivedDateParam.Value = DBNull.Value;
            if (decommDateParam.Value == null) decommDateParam.Value = DBNull.Value;
            if (fileCloseDateParam.Value == null) fileCloseDateParam.Value = DBNull.Value;
            if (feeAmountParam.Value == null) feeAmountParam.Value = DBNull.Value;
            if (auditDateParam.Value == null) auditDateParam.Value = DBNull.Value;
            if (decommTypeParam.Value == null) decommTypeParam.Value = DBNull.Value;
            if (reportRejectedParam.Value == null) reportRejectedParam.Value = DBNull.Value;
            if (hotServiceProviderIdParam.Value == null) hotServiceProviderIdParam.Value = DBNull.Value;
            if (hotCommentParam.Value == null) hotCommentParam.Value = DBNull.Value;
            if (countyParam.Value == null) countyParam.Value = DBNull.Value;
            if (yearParam.Value == null) yearParam.Value = DBNull.Value;
            if (decommDateParam.Value == null) decommDateParam.Value = DBNull.Value;
            if (hotStreetNbrParam.Value == null) hotStreetNbrParam.Value = DBNull.Value;
            if (hotStreetQuadParam.Value == null) hotStreetQuadParam.Value = DBNull.Value;
            if (hotStreetNameParam.Value == null) hotStreetNameParam.Value = DBNull.Value;
            if (hotStreetTypeParam.Value == null) hotStreetTypeParam.Value = DBNull.Value;
            if (hotOtherAddressParam.Value == null) hotOtherAddressParam.Value = DBNull.Value;
            if (hotCityParam.Value == null) hotCityParam.Value = DBNull.Value;
            if (hotZipCodeParam.Value == null) hotZipCodeParam.Value = DBNull.Value;
            if (rpFnameParam.Value == null) rpFnameParam.Value = DBNull.Value;
            if (rpLnameParam.Value == null) rpLnameParam.Value = DBNull.Value;
            if (rpOrgNameParam.Value == null) rpOrgNameParam.Value = DBNull.Value;
            if (rpStreetNbrParam.Value == null) rpStreetNbrParam.Value = DBNull.Value;
            if (rpStreetQuadParam.Value == null) rpStreetQuadParam.Value = DBNull.Value;
            if (rpStreetNameParam.Value == null) rpStreetNameParam.Value = DBNull.Value;
            if (rpStreetTypeParam.Value == null) rpStreetTypeParam.Value = DBNull.Value;
            if (rpOtherAddressParam.Value == null) rpOtherAddressParam.Value = DBNull.Value;
            if (rpCityParam.Value == null) rpCityParam.Value = DBNull.Value;
            if (rpStateParam.Value == null) rpStateParam.Value = DBNull.Value;
            if (rpZipCodeParam.Value == null) rpZipCodeParam.Value = DBNull.Value;

            var exeSp = "execute hotc.dbo.apInsUpdHotcCleanDecommData " +
                " @HotId,@NewHotId out, @CheckNbr , @CheckReceivedDate, @FeeAmount, @AuditDate, @DecommType, @ReportRejected, @HotServiceProviderId, @HotComment" +
                "  , @County, @Year, @DecommDate,  @FileCloseDate, @HotStreetNbr, @HotStreetQuad, @HotStreetName, @HotStreetType, @HotOtherAddress, @HotCity, @HotZipCode  " +
                "  , @RpFname, @RpLname, @RpOrgName, @RpStreetNbr, @RpStreetQuad, @RpStreetName, @RpStreetType, @RpOtherAddress, @RpCity, @RpState, @RpZipCode" +
                "  , @ErrorMessageHandler out, @Result out";

            var result = await _dbContext.Database.ExecuteSqlCommandAsync(exeSp, idParam, idOutParam
                , checkNumberParam, checkReceivedDateParam, feeAmountParam, auditDateParam, decommTypeParam
                , reportRejectedParam, hotServiceProviderIdParam, hotCommentParam
                , countyParam, yearParam, decommDateParam, fileCloseDateParam
                , hotStreetNbrParam, hotStreetQuadParam, hotStreetNameParam, hotStreetTypeParam
                , hotOtherAddressParam, hotCityParam, hotZipCodeParam
                , rpFnameParam, rpLnameParam, rpOrgNameParam, rpStreetNbrParam, rpStreetQuadParam
                , rpStreetNameParam, rpStreetTypeParam, rpOtherAddressParam, rpCityParam, rpStateParam, rpZipCodeParam
                , errorMsgOutParam, resultOutParam);

            var resultCode = (Int32)(resultOutParam.Value);

            if (resultCode != 0)
            {
                var json = JsonConvert.SerializeObject(apGetCleanDecommByHotIdData);
                var errorMsg = $"{exeSp} returned status code = {resultCode}. Post payload {json}.";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }

            //if ((errorMsgOutParam.Value != DBNull.Value) && (((string)errorMsgOutParam.Value).Length > 0))
            //{
            //    var json = JsonConvert.SerializeObject(apGetCleanDecommByHotIdData);
            //    var errorMsg = $"{exeSp} returned {errorMsgOutParam.Value}. Post payload {json}.";
            //    _logger.LogError(errorMsg);
            //    //throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            //}

            return new ApGenericResult
            {
                LustId = (idParam.Value == DBNull.Value) ? (Int32)idParam.Value :0,
                Id = (idOutParam.Value == DBNull.Value) ? (Int32)idParam.Value : (Int32)idOutParam.Value,
                ErrorMessageHandler = (errorMsgOutParam.Value == DBNull.Value) ? null : (string)errorMsgOutParam.Value
            };
        }

        public async Task<ServiceProvider> ApGetHotServiceProviderData(int licenseNbr)
        {
            var idParam = new SqlParameter("@LicenseNbr", licenseNbr);
            var resultOutParam = new SqlParameter { ParameterName = "@RESULT", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
            var exeSp = "execute hotc.dbo.ApGetHotServiceProviderData  @LicenseNbr, @RESULT OUTPUT ";

            var results = await _dbContext.Set<ServiceProvider>().AsNoTracking().FromSql(exeSp, idParam, resultOutParam).ToListAsync();
            var resultCode = (Int32)(resultOutParam.Value);
            if (resultCode != 0)
            {
                var errorMsg = $"{exeSp} for {licenseNbr} returned status code = {resultCode} .";
                _logger.LogError(errorMsg);
                throw new StoreProcedureNonZeroOutputParamException(errorMsg);
            }
            if (results.Count > 0)
            {
                return results[0];
            }
            else
            {
                throw new ResourceNotFoundException($"Resource requested - hotc.dbo.ApGetHotServiceProviderData not found for licenseNbr  {licenseNbr}.");
            }

        }

    }
}
