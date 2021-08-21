<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품이미지등록</title>

<style>

a { text-decoration: none; }

table { border : 0;
		padding : 10px; }	

.textbox {position: relative;}

.textbox label { position: absolute; 
				 top: 1px; /* input 요소의 border-top 설정값 만큼 */ 
				 left: 1px; /* input 요소의 border-left 설정값 만큼 */ 
				 padding: .5em .5em; /* input 요소의 padding 값 만큼 */ 
				 color: #999; 
				 cursor: text; } 
				 
.textbox input[type="text"] { width: 90%; /* 원하는 너비 설정 */ 
							height: auto; /* 높이값 초기화 */ 
							line-height : normal; /* line-height 초기화 */ 
							padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */ 
							font-family: inherit; /* 폰트 상속 */ 
							border: 1px solid #999; 
							border-radius: 0; /* iSO 둥근모서리 제거 */ 
							outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */ 
							-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ 
							-moz-appearance: none; 
							appearance: none; }	
								  
.td1 { width: 100px; }	

</style>


</head>
<body>
<div align="center">
<br>
	<h3>상품 이미지 등록</h3>
<form action="uploadImage.jsp" method="post" enctype="multipart/form-data">
	<table align="center">
	<tr><td class="td1">이미지 이름</td>
		<td><div class="textbox"><input type="text" id="input" name="pro_imagename" /></div></td>
	</tr>
	<tr><td style="padding:5px"></td></tr>
	<tr><td class="td1">이미지 파일</td>
		<td><div class="textbox"><input type="file" id="input" name="imagefile" /></div></td>
	</tr>	
	
	<tr><td colspan="2" align="center" style="padding:15px">
			<input type="submit" value="추가" />
			<input type="reset" value="취소" /></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>