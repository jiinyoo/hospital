<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

      /* 페이지 전체에서 가운데 정렬 */
    section {
         margin: 50px auto;
	    width: 900px;
	    padding: 40px;
	    background: #ffffff;
	    border-radius: 8px;
	    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    }
 
    table {
	    width: 100%;
	    margin-bottom: 40px;
	    border-collapse: separate;
	    border-spacing: 0 15px;
	}
    	
	th, td {
	    padding: 10px;
	    font-size: 18px;
	    line-height: 1.6;
	}
	
	td {
    
    color: #343a40;
    border-radius: 0 5px 5px 0;
    border: 1px solid #dee2e6;
    text-align:center;
	}
    table img {
    	width:150px;
    }
	
	submit {
		padding:20px;
		border-radius:10px;
	}
	
	.buttons {
		width:50px;
		height:30px;
		background-color:#004fa8;
		border-radius:5px;
		border:1px solid #004fa8;
		color:white;
	}
	
	   /* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.8); /* 배경 투명도 */
        justify-content: center; /* 가운데 정렬 */
        align-items: center; /* 가운데 정렬 */
    }
    .modal-content {
        max-width: 90%;
        max-height: 90%;
    }
    .close {
        position: absolute;
        top: 20px;
        right: 30px;
        color: white;
        font-size: 40px;
        font-weight: bold;
        cursor: pointer;
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
			<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">제목</td>
			<td>${idto.title}</td>
		</tr>
		<tr>
			<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">작성자</td>
			<td>${idto.user_id}</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">${idto.content}</td>
		</tr>
		
			<c:forEach items="${idto.imgs}" var="img">
				<c:if test="${img!=''}">
		<tr>
			<td colspan="2">
					<img src="../../static/client/inquiryfile/${img}" class="clickable-img">
			</td>
		</tr>
				</c:if>
			</c:forEach>
	
			<c:if test="${session_user_id==idto.user_id}">
		<tr>
			<td colspan="2" align="center" style="border:none;">
			
			<a href="/main/inquirylist"><input type="submit" value="목록" class="buttons"></a>
			<a href="/main/inquiryupdate?inq_id=${idto.inq_id}"><input type="submit" value="수정" class="buttons"></a>
			<a href="/main/inquirydelete?inq_id=${idto.inq_id}"><input type="submit" value="삭제"  class="buttons" onclick="return deletecheck()"></a>
			</td>
		</tr>
			</c:if>
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