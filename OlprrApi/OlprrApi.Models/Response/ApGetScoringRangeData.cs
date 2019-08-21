using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class ApGetScoringRangeData
    {
        public int LowScore { get; set; }
        public int AvgScore { get; set; }
        public int HighScore { get; set; }
        public int ScoreCount { get; set; }
        public string ScoreRange { get; set; }
        public int LustId { get; set; }
    }
}
