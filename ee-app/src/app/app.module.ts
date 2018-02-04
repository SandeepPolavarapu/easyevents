import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { DefaultUrlSerializer, RouterModule, Routes, UrlSerializer, UrlTree  } from '@angular/router';

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { VenueComponent } from './venue/venue.component';
import { VenueDetailComponent } from './venue-detail/venue-detail.component';
import { CateringComponent } from './catering/catering.component';
import { PackageDetailComponent } from './package-detail/package-detail.component';
import { ContactComponent } from './contact/contact.component';

const routes: Routes = [
  { path: '', component: HomeComponent },  
  { path: ':name/venue', component: VenueComponent },
  { path: ':name/venue/:id', component: VenueDetailComponent },  
  { path: ':name/catering', component: CateringComponent },
  { path: ':name/catering/:id', component: PackageDetailComponent },  
  { path: 'contact', component: ContactComponent }
];

class LowerCaseUrlSerializer extends DefaultUrlSerializer {
  parse(url: string): UrlTree {
      return super.parse(url.toLowerCase());
  }
}
@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    VenueComponent,
    VenueDetailComponent,
    CateringComponent,
    PackageDetailComponent,
    ContactComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(routes)
  ],
  providers: [
    {
      provide: UrlSerializer,
      useClass: LowerCaseUrlSerializer
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }