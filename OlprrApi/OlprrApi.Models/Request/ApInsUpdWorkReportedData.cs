using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Models.Request
{
    public class ApInsUpdWorkReportedData
    {
        [Required]
        public int LustId { get; set; }
        public int WorkReportedId { get; set; }
        public int WorkReportedTypeId { get; set; }
        public DateTime WorkReportedDate { get; set; }
        public string Comment { get; set; }
        [DefaultValue(0)]
        public int? OraReid { get; set; }
        [DefaultValue(0)]
        public int? OraConsultantId { get; set; }
        public string LastChangeBy { get; set; }

    }
}
