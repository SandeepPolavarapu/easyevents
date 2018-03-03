import { Component,OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';


declare var require: any;
declare var jQuery: any

@Component({
  selector: 'app-venue-detail',
  templateUrl: './venue-detail.component.html',
  styleUrls: ['./venue-detail.component.css']
})
export class VenueDetailComponent implements OnInit {  
  ngOnInit() {    
  }
  venues:any
  venuesData:any
  constructor(private activatedRoute: ActivatedRoute) {
    let params: any = this.activatedRoute.snapshot.params;
    this.venuesData = require('../../assets/venues.json');
    this.venues = this.venuesData.filter(e=>e.Id == params.id)    
  }
 
  packages = [
    {'Id':1,'Name':'Package 1','Price':200,'ItemsCount':16},
    {'Id':2,'Name':'Package 2','Price':250,'ItemsCount':22},
    {'Id':3,'Name':'Package 3','Price':300,'ItemsCount':29}
  ] 
 
}
