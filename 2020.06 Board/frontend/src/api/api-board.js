import axios from 'axios'

const instance = axios.create({
	baseURL: `${VUE_APP_SERVER_URI}`
})

function getList() {
	return instance.get('/');
}

function writeBoard(payload) {
	return instance.post('/submit', payload)
}

function viewBoard(payload) {
	return instance.get('/view/'+payload)
}

function editedBoard(payload) {
	return instance.put('/edit/'+payload.bno, payload)
}

function deleteBoard(payload) {
	return instance.delete('/delete/'+payload)
}

export { getList, writeBoard, viewBoard, editedBoard, deleteBoard }

