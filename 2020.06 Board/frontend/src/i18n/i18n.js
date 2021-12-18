import Vue from 'vue'
import VueI18n from 'vue-i18n'

Vue.use(VueI18n)

var messages = {
	'en' : {
		"title" : "title",
		"content" : "content",
		"writer" : "writer"
	},
	'ko' : {
		"title" : "제목",
		"content" : "내용",
		"writer" : "작성자"
	},
}

export const i18n = new VueI18n({
	locale: 'ko', fallbackLocale : 'en', messages
})