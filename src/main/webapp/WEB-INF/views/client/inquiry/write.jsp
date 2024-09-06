<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function add() {
		var filetag=document.getElementsByClassName("file")
		var len=filetag.length;
		if(len<10) {
			var one=document.getElementById("one");
			var inner=one.cloneNode(true);
			outer.appendChild(inner);
			filetag[len].name="fname"+len;
			filetag[len].value="";
			document.getElementsByClassName("img")[len].innerHTML="";
			document.getElementsByClassName("label")[len].setAttribute("for","fileup"+len);	
			filetag[len].setAttribute("id","fileup"+len);	
		}
	}

	function del() {
		
		var one=document.getElementsByClassName("one")
		var len=one.length;
		if(len>1) {
			one[len-1].remove()		
		}
	}
	
	function miniView(my) {
		var n=parseInt(my.name.substring(5))
		for(var image of event.target.files) {
			var reader=new FileReader();
			reader.onload=function() {
				var new1=document.createElement("img");
				new1.setAttribute("src",event.target.result);
				new1.setAttribute("width","100");
				new1.setAttribute("valign","middle");
				if(document.getElementsByClassName("img")[n].innerHTML!="") {
					document.getElementsByClassName("img")[n].innerHTML="";
				}
				document.getElementsByClassName("img")[n].appendChild(new1);
			};
			reader.readAsDataURL(image);
		}
	}
	
	
	function bimilcheck() {
		if(document.getElementById("bimilcheck").checked) {
			document.getElementById("bimil").setAttribute("value","1")
		} else {
			document.getElementById("bimil").value=("value","0");
		}
	}
	
	
	function check() {
		bimilcheck();
		return true;
		
	}

</script>
<style>

      /* 페이지 전체에서 가운데 정렬 */
    section {
        margin:auto;
        width: 1300px;
        height: 100vh; /* 뷰포트 전체 높이 사용 */
    }
 
    table {
        width:1000px;
    	margin:auto;
    	margin-top:50px;
    	border-collapse: collapse;
    	
    }

    td {
	    border-top: 1px solid black;
	    padding: 10px; /* 셀 내부 여백 조정 */
	    height: 30px;  /* 셀 높이 명확히 설정 */
	}

    #submit {
        display: block;
        margin: 20px auto; /* 자동으로 좌우 가운데 정렬 */
    }


</style>
</head>
<body>
<section>
	<form name="inquiry" method="post" action="writeOk" enctype="multipart/form-data" onsubmit="return check()">
		<table>
			<input type="hidden" name="bimil" id="bimil" value="0">
			<caption>진료 문의 등록</caption>
			<input type="hidden" name="state" value="1">
			<tr>
				<td width="100">제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>비밀글 체크</td>
				<td><input type="checkbox" name="bimilcheck" id="bimilcheck" >&nbsp; 비밀글로 설정하려면 체크하세요.</td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="part">
						<option value="정신과">정신과</option>
						<option value="내분비과">내분비과</option>
						<option value="치과">치과</option>
						<option value="이비인후과">이비인후과</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td>사진 업로드</td>
				<td>
					<input type="button" value="추가" onclick="add()">
					<input type="button" value="삭제" onclick="del()">
				</td>
			</tr>
			<tr>
				<td></td>
				<td id="outer" width="500">
					<p class="one" id="one">
						<label for="fileup0" class="label">클릭</label>
						<input id="fileup0" style="width:0px" type="file" name="fname0" class="file" onchange="miniView(this)">
						<span class="img"></span>
					</p>
				</td>
			</tr>
			<tr align="center">
				<td>
				</td>
				
				<td>
					<input type="submit" value="문의 글 등록" >
				</td>
			</tr>
		</table>
	</form>
</section>	
</body>
</html>