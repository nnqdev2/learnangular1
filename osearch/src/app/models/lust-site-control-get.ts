export interface LustSiteControlGet {
    siteControlId: number;
    controlId: number;
    controlBeginDate: Date;
    controlEndDate: Date;
    frequencyOfReview: number;
    controlComment: string;
    lastReviewBy: string;
    lastReviewDate: Date;
    lastChangeBy: string;
    lastChangeDate: Date;
    typeId: number;
    lustId: number;
    logNumber: string;
}
