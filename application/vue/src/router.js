import { createWebHistory, createRouter } from "vue-router";

const routes =  [
  {
    path: "/",
    name: "main",
    component: () => import("./components/main")
   },
  {
    path: "/memberlist",
    alias: "/memberlist",
    name: "memberlist",
    component: () => import("./components/Memberlist")
  },
  {
    path: "/tutorials/:id",
    name: "tutorial-details",
    component: () => import("./components/Tutorial")
  },
  {
    path: "/signup",
    name: "signup",
    component: () => import("./components/Signup")
  },
  {
    path: "/login",
    name: "login",
    component: () => import("./components/login")
  },
  {
    path: "/userlogin",
    name: "userlogin",
    component: () => import("./components/userlogin")
  },
  {
    path: "/hotel",
    name: "hotel",
    component: () => import("./components/hotel")
  },
  {
    path: "/loginhotel",
    name: "loginhotel",
    component: () => import("./components/loginhotel")
  },
  {
    path: "/userpage",
    name: "userpage",
    component: () => import("./components/userpage")
  },
  {
    path: "/hotel1detail",
    name: "hotel1detail",
    component: () => import("./components/hotel1detail")
  },
  {
    path: "/hotel2detail",
    name: "hotel2detail",
    component: () => import("./components/hotel2detail")
  },
  {
    path: "/hotel3detail",
    name: "hotel3detail",
    component: () => import("./components/hotel3detail")
  },
  {
    path: "/hotel4detail",
    name: "hotel4detail",
    component: () => import("./components/hotel4detail")
  },
  {
    path: "/hotel5detail",
    name: "hotel5detail",
    component: () => import("./components/hotel5detail")
  },
  {
    path: "/location",
    name: "location",
    component: () => import("./components/location")
  },
  {
    path: "/locationhotel",
    name: "locationhotel",
    component: () => import("./components/locationhotel")
  },
  {
    path: "/intro",
    name: "intro",
    component: () => import("./components/intro")
  }
  
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;