<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style lang="scss">
@import "src/assets/scss/scanlines.scss"
</style>

<style lang="css">
@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');
html {
  height: 100%;
}

body {
  background: #333;
  color: lightblue !important;
  font-family: "Source Code Pro", Hack, Monaco, "Lucida Console", monospace;
  font-size: 10pt;
  text-shadow: 0 0 10px lightblue;
  margin: 0;
  padding: 0;
  min-height: 100%;
}

#app {
  padding: 0.5rem;
}
</style>
