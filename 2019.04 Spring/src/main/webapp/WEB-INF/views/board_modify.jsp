<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>로즈시스템즈_게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="로즈시스템즈입니다" />
<meta name="format-detection" content="telephone=no" />
<!-- 전화번호 CSS 초기화 -->
<meta name="keywords" content="rosesystems" />
<meta property="og:title" content="rosesystems" />
<meta property="og:description" content="rosesystems" />
<!-- CSS : COMMON -->
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="resources/css/layout.css" />
<link rel="stylesheet" type="text/css" href="resources/css/board.css" />
<!-- Themify Icons -->
<link rel="stylesheet" type="text/css"
	href="resources/css/themify-icons.css">
<!-- jQuery-2.2.4 js -->
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn_cancel").bind("click", function(){
			history.back();
		});
	});
	
	$(function(){
		var formObj = $("form");
		$('#btnModify').bind("click", function(e){ // 수정완료
			e.preventDefault(); 
			var operation = $(this).data("oper");
			if(operation === 'modify'){
			 	var str = "";
		        $(".uploadResult ul li").each(function(i, obj){  
		          var jobj = $(obj);
		          console.dir(jobj);
		          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		        });
		        formObj.append(str).submit();
			}
			formObj.submit();
		});
	}); // function end

	$(document).ready(function() { // @GetPost (modify)
		  (function(){
		    var bno = '<c:out value="${boardVO.bno}"/>'; // 해당 게시물의 첨부파일 가져오기
		    $.getJSON("/getAttachList", {bno: bno}, function(arr){
		      console.log(arr);
		      var str = "";
		      $(arr).each(function(i, attach){
		          //image type
		    	  if(attach.fileType){
		    		  var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);	
		    		  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
		              str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		              str += "<span> "+ attach.fileName+"</span><br/>";
		              str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
		              str += " class='btn btn-light'><i class='fa fa-times'></i></button><br>";
		              str += "</a>";
		              str += "</div>";
		              str +"</li>";
		            }else{
		              str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
		              str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		              str += "<span> "+ attach.fileName+"</span><br/>";
		              str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
		              str += " class='btn btn-light'><i class='fa fa-times'></i></button><br>";
		              str += "</a>";
		              str += "</div>";
		              str +"</li>";
		            }
		       });
		      $(".uploadResult ul").html(str);
		    });//end getjson
		  })();//end function
		  
		  
		  $(".uploadResult").on("click", "button", function(e){ // 첨부파일 삭제
		    console.log("delete file");
		    if(confirm("Remove this file? ")){
		      var targetLi = $(this).closest("li");
		      targetLi.remove();
		    }
		  });  
		  
		  // var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		  var regex = new RegExp("(.*?)\.$");
		  var maxSize = 3145728; //3MB
		  function checkExtension(fileName, fileSize){
		    if(fileSize >= maxSize){
		      alert("파일 사이즈 초과");
		      return false;
		    }
		    /*
		    if(regex.test(fileName)){
		      alert("해당 종류의 파일은 업로드할 수 없습니다.");
		      return false;
		    } 
		    */
		    return true;
		  }

		  var csrfHeaderName = "${_csrf.headerName}";
		  var csrfTokenValue = "${_csrf.token}";
		  $("input[type='file']").change(function(e){
		    var formData = new FormData();
		    var inputFile = $("input[name='uploadFile']");
		    var files = inputFile[0].files;

		    if(files.length < 3) {
			    for(var i = 0; i < files.length; i++){
				      if(!checkExtension(files[i].name, files[i].size) ){
				        return false;
				      }
			     	formData.append("uploadFile", files[i]);
			    }
		    }else{
		    	alert("최대 2개 첨부 가능합니다.");
		    }
		    
		    $.ajax({
		      url: '/upload/uploadAjaxAction',
		      processData: false, 
		      contentType: false,
		      data: formData,
		      type: 'POST',
		      beforeSend: function(xhr){
			    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);  
			  },
		      dataType:'json',
		        success: function(result){
		          console.log(result); 
				  showUploadResult(result); //업로드 결과 처리 함수 
		      }
		    }); //$.ajax
		  });    

		  function showUploadResult(uploadResultArr){
		    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		    var uploadUL = $(".uploadResult ul");
		    var str ="";
		    $(uploadResultArr).each(function(i, obj){
		    	if(obj.image){
		    		var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "</a>";
					str += "</div>";
					str +"</li>";
				}else{
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "</a>";
					str += "</div>";
					str +"</li>";
				}

		    });
		    uploadUL.append(str);
		  }
		});
	
</script>
</head>


<body id="allWrap">

<form role="form" id="insert_form" method="post" action="/board_modify">
	<div class="board_wrap line_list">
		<input type="hidden" id="bno" name="bno"  value="${boardVO.bno}" />
		<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"  >
			<table summary="" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<thead>
					<tr>
						<th>작성자</th>
						<td class="tleft"><input type="text" name="writer"
							id="writer" value='<c:out value="${boardVO.writer}" />'  readonly  style="width: 120px"
							class="input_login1 mgb05 mgt03" />
						</td>
					</tr>
					<tr>
				</thead>
				<tbody>
					
					<tr>
						<th>제목</th>
						<td class="tleft">
						<input type="text" name="title" id="title" style="width: 99%" class="input_login1 mgb05 mgt03" value="<c:out value='${boardVO.title}' />" ></input></td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="tleft" style="padding: 10px;">
						<textarea id="content" name="content" value=""><c:out value='${boardVO.content}' /></textarea>
						</td>
					</tr>

				<tr>
				<th>
					<label for="pwd">글보안</label>
				</th>
				<td class="tleft">
					<input type="password" name="i_pass" id="" style="width:120px" class="input_login1 mgb05 mgt03" min="4" mname="비밀번호는 4자리 이상입니다" hname="비밀번호를 입력해 주세요" />
					<span class="fs_11">* (영문, 숫자 4~8자) </span>
				</td>
			</tr>

			<tr>
				<th>
					<label for="pwd">글보안</label>
				</th>
				<td class="tleft">
					비밀글 <input type="checkbox" name="i_private" value="Y" style="border:none;background-color:#fff;">
				</td>
			</tr>

			<tr>
				<th>
					<label for="file1">파일첨부1</label>
				</th>
				<td class="tleft">
					<div>
						<input type="file" name="uploadFile" id="uploadFile" multiple style="width:270px;border:none;padding:0;" class="mgb05 mgt03">
					</div>
					<span class="fs_11">* 3MB 이하, 최대 2개</span>
					<br />
					<br />
					<br />
					<div class='uploadResult'>
						<ul>
						
						</ul>
					</div>
				</td>
			</tr>
			
			<!-- 
			<tr>
				<th>
					<label for="file2">파일첨부2</label>
				</th>
				<td class="tleft">
					<input type="file" name="i_file_name2" id="i_file_name2"  style="width:270px;border:none;padding:0;" class="mgb05 mgt03">
					<br />
				</td>
			</tr>
 -->
				</tbody>
			</table>


			<div style="text-align: center; margin-top: 50px;">
				<button type="submit" id="btnModify" data-oper='modify' class="btnO">등록</button>
				<button type="button" id="btn_cancel" class="btnG">취소</button>
			</div>
		</div>
		</form>

<!-- 	</div> -->
	<!--// line_list end -->



</body>
</html>
