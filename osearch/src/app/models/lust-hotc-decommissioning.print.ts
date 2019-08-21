export class DecommissioningPrint {

    /*
        1 = Lust Home Owner
        2 = Lust Service Provider
        3 = HOTC Home Owner
        4 = HOTC Service Provider
    */
    printType: number;


    //     ADDRESS_HEADER = Made up of the following: Either (RP FirstName + RP LastName
    //     + RP Company Or RP First
    //         +    RP LastName OR RP Company)
    // + RP Address + RP City + , RP State + RP Zip

    organization: string ;
    firstName: string ;
    lastName: string ;

    // LUST AND HOT
    city: string ;
    state: string ;
    zipcode: string ;

    // LUST ONLY
    address: string ;
    street: string ;

    // HOT ONLY

    addressComment: string;
    streetNbr: string;
    quadrant: string;
    streetName: string;
    streetType: string;

    // LUST ONLY ADDRESS = value of the Site Address + City + , Oregon

    lustIncidentSiteName: string;
    lustIncidentSiteCity: string;
    lustIncidentSiteZip: string;

    // RE_ITEM = incident Site address

    lustIncidentSiteAddress: string;

    // COMPANY_NAME = Service Provider name
    serviceProviderName: string;

    // HOT_ID = Hot City + - + Hot Year + - + Hot Sequence # (txtHotCounty & "-" & txtHotYear & "-" & txtHotSeq)
    logNumber: string;
    logCounty: number;
    logYear: number;
    logSeq: number;

    // HOT_ID = Hot ID
    hotId: number;
    hotStreetNbr: string;
    hotStreetQuad: string;
    hotStreetNm: string;
    hotStreetType: string;
    hotAddrCmnt: string;
    hotCity: string;
    hotZipcode: string;

}

export enum DecommPrintType {
    LustHomeOwner = 1,
    LustServiceProvider = 2,
    HotcHomeOwner = 3,
    HotcServiceProvider = 4
  }
