<template>
    <div>
      <div class="navbar">
    <a class="logo" href="/userlogin">
      <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/awesome.png" >
    </a>
    <ul>
      <li class="font"><a href="/loginhotel"><b>숙박</b></a></li>
      <li class="font"><a href="/location"><b>내 위치</b></a></li>
      <li class="font"><a href="/"><b>로그아웃</b></a></li>
    </ul>
    </div>
    <hr>
    <div style="padding:10px;"></div>
    <div class="jb-top">
        <p>Nearby Hotels</p>
    </div>
    <div style="padding:10px;"></div>
      <ul class="list-group">
        <li class="list-group-item"
          :class="{ active: index == currentHtIndex }"
          v-for="(hotel, index) in hotels"
          :key="index"
          @click="locationhotel()"

        >
        {{ hotel.lotnoaddr }}
          {{ hotel.bizplc }}
        </li>
      </ul>
      {{locationAllHotels()}}
    

      <!-- <div id="apisInfo" class="jb-hotelname">  </div>
      <div id="apisAddr" class="jb-addr">  </div>
      <div id="apisLat">  </div>
      <div id="apisLon">  </div> -->
      
    </div>
</template>
  
  
<script>
import HotelDataService from "../services/HotelDataService";



export default {
  name: "tutorials-list",
  data() {
    return {
      hotels: [],
      currentHotel: null,
      currentHtIndex: -1,
      name: ""  

    };
  },
  methods: {
    retrieveHotels() {
      HotelDataService.getAll()
        .then(response => {
          this.hotels = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },
 refreshHtList() {
      this.retrieveHotels();
      this.currentHotel = null;
      this.currentHtIndex = -1;
    },
setActiveHotel(hotel, index) {
      this.currentHotel = hotel;
      this.currentHtIndex = hotel ? index : -1;
    },
removeAllHotels() {
      HotelDataService.deleteAll()
        .then(Htresponse => {
          console.log(Htresponse.data);
          this.refreshHtList();
        })
        .catch(e => {
          console.log(e);
        });
    },

    locationAllHotels(){
      let tourlist = this.hotels;


 function getDistance(lat1, lon1, lat2, lon2, unit) {
      var radlat1 = Math.PI * lat1/180;
      var radlat2 = Math.PI * lat2/180;
      // var radlon1 = Math.PI * lon1/180;
      // var radlon2 = Math.PI * lon2/180;
      var theta = lon1-lon2;
      var radtheta = Math.PI * theta/180;
      var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
      dist = Math.acos(dist);
      dist = dist * 180/Math.PI;
      dist = dist * 60 * 1.1515;
      if (unit=="K") { dist = dist * 1.609344 }
      if (unit=="N") { dist = dist * 0.8684 }
      return dist;
   
}

  navigator.geolocation.getCurrentPosition((position) => {
    let latitude = position.coords.latitude;
    let longitude = position.coords.longitude;
    
    console.log('latitude',latitude)
    console.log('longitude',longitude)

    for(let i=0 ; i<tourlist.length ; i++){
      let distance = getDistance(latitude, longitude, tourlist[i].lati, tourlist[i].longi, "K");
      tourlist[i].distance = distance;
    }
    let newTourList = tourlist.sort(function (a,b){
      if(a.distance > b.distance){
        return 1;
      }
      if(a.distance < b.distance){
        return -1;
      }
      return 0;
    });
    console.log(newTourList);
    
  })
    },
    locationhotel(){
      location.replace('https://www.btc-awesome.site/locationhotel');
    }
  },
  mounted() {
    this.retrieveHotels();
    
  }
};
</script>


  
  <style>
  * {
    box-sizing: border-box;
  }
  template {
    margin: 0;
    min-width: 992px;
    font-family: "Helvetica";
  }
  .navbar{
    height: 60px;
    padding-left: 30px;
  }
  .logo{
    line-height: 60px;
    float: left;
  }
  .logo img{
    vertical-align: middle;
    height: 60px ;
    
  }
  .navbar ul{
    float: right;
  }
  .navbar li{
    list-style-type: none;
    float: left;
    margin-right: 30px;
  }
  .navbar a{
    text-decoration: none;
    color: black;
    font-style: bold;
    font-size: 13px;
  }
  .hero_header img{
    height: 500px;
    width: 100%;
  }
  body h1{
    text-align: center;
    margin-top: 60px;
    margin-bottom: 60px;
    font-size: 24px;
    font-style: bold;
    color: #545454;
  }
  .products {
    margin-left: auto;
    margin-right: auto;
    padding: 0;
    width: 740px;
    text-align: center;
  }
  .products img{
    width: 225px;
    height: 225px;
    margin-right: 20px;
    margin-bottom: 20px;
    border-radius: 10%;
  }
  .products a{
    text-decoration: none;
    color: black;
    float: left;
    font-size: 16px;
  }
  .price{
    margin-top: 4px;
    margin-bottom: 80px;
  }
  .clearfix{
    clear: both;
  }
  .footer{
    text-align: center;
  }
  .footer img{
    margin-top: 40px;
    height: 20px;
    margin-bottom: 80px;
    margin-left: 10px;
    margin-right: 10px;
  }
  hr{
    height: 0.5px;
    background-color: rgb(231, 228, 228);
  }
  
      .jb-hotelname {
        padding: 5px 10px;
        text-align: center;
        position: absolute;
        top: 50%;
        left: 48%;
        color: black;
        font-size: 27px;
        font-weight:bold;
      }
      .jb-addr {
        padding: 5px 10px;
        text-align: center;
        position: absolute;
        top: 55%;
        left: 48%;
        color: gray;
        font-size: 17px;
        font-weight:bold;
      }
      .jb-lat {
        padding: 5px 10px;
        text-align: center;
        position: absolute;
        top: 60%;
        left: 48%;
        color: gray;
        font-size: 17px;
        font-weight:bold;
      }
      .jb-top {
      font-style:italic;
				padding: 5px 10px;
				text-align:center;
        top: 15%;
        left: 30%;
        color: black;
        font-size: 45px;
        font-weight:bold;
		}

  </style>