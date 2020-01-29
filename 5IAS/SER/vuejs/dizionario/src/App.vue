<template>
  <v-app id="app">
    <app-header></app-header>
    <v-content>
      <v-container class="fill-height" fluid>
        <router-view @msgLog="showSnackbar"></router-view>
      </v-container>
    </v-content>
    <v-snackbar v-model="snackbar" top right :color="sbcolor" :timeout="timeout">
      {{ sbtext }}
      <v-btn color="white" text @click="snackbar = false">Close</v-btn>
    </v-snackbar>
    <v-footer app>
      <span>&copy; 2019</span>
    </v-footer>
  </v-app>
</template>

<script>
import appHeader from "./components/Header.vue";

export default {
  components: {
    appHeader: appHeader
  },
  data: () => ({
    snackbar: false,
    sbcolor: "",
    sbtext: "",
    timeout: 2000
  }),
  methods: {
    showSnackbar(evt) {
      this.sbtext = evt.message;
      this.snackbar = true;
      this.sbcolor = evt.color;
    }
  }
};
</script>

<style>
</style>
