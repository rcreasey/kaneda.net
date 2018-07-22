<template>
  <div id="localhost">
    <Console :history="history" />
  </div>
</template>

<script>
import Console from './Console'

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
          result: 'drwxr-xr-x   - rcreasey 22 Jul  9:08 bin\n.rw-r--r-- 730 rcreasey 22 Jul  9:09 README.md',
          delay: 4,
          visible: false
        }
      ]
    }
  }
}
</script>
