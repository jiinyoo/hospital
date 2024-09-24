<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

      /* 페이지 전체에서 가운데 정렬 */
    section {
        margin:auto;
        width: 1300px;
    }
 
    table {
    	width:780px;
    	margin:auto;
    	margin-top:50px;
    	border-collapse: collapse;
    	
    }
    
    table img {
    	width:150px;
    }

    td {
	    border-top: 1px solid black;
	    padding: 10px; /* 셀 내부 여백 조정 */
	    height: 30px;  /* 셀 높이 명확히 설정 */
	}
	
	submit {
		padding:20px;
		border-radius:10px;
	}
	
	.modal {
        display: none; 
        position: fixed; 
        z-index: 1; 
        left: 0;
        top: 0;
        width: 100%; 
        height: 100%; 
        background-color: rgba(0, 0, 0, 0.8); /* 배경을 어둡게 */
        justify-content: center;
        align-items: center;
        
    }

    .modal-content {
        max-width: 80%;
        max-height: 80%;
        border-radius: 10px;
        
    }
    
    .close {
        position: absolute;
        top: 10px;
        right: 25px;
        color: white;
        font-size: 35px;
        font-weight: bold;
        cursor: pointer;
    }
	
	.clickable-img {
    	cursor:pointer;
    }
	
</style>
<script>
function deletecheck() {
	return confirm("정말로 삭제하시겠습니까?")	
}
</script>
</head>
<body>
	<section>
	<table>
		<tr>
			<td>제목</td>
			<td>${idto.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${idto.user_id}</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">${idto.content}</td>
		</tr>
		<tr>
			<td colspan="2">
			<c:forEach items="${idto.imgs}" var="img">
				<c:if test="${img!=''}">
		
					<img src="../../static/client/inquiryfile/${img}" class="clickable-img">
		
				</c:if>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<c:if test="${session_user_id==idto.user_id}">
			
			<a href="/main/inquirylist"><input type="submit" value="목록"></a>
			<a href="/main/inquiryupdate?inq_id=${idto.inq_id}"><input type="submit" value="수정"></a>
			<a href="/main/inquirydelete?inq_id=${idto.inq_id}"><input type="submit" value="삭제" onclick="return deletecheck()"></a>
			</c:if>
			</td>
		</tr>
	</table>
	</section>
	<div id="myModal" class="modal">
    <span class="close">&times;</span>
    <img class="modal-content" id="img01">
  </div>
  
  <script>
    // 클릭한 이미지를 모달에 보여주는 로직
    var modal=document.getElementById("myModal");
    var modalImg=document.getElementById("img01");
    var images=document.getElementsByClassName("clickable-img");

    for (let img of images) 
    {
        img.onclick=function()
        {
            modal.style.display="flex";
            modalImg.src=this.src;
        }
    }

    // 모달 닫기 버튼 기능
    var span=document.getElementsByClassName("close")[0];
    span.onclick=function() 
    {
        modal.style.display="none";
    }
  </script>
	
</body>
</html>