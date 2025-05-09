<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
        font-weight: normal;
    }
    
    /* 필드 제목 스타일 */
    div.field-label {
        margin-top: 10px;
        font-size: 20px;
        display:flex;
        justify-content: space-between;
    }
    
    /* 필드 내용 스타일 */
    div.field-value {
    	margin-top: 10px;
        margin-bottom: 18px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
        font-size: 16px;
        
    }
    
    div.field-value-content {
    	display:flex;
    	height:200px;
    	margin-top: 20px;
        margin-bottom: 15px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
        font-size: 16px;
        line-height: 27px;
    }
    
    
    /* 이미지 스타일 */
    .img-container img {
        margin-top: 10px;

		width:100%;
        border-radius: 5px;
        border: 1px solid #ddd;
        cursor: pointer;
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
    
    hr {
    	margin-top: 4px;
    	margin-bottom: 4px;
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

        cursor: pointer;
    }

</style>
</head>
<body>
  <section>
    <form method="post" action="admin_notice_content">
      <input type="hidden" name="notice_id" value="${ndto.notice_id}">
      
      <caption> <h3> 공지사항 내용 </h3></caption>
      <br>
      <div class="field-label">
      	<div>제 목 </div>
      	<div><span style="font-size: 13px;"><조회수> ${ndto.readnum}</span></div>
      </div>
      <div class="field-value">${ndto.title}</div>

      <hr>
      <div class="field-label">내용</div>
      <div class="field-value-content">${ndto.content}</div>
		<br>
      <div class="field-label"></div>
      <div class="img-container">
         <c:forEach items="${ndto.imgs}" var="img">
          <c:if test="${img!=''}">
           <img src="/static/client/notice/${img}" alt="첨부 이미지" class="clickable-img">
          </c:if>
         </c:forEach>
      </div>
	<br>
      <div class="buttons" align="center">
        <a href="admin_notice_list">목록</a>
        <c:if test="${user_id=='admin'}">
          <a href="../admin_notice/admin_notice_update?notice_id=${ndto.notice_id}">수정</a>
          <a href="../admin_notice/admin_notice_delete?notice_id=${ndto.notice_id}" class="delete">삭제</a>
        </c:if>
      </div>
    </form>
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