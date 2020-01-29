import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router';
import appDictionary from './components/Dictionary.vue';
import appLogin from './components/Login.vue';
import appSignup from './components/Signup.vue';


Vue.use(VueRouter);

const router = new VueRouter({
  routes: [
    { path: '/', component: appDictionary },
    { path: '/login', component: appLogin },
    { path: '/signup', component: appSignup }
  ]
})

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
