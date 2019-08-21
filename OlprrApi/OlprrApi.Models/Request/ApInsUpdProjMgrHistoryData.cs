using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class ApInsUpdProjMgrHistoryData
    {
        public int ProjMgrHistId { get; set; }
        public int LustId { get; set; }
        public string PmLogin { get; set; }
        public DateTime AssignedDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string LastChangeBy { get; set; }
    }
}
