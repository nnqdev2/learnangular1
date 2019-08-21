using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OlprrApi.Storage.Entities
{
    public class PcsPermit
    {
        [Key]
        public int PcsSwPermitId { get; set; }
        public int PcsId { get; set; }
        public string SwlaPermitNbr { get; set; }
        public DateTime? ApplReceivedDate { get; set; }
        public DateTime? IssueDate { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public DateTime? PermitExtensionDate { get; set; }
        public Boolean? SwFeeInd { get; set; }
        public Boolean? LandUseApproveInd { get; set; }
        public string TreatmentDescription { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime? LastChangeDate { get; set; }
        //public int LustId { get; set; }
        //public string LogNumber { get; set; }
    }
}
