import Vue from 'vue'
import Command from '@/components/Command'

const propsData = {
  hostname: 'kaneda.net',
  command: 'echo "hello"',
  result: 'hello'
} 
describe('Command.vue', () => {
  it('should render correct contents', () => {
    const Constructor = Vue.extend(Command)
    const vm = new Constructor({ propsData: propsData }).$mount()
    expect(vm.$el.querySelector('.command .prompt .hostname').textContent)
      .toEqual('kaneda.net %')
    expect(vm.$el.querySelector('div.prompt.hanging').textContent)
      .toEqual('kaneda.net % ')
  })
  it('should transition state for command sequence', () => {
    const Constructor = Vue.extend(Command)
    const vm = new Constructor({ propsData: propsData }).$mount()
    
    expect(vm.display_result_cursor).toBeFalsy()
    expect(vm.display_hanging_prompt).toBeFalsy()
  })
})
