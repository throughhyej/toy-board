import Vue from 'vue'
import Vuex from 'vuex'
import boardStore from './store-board'

Vue.use(Vuex)

export const store = new Vuex.Store({
	modules: {
		boardStore,
	}
})