using System;
using System.ComponentModel.DataAnnotations;

namespace DataService
{
    public class logDataDTO
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
