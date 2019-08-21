export interface AssessmentPostResult {
    lustId: number;
    assessmentIdIn: number;
    assessmentIdOut: number;
    siteScoreIdOut: number;
    errorMessageHandler: string;
    updateSiteScore: number;
    lowScore: number;
    avgScore: number;
    highScore: number;
    scoreCount: number;
    scoreRange: string;
}
