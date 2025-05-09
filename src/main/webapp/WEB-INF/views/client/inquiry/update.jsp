<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	//업데이트할 때 다시 살필 필요 있음.
	function bimilcheck() {
		if(document.getElementById("bimilcheck").checked) {
			document.getElementById("bimil").setAttribute("value","1")
		} else {
			document.getElementById("bimil").value=("value","0");
		}
	}
	
	
	function check() {
		var safeimg="";
		var delimg="";
		var imgList=document.getElementsByClassName("imgList");
		for(var i=0; i<imgList.length; i++) {
			if(imgList[i].checked) {
				delimg=delimg+imgList[i].value+"/";
			} else {
				safeimg=safeimg+imgList[i].value+"/";
			}
		}
		document.inquiry.delimg.value=delimg;
		document.inquiry.safeimg.value=safeimg;
		
		bimilcheck();
		return true;
		
	}
	
	
	window.onload=function() {
		document.inquiry.part.value="${idto.part}"
	}
</script>
<style>

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
		width:600px;
		height:200px;
	
	}
	
	#buttons {
		width:50px;
		height:30px;
		background-color:#004fa8;
		border-radius:5px;
		border:1px solid #004fa8;
		color:white;
	
	}
</style>
</head>
<body>
<section>
	<form name="inquiry" method="post" action="inquiryupdateOk" enctype="multipart/form-data" onsubmit="return check()">
			<input type="hidden" name="delimg" >
			<input type="hidden" name="safeimg" >
			<input type="hidden" name="inq_id" value="${idto.inq_id}">
			<input type="hidden" name="bimil" id="bimil" value="0">
			<input type="hidden" name="state" value="1">
			
		<table>
			
			<caption><h2>진료 문의 등록</h2></caption>
			
			<tr>
				<td width="150" style="background-color:#ECEBEF;border-left:5px solid #004fa8;">제목</td>
				<td><input type="text" style="width:500px;"name="title" value="${idto.title}"></td>
			</tr>
			<tr>
				<td width="100" style="background-color:#ECEBEF;border-left:5px solid #004fa8;">작성자</td>
				<td><input type="text" name="user_id" value="${idto.user_id}"></td>
			</tr>
			<tr>
				<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">비밀글 체크</td>
				<c:set var="chk" value=""/>
				<c:if test="${idto.bimil==1}">
					<c:set var="chk" value="checked"/>
				</c:if>		
				<td><input type="checkbox" name="bimilcheck" id="bimilcheck" ${chk}>&nbsp; 비밀글로 설정하려면 체크하세요.</td>
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
				<td><textarea name="content" id="textbox">${idto.content}</textarea></td>
			</tr>
		
			<tr>
				<td rowspan="2" style="background-color:#ECEBEF;border-left:5px solid #004fa8;">기존 이미지</td>
				<td rowspan="2">
					<div>
						<c:forEach items="${imgs}" var="simg">
						<c:if test="${simg!=''}">
							<img src="../../static/client/inquiryfile/${simg}" width="100">
							<input type="checkbox" value="${simg}" class="imgList">	
						</c:if>				
						</c:forEach>
					</div>
					<div>
						기존 사진을 삭제하려면 checkbox를 선택하세요.
					</div>				
				</td>
			<tr>
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
					<input type="submit" value="글 수정" class="buttons">
				</td>
			</tr>
		</table>
	</form>
</section>	
</body>
</html>