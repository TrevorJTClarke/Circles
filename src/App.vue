<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Directory</router-link> |
      <router-link :to="{ name: 'portfolio', params: { hash: defaultAddress }}">
        Portfolio
      </router-link>
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',

  data() {
    return {
      defaultAddress: '0x2342342',
    };
  },
};
</script>

<style lang="scss">
body {
  background: #f9f9f9;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
