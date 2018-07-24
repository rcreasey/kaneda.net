<template>
  <div class="shell" v-show="visible">
    <div class="command" v-if="command">
      <div class="prompt">
        <span class="hostname">{{ hostname }} %</span>
        <span v-if="isInteractive" class="output">{{ command }}</span>
        <vue-typer v-else :text="command" :pre-type-delay="typeDelay" :repeat="0" @completed="process_prompt"/>
      </div>
      <span class="cursor" v-show="display_result_cursor"></span>
      <transition name="result">
        <pre class="result" v-if="display_result" v-html="result"></pre>
      </transition>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Prompt',
  props: {
    id: { type: Number, default: 0 },
    hostname: { type: String, default: 'localhost' },
    command: { type: String, default: '' },
    result: { type: String, default: '' },
    delay: { type: Number, default: 0 },
    interactive: { type: Boolean, default: false },
    visible: { type: Boolean, default: false }
  },
  computed: {
    isInteractive: function () {
      console.log(this.interactive)
      return this.interactive
    },
    typeDelay: function () { return this.delay * 2 }
  },
  data () {
    return {
      display_prompt: false,
      display_result: false,
      display_result_cursor: false,
      user_input: ''
    }
  },
  methods: {
    prompt_complete: function () {
      this.display_result_cursor = false
      this.display_result = true
      this.display_prompt = true
      this.$emit('command-complete', this.id)
    },
    process_prompt: function () {
      this.display_result_cursor = true
      setTimeout(this.prompt_complete, this.delay * 1000)
    }
  },
  mounted: function () {
    this.process_prompt()
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

@keyframes blink {
  from, to { visibility: hidden; }
  50% { visibility: visible; }
}
</style>

<style scoped>
  span.result {
    display: flex;
    flex-flow: column;
  }

  .result-enter, .result-leave-to { opacity: 0; }
  .result-enter-active, .result-leave-active { opacity: 1; }
</style>
