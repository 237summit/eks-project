<template>
    <div>
      <div class="navbar">
      <a class="logo" href="/">
        <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/awesome.png" >
      </a>
      <ul>
        <li class="font"><a href="/hotel"><b>숙소</b></a></li>
        <li class="font"><a href="/signup"><b>회원가입</b></a></li>
        <li class="font"><a href="/login"><b>로그인</b></a></li>
      </ul>
      </div>
      <hr>
      <div class="hero_header" >
        <img src = "https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/awesomewayo.png" />
      </div>
      <h1>Our new hotels</h1>
          <div class="products">
            <a href="/login">
              <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/bed.png">
               <p>{{ hotels[1].bizplc}}</p>
               <p class="price">75,000</p>
            </a>
            <a href="/login">
              <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel2.png">
              <p>{{ hotels[2].bizplc}}</p>
              <p class="price">60,000</p>
            </a>
            <a href="/login">
              <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel3.png">
              <p>{{ hotels[3].bizplc}}</p>
              <p class="price">22,000</p>
            </a>
            <a href="/login">
              <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel4.png">
              <p>{{ hotels[4].bizplc}}</p>
              <p class="price">75,000</p>
            </a>
            <a href="/login">
              <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel5.png">
              <p>{{ hotels[5].bizplc}}</p>
              <p class="price">75,000</p>
            </a>
            <div class="clearfix"></div>
          </div>
          <div class="footer">
            <a href="#"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/facebook.png"></a>
            <a href="#"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/instagram.png"></a>
            <a href="#"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/kakao.png"></a>
          </div>
    </div>
</template>
  
  
  <script>
import HotelDataService from "../services/HotelDataService";


export default {
  name: "hotel-list",
  data() {
  return {
  hotels: [],
  };
},
methods: {
  retrieveHotels() {
    HotelDataService.getAll()
      .then(response => {
        this.hotels = response.data;
        console.log(response.data);
      })
  },
},
created() {
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


  </style>