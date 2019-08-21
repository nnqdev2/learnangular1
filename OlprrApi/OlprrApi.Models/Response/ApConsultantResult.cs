using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class ApConsultantResult
    {
        public int? ConsultantIdIn { get; set; }
        public int? ConsultantIdOut { get; set; }
        public string ErrorMessageHandler { get; set; }
    }
}
