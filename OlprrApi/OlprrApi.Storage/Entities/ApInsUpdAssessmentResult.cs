using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApInsUpdAssessmentResult
    {
        public int LustId { get; set; }
        public int? AssessmentIdIn { get; set; }
        public int? AssessmentIdOut { get; set; }
        public string ErrorMessageHandler { get; set; }
    }
}
