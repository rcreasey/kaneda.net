<template>
  <div id="localhost">
    <Console :history="history" />
  </div>
</template>

<script>
import Console from './Console'
import commands from '../lib/commands'

export default {
  name: 'Localhost',
  components: {
    Console
  },
  data () {
    return {
      history: [
        {
          hostname: 'localhost',
          command: 'ssh ryan@kaneda.net',
          result: 'Connected to kaneda.net.',
          delay: 3,
          visible: false
        },
        {
          hostname: 'kaneda.net',
          command: 'ls -la',
          result: commands.ls('/'),
          delay: 4,
          visible: false
        }
      ]
    }
  }
}
</script>
