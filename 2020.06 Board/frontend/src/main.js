import '@babel/polyfill'
import Vue from 'vue';
import App from './App.vue'
import { router } from './routes/routes'
import { store } from './store/store'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
window.$ = window.jQuery = require('jquery') // jquery 전역 설정
import BoardTemplate from './components/BoardTemplate.vue'
import { ValidationObserver, ValidationProvider } from 'vee-validate'
import * as validation from './common/validation'
import { i18n } from './i18n/i18n'
import VueSidebarMenu from 'vue-sidebar-menu'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'
Vue.use(VueSidebarMenu)

Vue.use(BootstrapVue)
Vue.component('validation-provider', ValidationProvider)
Vue.component('validation-observer', ValidationObserver)
Vue.component('board-template', BoardTemplate)

new Vue({
	el: '#app',
	router,
	store,
	i18n,
	render: h => h(App)
})