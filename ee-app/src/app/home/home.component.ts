import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor() { }

  ngOnInit() {    
  }
  venues = [
    {'Id':1, 'Name':'Abc Function hall', 'Photos':'/assets/images/noimage.jpg','Address':'ancd ad','Area':'dhbh','Phone':'989','Capacity':'100'},
    {'Id':2, 'Name':'Xyz Function hall', 'Photos':'/assets/images/venues/3/1.JPG','Address':'ancd ad','Area':'dhbh','Phone':'989','Capacity':'100'},
    {'Id':3, 'Name':'123 Function hall', 'Photos':'/assets/images/noimage.jpg','Address':'ancd ad','Area':'dhbh','Phone':'989','Capacity':'100'}
  ]
  packages = [
    {'Id':1,'Name':'Package 1','Price':'123','ItemsCount':'10'},
    {'Id':2,'Name':'Package 2','Price':'234','ItemsCount':'15'},
    {'Id':3,'Name':'Package 3','Price':'345','ItemsCount':'20'}
  ]

  showPackage(id){
    location.href='../vijayawada/catering/package-'+id;
  }

  showVenue(id,name){
    location.href='../vijayawada/venue/'+id+name;
  }
  
}
