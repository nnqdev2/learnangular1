
namespace OlprrApi.Models.Response
{
    public class ApInsUpdAssessmentSiteScoreRangeResult
    {
        public int LustId { get; set; }
        public int? AssessmentIdIn { get; set; } = 0;
        public int? AssessmentIdOut { get; set; } = 0;
        public int? SiteScoreIdIn { get; set; } = 0;
        public int? SiteScoreIdOut { get; set; } = 0;
        public string ErrorMessageHandler { get; set; }
        public int? UpdateSiteScore { get; set; } = 0;
        public int? LowScore { get; set; } = 0;
        public int? AvgScore { get; set; } = 0;
        public int? HighScore { get; set; } = 0;
        public int? ScoreCount { get; set; } = 0;
        public string ScoreRange { get; set; }
    }
}
