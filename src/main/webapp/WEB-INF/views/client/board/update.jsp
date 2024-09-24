<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Summernote CSS/JS -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>

//문자열 태그를 받는다.
function decodeHtml(html) {
	//textarea 문서에 텍스트area영역을 생성한다.
    var txt = document.createElement("textarea");
	//그 영역에 innerHTML로 html을 넣는다.
    txt.innerHTML = html;
	//txt의 value를 출력한다.
    return txt.value;
}


var content = "${fn:escapeXml(bdto.board_content)}";
$(document).ready(function() {
    $('#summernote').summernote({
        // 에디터 크기 설정
        height: 500,
        width: 675,
        // 에디터 한글 설정
        lang: 'ko-KR',
        toolbar: [
            // 글자 크기 설정
            ['fontsize', ['fontsize']],
            // 글자 [굵게, 기울임, 밑줄, 취소 선, 지우기]
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            // 글자색 설정
            ['color', ['color']],
            // 표 만들기
            ['table', ['table']],
            // 서식 [글머리 기호, 번호매기기, 문단정렬]
            ['para', ['ul', 'ol', 'paragraph']],
            // 줄간격 설정
            ['height', ['height']],
            // 이미지 첨부
            ['insert',['picture']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72','96'],
        focus : true,
        callbacks: {                                                    
            onImageUpload: function(files, editor, welEditable) {   
                for (var i = 0; i < files.length; i++) {
                    imageUploader(files[i], this);
                }
            },onInit: function() {
            	var content = "${fn:escapeXml(bdto.board_content)}";
            	var decodedContent = decodeHtml(content); // HTML 엔티티를 디코딩
            	$('#summernote').summernote('code', decodedContent);
            }
        }
    });
    
 
    $('#submit').click(function(event) {
        // Summernote에서 작성된 HTML 코드를 가져옵니다.
        if (!check()) {
            event.preventDefault(); // 폼 제출 막기
        } else {
        	var board_id="${bdto.board_id}"
	        var editorContent = $('#summernote').summernote('code');
			var user_id=$('#user_id').val();
			var board_title=$('#board_title').val();
	        // FormData 객체에 에디터 내용을 추가합니다.
	        
	     	console.log("Editor Content: ", editorContent);
			console.log("User ID: ", user_id);
			console.log("Board Title: ", board_title);
	        
	        
	        
	        var formData = new FormData();
	        formData.append("user_id",user_id);
	        formData.append("board_title",board_title);
	        formData.append("board_content", editorContent);
	        formData.append("board_id",board_id);
	
	        // 서버로 AJAX 요청을 보냅니다.
	        $.ajax({
	            type: "POST",
	            url: '/main/boardupdateOk',
	            data: formData,
	            processData: false,
	            contentType: false,
	           	success: function(response) {
	            	window.location.href = "/main/boardcontent?board_id="+board_id;
	                // 서버 응답에 따라 추가 작업을 수행할 수 있습니다.
	            },
	            error: function(error) {
	                alert('Failed to submit post');
	                console.log(error);
	            }
	        });
       }
    });
    
});



function imageUploader(file, el) {
	var formData = new FormData();
	formData.append('file', file);
  
	$.ajax({                                                              
		data : formData,
		type : "POST",
        // url은 자신의 이미지 업로드 처리 컨트롤러 경로로 설정해주세요.
		url : '/boardimageupload',  
		contentType : false,
		processData : false,
		enctype : 'multipart/form-data',                                  
		success : function(data) {   
			$(el).summernote('insertImage', "${pageContext.request.contextPath}/boardfile/"+data, function($image) {
				$image.css('width', "100%");
			});
            // 값이 잘 넘어오는지 콘솔 확인 해보셔도됩니다.
			console.log(data);
		}
	});
}




</script>

<style>

	* {
		font-family: 'goorm-sans-bold', sans-serif;
	}    

    section 
  	{
 	    width: 80%;
 	    max-width: 800px;
    	margin: 50px auto;
    	padding: 60px;
    	background-color: #ffffff;
    	border-radius: 5px;
    	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  	}

    /* 제목 스타일 */
    h3 {
        text-align: left;
        color: #004fa8;
        margin-bottom: 20px;
        margin-left:10px;
        font-size:30px;
    }
    
    h4 {
    	text-align: left;
        color: #004fa8;
        font-size:30px;
        margin-top: 10px;
        margin-bottom: 20px;
        margin-left:10px;
    }
    
    div 
  	{
    	margin: auto;
 	}

    /* 입력 필드 스타일 */
    input[type="text"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
        width: 99%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        outline: none;
    }
    
    input[type="file"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
        
    }
    
    textarea
    {
    	font-family: 'goorm-sans-bold', sans-serif;
    	width: 99%;
    	height:200px;
    	margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        outline: none;
        
    }

    /* 버튼 스타일 */
    input[type="button"] 
    {
    	font-family: 'goorm-sans-bold', sans-serif;
        width: 20px;
        height: 20px;
        margin-top: 10px;
        margin-bottom: 15px;
        margin-left: 7px;
        background-color: #004fa8;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    input[type="submit"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
    	width: 100px;
        padding: 10px;
        margin-top: 30px;
        margin-bottom: 10px;
        background-color: #004fa8;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    input[type="button"]:hover,
    input[type="submit"]:hover {
        background-color: #033D7F;
    }

    /* 이미지 미리보기 스타일 */
    .img img {
        margin-top: 10px;
        max-width: 130px;
        max-height: 130px;
        border-radius: 5px;
        border: 1px solid #ddd;
    }

    /* 사진 등록 부분 스타일 */
    .one {
        align-items: center;
        margin-bottom: 10px;
    }

    .one label {
        margin-right: 10px;
    }
    
    textarea {
    	resize:none;
    	padding:9px;
    }

</style>
<script>

function check()
{
	var title=document.getElementById("board_title");
	var content=$("#summernote").summernote('code');
	title.value=title.value.trim();
	content=content.trim();
	if(title.value.length>50) {
		alert("제목은 50자 미만입니다.");
		return false;
	} else if(title.value=="") {
		alert("제목을 입력하세요.")
		return false;
	} else if (content== "" || content=='<p><br></p>') {
		alert("내용을 입력하세요")
		return false;
	} else {
		return true;
	}
}




</script>


</head>
<body>


<section>
     <caption> <h3> 진료후기 글수정 </h3> </caption>
     <div> 
     	<input type="text" name="board_title"  id="board_title" placeholder="제 목" value="${bdto.board_title }">
     	<input type="text" name="user_id" id="user_id"  value="${user_id }" readonly> 
     </div>
     <div> 
     	<textarea name="postContent" id="summernote" placeholder="내 용"></textarea>
     </div>
     <div style="text-align: center;"> <input type="submit" value="작성" id="submit"> </div>
 </section>
</body>
</html>