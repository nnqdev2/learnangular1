using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApGetImageByLustIdData
    {
        [Key]
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
