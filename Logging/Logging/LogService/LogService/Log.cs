
using DataService;
using DataService.DTO;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Models.Requests;
using System;
using System.Threading.Tasks;


namespace LogService
{
    public class LogServices
    {
        
        public static async Task<bool> AddExceptionLogAsync(LogData logData, string cnString, AppSettings _appSettings, ILogger _logger)
        {
            
            logDataDTO data = new logDataDTO();
            data.machineName = logData.machineName;
            data.identity = logData.identity;
            data.typeMsg = logData.typeMsg;
            data.message = logData.message;
            data.source = logData.source;
            data.targetSite = logData.targetSite;
            data.details = logData.details;
            data.routeName = logData.routeName;

            appSettingsDTO appSettings = new appSettingsDTO();
            appSettings.Extension = _appSettings.Extension;
            appSettings.FileName = _appSettings.FileName;
            appSettings.FolderPath = _appSettings.FolderPath;
            appSettings.FileRespositoryLocation = _appSettings.FileRespositoryLocation;
            


            RepositoryFactory logFactory = new RepositoryFactory();
            IStoreRepository logger;
            logger = logFactory.GetDataStore(logData.storeTypeId, null);
            var result = await logger.AddExceptionLog(data, cnString, appSettings);

            

            return result;

           
        }
    }
}
