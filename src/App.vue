<template>
  <div id="app" class="scanlines">
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
html {
  height: 100%;
}

body {
  background: black;
  color: lightblue;
  font-family: Hack, Monaco, "Lucida Console", monospace;
  font-size: 10pt;
  text-shadow: 0 0 10px lightblue;
  margin: 0;
  min-height: 100%;
}

#app {
  // display: flex;
}

#cursor {
  font-weight: normal;
  background-color: lightblue;
  -webkit-animation: 1s blink step-end infinite;
  -moz-animation: 1s blink step-end infinite;
  -ms-animation: 1s blink step-end infinite;
  -o-animation: 1s blink step-end infinite;
  animation: 1s blink step-end infinite;
  padding: 0 0.25rem;
}

@keyframes blink {
  from, to {
    visibility: hidden;
  }
  50% {
    visibility: visible;
  }
}

.console {
  padding: 0.5rem;
}

.prompt {
  margin-right: 0.5rem;
}
</style>
