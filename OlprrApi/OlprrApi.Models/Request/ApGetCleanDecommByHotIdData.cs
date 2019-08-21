using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class ApGetCleanDecommByHotIdData
    {
        public int HotId { get; set; }
        public string DhotCounty { get; set; }
        public string DhotYear { get; set; }
        public string HotStreetNbr { get; set; }
        public string HotStreetQuad { get; set; }
        public string HotStreetNm { get; set; }
        public string HotStreetType { get; set; }
        public string HotAddrCmnt { get; set; }
        public string HotCity { get; set; }
        public string HotZip { get; set; }
        public string RpFirstNm { get; set; }
        public string RpLastNm { get; set; }
        public string RpCompanyNm { get; set; }
        public string RpStreetNbr { get; set; }
        public string RpStreetQuad { get; set; }
        public string RpStreetNm { get; set; }
        public string RpStreetType { get; set; }
        public string RpAddrCmnt { get; set; }
        public string RpCity { get; set; }
        public string RpState { get; set; }
        public string RpZip { get; set; }
        public DateTime? DecommissionDate { get; set; }
        public DateTime? FileClosedDate { get; set; }
        public string HotSpId { get; set; }
        public DateTime? CheckReceivedDate { get; set; }
        public string DecommType { get; set; }
        public string CheckNbr { get; set; }
        public decimal? FeeAmt { get; set; }
        public DateTime? AuditDate { get; set; }
        public string ReportRejected { get; set; }
        public string HotComments { get; set; }
        public int? PersonId { get; set; }
        public string FullName { get; set; }
        public string LicenseStatus { get; set; }
    }
}
