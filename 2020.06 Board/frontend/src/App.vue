<template>
	<div id="demo" :class="{ 'collapsed': collapsed }">
		
		<div class="container" style="max-width: 100%">	
			<transition name="fade">
				<router-view></router-view>
			</transition>
		</div>
		<sidebar-menu
			:menu="menu"
			:collapsed="collapsed"
			:theme="selectedTheme"
			@toggle-collapse="onToggleCollapse"
			@item-click="onItemClick"
		/>
	</div>
</template>

<script>
import { localize } from 'vee-validate';
import { i18n } from './i18n/i18n'

export default {
	data() {
		return {
			locale: USER_LOCALE,
			collapsed: false,
			theme: '',
			selectedTheme: 'white-theme',
			menu: [
				{
					header: true,
					title: '★',
					hiddenOnCollapse: false
				},
				{
					href: { path: '/' },
					title: 'LIST',
					icon: 'fa fa-list-ul'
				},
				{
					href: { path: '/nothing' },
					title: '다른 메뉴',
					icon: 'fa fa-code'
				},
				{
					href: '',
					title: '언어 설정',
					icon: 'fa fa-cogs'
				},
			],
		}
	},
	methods: {
		onToggleCollapse (collapsed) {
		this.collapsed = collapsed
		},
		onItemClick (event, item, node) {
			if(item.title === '언어 설정' ) {
				if(this.locale == 'ko') {
					i18n.locale = 'ko'
					localize(this.locale)
					this.locale = 'en'
				}else{
					i18n.locale = 'en'
					localize(this.locale)
					this.locale = 'ko'
				}
			}else{
				return false;
			}
		},
	},
}
</script>

<style scoped>
	#demo {
		padding-left: 350px;
		transition: 0.3s ease;
		/* padding: 50px; */
	}
	#demo.collapsed {
		padding-left: 50px;
	}
	.v-sidebar-menu, .vsm--title {
		color: red !important /* 안 된다 */
	}
	.container {
		margin-right: 0px;
	}
	.v-sidebar-menu.vsm_white-theme{
		background-color: aliceblue;
	}

	.fade-enter-active, .face-leave-active {
		transition: opacity .5s;
	}
	.fade-enter, .fade-leave-to {
		opacity: 0;
	}
</style>