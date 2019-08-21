using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Storage.Entities
{
    public class ActiveProjectManager
    {
        [Key]
        public string PmLogin { get; set; }
        public string PmName { get; set; }
    }
}
