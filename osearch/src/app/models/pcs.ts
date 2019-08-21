export class Pcs {
    pcsId: number;
    dispLandfillFacId?: number;
    dispThrmFacId?: number;
    onSiteDisposalInd?: boolean;
    offSiteDispAddr: string;
    soilStatusId?: number;
    soilStatusCode?: string;
    landfillAmtYrds3?: number;
    thermalAmtYrds3?: number;
    onSiteAmtYrds3?: number;
    offSiteAmtYrds3?: number;
    disposalDate: Date;
    pcsComment: string;
    lastChangeby: string;
    lastChangeDate: Date;
    lustId: number;
    logNumber: string;
    swlaPermitNbr: string;
}
