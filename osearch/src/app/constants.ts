import { Injectable } from '@angular/core';
export class Constants {
    public static readonly clientId = 'holSpa';
    public static readonly authPage = 'auth';
    public static readonly windowsLustAdminGroup = 'DEQ\\LustAdmin';
    public static readonly windowsLustProjectManagerGroup = 'DEQ\\LustProjectManager';
    public static readonly windowsOlprrReviewGroup = 'DEQ\\OlprrReview';
    public static readonly windowsLustWebDocGroup = 'DEQ\\LustWebDoc';
    public static readonly windowsDomainGroup = 'DEQ\\Domain Users';

    public static readonly web_docs_view =  'http://www.deq.state.or.us/Webdocs/Forms/Output/FPController.ashx';
    public static readonly web_docs_entry =  'http://deqapp1/WebDocs/forms/webload.aspx';
    public static readonly web_docs_Source_Id_Type = '10';
    public static readonly web_lit_url = 'http://deqapp1/website/lit/';
    public static readonly lib_app_id = 'LUST';
    public static readonly zip_format = '^\\d{5}(?:[-\\s]\\d{4})?';
    public static readonly phone_format = '^\\(?([0-9]{3})\\)?[ -.â—]?([0-9]{3})[-.â—]?([0-9]{4})$';
    public static readonly phone_place_holder = 'NNN-NNN-NNNN xNNNNN';
    public static readonly cris_invoice_contact_type = 'CRIS INVOICE CONTACT';
    public static readonly cris_invoice_affiltypecd = 'INV';
    public static readonly cris_invoice_msg = 'Invoice Contact data from CRIS system.  Information can\'t be changed from LUST system';
    public static readonly csv_file_type = '.csv';
    public static readonly xlsx_file_type = '.xlsx';
    public static readonly date_get_time = new Date().getTime();

    // ssrs
    public static readonly releasesReportedCountByRegionByCounty = 'rpt1';
    public static readonly cleanupsStartedCountByRegionByCounty = 'rpt2';
    public static readonly cleanupsCompletedCountByRegionByCounty = 'rpt3';
    public static readonly petroleumRelease = 'rpt4';
    public static readonly incidentOverview = 'rpt5';
    public static readonly starsReport = 'rpt6';
    public static readonly finalInvoiceDateEnteredByDateRangae = 'rpt7';

    // lables
    public static readonly exportToCSV = 'Export to CSV';
    public static readonly returnToSearch = 'Return to Search';
    public static readonly returnToList = 'Return to list';
}
