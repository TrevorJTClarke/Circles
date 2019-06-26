import Vue from 'vue';
import Vuex from 'vuex';
import directory from './directory.js';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    directory: {},
  },
  getters: {
    directory: state => state.directory,
  },
  mutations: {

  },
  actions: {

  },
});
