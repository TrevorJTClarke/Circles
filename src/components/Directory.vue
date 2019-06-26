<template>
  <div class="directory-list">
    <div class="list-item" v-for="item in list" :key="item">
      <h3>{{ item }}</h3>
      <router-link :to="{ name: 'portfolio', params: { hash: item }}">View Portfolio</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  name: 'Directory',

  data() {
    return {
      list: ['0fba123'],
    };
  },

  computed: {
    ...mapGetters(['directory']),
  },
};
</script>

<style scoped lang="scss">
.directory-list {
  display: flex;
  flex-direction: column;
  max-width: 400px;
  margin: 40px auto;
}

.list-item {
  background: white;
  box-shadow: 0 1px 10px -2px rgba(0,0,0,0.2);
  border-radius: 3px;
  padding: 10px;
  display: flex;
  justify-content: space-between;

  h3 {
    margin: 0;
  }
}
</style>
