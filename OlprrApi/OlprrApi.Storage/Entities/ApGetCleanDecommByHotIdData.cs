using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace OlprrApi.Storage.Entities
{
    public class ApGetCleanDecommByHotIdData
    {
        [Key]
        [Column("hot_id")]
        public int HotId { get; set; }
        [Column("dhot_county")]
        public string DhotCounty { get; set; }
        [Column("dhot_year")]
        public string DhotYear { get; set; }
        [Column("hot_street_nbr")]
        public string HotStreetNbr { get; set; }
        [Column("hot_street_quad")]
        public string HotStreetQuad { get; set; }
        [Column("hot_street_nm")]
        public string HotStreetNm { get; set; }
        [Column("hot_street_type")]
        public string HotStreetType { get; set; }
        [Column("hot_addr_cmnt")]
        public string HotAddrCmnt { get; set; }
        [Column("hot_city")]
        public string HotCity { get; set; }
        [Column("hot_zip")]
        public string HotZip { get; set; }
        [Column("rp_first_nm")]
        public string RpFirstNm { get; set; }
        [Column("rp_last_nm")]
        public string RpLastNm { get; set; }
        [Column("rp_company_nm")]
        public string RpCompanyNm { get; set; }
        [Column("rp_street_nbr")]
        public string RpStreetNbr { get; set; }
        [Column("rp_street_quad")]
        public string RpStreetQuad { get; set; }
        [Column("rp_street_nm")]
        public string RpStreetNm { get; set; }
        [Column("rp_street_type")]
        public string RpStreetType { get; set; }
        [Column("rp_addr_cmnt")]
        public string RpAddrCmnt { get; set; }
        [Column("rp_city")]
        public string RpCity { get; set; }
        [Column("rp_state")]
        public string RpState { get; set; }
        [Column("rp_zip")]
        public string RpZip { get; set; }
        [Column("decommission_date")]
        public DateTime? DecommissionDate { get; set; }
        [Column("file_closed_date")]
        public DateTime? FileClosedDate { get; set; }
        [Column("hot_sp_id")]
        public string HotSpId { get; set; }
        [Column("check_received_date")]
        public DateTime? CheckReceivedDate { get; set; }
        [Column("decomm_type")]
        public string DecommType { get; set; }
        [Column("check_nbr")]
        public string CheckNbr { get; set; }
        [Column("fee_amt", TypeName = "decimal(15, 2)")]
        public decimal? FeeAmt { get; set; }
        [Column("audit_date")]
        public DateTime? AuditDate { get; set; }
        [Column("report_rejected")]
        public string ReportRejected { get; set; }
        [Column("hot_comments")]
        public string HotComments { get; set; }
        public int? PersonId { get; set; }
        public string FullName { get; set; }
        public string LicenseStatus { get; set; }
    }
}
