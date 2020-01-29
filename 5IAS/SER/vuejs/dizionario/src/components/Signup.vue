<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="8" md="4">
      <v-card class="elevation-12">
        <v-toolbar color="primary" dark flat>
          <v-toolbar-title>Signup</v-toolbar-title>
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
            <v-select :items="roles" label="Role" v-model="selectedRole"></v-select>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn color="primary" @click="submit">Signup</v-btn>
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
    password: "",
    roles: ["Super Admin", "Admin"],
    selectedRole: ""
  }),
  methods: {
    submit() {
      this.$store.dispatch("setLoading", true);
      axios({
        method: "PUT",
        url: `${process.env.VUE_APP_BASE_URL}/auth/signup`,
        headers: {
          "Content-Type": "application/json"
        },
        data: {
          nickname: this.nickname,
          password: this.password,
          role: this.selectedRole == "Super Admin" ? 0 : 1
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
          this.$store.dispatch("setLoading", false);
          this.$emit("msgLog", {
            message: error.response.data.data[0].msg,
            color: "#F44336"
          });
        });
    },
    clear() {
      this.nickname = "";
      this.password = "";
      this.selectedRole = "";
    }
  }
};
</script>