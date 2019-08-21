using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApInsUpdPictureData
    {
        public int LustId { get; set; }
        public int PictureId { get; set; }
        public int SitePictureId { get; set; }
        public string Caption { get; set; }
        public DateTime PictureDate { get; set; }
        public string LastChangeBy { get; set; }
        public byte[] Picture { get; set; }
    }
}
