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

	}
	
	    /* 버튼 스타일 */
    .buttons a {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px 0;
        background-color: #004fa8;
        color: white;
        border-radius: 10px;
        text-decoration: none;
        text-align: center;
        transition: all 0.3s ease;
        font-size: 14px;
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
function deletecheck(boardid, userid) {
	if(confirm("정말로 삭제하시겠습니까?")) {
		location="/main/boarddelete?board_id="+boardid+"&user_id="+userid;
	}	
}


</script>
</head>
<body>
<section>
	<h3>진료 후기</h3>
	<table>
		<tr>
			<th>제목</th>
			<td>${bdto.board_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bdto.user_id}</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
		</tr>
		<tr>
			<td colspan="2">${bdto.board_content}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<div class="buttons">
			<c:if test="${user_id==bdto.user_id}">
			<a href="/main/boardupdate?board_id=${bdto.board_id}&user_id=${bdto.user_id}">수정</a>
			<a href="javascript:deletecheck('${bdto.board_id}','${bdto.user_id }')">삭제</a>
			</c:if>
			</div>
			</td>
		</tr>
	</table>
</section>
</body>
</html>