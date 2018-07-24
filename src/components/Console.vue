<template>
  <div id="console">
    <Prompt v-for="(entry, index) in history"
      :key="entry.id"
      :id="index"
      :hostname="entry.hostname"
      :command="entry.command"
      :result="entry.result"
      :delay="entry.delay"
      :visible="entry.visible"
      :interactive="entry.interactive"
      v-on:command-complete="commandComplete" />

    <div class="interactive prompt" v-show="is_interactive">
      <span class="hostname">kaneda.net %</span>
      <span class="cursor" v-show="show_interactive_cursor"></span>
      <input id="user_input"
        v-model="user_input" v-focus
        ref="input" type="text"
        autocomplete="off"
        v-bind:class="{active: active_prompt}"
        @focus="check_command"
        @blur="check_command"
        @keyup="check_command"
        @keyup.enter="send_command"
      />
    </div>
    <pre>{{ history }}</pre>

  </div>
</template>

<script>
import Prompt from './Prompt'
export default {
  name: 'Console',
  components: {
    Prompt
  },
  data () {
    return {
      is_interactive: false,
      active_prompt: false,
      show_interactive_cursor: false,
      user_input: ''
    }
  },
  directives: {
    focus: {
      inserted: function (el) {
        el.focus()
      }
    }
  },
  props: {
    history: { type: Array, default: () => { return [] } }
  },
  methods: {
    commandComplete: function (id) {
      this.history[id].visible = true
      this.is_interactive = true
    },
    check_command () {
      this.show_interactive_cursor = !this.user_input.length
      this.active_prompt = this.user_input.length > 0
    },
    send_command () {
      const [command, ...args] = this.user_input.trim().split(' ')
      this.history.push({
        hostname: 'kaneda.net',
        command: command + ' ' + args,
        result: 'command not found: ' + command,
        interactive: true,
        visible: true
      })
      this.$nextTick(() => {
        this.user_input = ''
        this.show_interactive_cursor = true
        this.active_prompt = false
      })
    }
  },
  mounted: function () {
    if (this.history.length) {
      this.history[0].visible = true
    }
  }
}
</script>

<style scoped>
div.prompt {
  display: flex;
}

span.hostname {
  margin-right: 0.5rem;
}

input {
  padding: 0;
  margin: 0 0 0 -0.5rem;
  border: none;
  outline: none;
  background: none;
  min-width: 0;
  flex: 1;
}

input.active {
  margin-left: 0;
}
</style>
