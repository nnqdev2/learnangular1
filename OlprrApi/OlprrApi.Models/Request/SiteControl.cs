using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class SiteControl
    {
        public int? SiteControlId { get; set; }
        public int? ControlId { get; set; }
        public string ControlDescription { get; set; }
        public DateTime? ControlBeginDate { get; set; }
        public DateTime? ControlEndDate { get; set; }
        public short? FrequencyOfReview { get; set; }
        public string ControlComment { get; set; }
        public string LastReviewBy { get; set; }
        public DateTime? LastReviewDate { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime? LastChangeDate { get; set; }
        public int? TypeId { get; set; }
        public int? LustId { get; set; }
        public string LogNumber { get; set; }
    }
}
