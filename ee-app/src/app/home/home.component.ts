import { Component, OnInit } from '@angular/core';

declare var require: any;
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {  
  constructor() { }

  ngOnInit() {    
  }
  
  // venues = [
  //   {'Id':1, 'Name':'Abc Function hall', 'Photos':'/assets/images/noimage.jpg','Address':'ancd ad','Area':'dhbh','Phone':'989','Capacity':'100'},
  //   {'Id':2, 'Name':'Xyz Function hall', 'Photos':'/assets/images/venues/3/1.JPG','Address':'ancd ad','Area':'dhbh','Phone':'989','Capacity':'100'},
  //   {'Id':3, 'Name':'123 Function hall', 'Photos':'/assets/images/noimage.jpg','Address':'ancd ad','Area':'dhbh','Phone':'989','Capacity':'100'}
  // ]
  venuesData = require('../../assets/venues.json');
  venues = this.venuesData.filter(e=>e.HasPhotos == "1" && e.IsActive == "1").slice(0, 3)      
  
  packages = [
    {'Id':1,'Name':'Package 1','Price':200,'ItemsCount':16},
    {'Id':2,'Name':'Package 2','Price':250,'ItemsCount':22},
    {'Id':3,'Name':'Package 3','Price':300,'ItemsCount':29}
  ]

  showPackage(id){
    location.href='../vijayawada/catering/package-'+id;
  }

  showVenue(id,name){
    location.href='../vijayawada/venue/'+id+'/'+name.toLowerCase().split(' ').join('-');
  }
  
}
