export class PcsPcsPermit {
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
    pcsSwPermitId: number;
    swlaPermitNbr: string;
    applReceivedDate: Date;
    issueDate: Date;
    expirationDate: Date;
    permitExtensionDate: Date;
    swFeeInd: boolean;
    landUseApproveInd: boolean;
    treatmentDescription: string;
    pcsPermitLastChangeBy: string;
    pcsPermitLastChangeDate: Date;

}
