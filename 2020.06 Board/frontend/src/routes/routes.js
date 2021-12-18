import Vue from 'vue'
import VueRouter from 'vue-router'
import boardrouter  from './board-route'

Vue.use(VueRouter)

export const router = new VueRouter ({
	mode: 'history',
	routes: [
		...boardrouter
	]
})