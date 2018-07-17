<template>
  <div class="command">
    <div class="prompt">
      <span class="hostname">{{ hostname }} %</span>
      <vue-typer :text="command" :repeat="0" @completed="process_command" :v-show="Boolean(command)"></vue-typer>
    </div>
    <span class="cursor" v-show="display_result_cursor"></span>
    <transition name="result">
      <span class="result" v-if="display_result">{{ result }}</span>
    </transition>
    <div class="prompt hanging" v-show="display_hanging_prompt">
      <span class="hostname">{{ hostname }} %</span>
      <span class="cursor"></span>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Command',
  props: {
    hostname: { type: String, default: 'kaneda.net' },
    command: { type: String, default: '' },
    result: { type: String, default: '' },
    result_delay: { type: Number, default: 0 }
  },
  data () {
    return {
      display_hanging_prompt: false,
      display_result_cursor: false
    }
  },
  methods: {
    command_complete: function () {
      this.display_result_cursor = false
      this.display_hanging_prompt = true
    },
    output_result: function () {
      this.command_complete()
      this.display_result = true
    },
    process_command: function () {
      this.display_result_cursor = true
      setTimeout(this.output_result, this.result_delay * 1000)
    }
  }
}
</script>

<style>
.vue-typer .custom.char {
  color: lightblue;
  background-color: transparent;
}

.vue-typer .custom.caret {
  background-color: lightblue;
  margin-left: 0.25rem;
  width: 0.5rem;
}
</style>

<style scoped>
  span.command {
    display: flex;
    flex-flow: column;
  }

  span.result {
    display: flex;
    flex-flow: column;
  }

  span.cursor {
    font-weight: normal;
    background-color: lightblue;
    -webkit-animation: 1s blink step-end infinite;
    -moz-animation: 1s blink step-end infinite;
    -ms-animation: 1s blink step-end infinite;
    -o-animation: 1s blink step-end infinite;
    animation: 1s blink step-end infinite;
    box-shadow: 0 0 10px lightblue;
    padding: 0 0.25rem;
  }

  div.hanging span.cursor {
    margin-left: 0.5rem;
  }

  @keyframes blink {
    from, to {
      visibility: hidden;
    }
    50% {
      visibility: visible;
    }
  }

  .result-enter, .result-leave-to { opacity: 0; }
  .result-enter-active, .result-leave-active { opacity: 1; }
</style>
