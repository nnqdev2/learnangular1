using System;
using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Models.Response
{
    public class ApGetImageByLustIdData
    {
 
        public int LustId { get; set; }
        public int PictureId { get; set; }
        public int SitePictureId { get; set; }
        public string Caption { get; set; }
        public DateTime PictureDate { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime? LastChangeDate { get; set; }
        public string LogNumber { get; set; }
    }
}
