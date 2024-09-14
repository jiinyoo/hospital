<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 페이지 스타일 */
    body 
  	{
    	font-family: 'goorm-sans-bold', sans-serif;
    	background-color: #f2f4f9;
    	margin: 0;
    	padding: 0;
  	}	
    
    section 
  	{
 	    width: 80%;
 	    max-width: 550px;
    	margin: 50px auto;
    	padding: 60px;
    	background-color: #ffffff;
    	border-radius: 40px;
    	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  	}

    /* 제목 스타일 */
    h3 {
        text-align: center;
        color: #B5B2FF;
        margin-bottom: 20px;
        font-size:22px;
    }
    
    /* 필드 제목 스타일 */
    div.field-label {
        font-weight: bold;
        margin-top: 10px;
        font-size: 16px;
    }
    
    /* 필드 내용 스타일 */
    div.field-value {
    	margin-top: 10px;
        margin-bottom: 18px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f9f9f9;
        font-size: 14px;
    }
    
    div.field-value-content {
    	display:flex;
    	height:200px;
    	margin-top: 20px;
        margin-bottom: 15px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f9f9f9;
        font-size: 14px;
    }
    
    
    /* 이미지 스타일 */
    .img-container img {
        margin-top: 10px;
        max-width: 100px;
        max-height: 100px;
        border-radius: 10px;
        border: 1px solid #ddd;
    }
    
    /* 버튼 스타일 */
    .buttons a {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px 0;
        background-color: #B5B2FF;
        color: white;
        border-radius: 10px;
        text-decoration: none;
        text-align: center;
        transition: all 0.3s ease;
        font-size: 14px;
    }

    .buttons a:hover {
        background-color: #7D78FF;
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

</style>
</head>
<body>
  <section>
    <form method="post" action="notice_content">
      <input type="hidden" name="notice_id" value="${ndto.notice_id}">
      
      <caption> <h3> 공지사항 내용 </h3></caption>
      
      <div class="field-label">제 목</div>
      <div class="field-value">${ndto.title}</div>
      
      <div class="field-label">작성자</div>
      <div class="field-value">${ndto.user_id}</div>
      <hr>
      <div align="center"><조회수> ${ndto.readnum}</span></div>
      <hr>
      <div class="field-label">내용</div>
      <div class="field-value-content">${ndto.content}</div>

      <div class="field-label">첨부된 이미지</div>
      <div class="img-container">
         <c:forEach items="${ndto.imgs}" var="img">
          <c:if test="${img!=''}">
           <img src="/static/client/notice/${img}" alt="첨부 이미지">
          </c:if>
         </c:forEach>
      </div>

      <div class="buttons" align="center">
        <a href="notice_list">목록</a>
        <c:if test="${sessionScope.state==2}">
          <a href="../main/notice_update?notice_id=${ndto.notice_id}">수정</a>
          <a href="../main/notice_delete?notice_id=${ndto.notice_id}" class="delete">삭제</a>
        </c:if>
      </div>
    </form>
  </section>

</body>
</html>