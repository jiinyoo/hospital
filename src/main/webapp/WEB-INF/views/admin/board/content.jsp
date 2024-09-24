<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	section {
        margin:auto;
        width:800px;
        margin:50px auto;
        padding: 60x;
        background: #fff;
        border-radius: 5px;
    }
    
    h3 {
        text-align: left;
        color: #004fa8;
        margin: 30px;
        font-size:30px;
    }
    /* 테이블의 최대 너비 설정 및 가운데 정렬 */
    table {
    	
		width: 100%;
		padding: 20px;
    }
    
    th,td {
    	border-radius: 3px;
    	padding: 5px 10px;
    }
    
    th {
    	width: 10%;
    	text-align: left;
    	background: #ccc;
    	font-size: 18px;
    }

    /* 테이블 내부 요소 스타일링 */
    td {
		border:2px solid gray;
		border-radius: 3px;
	}
	
	#borcont {
		border:2px solid gray;
		border-radius: 3px;
	}
	
	    /* 버튼 스타일 */
    .buttons a {
        display: inline-block;
        padding: 10px 15px;
        margin: 20px 0 50px 0;
        background-color: #004fa8;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        text-align: center;
        transition: all 0.3s ease;
        font-size: 14px;
    }
    
    #del {
    	background-color:#FF5252;
    }
    
    #del:hover {
    	background-color:red;
    }

    .buttons a:hover {
        background-color: #033D7F;
    }

    .buttons a.delete {
        background-color: #FF7A7A;
    }

    .buttons a.delete:hover {
        background-color: #FF5252;
    }
</style>
<script>
function deletecheck(boardid) {
	if(confirm("정말로 삭제하시겠습니까?")) {
		location="/admin/board/delete?board_id="+boardid;
	}	
}
</script>
</head>
<body>
<section>
	<table>
		<tr>
			<td>제목</td>
			<td>${bdto.board_title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${bdto.user_id}</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">${bdto.board_content}</td>
		</tr>
		</table>

			<div class="buttons" align="center">
				<a href="/admin/board/list"> 목록 </a>
				<a id="del"  href="javascript:deletecheck('${bdto.board_id}')">삭제</a>
			</div>


</section>
</body>
</html>