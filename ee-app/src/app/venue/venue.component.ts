import { Component, OnInit } from '@angular/core';

declare var require: any;
@Component({
  selector: 'app-venue',
  templateUrl: './venue.component.html',
  styleUrls: ['./venue.component.css']
})
export class VenueComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }
  
  venuesData = require('../../assets/venues.json');
  venues = this.venuesData.filter(e=>e.IsActive == "1")      
  packages = [
    {'Id':1,'Name':'Package 1','Price':200,'ItemsCount':16},
    {'Id':2,'Name':'Package 2','Price':250,'ItemsCount':22},
    {'Id':3,'Name':'Package 3','Price':300,'ItemsCount':29}
  ]
}
