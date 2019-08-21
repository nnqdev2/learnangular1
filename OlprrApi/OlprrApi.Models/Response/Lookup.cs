using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class LookUp
    {
        public int Id { get; set; }
        public string DataType { get; set; }

        public string CodeValue { get; set; }
        public string NameValue { get; set; }
    }
}
