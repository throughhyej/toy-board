<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="UTF-8">
    <title>로즈시스템즈_게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="로즈시스템즈입니다"/>
    <meta name="format-detection" content="telephone=no"/> <!-- 전화번호 CSS 초기화 -->
    <meta name="keywords" content="rosesystems"/>
    <meta property="og:title" content="rosesystems"/>
    <meta property="og:description" content="rosesystems"/>
    <!-- CSS : COMMON -->
        <link rel="stylesheet" type="text/css" href="resources/css/common.css"/>
        <link rel="stylesheet" type="text/css" href="resources/css/layout.css"/>
        <link rel="stylesheet" type="text/css" href="resources/css/board.css"/>
    <!-- Themify Icons -->
        <link rel="stylesheet" type="text/css" href="resources/css/themify-icons.css">
      <!-- jQuery-2.2.4 js -->
      <script src="/resources/js/jquery.min.js"></script>
      <script>
      	$(document).ready(function(){
  			var formObj = $("form[role='form']");
    		$("#btnList").on("click", function(){
    				formObj.attr("method", "get");
    				formObj.attr("action", "/");
    				formObj.submit();		
    			}); // 목록페이지로 돌아가기
    		});
    	$(function(){
   			var openForm = $("#openForm");
   			$("#btnDelete").bind("click", function(e){
   				openForm.method = "POST";
   				openForm.action = "/remove";
   				openForm.submit();
   			}); // 삭제하기
    	});
      </script>
      <script>
	$(document).ready(function(){
		
	  $(function(){
	    var bno = '<c:out value="${boardVO.bno}"/>';
	    $.getJSON("/getAttachList", {bno: bno}, function(arr){
	       console.log(arr);
	       var str = "";
	       $(arr).each(function(i, attach){
	         //image type
	    	   if(attach.fileType){
	    		   str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	               str += "<span> "+ attach.fileName+"</span><br/>";
	               str += "</a>";
	               str += "</div>";
	               str +"</li>";
	             }else{
	               str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	               str += "<span> "+ attach.fileName+"</span><br/>";
	               str += "</a>";
	               str += "</div>";
	               str +"</li>";
	             }
	       });
	       $(".uploadResult ul").html(str);
	     });//end getjson
	  });//end function
	  
	  
	  $(".uploadResult").on("click","li", function(e){
	    var liObj = $(this);
	    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
	    if(liObj.data("type")){
	    	//download 
	        self.location ="/download?fileName="+path
	      }else {
	        //download 
	        self.location ="/download?fileName="+path
	      }
	  });
	});

</script>
</head>


<body id="allWrap">
<form id="openForm" action="/remove" method="post">
	<div class="board_wrap line_list">
		<input type="hidden" id="bno" name="bno"  value="${boardVO.bno}" />
		<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"  >
		 <table summary="" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th>
				  <span class="fs_15 bold">${boardVO.title}</span>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td class="tright" style="letter-spacing:-1px;">
					 <span class="fc_01">작성자 : </span>
					 <span class="mgr05">${boardVO.writer}</span>
					 <span class="fc_01">조회수 : </span>
					 <span class="mgr05 letter_zero"><c:out value="${boardVO.viewCount }" /></span>
					 <span class="fc_01">등록일 : </span>
					 <span class="letter_zero"><fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd" /></span>
				</td>
			</tr>
			<tr>
				<td class="board_input_cont tleft">
                        <c:out value="${boardVO.content}" />
				</td>
			</tr>
			<tr>
				<td class="tright" style="padding-right:20px;">
					 <span class="name">첨부파일 :
					 <br />
					 <br />
					 <div class='uploadResult'>
						<ul>
						
						</ul>
					</div>
					</span>
                     <!-- <span id="" disp_attachfile><a href="#0"><span class="ti-clip mgl02"></span> 첨부파일명.hwp</a></span> -->
				</td>
			</tr>
			</tbody>
		</table>

		<table class="mgt30" cellpadding="0" cellspacing="0">
			<tbody>
			<tr>
				<th width="30%" scope="row"><span class="ti-angle-up fl"></span> 이전글</th>
				<td class="tleft">

                	<span id="disp_prev_subject"><a href="#0" class="product">이전글 제목입니다</a></span>
<!--
					<span id="disp_prev_subject">이전글이 없습니다</span>
-->
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="ti-angle-down fl"></span> 다음글</th>
				<td class="tleft">
                    <span id="disp_next_subject"><a href="#0" class="product">다음글 제목입니다</a></span>
<!--
					<span id="disp_next_regdt">다음글이 없습니다</span>
-->
				</td>
			</tr>
			</tbody>
		</table>

		  <div class="mgt15 mgb20 mgr10 tright">
             <button type="button" id="btnList"><span id="btn_list" class="btn btnG">목록</span></button>
             <sec:authentication property="principal" var="pinfo" />
	<sec:authorize access="isAuthenticated()">
		<c:if test="${pinfo.username eq 'admin'}">
             <button type="button" id="btnUpdate"><span id="btn_modify" class="btn btnG"><a href="/board_modify?bno=<c:out value='${boardVO.bno}'/>">수정</a></span></button>
             <button type="button" data-oper="remove" id="btnDelete"><span id="btn_delete" class="btn btnG4">삭제</span></button>
         </c:if>
	</sec:authorize>   
          </div>
          

</div>
<!--// line_list -->
</form>

	<form role="form" method="post">
		<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>

</body>
</html>
