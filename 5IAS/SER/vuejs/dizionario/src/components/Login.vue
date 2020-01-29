<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="8" md="4">
      <v-card class="elevation-12">
        <v-toolbar color="primary" dark flat>
          <v-toolbar-title>Login</v-toolbar-title>
          <v-spacer />
        </v-toolbar>
        <v-card-text>
          <v-form>
            <v-text-field label="Nickname" name="nickname" v-model="nickname" type="text" />
            <v-text-field
              id="password"
              label="Password"
              name="password"
              v-model="password"
              type="password"
            />
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn color="primary" @click="submit">Login</v-btn>
          <v-btn color="primary" @click="clear">Clear</v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>
<script>
import axios from "axios";

export default {
  data: () => ({
    nickname: "",
    password: ""
  }),
  methods: {
    submit() {
      this.$store.dispatch("setLoading", true);
      axios({
        method: "POST",
        url: `${process.env.VUE_APP_BASE_URL}/auth/login`,
        headers: {
          "Content-Type": "application/json"
        },
        data: {
          nickname: this.nickname,
          password: this.password
        }
      })
        .then(response => {
          this.$emit("msgLog", {
            message: response.data.message,
            color: "#00E676"
          });
          let user = response.data.user;
          user.token = response.data.token;
          this.$store.dispatch("setUser", user);
          this.$store.dispatch("setLoading", false);
          this.$router.push("/");
        })
        .catch(error => {
          this.$emit("msgLog", {
            message: error.response.data.message,
            color: "#F44336"
          });
          this.$store.dispatch("setLoading", false);
        });
    },
    clear() {
      this.nickname = "";
      this.password = "";
    }
  }
};
</script>