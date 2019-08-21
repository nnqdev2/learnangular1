export interface IAppConfig {
    env: {
        name: string;
        urlSub: string;
    };
    logging: {
        console: boolean;
        api: boolean;
    };
    caching: {
        cacheExpiryInMs: string;
    };
    apiServer: {
        hol: string;
        lit: string;
        addressContactVerify: string;
        ssrs: string;
    };
    sts: {
        authority: string;
    };
}
