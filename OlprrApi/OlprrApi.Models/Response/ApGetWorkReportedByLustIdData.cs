using System;

namespace OlprrApi.Models.Response
{
    public class ApGetWorkReportedByLustIdData
    {
        public int WrId { get; set; }
        public DateTime WrkDate { get; set; }
        public int WorkTypeId { get; set; }
        public string WrkDesc { get; set; }
        public string WorkBy { get; set; }
        public string SidWorkBy { get; set; }
        public string Comment { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangeDate { get; set; }
        public int LustId { get; set; }
        public string LogNumber { get; set; }
    }
}
