<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<form id="operForm" action="/update" method="GET" style="margin:0;">
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
						<ul class="actions" style="margin-left:56em;">
							<li><input type="button" value="수정" onclick="javascript:updateBoardVO();"/></li>
							<li><input type="button" value="삭제" onclick="javascript:deleteBoardVO();" class="primary" /></li>
							<li><input type="button" value="목록" onclick="javascript:goList();"/></li>
						</ul>
					</div>
					<div class="row gtr-uniform">
						<div class="col-12">
							<input type="text" name="title" id="title" value="${board1.title}" readonly />
						</div>
						<div class="col-12" style="margin-left:1em;">
							<div>${board1.content}</div>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- Sidebar -->
	<jsp:include page="sideMenu.jsp" />
	
</div>
<script>
function goList(){
	// http://localhost:8080/view?page=1&perPageNum=10&idx=11
	location.href='/?page=' + ${pagingBase.page} + '&perPageNum=' + ${pagingBase.perPageNum} ;
}

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
var idx = <%=idx%>;
function deleteBoardVO(){
	if(confirm("삭제됩니다.") == true){
		$.ajax({
			url: "/delete",
			data: {
				idx: idx
			},
			method: "POST",
			dataType: "html",
			error: function(error){
				alert("ERROR: " + error);
			},
			success: function(data){
				alert("삭제되었습니다.");
				location.href="/";
			}
		})
	}else{
		return false;
	}
}

function updateBoardVO(){
	location.href='/update?page=' + ${pagingBase.page} + '&perPageNum=' + ${pagingBase.perPageNum} + '&idx=' + idx;
}
</script>
</body>
</html>