<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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
        <!-- jQuery-2.2.4 js -->
      	<script src="/resources/js/jquery.min.js"></script>
</head>


<body id="allWrap">

	<div class="board_wrap line_list">
<!--
		<form id="insert_form" name="insert_form" method="post" action="">
-->        
		<input type="hidden" name="i_main" value="">
		<input type="hidden" name="i_board_id" value="">

		<input type="hidden" name="i_thumb_file_name" />
		<input type="hidden" name="i_file_desc" />
		<input type="hidden" name="i_thumb_file_name" />
		<input type="hidden" name="i_file_desc" />
        
        <div id="pw_box">
        	<span class="pw_tit">비밀번호 확인</span>
            <ul class="pw_ment">
            	<li>권한이 필요합니다.</li>
                <li>비밀번호를 입력해 주세요.</li>
            </ul>
        </div>

		<table summary="" cellpadding="0" cellspacing="0">			
		<tbody>
			<tr>
				<th>
					<label for="pwd">비밀번호</label>
				</th>
				<td class="tleft">
					<input type="password" name="i_pass" id="" style="width:120px" class="input_login1 mgb05 mgt03" min="4" mname="비밀번호는 4자리 이상입니다" hname="비밀번호를 입력해 주세요" />
					<span class="fs_11">* (영문, 숫자 4~8자) </span>
				</td>
			</tr>

		</tbody>
		</table>


		<div style="text-align:center;margin-top:50px;">
		    <span id="btn_ok" class="btnO">확인</span>	
			<span id="btn_cancel" class="btnG">취소</span>				
		</div>

		</form>	

</div>
<!--// line_list end -->



</body>
</html>
