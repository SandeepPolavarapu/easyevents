import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-catering',
  templateUrl: './catering.component.html',
  styleUrls: ['./catering.component.css']
})
export class CateringComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }
  packages = [
    {'Id':1,'Name':'Package-1','Price':200,'ItemsCount':16,'MoreVarieties':8,"Menu":[
      {'Item1':2,'Item2':'Sweets'},
      {'Item1':1,'Item2':'Hot'},
      {'Item1':1,'Item2':'Special Rice '},
      {'Item1':0,'Item2':'Raita'},
      {'Item1':1,'Item2':'Kurma'},
      {'Item1':0,'Item2':'Rice'},
      {'Item1':1,'Item2':'Dal Curry'}
    ]},
    {'Id':2,'Name':'Package-2','Price':250,'ItemsCount':22,'MoreVarieties':13,"Menu":[
      {'Item1':1,'Item2':'Juice'},
      {'Item1':2,'Item2':'Sweets'},
      {'Item1':1,'Item2':'Hot'},
      {'Item1':1,'Item2':'Roti'},
      {'Item1':1,'Item2':'Roti Curry'},
      {'Item1':1,'Item2':'Special Rice'},
      {'Item1':0,'Item2':'Raita'}
    ]},
    {'Id':3,'Name':'Package-3','Price':300,'ItemsCount':29,'MoreVarieties':14,"Menu":[
      {'Item1':2,'Item2':'Juices'},
      {'Item1':2,'Item2':'Sweets'},
      {'Item1':2,'Item2':'Hots'},
      {'Item1':2,'Item2':'Roties'},
      {'Item1':1,'Item2':'Roti Curry'},
      {'Item1':2,'Item2':'Special Rice'},
      {'Item1':0,'Item2':'Raita'}
    ]},
    {'Id':4,'Name':'Package-4','Price':350,'ItemsCount':32,'MoreVarieties':16,"Menu":[
      {'Item1':2,'Item2':'Welcome Sweets'},
      {'Item1':1,'Item2':'Welcome Hot'},
      {'Item1':2,'Item2':'Juices'},
      {'Item1':2,'Item2':'Sweets'},
      {'Item1':2,'Item2':'Hots'},
      {'Item1':2,'Item2':'Roties'},
      {'Item1':1,'Item2':'Roti Curry'}
    ]}
  ]
}
