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
      <div style="padding:10px;"> </div>
    <div class="jb-wrap">
    <div class="jb-image">
        <img src="https://awesome-s320221201003413196200000001.s3.ap-northeast-2.amazonaws.com/hotel2.png" alt="">
        <div class="jb-recommend">
        <p>9.0 추천해요(3113) </p>
        </div>
        <div class="jb-okay">
        <p>예약취소가능</p>
        </div>
        <div class="jb-price">
         <p>숙박   60,000원</p>
         </div>
         <button class="error" @click="onPayment">숙박 예약</button>



         <div  class="jb-hotelname"> {{ hotels[2].bizplc}} </div>
         <div  class="jb-addr"> {{ hotels[2].lotnoaddr}} </div>



    </div>


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
    name: "tutorials-list",
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


    onPayment() {
      /* 1. 가맹점 식별하기 */
      const { IMP } = window;
      IMP.init('imp71708615');

      /* 2. 결제 데이터 정의하기 */
      const data = {
        pg: 'html5_inicis.INIpayTest',                           // PG사
        pay_method: 'card',                           // 결제수단
        merchant_uid: `mid_${new Date().getTime()}`,   // 주문번호
        amount: 60000,                                 // 결제금액
        name: 'AWeSome 결제 테스트',                  // 주문명
        buyer_name: 'AWeSome',                        // 구매자 이름
        buyer_email: 'AWeSome@example',             // 구매자 이메일
        buyer_postcode: '06018',                    
      };

      /* 4. 결제 창 호출하기 */
      IMP.request_pay(data, this.callback);
    },
    callback(response) {
      /* 3. 콜백 함수 정의하기 */
      const {
        success,
        error_msg,
      } = response;

      if (success) {
        alert('결제 성공');
      } else {
        alert(`결제 실패: ${error_msg}`);
      }
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
        width: 100%;
        margin-left: 50px;
        position: relative;
      }
      .jb-wrap img {
        width: 45%;
        height: 400px;
        vertical-align: middle;
      }
      .jb-hotelname {
        padding: 5px 10px;
        text-align: center;
        position: absolute;
        top: 0%;
        left: 48%;
        color: black;
        font-size: 27px;
        font-weight:bold;
      }
      .jb-price {
        padding: 5px 10px;
        text-align: center;
        position: absolute;
        top: 70%;
        left: 70%;
        color: black;
        font-size: 23px;
        font-weight:bold;
      }
      .jb-recommend {
        padding: 5px 10px;
        text-align: center;
        position: absolute;
        top: 10%;
        left: 48%;
        color: rgb(252, 185, 62);
        font-size: 20px;
        font-weight:600;
      }
      .jb-addr {
        padding: 5px 10px;
        text-align: center;
        position: absolute;
        top: 18%;
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
        .jb-okay {
        height: 27px;
        padding: 2px 10px;
        text-align: center;
        position: absolute;
        top: 26%;
        left: 49%;
        color: rgb(44, 44, 44);
        font-size: 14px;
        background-color: rgb(184, 183, 183);
        }
        button {
         -webkit-appearance: none;
         -moz-appearance: none;
          appearance: none;
  
          background: var(--button-bg-color);
          color: var(--button-color);
          
          margin: 0;
         padding: 0.5rem 1rem;

         position: absolute;
             top: 85%;
            left: 75%;
          font-family: 'Noto Sans KR', sans-serif;
          font-size: 1rem;
          font-weight: 400;
         text-align: center;
         text-decoration: none;
  
           border: none;
           border-radius: 4px;
  
         display: inline-block;
          width: auto;
  
         box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  
          cursor: pointer;
  
         transition: 0.5s;
       }
        button.error {
         --button-bg-color: #dc3545;
         --button-hover-bg-color: #c82333;
         color: white;
        
        }
  </style>