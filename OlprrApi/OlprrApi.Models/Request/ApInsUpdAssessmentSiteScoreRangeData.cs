using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class ApInsUpdAssessmentSiteScoreRangeData
    {
        public int LustId { get; set; }
        public int? AssessmentId { get; set; }
        public DateTime? DiscoverDate { get; set; }
        public int? ConfirmationId { get; set; }
        public int? DiscoveryId { get; set; }
        public int? ReleaseCauseId { get; set; }
        public int? ReleaseSourceId { get; set; }
        public Boolean? SLMediaInd { get; set; } = false;
        public Boolean? GWMediaInd { get; set; } = false;
        public Boolean? SWMediaInd { get; set; } = false;
        public Boolean? WMediaInd { get; set; } = false;
        public Boolean? DWMediaInd { get; set; } = false;
        public Boolean? FVMediaInd { get; set; } = false;
        public Boolean? FPMediaInd { get; set; } = false;
        public Boolean? UNMediaInd { get; set; } = false;
        public Boolean? UGContamInd { get; set; } = false;
        public Boolean? LGContamInd { get; set; } = false;
        public Boolean? MGContamInd { get; set; } = false;
        public Boolean? DSContamInd { get; set; } = false;
        public Boolean? WOContamInd { get; set; } = false;
        public Boolean? LBContamInd { get; set; } = false;
        public Boolean? SVContamInd { get; set; } = false;
        public Boolean? OPContamInd { get; set; } = false;
        public Boolean? CHContamInd { get; set; } = false;
        public Boolean? UNContamInd { get; set; } = false;
        public Boolean? MTBEContamInd { get; set; } = false;
        public Boolean? CleanupNecessaryInd { get; set; } = false;
        public Boolean? OffSiteMigrationInd { get; set; } = false;
        public Boolean? HOContamInd { get; set; } = false;
        public Boolean? FPRemovedInd { get; set; } = false;
        public Boolean? VPRemovedInd { get; set; } = false;
        public Boolean? DelineateSL { get; set; } = false;
        public Boolean? DelineateGW { get; set; } = false;
        public Boolean? SLDelineated { get; set; } = false;
        public Boolean? GWDelineated { get; set; } = false;
        public Boolean? GWCompMonitoring { get; set; } = false;
        public Boolean? CAPRequested { get; set; } = false;
        public Boolean? CAPSubmitted { get; set; } = false;
        public Boolean? CAPApproved { get; set; } = false;
        public int? CurrentSiteScore { get; set; } = 0;
        public string AmntReleaseComment { get; set; }
        public string ContamComment { get; set; }
        public string LastChangeBy { get; set; }

        public int? SiteScoreIdIn { get; set; } = 0;
        public int? DwReplmeasr { get; set; } = 0;
        public int? DwImpmeasr { get; set; } = 0;
        public int? DwImpLiklymeasr { get; set; } = 0;
        public int? VprLvlmeasr { get; set; } = 0;
        public int? PopExposdmeasr { get; set; } = 0;
        public int? EnvTypmeasr { get; set; } = 0;
        public int? EnvImpLilelymeasr { get; set; } = 0;
        public int? NonDwSupTypmeasr { get; set; } = 0;
        public int? UtImpmeasr { get; set; } = 0;
        public int? RainfallAnnualmeasr { get; set; } = 0;
        public int? SoilPermmeasr { get; set; } = 0;
        public int? AqfrDepthmeasr { get; set; } = 0;
        public int? SwDistmeasr { get; set; } = 0;
    }
}
