<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.ck .ck-content {
	    height: 500px;
	}
</style>
</head>
<body>
<form id="operForm" action="/update" method="POST" style="margin:0;">
	<input type="hidden" name="idx" value="<c:out value='${board1.idx}'/>">
	<input type="hidden" name="page" value="<c:out value='${pagingBase.page}'/>">
	<input type="hidden" name="perPageNum" value="<c:out value='${pagingBase.perPageNum}'/>">
</form>
<div id="wrapper">
<!-- Main -->
<div id="main">
	<div class="inner">
		<!-- Header -->
		<header id="header">
			<a href="/" class="logo"><strong>SHIN </strong>HYE JEONG</a>
		</header>
			<!-- Content -->
			<section style="padding:3em 0em 3em 0em;">
				<!-- Elements -->
				<form method="post" action="#">
					<div class="col-12">
						<ul class="actions" style="margin-left:55em;">
							<li><input type="button" value="취소" onclick="javascript:cancel();" /></li>
							<li><input type="button" value="저장" onclick="javascript:register();" class="primary" /></li>
							<li><input type="button" value="목록" onclick="javascript:goList();"/></li>
						</ul>
					</div>
					<div class="row gtr-uniform">
						<div class="col-12">
							<input type="text" name="title" id="title" value="${board1.title}" readonly />
						</div>
						<div class="col-12">
							<div name="content" id="editor">${board1.content}</div>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- Sidebar -->
	<jsp:include page="sideMenu.jsp" />
	
</div>

<script src="/resources/js/ckeditor.js"></script>
<script>
var editorContent;
ClassicEditor.create(document.querySelector('#editor'))
		.then(editor => {
			editorContent = editor;
		})
		.catch (error => {
			alert(error);
});

function goList(){
	if(confirm("목록으로 돌아갑니다.") == true){
		location.href='/?page=' + ${pagingBase.page} + '&perPageNum=' + ${pagingBase.perPageNum} ;
	}else{
		return false;	
	}
}

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
var idx = <%=idx%>;

function register(){
	var title = $("#title").val();
	var content = editorContent.getData();
	if(title == ''){
		alert("내용을 입력해주세요");
		return false;
	}else if(content == ''){
		alert("본문을 입력해주세요");
		return false;
	}else{
		$.ajax({
			url: "/update",
			data: {
				idx: idx,
				title: title,
				content: content
			},
			method: "POST",
			error: function(error){
				alert("ERROR: " + error);
			},
			success: function(data){
				alert("수정되었습니다.");
				location.href="/";
			}
		})
	}
}

function cancel(){
	if(confirm("수정을 취소합니다.") == true) {
		location.href='/view?page=' + ${pagingBase.page} + '&perPageNum=' + ${pagingBase.perPageNum} + '&idx=' + idx;
	}else{
		return false;
	}
}
</script>
</body>
</html>