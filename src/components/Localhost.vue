<template>
  <div id="console">
    <Command hostname="localhost" command="ssh ryan@kaneda.net" result="Connection to kaneda.net timed out." :result_delay="2" />
  </div>
</template>

<script>
import Command from './Command'

export default {
  name: 'Localhost',
  components: {
    Command
  }
}
</script>
