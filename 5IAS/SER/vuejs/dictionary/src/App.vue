<template>
  <div id="app">
    <app-header></app-header>
    <router-view></router-view>
  </div>
</template>

<script>
import appHeader from "./components/Header.vue";

export default {
  components: {
    appHeader: appHeader
  }
};
</script>

<style>
</style>
