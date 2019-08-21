using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class PcsPermit
    {
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
