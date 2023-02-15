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
      <h4>유저 정보</h4>
      <ul class="list-group">
        <li class="list-group-item"
          :class="{ active: index == currentIndex }"
          v-for="(tutorial, index) in tutorials"
          :key="index"
          @click="setActiveTutorial(tutorial, index)"

        >
          {{ tutorial.title }}
          {{ tutorial.description }}
        </li>
      </ul>



    </div>
  </template>
  
  
  <script>
import TutorialDataService from "../services/TutorialDataService";
export default {
  name: "tutorials-list",
  data() {
    return {
      tutorials: [],
      currentTutorial: null,
      currentIndex: -1,
      title: ""
    };
  },
  methods: {
    retrieveTutorials() {
      TutorialDataService.getAll()
        .then(response => {
          this.tutorials = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },
    refreshList() {
      this.retrieveTutorials();
      this.currentTutorial = null;
      this.currentIndex = -1;
    },
    setActiveTutorial(tutorial, index) {
      this.currentTutorial = tutorial;
      this.currentIndex = tutorial ? index : -1;
    },
    removeAllTutorials() {
      TutorialDataService.deleteAll()
        .then(response => {
          console.log(response.data);
          this.refreshList();
        })
        .catch(e => {
          console.log(e);
        });
    },
    
    searchTitle() {
      TutorialDataService.findByTitle(this.title)
        .then(response => {
          this.tutorials = response.data;
          this.setActiveTutorial(null);

          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    }
  },
  mounted() {
    this.retrieveTutorials();
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
    hr{
    height: 0.5px;
    background-color: rgb(231, 228, 228);
  }
  </style>