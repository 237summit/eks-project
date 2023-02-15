import { createApp } from 'vue'
import App from './App.vue'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import router from './router'
import "vue-material/dist/vue-material.min.css";
import "vue-material/dist/theme/default.css";
import VueParticlesBg from "particles-bg-vue";






createApp(App).use(router).use(VueParticlesBg).mount('#app')





// import { createApp } from 'vue';
// import { createLogger } from 'vue-logger-plugin'
// import App from './App.vue'
// createApp(App)
//   .use(createLogger())
//   .mount('#app')