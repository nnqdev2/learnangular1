import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './services/auth.service';
import { Constants } from './constants';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  routeLinks: any[];
  activeLinkIndex = -1;
  background = '';

  public LUSTId: string;
  public LUSTIdKey: string;
  showCreateNewIncident = false;

  constructor(private router: Router, private authService: AuthService) {
  }

  ngOnInit(): void {
  }

  private checkProfile(): void {
    this.showCreateNewIncident = false;
    if (this.authService.isLustAdminRole()) {
      this.showCreateNewIncident = true;
    }
  }

  routeIncident(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log(lustIDKeyIdentifier.textContent);
    console.log('Routing to Incident using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent]);
    this.closeNav();
  }



  routeContacts(): void {

    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log(lustIDKeyIdentifier.textContent);
    console.log('Routing to Contacts using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/contacts']);
    this.closeNav();
  }

  routeAssessment(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Assessment using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/assessment']);
    this.closeNav();
  }


  routeProjMgrs(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Project Managers using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/projectmanagers']);
    this.closeNav();
  }

  routeSiteAlias(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Site Aliases using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/sitealiases']);
    this.closeNav();
  }

  routeWorkReported(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Work Reported using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    // this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/wrs']);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/wrs']);
    this.closeNav();
  }

  routePCSS(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to PCSS using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/pcss']);
    this.closeNav();
  }

  routeInspections(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Inspections using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/inspections']);
    this.closeNav();
  }

  routeSiteControl(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Site Controls using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/sitecontrols']);
    this.closeNav();
  }

  routePublicNotice(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Public Notices using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/pns']);
    this.closeNav();
  }

  routeSitePhotos(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Site Photos using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/sitephotos']);
    this.closeNav();
  }

  routeConsultant(): void {
    const lustIDKeyIdentifier = document.getElementById('LUSTIdKey');
    console.log('Routing to Consultants using LustIDKey value = ' + lustIDKeyIdentifier.textContent);
    console.log(lustIDKeyIdentifier.textContent);
    this.router.navigate(['/lust/' + lustIDKeyIdentifier.textContent + '/cssearch']);
    this.closeNav();
  }


openNav(): void {
    // console.log('Open Nav');
    this.checkProfile();
    document.getElementById('sidenav').style.width = '250px';
  }

  closeNav(): void {
    // console.log('Close Nav');
    document.getElementById('sidenav').style.width = '0';
  }




  // constructor(private router: Router, private authService: AuthService) {
  //   this.routeLinks = [
  //       {
  //           label: 'OLPRR Reporting',
  //           link: '/incident',
  //           index: 0
  //       }, {
  //           label: 'OLPRR Search',
  //           link: '/osearch',
  //           index: 1
  //       }, {
  //           label: 'LUST Search',
  //           link: '/lsearch',
  //           index: 2
  //       }, {
  //           label: 'UST Search',
  //           link: '/usearch',
  //           index: 4
  //       }, {
  //           label: 'Contact Search',
  //           link: '/csearch',
  //           index: 5
  //       }, {
  //           label: 'HOTC Decomm Search',
  //           link: '/dsearch',
  //           index: 6
  //       },
  //        {

  //           link: '.contacts',
  //           index: 2
  //       }
  //   ];
  // }

  // ngOnInit(): void {
  //     this.router.events.subscribe((res) => {
  //         this.activeLinkIndex = this.routeLinks.indexOf(this.routeLinks.find(tab => tab.link === '.' + this.router.url));
  //     });
  // }



}

