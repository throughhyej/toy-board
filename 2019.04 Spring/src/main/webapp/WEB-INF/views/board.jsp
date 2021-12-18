<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html class="no-js">
<head>
	 <meta charset="UTF-8">
    <title>로즈시스템즈_게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="로즈시스템즈입니다"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="keywords" content="rosesystems"/>
    <meta property="og:title" content="rosesystems"/>
    <meta property="og:description" content="rosesystems"/>

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
      	$(function(){
			$("#btn_search").bind("click", function(){
				self.location = "/" + '${pageMaker.makeQuery(1)}' + "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keyword').val();
			}); // 검색 버튼
		});
      	</script>
</head>

<body id="allWrap">
<div class="board_wrap">

    <form id="searchForm">
	    <span class="tTit">TOTAL<span id="count">${pageMaker.totalCount}</span></span>
	    <div class="searchWrap">
	        <ul>
	          <li>
	            <select class="search" id="search" name="search">
	                <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
	                <option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>
	                <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
	            </select>
	          </li>
	          <li class="mgl02"><input type="text" id="keyword" name="keyword" class="search" value="${cri.keyword}"></li>
	          <li class="mgl05"><span class="btnSearch" id="btn_search"><span class="ti-search bold"></span></span></li>
	        </ul>
	    </div><!--// searchWrap end -->
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
                        <a href='/board_view${pageMaker.makeQuery(pageMaker.cri.page)}&bno=<c:out value="${board.bno}"/>'>
                        <span class="ellipsis" id="title"><c:out value="${board.title}"/></span></a> 
                    </td>
                    <td class="letter_zero fc_gray"><span class="ellipsis"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></span></td>
                    <td><c:out value="${board.writer}"/></td>
                    <td class="letter_zerod"><span class="ellipsis"><c:out value="${board.viewCount}" /></span></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
          <!-- 버튼 -->
          <div class="mgt15 mgr05 fr">
          <sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq 'admin'}">
             			<a href="board_write"><span id="btn_write" class="btn btnB">글쓰기</span></a>
             	</c:if>
			</sec:authorize>     
             			<a href="/"><span id="btn_list" class="btn btnB">목록</span></a>
          </div>
          
         <div class="cont_bottomWrap pdt30">
            <div class="pagination center">
                <span class="btn_p ti-angle-double-left arrow"></span>
                <c:if test="${pageMaker.prev}" >
                	<a href="/${pageMaker.makeQuery(pageMaker.startPage - 1)}"><span class="btn_p ti-angle-left arrow prev"></span></a>
                </c:if>
                
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
              		<span class="btn_p btn_num <c:out value='${pageMaker.cri.page==num? "on" : "" }' />" ><a href="/${pageMaker.makeQuery(num)}">${num}</a></span>                              	<!-- <li class="page-item active" ><a class="page-link" href="#"></a></li>  -->
              	</c:forEach>

	             <c:if test="${pageMaker.next}" >
	                <a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}"><span class="btn_p ti-angle-right arrow next"></span></a>
	              </c:if>
	                <span class="btn_p ti-angle-double-right arrow"></span>
            </div>
        </div>

        <form id="actionForm" action="/" method="get">
          	<input type='hidden' name="page" value="${pageMaker.cri.page}">
  			<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}">
        </form>	
    
    </div>
    <!--// line_list -->
    
</div>
<!--// board_wrap -->

</body>
</html>
