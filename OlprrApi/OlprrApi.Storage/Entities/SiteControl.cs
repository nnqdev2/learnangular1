using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OlprrApi.Storage.Entities
{
    public class SiteControl
    {
        [Key]
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
        [Column("fkLustId")]
        public int? LustId { get; set; }
        public string LogNumber { get; set; }
    }
}
