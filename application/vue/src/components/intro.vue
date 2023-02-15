<template>
  <div id="app">
    <IntroLogin/>
    <particles-bg type="custom" :config="config" :bg="true"/>
  </div>
</template>

<script>
import IntroLogin from "@/components/introLogin";
import { ParticlesBg } from "particles-bg-vue";
import icon from "@/assets/icon.js";

export default {
  name: "intro",
  components: {
    IntroLogin,
    ParticlesBg
  },
  data: function() {
    return {
      config: {
        num: [4, 7],
        rps: 0.2,
        radius: [5, 40],
        life: [1.5, 10],
        v: [2, 3],
        tha: [-30, 30],
        body: icon,
        alpha: [0.6, 0],
        scale: [0.1, 0.4],
        position: "all",
        cross: "dead",
        random: 30
      }
    };
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>