using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class ApGetScoringValuesByLustIdData
    {
        public int SiteScoreId { get; set; }
        public int DwReplMeasure { get; set; }
        public int DwImpMeasure { get; set; }
        public int DwImpLiklyMeasure { get; set; }
        public int VprLvlMeasure { get; set; }
        public int PopExposdMeasure { get; set; }
        public int EnvTypMeasure { get; set; }
        public int EnvImpLilelyMeasure { get; set; }
        public int NonDwSupTypMeasure { get; set; }
        public int UtImpMeasure { get; set; }
        public int RainfallAnnualMeasure { get; set; }
        public int SoilPermMeasure { get; set; }
        public int AqfrDepthMeasure { get; set; }
        public int SwDistMeasure { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangeDate { get; set; }
    }
}
