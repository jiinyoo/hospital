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
   <form method="post" action="writeOk">
     <caption> <h3> 공지 글쓰기 </h3> </caption>
     <div> <input type="text" name="title"> </div>
     <div> <textarea name="content"> </textarea></div>
     <div> <input type="button" value="추가"> </div>
     <div> <input type="button" value="삭제"> </div>
     <div> 
       <h4> 사진 등록 </h4>
     	<input type="file" id="file" name="file" class="file"> 
     	<span class="img"></span>
     </div>
     <div> <input type="submit" value="후기 등록"> </div>
   </form>
 </section>

</body>
</html>