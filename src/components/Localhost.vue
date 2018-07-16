<template>
  <div id="console">
    <div class="localhost">
      <span class="hostname prompt">localhost %</span>
      <vue-typer text='ssh ryan@kaneda.net' :repeat="0" @completed="timeout_ssh"></vue-typer>
    </div>
    <div class="remote">
      <span id="cursor" class="clear" v-show="show_cursor"></span>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Localhost',
  data () {
    return {
      show_cursor: false,
      command: 'ssh ryan@kaneda.net'
    }
  },
  methods: {
    timeout_ssh: function () {
      this.show_cursor = true
    }
  }
}
</script>
