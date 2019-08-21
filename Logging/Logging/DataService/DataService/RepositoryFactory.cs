using Microsoft.Extensions.Configuration;


namespace DataService
{
    public class RepositoryFactory 

    {
        public IStoreRepository GetDataStore(int storeTypeId, IConfiguration config)
        {
            IStoreRepository storeRepository = null;

            switch (storeTypeId)
            {
                case 1:
                    storeRepository = new DataDBRepository(config);
                    break;
                case 2:
                    storeRepository = new FileRepository(config);
                    break;
            }
            return storeRepository;
        }

    }
}
