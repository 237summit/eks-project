<template>
  <div class="list row">
    <div class="col-md-8">
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search by title"
          v-model="title"/>
        <div class="input-group-append">
          <button class="btn btn-outline-secondary" type="button"
            @click="searchTitle"
          >
            Search
          </button>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <h4>회원 정보</h4>
      <ul class="list-group">
        <li class="list-group-item"
          :class="{ active: index == currentIndex }"
          v-for="(tutorial, index) in tutorials"
          :key="index"
          @click="setActiveTutorial(tutorial, index)"

        >
          {{ tutorial.title }}
        </li>
      </ul>


      <button class="m-3 btn btn-sm btn-danger" @click="removeAllTutorials">
        Remove All
      </button>

    </div>
    <div class="col-md-6">
      <div v-if="currentTutorial">
        <h4>Tutorial</h4>
        <div>
          <label><strong>Title: </strong></label> {{ currentTutorial.title }}
        </div>
        <div>
          <label><strong>Description:</strong></label> {{ currentTutorial.description }}
        </div>
        <div>
          <label><strong>Status:</strong></label> {{ currentTutorial.published ? "Published" : "Pending" }}
        </div>

        <router-link :to="'/tutorials/' + currentTutorial.id" class="badge badge-warning">Edit</router-link>
      </div>
      <div v-else>
        <br />
        <p>see details</p>
      </div>
    </div>
  </div>
</template>

<script>
import TutorialDataService from "../services/TutorialDataService";
import HotelDataService from "../services/HotelDataService";

export default {
  name: "tutorials-list",
  data() {
    return {
      tutorials: [],
      currentTutorial: null,
      currentIndex: -1,
      title: "",
      hotels: [],
      currentHotel: null,
      currentHtIndex: -1,
      name: ""  

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
    },
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
  
  
  },


  mounted() {
    this.retrieveTutorials();
    this.retrieveHotels();
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
</style>