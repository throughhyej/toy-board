<template>
  <div style="padding: 5em 13em;">
	  <h1 style="text-align:center">글 수정 페이지 :)</h1>
		<board-template v-bind:parentInfo="this.parentInfo" ref="editBoard"></board-template>
		<h1>&nbsp;</h1>
		<div style="text-align-last:center;">
			<b-button style="width:45%" variant="info" @click="backToList">수정취소</b-button>
			<b-button style="width:45%" variant="warning" @click="editedBtn">수정완료</b-button>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			parentInfo: {
				bno: this.$route.params.bno,
				isEdit: 'edit'
			}
		}
	},
	methods: {
		editedBtn() {
			this.$refs.editBoard.submitBnt()
			// $refs
			// 렌더링 된 후에만 접근 가능
			// 직접적인 자식 요소 제어에만 유효
		},
		backToList() {
			if(confirm("수정사항을 폐기하고 목록으로 돌아가시겠습니까?")) {
				this.$router.push('/')
			}else{
				return false;
			}
		},
	}
}
</script>

<style>

</style>