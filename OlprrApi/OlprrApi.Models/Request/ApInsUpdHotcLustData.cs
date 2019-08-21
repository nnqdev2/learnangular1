using System;
namespace OlprrApi.Models.Request
{
    public class ApInsUpdHotcLustData
    {
        public string HotcHotManagementLogNumber { get; set; }
        public int? HotcHotManagementHotId { get; set; }
        public int LustManagementLustId { get; set; }
        public int? LustManagementMangementId { get; set; }
        public DateTime? LustManagementReleaseStopDate { get; set; }
        public DateTime? LustManagementFinalInvcRqstDate { get; set; }
        public string HotcHotMangementCheckNbr { get; set; }
        public DateTime? HotcHotManagementCheckReceivedDate { get; set; }
        public decimal? HotcHotManagementFeeAmt { get; set; }
        public string HotcHotManagementDecommType { get; set; }
        public string HotcHotManagementReportRejected { get; set; }
        public string HotcHotManagementHotSpId { get; set; }
        public string HotcHotManagementHotComments { get; set; }
        public DateTime? HotcHotManagementAuditDate { get; set; }
        public string LustManagementLastChangeBy { get; set; }
    }
}
