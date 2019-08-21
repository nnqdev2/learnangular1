using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApValidateLogNumberAndManagementData
    {
        [Key]
        [Column("Lust_Incident_LustId")]
        public int LustIncidentLustId { get; set; }
        [Column("Lust_Management_LustId")]
        public int? LustManagementLustId { get; set; }
        [Column("Lust_Management_MangementId")]
        public int? LustManagementMangementId { get; set; }
        [Column("Lust_Management_ReleaseStopDate")]
        public DateTime? LustManagementReleaseStopDate { get; set; }
        [Column("Lust_Management_FinalInvcRqstDate")]
        public DateTime? LustManagementFinalInvcRqstDate { get; set; }
        [Column("Hotc_HotManagement_LogNumber")]
        public string HotcHotManagementLogNumber { get; set; }
        [Column("Lust_Incident_SiteAddress")]
        public string LustIncidentSiteAddress { get; set; }
        [Column("Lust_Incident_SiteName")]
        public string LustIncidentSiteName { get; set; }
        [Column("Lust_Incident_SiteCity")]
        public string LustIncidentSiteCity { get; set; }
        [Column("Lust_Incident_SiteZip")]
        public string LustIncidentSiteZip { get; set; }
        [Column("Hotc_HotManagement_hotId")]
        public int? HotcHotManagementHotId { get; set; }
        [Column("Hotc_HotMangement_check_nbr")]
        public string HotcHotMangementCheckNbr { get; set; }
        [Column("Hotc_HotManagement_check_received_date")]
        public DateTime? HotcHotManagementCheckReceivedDate { get; set; }
        [Column("Hotc_HotManagement_fee_amt", TypeName = "decimal(15, 2)")]
        public decimal? HotcHotManagementFeeAmt { get; set; }
        [Column("Hotc_HotManagement_audit_date")]
        public DateTime? HotcHotManagementAuditDate { get; set; }
        [Column("Hotc_HotManagement_decomm_type")]
        public string HotcHotManagementDecommType { get; set; }
        [Column("Hotc_HotManagement_report_rejected")]
        public string HotcHotManagementReportRejected { get; set; }
        [Column("Hotc_HotManagement_hot_sp_id")]
        public string HotcHotManagementHotSpId { get; set; }
        [Column("Hotc_HotManagement_hot_comments")]
        public string HotcHotManagementHotComments { get; set; }
        [Column("Contact_AffilID")]
        public int? ContactAffilId { get; set; }
        [Column("Contact_Organization")]
        public string ContactOrganization { get; set; }
        [Column("Contact_FirstName")]
        public string ContactFirstName { get; set; }
        [Column("Contact_LastName")]
        public string ContactLastName { get; set; }
        [Column("Contact_Street")]
        public string ContactStreet { get; set; }
        [Column("Contact_City")]
        public string ContactCity { get; set; }
        [Column("Contact_State")]
        public string ContactState { get; set; }
        [Column("Contact_Zip")]
        public string ContactZip { get; set; }
        public string Status { get; set; }
        [Column("Lust_Incident_LogNumber")]
        public string LustIncidentLogNumber { get; set; }
        public string ServiceOwnerFullName { get; set; }
        public string ServiceOwnerLicenseStatus { get; set; }
        [Column("Lust_Management_LastChangeBy")]
        public string LustManagementLastChangeBy { get; set; }
        [Column("Lust_Management_LastChangeDate")]
        public DateTime? LustManagementLastChangeDate { get; set; }
    }
}
