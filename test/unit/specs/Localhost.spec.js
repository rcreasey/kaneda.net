import Vue from 'vue'
import Localhost from '@/components/Localhost'

describe('Localhost.vue', () => {
  it('should render correct contents', () => {
    const Constructor = Vue.extend(Localhost)
    const vm = new Constructor().$mount()
    expect(vm.$el.querySelector('#console'))
  })
})
