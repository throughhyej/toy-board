<template>
	<div>
		<h1>&nbsp;</h1>
		<validation-observer v-slot="{ handleSubmit }"> <!--  양식 전체 유효성 검사 -->
			<form @submit.prevent="handleSubmit(submit)">
				<div>
				<!-- <validation-provider name="제목" rules="required|max:10" v-slot="{ errors }"> -->
					<validation-provider name="title" rules="required|max:10" v-slot="error">
						<span>{{ $t("title") }}&nbsp;&nbsp;:&nbsp;</span>
						<input type="text" style="width:95%" v-model="board.title" class="disabled"/>
						<p class="errorMsg">{{ error.errors[0] }}</p>
				</validation-provider> <!--  입력 필드 유효성 검사 -->
				</div>
				<div>
					<validation-provider name="content" rules="required|max:200" v-slot="{ errors }">
							<span>{{ $t("content") }}&nbsp;&nbsp;:&nbsp;</span>
							<b-form-textarea
								id="textarea"
								rows="3"
								max-rows="6"
								style="width:95%; margin-left:3.5em"
								v-model="board.content"
								class="disabled"
								></b-form-textarea>
							<p class="errorMsg">{{ errors[0] }}</p>
					</validation-provider>
				</div>
				<div style="padding-top: 7px;">
					<validation-provider name="writer" rules="required|max:7" v-slot="{ errors }">
							<label for="writer">{{ $t("writer") }}:&nbsp;</label>
							<input type="text" style="width:94.5%" v-model="board.writer" class="disabled" />
							<p class="errorMsg">{{ errors[0] }}</p>
					</validation-provider>
				</div>
				<b-button type="submit" id="submitBnt" style="background-color:#fff; border-color:#fff;"></b-button>
			</form>
		</validation-observer>
	</div>
</template>

<script>
import { viewBoard } from '../api/api-board'

export default {
	props: [
		'parentInfo'
	],
	data() {
		return {
			board: {
				bno: '',
				title: '',
				content: '',
				writer: ''
			},
			boolean: false,
			submitMethod: ''
		}
	},
	methods: {
		submitBnt() {
			$("#submitBnt").click();
		},
		submit() {
			const board = this.board // JSON.stringify(this.board)
			if(this.submitMethod == 'edit'){
				if(confirm("게시물을 수정하시겠습니까.")) {
					this.$store.dispatch('updateBoard', board)
				}
			}else if(this.submitMethod == 'write'){
				if(confirm("게시물을 등록합니다.")) {
					this.$store.dispatch('regBoard', board)
			}
			}
		}
	},
	async created() {
		try {
			if(this.parentInfo.isEdit != 'write') {
				let { data } = await viewBoard(this.parentInfo.bno)
				this.board.bno = this.parentInfo.bno
				this.board.title = data.title
				this.board.content = data.content
				this.board.writer = data.writer
				if(this.parentInfo.isEdit == 'edit') {
					this.submitMethod = 'edit'
				}else{
					this.submitMethod = ''
				}
			}else if(this.parentInfo.isEdit == 'write') {
				this.submitMethod = 'write'
			}
		}catch(e){
			console.log(e)
		}
	},
	mounted() {
		if(this.parentInfo.isEdit == 'read') {
			$(".disabled").attr("disabled", true)
		}else if(this.parentInfo.isEdit == 'edit'){
			$(".disabled").attr("disabled", false)
		}else if(this.parentInfo.isEdit == 'write'){
			$(".disabled").attr("disabled", false)
		}
	}	
}
</script>

<style scoped>
.errorMsg {
	margin-left: 4em !important;
	color: red;

}
</style>