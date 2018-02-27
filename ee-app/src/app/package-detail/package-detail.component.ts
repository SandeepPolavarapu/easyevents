import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-package-detail',
  templateUrl: './package-detail.component.html',
  styleUrls: ['./package-detail.component.css']
})
export class PackageDetailComponent implements OnInit {
  package:any
  constructor(private activatedRoute: ActivatedRoute) {
    let params: any = this.activatedRoute.snapshot.params;
    if(params.id == "package-1")
    {
      this.package = {'Id':1,'Name':'Package-1 (16 Items)','Price':'200','ItemsCount':'16',"Menu":[
        {'Item1':2,'Item2':'Sweets','Item3':'Bobattu, Bread Halwa, Carrot Sorakaya Halwa, Chakra Pongali, Poornam'},
        {'Item1':1,'Item2':'Hot','Item3':'Cutlet, Gaare, Masala Vada, Mirchi Bajji, Smile Heart, Veg Roll'},
        {'Item1':1,'Item2':'Special Rice','Item3':'All Mix Biryani, Fried Rice, Pulihora, Veg Biryani'},
        {'Item1':0,'Item2':'Raita','Item3':'Raita'},
        {'Item1':1,'Item2':'Kurma','Item3':'Aloo Kurma, Meal Maker Kurma, Mixed Veg Kurma, Vegetable Kurma'},
        {'Item1':0,'Item2':'Rice','Item3':'White Rice With Ghee'},
        {'Item1':1,'Item2':'Dal Curry','Item3':'Aakukura Pappu, Mudda Pappu Dapalam, Pappu Dosakaya, Pappu Tomato'},
        {'Item1':1,'Item2':'Fry Curry','Item3':'Aloo Carrot Mirchi Fry, Beans Carrot Fry, Bendi Kobbari Jeedi Pappu Fry, Dondakay Cheelikalu Fry, Vankay Pakodi Fry'},
        {'Item1':1,'Item2':'Gravy Curry','Item3':'Gutti Vankaya, Sorakaya Masala, Tomato Mulakaya, Vankaya Batani'},
        {'Item1':1,'Item2':'Grind Chutney','Item3':'Cabbage Chutney, Dosakaya Chutney, Jamakaya Chutney, Tomato Chutney, Vankaya Dosakaya Tomato Chutney'},
        {'Item1':1,'Item2':'Liquid','Item3':'Pappu Charu, Sambar, Tomato Rasam'},
        {'Item1':0,'Item2':'Papad','Item3':'Papads'},
        {'Item1':0,'Item2':'Curd','Item3':'Curd In Pot'},
        {'Item1':1,'Item2':'Ice Cream','Item3':'Strawberry, Vanilla'},
        {'Item1':0,'Item2':'Water','Item3':'Mineral Water'}
      ]}
    }
    else if(params.id == "package-2")
    {
      this.package = {'Id':2,'Name':'Package-2 (22 Items)','Price':'250','ItemsCount':'22',"Menu":[
        {'Item1':1,'Item2':'Juice','Item3':'Cool Drinks, Fruit Punch, Grape Juice, Water Melon'},
        {'Item1':2,'Item2':'Sweets','Item3':'Chakra Pongali, Dry Fruit Halwa, Gajar Halwa, Junnu, Kaju Sweets, Malai Sandwich, Malpuri Khova, Navarang Pan, Poornam'},
        {'Item1':1,'Item2':'Hot','Item3':'Corn Samosa, Cutlet, Gaare, Shanghai Roll, Smile Heart, Veg Fingers, Veg Roll'},
        {'Item1':1,'Item2':'Roti','Item3':'Masala Kulcha, Paratha, Pulka, Rumali Roti'},
        {'Item1':1,'Item2':'Roti Curry','Item3':'Methi Chaman Kurma, Paneer Kurma'},
        {'Item1':1,'Item2':'Special Rice','Item3':'All Mix Biryani, Fried Rice, Panasakaya Biryani, Pudhina Rice, Tomato Rice, Veg Biryani'},
        {'Item1':0,'Item2':'Raita','Item3':'Raita'},
        {'Item1':1,'Item2':'Kurma','Item3':'Aloo Kurma, Meal Maker Kurma, Mirchi Gasala Kurma, Phool Makhan Kurma, Vegetable Kurma'},
        {'Item1':0,'Item2':'Rice','Item3':'White Rice With Ghee'},
        {'Item1':1,'Item2':'Dal Curry','Item3':'Aakukura Pappu, Avakaya Pappu, Mudda Pappu Dapalam, Pappu Dosakaya, Pappu Tomato'},
        {'Item1':1,'Item2':'Fry Curries','Item3':'Aloo Carrot Mirchi Fry, Beans Carrot Fry, Bendi Kobbari Jeedi Pappu Fry, Cabbage 65, Dondakay Cheelikalu Fry, Dosakaya 65, Vankay Pakodi Fry'},
        {'Item1':1,'Item2':'Gravy Curry','Item3':'Beerakaya Senagapappu, Macaroni Gongura, Mushroom, Sorakaya Masala, Vankaya Tomato Kaju'},
        {'Item1':1,'Item2':'Pickle','Item3':'Allam, Gongura Pandu Mirchi, Mango, Pachi Boppayee, Pandu Mirchi, Tomato'},
        {'Item1':1,'Item2':'Grind Chutney','Item3':'Cabbage Chutney, Dosakaya Chutney, Tomato Chutney, Vankaya Dosakaya Tomato Chutney'},
        {'Item1':1,'Item2':'Liquid','Item3':'Miryala Rasam, Pappu Charu, Sambar, Tomato Rasam, Ulavacharu With Cream'},
        {'Item1':0,'Item2':'Papad','Item3':'Papads'},
        {'Item1':0,'Item2':'Curd','Item3':'Curd In Pot'},
        {'Item1':1,'Item2':'Ice Cream','Item3':'Plain Pista, Strawberry, Vanilla'},
        {'Item1':1,'Item2':'Paan','Item3':'Live Paan, Paan With Cherry & Tooth Pick, Sada Paan, Sweet Paan'},
        {'Item1':0,'Item2':'Water','Item3':'Mineral Water'}
      ]}
    }
    else if(params.id == "package-3")
    {
      this.package = {'Id':3,'Name':'Package-3 (29 Items)','Price':'300','ItemsCount':'29',"Menu":[
        {'Item1':2,'Item2':'Juices','Item3':'Badam Milk, Cool Drinks, Fruit Punch, Grape Juice, Karbuja Juice, Mango Juice, Strawberry Milk, Water Melon'},
        {'Item1':2,'Item2':'Sweets','Item3':'Chakra Pongali, Dry Fruit Halwa, Fruit Cake, Fruit Cocktail, Kaju Sweets, Litchi Wine, Malpuri Khova, Mango Delight, Paneer Jalebi, Poornam, Strawberry Rasamalay, Tawa Mixed Sweet'},
        {'Item1':2,'Item2':'Hots','Item3':'Corn Cutlet, Corn Roll, Corn Samosa, Gaare, Gold Coin, Palak Roll, Paneer Vada, Shanghai Roll, Smile Heart, Veg Fingers, Veg Roll'},
        {'Item1':2,'Item2':'Roties','Item3':'Lachha Paratha, Masala Kulcha, Naan, Paratha, Pudhina Paratha, Pulka, Rumali Roti, Tandoori Roti'},
        {'Item1':1,'Item2':'Roti Curry','Item3':'Methi Chaman Kurma, Palak Paneer Kurma, Paneer Butter Masala, Paneer Kurma'},
        {'Item1':2,'Item2':'Special Rice','Item3':'All Mix Biryani, Fried Rice, Kobbari Rice, Kothimeera Rice, Panasakaya Biryani, Pudhina Rice, Sweet Corn Biryani, Tomato Rice, Veg Biryani'},
        {'Item1':0,'Item2':'Raita','Item3':'Raita'},
        {'Item1':1,'Item2':'Kurma','Item3':'Aloo Kurma, Meal Maker Kurma, Mirchi Gasala Kurma, Phool Makhan Kurma, Vegetable Kurma'},
        {'Item1':0,'Item2':'Rice','Item3':'White Rice With Ghee'},
        {'Item1':1,'Item2':'Dal Curry','Item3':'Aakukura Pappu, Avakaya Pappu, Mudda Pappu Dapalam, Pappu Dosakaya, Pappu Tomato'},
        {'Item1':2,'Item2':'Fry Curries','Item3':'Aloo Carrot Mirchi Fry, Baby Corn 65, Baby Corn Ulavacharu Fry, Beans Carrot Fry, Bendi Kobbari Jeedi Pappu Fry, Cabbage 65, Chikkudukaya Fry, Corn Liver Fry, Dondakay Cheelikalu Fry, Dosakaya 65, Mixed Veg Fry, Mushroom Ulavacharu Fry, Thotakura Liver Fry, Vankay Pakodi Fry'},
        {'Item1':1,'Item2':'Gravy Curry','Item3':'Baby Corn Kaju, Beerakaya Senagapappu, Dosakaya Jeedi Gullu, Macaroni Gongura, Mushroom Kaju, Sorakaya Masala, Tomato Mulakaya Kaju'},
        {'Item1':1,'Item2':'Pickle','Item3':'Allam, Chinna Ullipaya Avakaya, Chow Chow Avakaya, Gongura Pandu Mirchi, Mango, Pachi Boppayee, Pandu Mirchi, Tomato'},
        {'Item1':1,'Item2':'Grind Chutney','Item3':'Beerakaya Dondakaya Mukkala Chutney, Cabbage Chutney, Dosakaya Chutney, Gongura Ullipaya Chutney, Jamakaya Chutney, Tomato Chutney, Vankaya Dosakaya Tomato Chutney'},
        {'Item1':2,'Item2':'Liquids','Item3':'Menthi Majjiga, Miryala Rasam, Pachi Pulusu, Sambar, Tomato Rasam, Ulavacharu With Cream'},
        {'Item1':0,'Item2':'Papad','Item3':'Papads & Vadiyalu'},
        {'Item1':0,'Item2':'Curd','Item3':'Curd In Pot'},
        {'Item1':2,'Item2':'Ice Creams','Item3':'Butter Scotch, Sapota, Strawberry, Vanilla'},
        {'Item1':1,'Item2':'Paan','Item3':'Live Paan, Paan With Cherry & Tooth Pick, Sada Paan, Sweet Paan'},
        {'Item1':0,'Item2':'Water','Item3':'500ml Water Bottles'},
        {'Item1':0,'Item2':'Cut Fruit','Item3':'Apple, Grape, Karbuja, One Seasonal Fruit, Papaya'}
      ]}
    }
    else if(params.id == "package-4")
    {
      this.package = {'Id':4,'Name':'Package-4 (32 Items)','Price':'350','ItemsCount':'32',"Menu":[
        {'Item1':2,'Item2':'Welcome Sweets','Item3':'Badam Ball, Kaju Ball, Orange Roll, Pista Ball'},
        {'Item1':1,'Item2':'Welcome Hot','Item3':'Cut Mirchi, Dil Pasandh, Veg Finger, Veg Lollypop'},
        {'Item1':2,'Item2':'Juices','Item3':'Badam Milk, Cool Drinks, Fruit Punch, Grape Juice, Karbuja Juice, Mango Juice, Strawberry Milk, Water Melon'},
        {'Item1':2,'Item2':'Sweets','Item3':'Chakra Pongali, Dry Fruit Halwa, Fruit Cake, Fruit Cocktail, Kaju Sweets, Litchi Wine, Malpuri Khova, Mango Delight, Paneer Jalebi, Poornam, Strawberry Rasamalay, Tawa Mixed Sweet'},
        {'Item1':2,'Item2':'Hots','Item3':'Corn Cutlet, Corn Roll, Corn Samosa, Gaare, Gold Coin, Palak Roll, Paneer Tikka, Paneer Vada, Shanghai Roll, Smile Heart, Veg Fingers, Veg Roll'},
        {'Item1':2,'Item2':'Roties','Item3':'Lachha Paratha, Masala Kulcha, Naan, Paratha, Pudhina Paratha, Pulka, Rumali Roti, Tandoori Roti'},
        {'Item1':1,'Item2':'Roti Curry','Item3':'Methi Chaman Kurma, Palak Paneer Kurma, Paneer Butter Masala, Paneer Kurma'},
        {'Item1':2,'Item2':'Special Rice','Item3':'All Mix Biryani, Fried Rice, Kobbari Rice, Kothimeera Rice, Mushroom Biryani, Panasakaya Biryani, Pudhina Rice, Sweet Corn Biryani, Tomato Rice, Veg Biryani'},
        {'Item1':0,'Item2':'Raita','Item3':'Raita'},
        {'Item1':1,'Item2':'Kurma','Item3':'Aloo Kurma, Meal Maker Kurma, Mirchi Gasala Kurma, Phool Makhan Kurma, Vegetable Kurma'},
        {'Item1':0,'Item2':'Rice','Item3':'White Rice With Ghee'},
        {'Item1':1,'Item2':'Dal Curry','Item3':'Aakukura Pappu, Avakaya Pappu, Mudda Pappu Dapalam, Pappu Dosakaya, Pappu Tomato'},
        {'Item1':2,'Item2':'Fry Curries','Item3':'Aloo Carrot Mirchi Fry, Baby Corn 65, Baby Corn Ulavacharu Fry, Beans Carrot Fry, Bendi Kobbari Jeedi Pappu Fry, Cabbage 65, Chikkudukaya Fry, Corn Liver Fry, Dondakay Cheelikalu Fry, Dosakaya 65, Mixed Veg Fry, Mushroom Ulavacharu Fry, Thotakura Liver Fry, Vankay Pakodi Fry'},
        {'Item1':1,'Item2':'Gravy Curry','Item3':'Baby Corn Kaju, Beerakaya Senagapappu, Capsicum Kaju, Dosakaya Jeedi Gullu, Macaroni Gongura, Mushroom Kaju, Pachi Jeedi Gullu, Sorakaya Masala, Tomato Mulakaya Kaju'},
        {'Item1':1,'Item2':'Pickle','Item3':'Allam, Chinna Ullipaya Avakaya, Chow Chow Avakaya, Gongura Pandu Mirchi, Mango, Pachi Boppayee, Pandu Mirchi, Tomato'},
        {'Item1':1,'Item2':'Grind Chutney','Item3':'Beerakaya Dondakaya Mukkala Chutney, Cabbage Chutney, Dosakaya Chutney, Gongura Ullipaya Chutney, Jamakaya Chutney, Tomato Chutney, Vankaya Dosakaya Tomato Chutney'},
        {'Item1':2,'Item2':'Liquids','Item3':'Menthi Majjiga, Miryala Rasam, Pachi Pulusu, Sambar, Tomato Rasam, Ulavacharu With Cream'},
        {'Item1':0,'Item2':'Papad','Item3':'Papads & Vadiyalu'},
        {'Item1':0,'Item2':'Curd','Item3':'Curd In Pot'},
        {'Item1':2,'Item2':'Ice Creams','Item3':'Butter Scotch, Sapota, Strawberry, Vanilla'},
        {'Item1':1,'Item2':'Paan','Item3':'Live Paan, Paan With Cherry & Tooth Pick, Sada Paan, Sweet Paan'},
        {'Item1':0,'Item2':'Water','Item3':'500ml Water Bottles'},
        {'Item1':0,'Item2':'Cut Fruit','Item3':'Apple, Grape, Karbuja, One Seasonal Fruit, Papaya'}
      ]}
    }
   }

  ngOnInit() {
  }  
}
