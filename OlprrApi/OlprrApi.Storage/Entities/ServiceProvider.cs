using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ServiceProvider
    {
        [Key]
        public int LicenseNbr { get; set; }
        public string FullName { get; set; }

        public string LicenseStatus { get; set; }
    }
}
