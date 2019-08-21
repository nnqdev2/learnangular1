using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Storage.Entities
{
    public class ApGetLookupTablesByType2
    {
        [Key]
        public string Sid { get; set; }
        public string Descript { get; set; }
    }
}
