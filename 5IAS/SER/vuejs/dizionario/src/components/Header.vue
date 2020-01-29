<template>
  <v-container>
    <v-navigation-drawer v-model="drawer" app clipped>
      <v-list dense>
        <v-list-item link to="/">
          <v-list-item-action>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Home</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <template v-if="!isAuth">
          <v-list-item link to="/login">
            <v-list-item-action>
              <v-icon>mdi-view-dashboard</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Login</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item link to="/signup">
            <v-list-item-action>
              <v-icon>mdi-settings</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Signup</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
        <v-list-item v-else @click="onLogout">
          <v-list-item-action>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Logout</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar app clipped-left>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title>Dictionary</v-toolbar-title>
      <v-progress-linear
        :active="isLoading"
        :indeterminate="isLoading"
        bottom
        absolute
        color="#3D5AFE"
      ></v-progress-linear>
    </v-app-bar>
  </v-container>
</template>

<script>
export default {
  props: {
    source: String
  },
  data: () => ({
    drawer: null
  }),
  methods: {
    onLogout() {
      this.$emit("msgLog", {
        message: "Logged Out",
        color: "#00E676"
      });
      this.$store.dispatch("logoutUser");
    }
  },
  computed: {
    isAuth() {
      return this.$store.getters.getUser;
    },
    isLoading() {
      return this.$store.getters.getLoading;
    }
  },
  created() {
    this.$vuetify.theme.dark = true;
  }
};
</script>