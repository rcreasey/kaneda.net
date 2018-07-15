import Vue from 'vue'
import Router from 'vue-router'
import Localhost from '@/components/Localhost'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Localhost',
      component: Localhost
    }
  ]
})
