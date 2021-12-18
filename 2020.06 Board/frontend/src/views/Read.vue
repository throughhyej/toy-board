<template>
  <div style="padding: 5em 13em;">
	  <h1 style="text-align:center">글 조회 페이지 :)</h1>
		<board-template v-bind:parentInfo="this.parentInfo"></board-template>
		<h1>&nbsp;</h1>
		<div style="text-align-last:center;">
			<b-button style="width:30%" variant="info" @click="backToList">목록</b-button>
			<b-button style="width:30%" variant="warning" @click="editThis">수정</b-button>
			<b-button style="width:30%" variant="danger" @click="delThis">삭제</b-button>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			parentInfo: {
				bno: this.$route.params.bno,
				isEdit: 'read'
			}
		}
	},
	methods: {
		backToList() {
			if(confirm("목록으로 이동합니다.")) {
				this.$router.push('/')
			}else{
				return false;
			}
		},
		editThis() {
			this.$router.push(`/edit/${this.parentInfo.bno}`)
		},
		delThis() {
			if(confirm("삭제하시겠습니까?")) {
				this.$store.dispatch('removeBoard', this.parentInfo.bno)
			}else{
				return false;
			}
		}
	},
}
</script>

<style>

</style>