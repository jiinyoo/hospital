<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


$(document).ready(function() {
    $('#summernote').summernote({
        // 에디터 크기 설정
        height: 500,
        width: 1000,
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
        callbacks : {                                                    
            onImageUpload : function(files, editor, welEditable) {   
                for (var i = 0; i < files.length; i++) {
                    imageUploader(files[i], this);
                }
            }
        }
    });
    
    
    $('#submit').click(function() {
        // Summernote에서 작성된 HTML 코드를 가져옵니다.
        var editorContent = $('#summernote').summernote('code');
		var user_id=$('#user_id').val();
		var board_title=$('#board_title').val();
        // FormData 객체에 에디터 내용을 추가합니다.
        var formData = new FormData();
        formData.append("user_id",user_id);
        formData.append("board_title",board_title);
        formData.append("board_content", editorContent);

        // 서버로 AJAX 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: '/boardwriteOk',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
            	window.location.href = "/boardlist";
                // 서버 응답에 따라 추가 작업을 수행할 수 있습니다.
            },
            error: function(error) {
                alert('Failed to submit post');
                console.log(error);
            }
        });
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

      /* 페이지 전체에서 가운데 정렬 */
    section {
        display: flex;
        margin:auto;
        width: 1300px;
        height: 100vh; /* 뷰포트 전체 높이 사용 */
    }
    /* 테이블의 최대 너비 설정 및 가운데 정렬 */
    table {
        width:1000px;
    	margin:0 auto;
    	margin-top:5px;
    	border-collapse: collapse;
    }

    /* 테이블 내부 요소 스타일링 */
    td {
	    border-top: 1px solid black;
	    padding: 10px; /* 셀 내부 여백 조정 */
	    height: 30px;  /* 셀 높이 명확히 설정 */
	}
    /* 제출 버튼 가운데 정렬 */
    #submit {
        display: block;
        margin: 20px auto; /* 자동으로 좌우 가운데 정렬 */
    }
	#board_title{
		 outline: none;
		 width:900px;
		 height:30px;
	}
	
	#user_id{
		outline: none;
		width:100px;
		height:30px;
		border:none;
	
	}
	
	#submit {
		width:100px;
		height:30px;
	}
	
	hr {
	 margin-bottom:0px;
	 margin-top:0px;
     border:0.1px solid #ccc;
	}

	
	#summernote {
    display: block; /* 블록 요소로 설정 */
    margin: 0 auto; /* 블록 요소의 가로 중앙 정렬 */
	}
</style>
</head>
<body>
<section >
	<table>
		<caption style="text-align: center;"><h2>진료후기 게시판 글쓰기</h2></caption>
		<tr>
			<td width="100">제목</td>
			<td><input type="text" name="board_title"  id="board_title"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="user_id" id="user_id" value="${user_id}" readonly></td>
		</tr>
		<tr>
			<td colspan="2">작성내용</td>
		</tr>
		<tr>
			<td colspan="2">
			<textarea name="postContent" id="summernote" width="600" height="600" ></textarea>		
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="작성" id="submit">
			</td>
		</tr>
		
	</table>
</section>
</body>
</html>