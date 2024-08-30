<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <section>
   <form method="post" action="update">
     <caption> <h3> 공지사항 글 수정 </h3></caption>
     <div> <input type="text" name="title" value="${ndto.title}"></div>
     <div> <textarea name="content"> ${ndto.content} </textarea></div>
     <div> <input type="button" value="추가"> </div>
     <div> <input type="button" value="삭제"> </div>
     <div>
       <h4> 사진 등록 </h4>
       <input type="file" id="file" name="file" class="file"> 
       <span class="img"></span>
     </div>
     <div> <input type="submit" value="공지사항 수정"> </div>
   </form>
 </section>

</body>
</html>