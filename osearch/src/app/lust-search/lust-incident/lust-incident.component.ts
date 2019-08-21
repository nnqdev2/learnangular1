import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-lust-incident',
  templateUrl: './lust-incident.component.html',
  styleUrls: ['./lust-incident.component.scss']
})
export class LustIncidentComponent implements OnInit {
  routeLinks: any[];
  activeLinkIndex = -1;
  background = '';



  constructor(private router: Router) {
    this.routeLinks = [
        {
            label: 'New Incident',
            link: '/lust',
            index: 0
        }, {
            label: 'Incident',
            link: './',
            index: 1
        }, {
            label: 'Contact',
            link: 'contacts',
            index: 2
        }, {
            label: 'Assessment',
            link: 'assessment',
            index: 4
        }, {
            label: 'Proj Mgrs',
            link: 'projectmanagers',
            index: 5
          }, {
            label: 'Site Alias',
            link: 'sitealiases',
            index: 6
        }, {
            label: 'Work Reported',
            link: 'wrs',
            index: 7
        }, {
            label: 'PCSS',
            link: 'pcss',
            index: 8
        }, {
            label: 'Inspections',
            link: 'inspections',
            index: 9
        }, {
            label: 'Site Control',
            link: 'sitecontrols',
            index: 10
        }, {
            label: 'Public Notice',
            link: 'pns',
            index: 11
        }, {
            label: 'Site Photos',
            link: 'sitephotos',
            index: 12
        }, {
            label: 'Consultant',
            link: 'cssearch',
            index: 13
        },

    ];
}


ngOnInit(): void {
    this.router.events.subscribe((res) => {
        this.activeLinkIndex = this.routeLinks.indexOf(this.routeLinks.find(tab => tab.link === '.' + this.router.url));
    });
}

}
