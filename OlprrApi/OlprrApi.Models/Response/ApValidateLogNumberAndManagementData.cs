using System;

namespace OlprrApi.Models.Response
{
    public class ApValidateLogNumberAndManagementData
    {
        public int LustIncidentLustId { get; set; }
        public int? LustManagementLustId { get; set; }
        public int? LustManagementMangementId { get; set; }
        public DateTime? LustManagementReleaseStopDate { get; set; }
        public DateTime? LustManagementFinalInvcRqstDate { get; set; }
        public string HotcHotManagementLogNumber { get; set; }
        public string LustIncidentSiteAddress { get; set; }
        public string LustIncidentSiteName { get; set; }
        public string LustIncidentSiteCity { get; set; }
        public string LustIncidentSiteZip { get; set; }
        public int? HotcHotManagementHotId { get; set; }
        public string HotcHotMangementCheckNbr { get; set; }
        public DateTime? HotcHotManagementCheckReceivedDate { get; set; }
        public decimal? HotcHotManagementFeeAmt { get; set; }
        public DateTime? HotcHotManagementAuditDate { get; set; }
        public string HotcHotManagementDecommType { get; set; }
        public string HotcHotManagementReportRejected { get; set; }
        public string HotcHotManagementHotSpId { get; set; }
        public string HotcHotManagementHotComments { get; set; }
        public int? ContactAffilId { get; set; }
        public string ContactOrganization { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public string ContactStreet { get; set; }
        public string ContactCity { get; set; }
        public string ContactState { get; set; }
        public string ContactZip { get; set; }
        public string Status { get; set; }
        public string LustIncidentLogNumber { get; set; }
        public string ServiceOwnerFullName { get; set; }
        public string ServiceOwnerLicenseStatus { get; set; }
        public string LustManagementLastChangeBy { get; set; }
        public DateTime? LustManagementLastChangeDate { get; set; }
    }
}
