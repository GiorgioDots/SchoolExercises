import 'es6-promise/auto';
import Vue from 'vue';
import App from './App.vue';
import VueRouter from 'vue-router';
import appDictionary from './components/Dictionary.vue';
import appLogin from './components/Login.vue';
import appSignup from './components/Signup.vue';
import vuetify from './plugins/vuetify';
import { store } from './store/store';

Vue.use(VueRouter);

const router = new VueRouter({
  routes: [
    { path: '/', component: appDictionary },
    { path: '/login', component: appLogin },
    { path: '/signup', component: appSignup },
    { path: '/*', redirect: '/' }
  ]
})

new Vue({
  el: '#app',
  router,
  vuetify,
  store,
  render: h => h(App)
})
