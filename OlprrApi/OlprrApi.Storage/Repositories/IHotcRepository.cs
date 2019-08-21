using System.Collections.Generic;
using System.Threading.Tasks;
using OlprrApi.Storage.Entities;

namespace OlprrApi.Storage.Repositories
{
    public interface IHotcRepository
    {
        Task<IEnumerable<HotcSearchFilterResultStats>> ApGetHotcData(HotcSearchFilter hotcSearchFilter);
        Task<IEnumerable<HotcContact>> ApGetHotcContacts(int lustId);
        Task<ApValidateLogNumberAndManagementData> ApValidateLogNumberAndManagementData(int lustId);
        Task<ApGenericResult> ApInsUpdHotcLustData(ApInsUpdHotcLustData apInsUpdHotcLustData);
        Task<ApGetCleanDecommByHotIdData> ApGetCleanDecommByHotIdData(int hotId);
        Task<ApGenericResult> ApInsUpdHotcCleanDecommData(ApGetCleanDecommByHotIdData apGetCleanDecommByHotIdData);
        Task<ServiceProvider> ApGetHotServiceProviderData(int licenseNbr);
    }
}
