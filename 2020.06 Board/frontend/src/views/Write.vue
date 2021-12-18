<template>
 	 <div style="padding: 5em 13em;">
	  	<h1 style="text-align:center">글 작성 페이지 :)</h1>
		<board-template v-bind:parentInfo="this.parentInfo" ref="writeBoard"></board-template>
		<b-button variant="warning" style="width:45%" @click="goList">취소</b-button>
		<b-button variant="info" style="width:50%" @click="regBtn">등록</b-button>
	</div>
</template>

<script>
export default {
	data() {
		return {
			parentInfo: {
				isEdit: 'write'
			}
		}
	},
	methods: {
		regBtn() {
			this.$refs.writeBoard.submitBnt()
			// $refs
			// 렌더링 된 후에만 접근 가능
			// 직접적인 자식 요소 제어에만 유효
		},
		goList() {
			if(confirm("목록으로 돌아갑니다.")) {
				this.$router.go(-1)
			}else{
				return false;
			}
		}
	}
}
</script>

<style scoped>

</style>