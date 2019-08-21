using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApGetAssessmentSiteScoreValuesRangesByLustId
    {
        [Key]
        public int AssessmentId { get; set; }
        public DateTime? DiscoverDate { get; set; }
        public Boolean? CleanupNecessaryInd { get; set; }
        public Boolean? MigrationInd { get; set; }
        public int? ConfirmationId { get; set; }
        public int? DiscoveryId { get; set; }
        public int? ReleaseCauseId { get; set; }
        public int? ReleaseSourceId { get; set; }
        public Boolean? SLMediaInd { get; set; }
        public Boolean? GWMediaInd { get; set; }
        public Boolean? SWMediaInd { get; set; }
        public Boolean? DWMediaInd { get; set; }
        public Boolean? FVMediaInd { get; set; }
        public Boolean? FPMediaInd { get; set; }
        public Boolean? UNMediaInd { get; set; }
        public Boolean? UGContamInd { get; set; }
        public Boolean? LGContamInd { get; set; }
        public Boolean? MGContamInd { get; set; }
        public Boolean? DSContamInd { get; set; }
        public Boolean? WOContamInd { get; set; }
        public Boolean? LBContamInd { get; set; }
        public Boolean? SVContamInd { get; set; }
        public Boolean? OPContamInd { get; set; }
        public Boolean? CHContamInd { get; set; }
        public Boolean? UNContamInd { get; set; }
        public Boolean? MTBEContamInd { get; set; }
        public Boolean? HOContamInd { get; set; }
        public Boolean? FPRemovedInd { get; set; }
        public Boolean? VPRemovedInd { get; set; }
        public Boolean? DelineateSL { get; set; }
        public Boolean? DelineateGW { get; set; }
        public Boolean? SLDelineated { get; set; }
        public Boolean? GWDelineated { get; set; }
        public Boolean? GWCompMonitoring { get; set; }
        public Boolean? CAPRequested { get; set; }
        public Boolean? CAPSubmitted { get; set; }
        public Boolean? CAPApproved { get; set; }
        public int CurrentSiteScore { get; set; }
        public string AmntReleaseComment { get; set; }
        public string ContamComment { get; set; }
        public string AssessmentLastChangeBy { get; set; }
        public DateTime? AssessmentLastChangeDate { get; set; }

        //-- Site Score Values
        public int? SiteScoreId { get; set; }
        public int? DwReplMeasure { get; set; }
        public int? DwImpMeasure { get; set; }
        public int? DwImpLiklyMeasure { get; set; }
        public int? VprLvlMeasure { get; set; }
        public int? PopExposdMeasure { get; set; }
        public int? EnvTypMeasure { get; set; }
        public int? EnvImpLilelyMeasure { get; set; }
        public int? NonDwSupTypMeasure { get; set; }
        public int? UtImpMeasure { get; set; }
        public int? RainfallAnnualMeasure { get; set; }
        public int? SoilPermMeasure { get; set; }
        public int? AqfrDepthMeasure { get; set; }
        public int? SwDistMeasure { get; set; }
        public string SiteScoreLastChangeBy { get; set; }
        public DateTime? SiteScoreLastChangeDate { get; set; }
        public int LowScore { get; set; }
        public int AvgScore { get; set; }
        public int HighScore { get; set; }
        public int ScoreCount { get; set; }
        public string ScoreRange { get; set; }
        public int LustId { get; set; }
    }
}
