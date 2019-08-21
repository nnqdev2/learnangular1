export interface PublicNotice {
    publicNoticeId: number;
    publicNoticeTypeId: number;
    description: string;
    publicNoticeDate: Date;
    meetingDate?: Date;
    comment: string;
    meetingRqstInd: boolean;
    lastChangeBy: string;
    lastChangeDate: Date;
    lustId: number;
    logNumber: string;
}
