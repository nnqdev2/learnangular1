using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ProjectManagerHistory
    {
        [Key]
        //[Column("ProjMgrHistID")]
        public int ProjMgrHistId { get; set; }
        public string UserName { get; set; }
        public DateTime? AssignedDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangeDate { get; set; }
        public int LustId { get; set; }
        public string LogNumber { get; set; }
    }
}
