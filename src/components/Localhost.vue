<template>
  <div class="localhost console">
    <span class="hostname prompt">localhost %</span><span id="cursor"></span>
  </div>
</template>

<script>
export default {
  name: 'Localhost',
  data () {
    return {
      command: 'ssh ryan@kaneda.net'
    }
  }
}
</script>

<style scoped>
</style>
