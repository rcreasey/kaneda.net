// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

import VueLodash from 'vue-lodash'
import VueTyperPlugin from 'vue-typer'
import vbclass from 'vue-body-class'

Vue.use(VueLodash)
Vue.use(VueTyperPlugin)
Vue.use(vbclass, router)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

document.body.addEventListener('click', function () { document.getElementById('user_input').focus() }, true)
