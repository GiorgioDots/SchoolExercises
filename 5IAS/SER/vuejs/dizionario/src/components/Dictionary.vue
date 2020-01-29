<template>
  <div>
    <h1>Dict</h1>
  </div>
</template>

<script>
export default {
  computed: {
    isAuth() {
      return this.$store.getters.getUser;
    }
  },
  methods: {
    setUser() {
      this.$store.dispatch("setUser", { capra: "Cosa?" });
    },
    removeUser() {
      this.$store.dispatch("logoutUser");
    }
  }
};
</script>