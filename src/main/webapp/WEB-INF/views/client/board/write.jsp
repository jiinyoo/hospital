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
	<table align="center" width="700">
		<tr>
			<td width="100">제목</td>
			<td><input type="text" name="board_title"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${user_id}</td>
		</tr>
		<tr>
			<td colspan="2">작성내용</td>
		</tr>
		<tr>
			<td colspan="2">
			<textarea name="postContent" id="summernote" width="600" height="600"></textarea>		
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