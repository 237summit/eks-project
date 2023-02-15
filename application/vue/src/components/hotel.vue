<template>
    <div>
      <div class="navbar">
      <a class="logo" href="/">
        <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/awesome.png" >
      </a>
      <ul>
        <li class="font"><a href="#"><b>숙소</b></a></li>
        <li class="font"><a href="/signup"><b>회원가입</b></a></li>
        <li class="font"><a href="/login"><b>로그인</b></a></li>
      </ul>
      </div>
      <hr>
      <div style="padding:10px;"> </div>
      <div class="jb-top">
        <p>Hotel List</p>
      </div>
      <div style="padding:10px;"> </div>
		<div class="jb-wrap">
      <a href="/signup">
			<div class="jb-image"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/bed.png" alt=""></div>
      <div  class="jb-hotelname"> {{ hotels[1].bizplc}} </div>
    <div  class="jb-addr"> {{ hotels[1].lotnoaddr}} </div>
      <div class="jb-recommend">
				<p>9.1 추천해요(402) </p>
			</div>
      <div class="jb-price">
				<p>숙박   75,000원</p>
			</div>

    </a>
		</div>

    <div class="jb-wrap">
      <a href="/signup">
			<div class="jb-image"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel2.png" alt=""></div>
      <div  class="jb-hotelname"> {{ hotels[2].bizplc}} </div>
      <div  class="jb-addr"> {{ hotels[2].lotnoaddr}} </div>
      <div class="jb-recommend">
				<p>9.0 추천해요(3113)</p>
			</div>
      <div class="jb-price">
				<p>숙박   60,000원</p>
			</div>
    </a>
		</div>

    <div class="jb-wrap">
      <a href="/signup">
			<div class="jb-image"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel3.png" alt=""></div>
      <div  class="jb-hotelname"> {{ hotels[3].bizplc}} </div>
      <div  class="jb-addr"> {{ hotels[3].lotnoaddr}} </div>
      <div class="jb-recommend">
				<p>9.4 추천해요(6486)</p>
			</div>
      <div class="jb-price">
				<p>숙박   22,000원</p>
			</div>
    </a>
		</div>

    <div class="jb-wrap">
      <a href="/signup">
			<div class="jb-image"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel4.png" alt=""></div>
      <div  class="jb-hotelname"> {{ hotels[4].bizplc}} </div>
      <div  class="jb-addr"> {{ hotels[4].lotnoaddr}} </div>
      <div class="jb-recommend">
				<p>9.1 추천해요(402)</p>
			</div>
      <div class="jb-price">
				<p>숙박   75,000원</p>
			</div>
    </a>
		</div>
    <div class="jb-wrap">
      <a href="/signup">
			<div class="jb-image"><img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel5.png" alt=""></div>
      <div  class="jb-hotelname"> {{ hotels[5].bizplc}} </div>
      <div  class="jb-addr"> {{ hotels[5].lotnoaddr}} </div>
      <div class="jb-recommend">
				<p>9.1 추천해요(402)</p>
			</div>
      <div class="jb-price">
				<p>숙박   75,000원</p>
			</div>
    </a>
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
  hotels: []
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
      background-color: white;
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
      height: 450px;
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
    .jb-wrap {
				width: 65%;
				margin: 10px auto;
        position: relative;
			}
			.jb-wrap img {
        filter: brightness(50%);
				width: 100%;
        height: 300px;
				vertical-align: middle;
			}
			.jb-hotelname {
				padding: 5px 10px;
				text-align: center;
        position: absolute;
        top: 55%;
        left: 3%;
        color: white;
        font-size: 27px;
        font-weight:bold;
			}
      .jb-price {
				padding: 5px 10px;
				text-align: center;
        position: absolute;
        top: 70%;
        left: 70%;
        color: white;
        font-size: 23px;
        font-weight:bold;
			}
      .jb-recommend {
				padding: 5px 10px;
				text-align: center;
        position: absolute;
        top: 70%;
        left: 3%;
        color: orange;
        font-size: 20px;
        font-weight:600;
			}
      .jb-addr {
				padding: 5px 10px;
				text-align: center;
        position: absolute;
        top: 85%;
        left: 3%;
        color: white;
        font-size: 17px;
        font-weight:bold;
			}
      .jb-top {
        /* font-family:Comic Sans MS; */
        /* font-family:Ink Free; */
        /* font-family:MV Boli; */
        font-style:italic;
				padding: 5px 10px;
				text-align:center;
        top: 15%;
        left: 30%;
        color: black;
        font-size: 45px;
        font-weight:bold;
			}
      hr{
    height: 0.5px;
    background-color: rgb(231, 228, 228);
  }

  </style>