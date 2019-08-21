using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Models.Requests
{

    public class LogData
    {
        public int storeTypeId { get; set; }

        [Required]
        [StringLength(20, ErrorMessage = "MachineName maximum length is 20 characters")]
        public string machineName { get; set; }
        public string identity { get; set; }
        public string typeMsg { get; set; }

        public string message { get; set; }
        public string source { get; set; }
        public string targetSite { get; set; }
        public string details { get; set; }
        public string routeName { get; set; }
    }

}
