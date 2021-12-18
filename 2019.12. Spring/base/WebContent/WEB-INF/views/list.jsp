<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
</head>
<body class="is-preload">
<form id="actionForm" action="/" method="GET" style="margin:0;">
	<input type="hidden" name="page" value="${pagingCalc.pagingBase.page}">
	<input type="hidden" name="perPageNum" value="${pagingCalc.pagingBase.perPageNum}">
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
					<div class="row gtr-200">
						<h4>LIST</h4>
						<ul class="actions" style="margin-left:auto;">
							<li><a href="/write" class="button primary">글 등록</a></li>
						</ul>
					</div>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="10%">
								<col width="65%">
								<col width="15%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>NO.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일자</th>
								</tr>
							</thead>
							<tbody id="list">
								<c:forEach var="list" items="${boardList}">
									<tr>
										<td>${list.idx}</td>
										<td><a href='<c:out value="${list.idx}"/>'>${list.title}</a></td>
										<td>${list.writer}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regDate}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<ul class="pagination" style="text-align:center;">
						<c:if test="${pagingCalc.prev}"><li><a href="${pagingCalc.startPage -1}" class="button">Prev</a></li></c:if>
						<c:forEach var="pageNo" begin="${pagingCalc.startPage}" end="${pagingCalc.endPage}">
							<li><a href="${pageNo}" class="page ${pagingCalc.pagingBase.page == pageNo ? 'active' : '' }">${pageNo}</a></li>
						</c:forEach>
						<c:if test="${pagingCalc.next}"><li><a href="${pagingCalc.endPage +1} class="button">Next</a></li></c:if>
					</ul>
					<!-- <ul class="pagination" style="text-align:center;">
						<li><span class="button disabled">Prev</span></li>
						<li><a href="#" class="page active">1</a></li>
						<li><a href="#" class="page">2</a></li>
						<li><a href="#" class="page">3</a></li>
						<li><span>&hellip;</span></li>
						<li><a href="#" class="page">8</a></li>
						<li><a href="#" class="page">9</a></li>
						<li><a href="#" class="page">10</a></li>
						<li><a href="#" class="button">Next</a></li>
					</ul> -->
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<jsp:include page="sideMenu.jsp" />
		
	</div>
<!-- <script src="resources/base.js"></script> -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/browser.min.js"></script>
<script src="resources/js/breakpoints.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script>
var actionForm = $("#actionForm");
	$().ready(function(){
		$(".pagination a").on("click", function(event){
			event.preventDefault();
			actionForm.find("input[name=page]").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$("#list a").on("click", function(event){
			event.preventDefault();
			// <input type="hidden" name="page" value="${pagingCalc.pagingBase.page}">
			actionForm.append("<input type='hidden' name='idx' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/view");
			actionForm.submit();
		});
	});
</script>
</body>
</html>