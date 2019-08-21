
using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Storage.Entities
{
    public class ApGetScoringRangeData
    {

        public int LowScore { get; set; }
        public int AvgScore { get; set; }
        public int HighScore { get; set; }
        public int ScoreCount { get; set; }
        public string ScoreRange { get; set; }
        [Key]
        public int LustId { get; set; }
    }
}
