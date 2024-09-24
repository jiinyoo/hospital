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
		document.inquiry.part.value="${aidto.part}"
		document.getElementById("bimil").value="${aidto.bimil}"
	}
</script>
<style>
      section {
        margin: 30px auto;
        width: 1300px;
        height: 100vh; /* 뷰포트 전체 높이 사용 */
        display: flex; /* Flexbox 사용 */
        justify-content: center; /* 가로 가운데 정렬 */
    }
    /* 테이블 스타일 */
    table {
        width: 700px;
        margin-top: 30px;
        border-collapse: collapse;
        background-color: #fff; /* 테이블 배경색 흰색 설정 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        border-radius: 5px; /* 모서리 둥글게 */
    }
    td {
        border-top: 1px solid #d3d3d3; /* 연한 회색 */
        padding: 10px; /* 셀 내부 여백 조정 */
        height: 30px; /* 셀 높이 명확히 설정 */
        text-align: left; /* 왼쪽 정렬 */
    }
    #submit {
        margin: auto; /* 자동으로 좌우 가운데 정렬 */
    }
    .buttons {
        width: 80px; /* 버튼 너비 설정 */
        height: 40px; /* 버튼 높이 설정 */
        border-radius: 3px; /* 모서리 둥글게 */
        border: 1px solid #004fa8; /* 테두리 색상 */
        background-color: #004fa8; /* 배경색 */
        color: white; /* 글자색 */
        cursor: pointer; /* 마우스 포인터 변경 */
        transition: background-color 0.3s; /* 호버 효과 추가 */
    }
    .buttons:hover {
        background-color: #003366; /* 호버 시 색상 변경 */
    }
    
    #contentbox {
    	width:500px;
    	height:200px;
    
    }
    td.center {
    text-align: center; /* 가운데 정렬 */
	}
</style>
</head>
<body>
<section>
	<form name="inquiry" method="post" action="updateOk" enctype="multipart/form-data" onsubmit="return check()">
		
		<div id="table-wrapper">
		<table>
			<input type="hidden" name="delimg" >
			<input type="hidden" name="safeimg" >
			<input type="hidden" name="inq_id" value="${aidto.inq_id}">
			<input type="hidden" name="bimil" id="bimil">
			<tr align="center">
				<td colspan="2">진료 문의 수정</td>
			</tr>
			<tr>
				<td width="100">제목</td>
				<td><input type="text" name="title" value="${aidto.title}"></td>
			</tr>
			<tr>
				<td width="100">작성자</td>
				<td>${aidto.user_id}</td>
			</tr>
			<c:if test="${bimil!=1}">
				<tr>
					<td>비밀글 체크</td>
					<td><input type="checkbox" name="bimilcheck" id="bimilcheck" >&nbsp; 비밀글로 설정하려면 체크하세요.</td>
				</tr>
			</c:if>
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
				<td><textarea name="content" id="contentbox">${aidto.content}</textarea></td>
			</tr>
		
			<tr>
				<td rowspan="2">기존 이미지</td>
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
			<tr>
    		<td colspan="2" class="center">
        		<input type="submit" value="문의 글 수정">
    		</td>
			</tr>
			</table> 
	</form>
</section>	
</body>
</html>