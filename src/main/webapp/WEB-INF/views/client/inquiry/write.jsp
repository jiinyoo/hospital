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
	
	#textbox {
		width:500px;
		height:300px;
	
	
	}

</style>
</head>
<body>
<section>
	<form name="inquiry" method="post" action="inquirywriteOk" enctype="multipart/form-data" onsubmit="return check()">
		<table>
			<input type="hidden" name="bimil" id="bimil" value="0">
			<caption><h2>진료 문의 등록</h2></caption>
			<input type="hidden" name="state" value="1">
			<tr>
				<td width="150" style="background-color:#ECEBEF;border-left:5px solid #004fa8;">제목</td>
				<td><input type="text" name="title" style="width:500px;"></td>
			</tr>
			<tr>
				<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">비밀글 체크</td>
				<td><input type="checkbox" name="bimilcheck" id="bimilcheck" >&nbsp; 비밀글로 설정하려면 체크하세요.</td>
			</tr>
			<tr>
				<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">부서</td>
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
				<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">내용</td>
				<td><textarea name="content" id="textbox"></textarea></td>
			</tr>
			<tr>
				<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">사진 업로드</td>
				<td>
					<input type="button" value="추가" onclick="add()" class="buttons">
					<input type="button" value="삭제" onclick="del()" class="buttons">
				</td>
			</tr>
			<tr>
				<td id="outer" width="500" colspan="2">
					<p class="one" id="one">
						<label for="fileup0" class="label">클릭</label>
						<input id="fileup0" style="width:0px" type="file" name="fname0" class="file" onchange="miniView(this)">
						<span class="img"></span>
					</p>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="글 등록" class="buttons">
				</td>
			</tr>
		</table>
	</form>
</section>	
</body>
</html>