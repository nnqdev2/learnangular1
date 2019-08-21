using DataService.DTO;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Text;
using System.Threading.Tasks;


namespace DataService
{
    public class FileRepository : IStoreRepository
    {
    
      
        private readonly IConfiguration config;

        public FileRepository(IConfiguration _config)
        {
            config = _config;
        }


        public async Task<bool> AddExceptionLog(logDataDTO logData, string cnString, appSettingsDTO _appSettings)
        {
            AppSettings appSettings = new AppSettings();
            appSettings.Extension = _appSettings.Extension;
            appSettings.FileName = _appSettings.FileName;
            appSettings.FolderPath = _appSettings.FolderPath;
            appSettings.FileRespositoryLocation = _appSettings.FileRespositoryLocation;

            bool rtn = false;
            string outputFileName = GetOutputFileName(appSettings);
            try
            { 
                using (System.IO.StreamWriter sw = System.IO.File.AppendText(outputFileName))
                {
                    string serverName = GetServerName(logData.routeName);
                    StringBuilder sb = new StringBuilder();
                    try
                    {
                       //logger.LogWarning(0, "Writing to file");
                        sb.Append(System.DateTime.Now + "\t" + serverName + "\t" + logData.machineName + "\t" + logData.identity + "\t" + logData.typeMsg + "\t" + logData.message + "\t" + logData.source + "\t" + logData.targetSite + "\t" + logData.details);
                        string swline = sb.ToString();
                        await sw.WriteLineAsync(swline);
                        sw.Close();
                        rtn = true;
                    }
                    catch 
                    {
                        rtn = false;
                    }
                }   
            }
            catch (System.IO.IOException ex)
            {
                System.Diagnostics.Debug.Print(ex.Message + "\n" + ex.InnerException);
            }



            return rtn;

        }

        private string GetOutputFileName(AppSettings appSettings)
        {
            

            bool bUseConfigured = false;
            string filename = string.Empty;
            try
            {
                //filename =  appSettings.FileRespositoryLocation + charSlash + appSettings.FolderPath + charSlash + appSettings.FileName + System.DateTime.Now.ToString("MMddyy") + "." + appSettings.Extension;
                filename = appSettings.FileRespositoryLocation + System.DateTime.Now.ToString("MMddyy") + "." + appSettings.Extension;
            }
            catch
            {
            }

            try {
                if (!System.IO.File.Exists(filename))
                {
                    System.IO.File.Create(filename);
                    bUseConfigured = true;
                }
                else
                    bUseConfigured = true;
            }
            catch 
            {
                bUseConfigured = false;
            }

            if (bUseConfigured == false)
                filename = System.Environment.GetEnvironmentVariable("TEMP") + "\\LogFile_" +  System.DateTime.Now.ToString("MMddyy") + ".txt";

            return filename;
        }

        private string GetServerName (string routeName)
        {
            string rtn = string.Empty;
            try
            {
                string[] lastindexSlash = routeName.Split("/");
                if (lastindexSlash.Length != 0)
                    rtn = lastindexSlash[lastindexSlash.Length - 1].ToString();

                if (string.IsNullOrWhiteSpace(rtn))
                    rtn = "Unknown";
            }
            catch
            {
                rtn = "Unknown";
            }
            return rtn;

        }
    }
}
