import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';

declare var require: any;

@Component({
  selector: 'app-venue-detail',
  templateUrl: './venue-detail.component.html',
  styleUrls: ['./venue-detail.component.css']
})
export class VenueDetailComponent implements OnInit {
  venues:any
  venuesData:any
  constructor(private activatedRoute: ActivatedRoute) {
    let params: any = this.activatedRoute.snapshot.params;
    this.venuesData = require('../../assets/venues.json');
    this.venues = this.venuesData.filter(e=>e.Id == params.id)
    // console.log(this.venue)
    // console.log(params.id)
  }
  // venuesData = require('../../assets/venues.json');
  // venues = this.venuesData.filter(e=>e.HasPhotos == "1" && e.IsActive == "1").slice(0, 1) 
  // lat: number = this.venues.Latitude
  // lng: number = this.venues.Longitude
  
  // venueDetail=[
  //     {
  //     "Id": "2",
  //     "Name": "Sri Lakkireddy Narayanamagarla Kalyana Mandapam",
  //     "Address": "Swati Theatre Road,HB Colony",
  //     "Area": "Bhavani Puram",
  //     "Pincode": "521241",
  //     "Phone": "0866 2413407",
  //     "Latitude": "16.5325",
  //     "Longitude": "80.59694444",
  //     "Rent": "20000.0000",
  //     "Capacity": "800",
  //     "IsAirConditioned": "0",
  //     "IsActive": "1",
  //     "Photos":"/assets/images/noimage.jpg",
  //     "HasPhotos": "0"    
  //     }
  // ]
  packages = [
    {'Id':1,'Name':'Package 1','Price':200,'ItemsCount':16},
    {'Id':2,'Name':'Package 2','Price':250,'ItemsCount':22},
    {'Id':3,'Name':'Package 3','Price':300,'ItemsCount':29}
  ]
  ngOnInit() {
  }

}
