using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Models.Response
{
    public class ApGetLookupTablesByType
    {
        [Key]
        public int Id { get; set; }
        public string Descript { get; set; }
    }
}
