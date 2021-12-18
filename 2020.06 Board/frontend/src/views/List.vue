<template>
	<div>
		<h1>&nbsp;</h1>
		<router-link to="/write"><b-button block variant="primary">글 쓰기</b-button></router-link>
		<h1>&nbsp;</h1>
		<b-table ref="table" striped hover :items="getAll" @row-clicked="clickDetail"></b-table>
		<h1>&nbsp;</h1>
	</div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
	computed: {
		...mapGetters(['getAll']),
	},
	methods: {
		clickDetail(record) {
			this.$router.push(`/detail/${record.bno}`)
		},
	},
	created() {
		this.$store.dispatch('fetchedList') // actions 호출
	}
}
</script>

<style scoped>
.table {
	width: 95% !important;
	margin: auto;
}
</style>