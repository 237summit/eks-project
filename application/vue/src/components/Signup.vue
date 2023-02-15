<template>
  <div class>
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
    <div v-if="!submitted">
      <div class="input-form col-md-12 mx-auto">
      <h4 class="mb-3">회원가입</h4>
        <label for="title">아이디</label>
        <input
          type="text"
          class="form-control"
          id="title"
          required
          v-model="tutorial.title"
          name="title"
        />

        <div class="mb-4"></div>

        <label for="description">비밀번호</label>
        <input
          type="password"
          class="form-control"
          id="description"
          required
          v-model="tutorial.description"
          name="description"
        />

        <div class="mb-4"></div>


        <div class="mb-4"></div>
        <div style=" text-align: center;">
      <button @click="saveSignup" class="button" >
        가입완료
      </button>
      </div>
      </div>
    </div>

    <div v-else  >
    </div>
    <div class="mb-4"></div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 AWeSome</p>
    </footer>
  </div>
</template>


<script>
import TutorialDataService from "../services/TutorialDataService";
export default {
  name: "add-tutorial",
  data() {
    return {
      tutorial: {
        id: null,
        title: "",
        description: "",
        published: false
      },
      submitted: false
    };
  },
  methods: {
    saveSignup() {
      var data = {
        title: this.tutorial.title,
        description: this.tutorial.description
      };
      TutorialDataService.create(data)
        .then(response => {
          this.tutorial.id = response.data.id;
          console.log(response.data);
          this.submitted = true;
          alert("회원가입이 완료되었습니다")

          location.replace('https://www.btc-awesome.site/login');
        })
        .catch(e => {
          console.log(e);
        });
    },
  }
};
</script>

<style>
.submit-form {
  max-width: 300px;
  margin: auto;
}
    template {
      min-height: 100vh;
      background: -webkit-gradient(linear, left bottom, right top, from(#ffffff), to(#ffffff));
      background: -webkit-linear-gradient(bottom left, #ffffff 0%, #ffffff 100%);
      background: -moz-linear-gradient(bottom left, #ffffff 0%, #ffffff 100%);
      background: -o-linear-gradient(bottom left, #ffffff 0%, #ffffff 100%);
      background: linear-gradient(to top right, #ffffff 0%, #ffffff 100%);
    }
    .input-form {
      max-width: 680px;
      margin-top: 80px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  body {
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
  .button {
  display: inline-block;
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: bold;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #ff9e9e;
  box-shadow: 0px 15px 20px rgba(247, 36, 46, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
hr{
    height: 0.5px;
    background-color: rgb(231, 228, 228);
  }

</style>