import Vue from 'vue'
import Console from '@/components/Console'

const propsData = {
  hostname: 'kaneda.net',
  command: 'echo "hello"',
  result: 'hello'
}
describe('Console.vue', () => {
  it('should render correct contents', () => {
    const Constructor = Vue.extend(Console)
    const vm = new Constructor({ propsData: propsData }).$mount()
    expect(vm.$el.querySelector('#console .prompt .hostname').textContent)
      .toEqual('kaneda.net %')
    expect(vm.$el.querySelector('div.prompt.interactive').textContent)
      .toEqual('kaneda.net %  ')
  })
  it('should transition state for console sequence', () => {
    const Constructor = Vue.extend(Console)
    const vm = new Constructor({ propsData: propsData }).$mount()

    expect(vm.display_result_cursor).toBeFalsy()
    expect(vm.display_hanging_prompt).toBeFalsy()
  })
})
