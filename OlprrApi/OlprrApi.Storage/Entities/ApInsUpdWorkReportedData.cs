using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApInsUpdWorkReportedData
    {
        public int LustId { get; set; }
        public int WorkReportedId { get; set; }
        public int WorkReportedTypeId { get; set; }
        public DateTime WorkReportedDate { get; set; }
        public string Comment { get; set; }
        public int? OraReid { get; set; }
        public int? OraConsultantId { get; set; }
        public string LastChangeBy { get; set; }
    }
}
