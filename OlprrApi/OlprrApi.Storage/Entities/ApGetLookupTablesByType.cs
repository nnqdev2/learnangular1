using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Storage.Entities
{
    public class ApGetLookupTablesByType
    {
        [Key]
        public int Id { get; set; }
        public string Descript { get; set; }
    }
}
