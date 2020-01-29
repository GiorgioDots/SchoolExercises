import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export const store = new Vuex.Store({
    state: {
        user: null,
        loading: false
    },
    mutations: {
        setUser(state, user) {
            localStorage.setItem("user", JSON.stringify(user));
            state.user = user;
        },
        logoutUser(state) {
            localStorage.removeItem('user');
            state.user = null;
        },
        setLoading(state, loading) {
            state.loading = loading;
        }
    },
    actions: {
        setUser({ commit }, user) {
            commit('setUser', user);
        },
        logoutUser({ commit }) {
            commit('logoutUser');
        },
        setLoading({ commit }, loading) {
            commit('setLoading', loading);
        }
    },
    getters: {
        getUser(state) {
            return state.user
        },
        getLoading(state) {
            return state.loading;
        }
    }
})