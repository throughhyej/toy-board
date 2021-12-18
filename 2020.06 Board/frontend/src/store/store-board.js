import { router } from '../routes/routes'
import { getList, viewBoard, writeBoard, editedBoard, deleteBoard } from '../api/api-board'

export default {
	state: {
		boards: [],
		oneboard: {},
	},
	getters: {
		getAll(state) {
			return state.boards
		},
		getOne(state) {
			return state.oneboard;
		}
	},
	mutations: {
		fetchData(state, payload) {
			state.boards = payload
		},
		fetchBoard (state, payload) {
			state.oneboard = payload
		}
	},
	actions: {
		fetchedList (context) {
			getList().then(response => context.commit('fetchData', response.data))
					.catch(e => console.log(e))
		},
		getDetail(context, payload) {
			viewBoard(payload).then(response => context.commit('fetchBoard', response.data))
									.catch(e => console.log(e))
		},
		regBoard(context, payload) {
			writeBoard(payload).then(response => alert("등록 완료"))
									.then(response => router.push('/'))
									.catch(e => console.log(e))
		},
		updateBoard(context, payload) {
			editedBoard(payload).then(response => alert("수정 완료"))
										.then(response => router.push(`/detail/${payload.bno}`))
										.catch(e => console.log(e))
		},
		removeBoard(context, payload) {
			deleteBoard(payload).then(response => alert("삭제 완료"))
										.then(response => router.push('/'))
										.catch(e => console.log(e))
		}
	}
}