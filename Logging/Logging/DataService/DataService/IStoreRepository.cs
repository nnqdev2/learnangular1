using DataService.DTO;
using Microsoft.Extensions.Logging;
using System;

using System.Threading.Tasks;

namespace DataService
{
    public interface IStoreRepository
    {

        Task<Boolean> AddExceptionLog(logDataDTO logData, string cnString, appSettingsDTO appSettigns);
       
    }
}
