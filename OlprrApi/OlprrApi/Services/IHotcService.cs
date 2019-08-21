using OlprrApi.Models.Response;
using System.Collections.Generic;
using System.Threading.Tasks;
using RequestDto = OlprrApi.Models.Request;
using ResponseDto = OlprrApi.Models.Response;
namespace OlprrApi.Services
{
    public interface IHotcService
    {
        Task<IEnumerable<ResponseDto.HotcSearchFilterResultStats>> Search(RequestDto.HotcSearchFilter hotcSearchFilter);
        Task<IEnumerable<ResponseDto.HotcContact>> GetHotcContacts(int lustId);
        Task<ApValidateLogNumberAndManagementData> ValidateLogNumberAndManagementData(int lustId);
        Task<ApGenericResult> InsUpdHotcLustData(RequestDto.ApInsUpdHotcLustData apInsUpdHotcLustData);
        Task<ApGetCleanDecommByHotIdData> GetCleanDecommByHotIdData(int hotId);
        Task<ApGenericResult> InsUpdHotcCleanDecommData(RequestDto.ApGetCleanDecommByHotIdData apGetCleanDecommByHotIdData);
        Task<ServiceProvider> GetHotServiceProviderData(int licenseNbr);
    }
}
