<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	 <meta charset="UTF-8">
    <title>로즈시스템즈_게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="로즈시스템즈입니다"/>
    <meta name="format-detection" content="telephone=no"/> <!-- 전화번호 CSS 초기화 -->
    <meta name="keywords" content="rosesystems"/>
    <meta property="og:title" content="rosesystems"/>
    <meta property="og:description" content="rosesystems"/>
    <!--
        <link rel="canonical" href="#0">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
    -->
    <!-- CSS : COMMON -->
        <link rel="stylesheet" type="text/css" href="resources/css/common.css"/>
        <link rel="stylesheet" type="text/css" href="resources/css/layout.css"/>
        <link rel="stylesheet" type="text/css" href="resources/css/board.css"/>
    <!-- Themify Icons -->
        <link rel="stylesheet" type="text/css" href="resources/css/themify-icons.css">
        <!--[if !IE]><!-->
         <!-- jQuery-2.2.4 js -->
      	<script src="/resources/js/jquery.min.js"></script>
      	<script>
      	
      	</script>
</head>


<body id="allWrap">
<div class="board_wrap">

    <form id="searchForm">
    <span class="tTit">TOTAL<span id="count"></span></span>
    <div class="searchWrap">
    
      <input type="hidden" name="board_id" value=""/>
        <ul>
          <li>
            <select class="search" id="search" name="search">
                <option value="subject">제목</option>
                <option value="name">작성자</option>
                <option value="content">내용</option>
            </select>
          </li>
          <li class="mgl02"><input type="text" id="searchword" name="searchword" class="search" ></li>
          <li class="mgl05"><span class="btnSearch" id="btn_search"><span class="ti-search bold"></span></span></li>
        </ul>
      
    </div>
    <!--// searchWrap end -->
    </form>
    
        <div class="line_list">    
        <table summary="" cellpadding="0" cellspacing="0">        
            <colgroup>			
                <col width ="10%"/>
                <col width ="52%" />
                <col width ="18%" />
                <col width ="10%" />
                <col width ="10%" />
            </colgroup>            
            <thead>
                <tr>
                    <th>번호</th>
                    <th>글제목</th>
                    <th>등록일</th>
                    <th>작성자</th>
                    <th class="input_txt">조회수</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="board" items="${list}">
                <tr>
                    <td><c:out value="${board.bno}"/></td>
                    <td class="tleft">
                        <a href='/board_view?bno=<c:out value="${board.bno}"/>'>
                        <span class="ellipsis"><c:out value="${board.title}"/></span></a> 
                    </td>
                    <td class="letter_zero fc_gray"><span class="ellipsis"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></span></td>
                    <td><c:out value="${board.writer}"/></td>
                    <td class="letter_zerod"><span class="ellipsis">123</span></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
        
          <!-- 버튼 -->
          <div class="mgt15 mgr05 fr">
             <a href="board_write"><span id="btn_write" class="btn btnB">글쓰기</span></a>
             <!--버튼부분 a태그는 테스트용, 개발적용후 삭제요망 -->
          </div>
          
      <%--   <div class="cont_bottomWrap pdt30">
            <div class="pagination center">
                <span class="btn_p ti-angle-double-left arrow"></span>
                <c:if test="${pageMaker.prev}" >
                	<a href="${pageMaker.startPage - 1}"><span class="btn_p ti-angle-left arrow prev"></span></a>
                </c:if>
                
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
              		<span class="btn_p btn_num ${pageMaker.cri.pageNum==num? 'on' : '' }" ><a href="?pageNum=${num}">${num}</a></span>                              	<!-- <li class="page-item active" ><a class="page-link" href="#"></a></li>  -->
              	</c:forEach>

	             <c:if test="${pageMaker.next}" >
	                <a href="${pageMaker.endPage + 1}"><span class="btn_p ti-angle-right arrow next"></span></a>
	              </c:if>
	                <span class="btn_p ti-angle-double-right arrow"></span>
            </div>
        </div> --%>
        
  
        
        <form name="frmChk" method="post">
            <input type="hidden" name="board_idx">
            <input type="hidden" name="board_id" value="">
            <input type="hidden" name="category" value="">
            <input type="hidden" name="page" value="">
            <input type="hidden" name="search" value="">
            <input type="hidden" name="searchword" value="">
        </form>
    
    
    </div>
    <!--// line_list -->
    
</div>
<!--// board_wrap -->



</body>
</html>
