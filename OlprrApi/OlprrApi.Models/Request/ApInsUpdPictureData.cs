using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class ApInsUpdPictureData
    {
        [Required]
        public int LustId { get; set; }
        [DefaultValue(0)]
        public int PictureId { get; set; }
        [DefaultValue(0)]
        public int SitePictureId { get; set; }
        public string Caption { get; set; }
        public DateTime PictureDate { get; set; }
        public string LastChangeBy { get; set; }
        public byte[] Picture { get; set; }
    }
}
