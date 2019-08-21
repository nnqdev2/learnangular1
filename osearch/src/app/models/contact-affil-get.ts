export interface ContactAffilGet {
    affilId: number;
    affilTypeCd: string;
    affilTypeDesc?: string;
    startDt?: Date;
    endDt?: Date;
    partyId?: number;
    organization?: string;
    subOrganization?: string;
    jobTitle?: string;
    firstName?: string;
    lastName?: string;
    phone: string;
    email: string;
    street: string;
    city: string;
    state: string;
    zip: string;
    country: string;
    affilComments: string;
    lastUpdBy: string;
    lastUpdDttm: Date;
    zp4Checked: number;
    lustId: number;
    crisCheck: number;
    logNumber: string;
    releaseType: string;
}
