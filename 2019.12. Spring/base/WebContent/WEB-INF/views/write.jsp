<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<style>
	.ck .ck-content {
	    height: 500px;
	}
</style>
</head>
<body class="is-preload">
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
							<ul class="actions" style="margin-left:61.5em;">
								<li><input type="button" value="등록" onclick="javascript:register();" class="primary" /></li>
								<li><input type="button" value="목록" onclick="javascript:goList();"/></li>
							</ul>
						</div>
						<div class="row gtr-uniform">
							<div class="col-12">
								<input type="text" name="title" id="title" value="" placeholder="제목을 입력해주세요." />
							</div>
							<div class="col-12">
								<div name="content" id="editor"></div>
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
	if(confirm("입력내용이 모두 초기화됩니다.") == true){
		location.href='/';
	}else{
		return false;	
	}
}

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
			url: "/write",
			data: {
				title : title,
				content : content
			},
			method: "POST",
			error: function(error){
				alert("ERROR: " + error);
			},
			success: function(data){
				alert("등록되었습니다.");
				location.href="/";
			}
		})
	}
}
</script>
<!-- <script src="resources/base.js"></script> -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/browser.min.js"></script>
<script src="resources/js/breakpoints.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
</body>
</html>