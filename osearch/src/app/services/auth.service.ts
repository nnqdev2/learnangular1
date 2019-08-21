import { Injectable, Inject } from '@angular/core';
import { UserManager, UserManagerSettings, User, WebStorageStateStore } from 'oidc-client';
import { Router } from '@angular/router';
import { AppConfig } from '../app.config';
import { Constants } from '../constants';

export enum AuthLevel {
  Domain,
  WebDoc,
  PM,
  Admin
}

@Injectable({
  providedIn: 'root'
})

export class AuthService {
  private manager: UserManager = null;
  private user: User = null;
  private isLustAdmin = false;
  private isOlprrReview = false;
  private isLustProjectManager = false;
  private isLustWebDoc = false;
  private authLevel = AuthLevel.Domain;

  constructor(private router: Router) {
    this.manager = new UserManager(this.getSettings());
    this.manager.getUser().then(user => {
      if (user && !user.expired) {
        this.user = user;
      }
    });
    this.manager.events.addUserLoaded(() => {
      this.manager.getUser().then(user => {
        this.user = user;
      });
    });
  }

  isLoggedIn(): boolean {
    if (this.user  !== undefined && this.user !== null
      && this.user.access_token  ) {
      return true;
    }
    return false;
  }

  getClaims(): any {
    return this.user.profile;
  }

  getAccessToken(): string {
    return this.user ? this.user.access_token : '';
  }

  getIdToken(): string {
    return this.user ? this.user.id_token : '';
  }

  getProfile(): any {
    return this.user ? this.user.profile : '';
  }

  getAuthorizationHeaderValue(): string {
    return `${this.user.token_type} ${this.user.access_token}`;
  }

  async startAuthentication(): Promise<void> {
    return await this.manager.signinRedirect();
  }

  async completeAuthentication(): Promise<void> {
    await this.manager.signinRedirectCallback();
    this.setPermissions();
    this.setAuthLevel();
    window.history.replaceState({},
      window.document.title,
      window.location.origin);
    const clientRoot = this.getClientRoot();
    const returnUrl = localStorage.getItem(`${clientRoot}:${Constants.authPage}`);
    this.router.navigate([returnUrl]);
    localStorage.removeItem(`${clientRoot}:${Constants.authPage}`);
  }

  isLustAdminRole(): boolean {
    this.setLustAdmin();
    return (this.isLoggedIn () ? this.isLustAdmin : false);
    // return false;
  }

  isLustProjectManagerRole(): boolean {
    this.setLustProjectManager();
    return (this.isLoggedIn () ? this.isLustProjectManager : false);
    // return false;
  }

  isLustWebDocRole(): boolean {
    this.setLustWebDoc();
    return (this.isLoggedIn () ? this.isLustWebDoc : false);
    // return false;
  }

  setPermissions(): void {
    this.setLustWebDoc();
    this.setLustProjectManager();
    this.setLustAdmin();
  }

  private setLustAdmin(): void {
    this.isLustAdmin = ((this.user.profile.role.indexOf(Constants.windowsLustAdminGroup) > -1) ? true : false);
  }

  private setLustProjectManager(): void {
    this.isLustProjectManager = ((this.user.profile.role.indexOf(Constants.windowsLustProjectManagerGroup) > -1) ? true : false);
  }

  private setLustWebDoc(): void {
    this.isLustWebDoc = ((this.user.profile.role.indexOf(Constants.windowsLustWebDocGroup) > -1) ? true : false);
  }

  private setAuthLevel()  {
    if (this.isLustAdminRole() ) {
      this.authLevel = AuthLevel.Admin;
    } else if (this.isLustProjectManagerRole()) {
      this.authLevel = AuthLevel.PM;
    } else if (this.isLustWebDocRole()) {
      this.authLevel = AuthLevel.WebDoc;
    } else {
      this.authLevel = AuthLevel.Domain;
    }
  }

  getAuthLevel(): AuthLevel {
    this.setAuthLevel();
    return this.authLevel;
  }

  getUserIdWoDomain(): string {
    return (this.isLoggedIn () ? (  this.user.profile.name.slice(this.user.profile.name.indexOf('\\')  + 1)  ).toUpperCase() : null);
  }

  getHostName(): string {
    return location.origin;
  }

  getClientRoot(): string {
    let x: string;
    if (this.getHostName().indexOf('localhost') > 0) {
      x = '/';
    } else {
      x = `/${AppConfig.urlSub}/`;
    }
    return this.getHostName() + x;
  }

  private getSettings(): UserManagerSettings {
    const clientRoot = this.getClientRoot();
    return {
      authority: AppConfig.authority,
      client_id: Constants.clientId,
      redirect_uri: `${clientRoot}auth-callback`,
      post_logout_redirect_uri: `${clientRoot}`,
      response_type: 'id_token token',
      scope: 'openid profile',
      filterProtocolClaims: true,
      loadUserInfo: true,
      userStore: new WebStorageStateStore({ store: window.localStorage }),
    };
  }

}


