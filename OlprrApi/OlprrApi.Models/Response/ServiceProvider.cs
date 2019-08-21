using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class ServiceProvider
    {
        public int LicenseNbr { get; set; }
        public string FullName { get; set; }

        public string LicenseStatus { get; set; }
    }
}
