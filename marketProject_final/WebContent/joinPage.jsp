<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

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
				 
.textbox input[type="text"], 
.textbox input[type="password"] { width: 100%; /* 원하는 너비 설정 */ 
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
								  
</style>

<script src="./js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var checkedUsername = false;
	var checkedID = false;	//아이디 중복 체크
	
	function checkValue(){
		if(document.userInfo.pw.value != document.userInfo.pw2.value){
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		
		if(!checkedID){
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		
	}
	
	//아이디 중첩 체크
	function button_click(){
		var userid = $("#input").val();
		
		if(userid == "")
		{
			alert("아이디를 입력해주세요");
			return;
		}
		
		
		//alert("id="+userid);
		$.ajax({
			url : "memCheckID.do?userid="+userid,
			
			//dataType:"text", //responseText, responseXML
			//type:"get", //open
			
			success : function(data) {
				//alert("성공="+data);
				//console.log(data);
				
/* 				if( data == '1')
					alert("'1'인가요???");
				if( data == "1")
					alert("'1'인가요?.."); 
				if( data == 1)
					alert("1인가요!!");//this!!  */
				
				if(data == 1)
					alert("중복된 아이디입니다");
				else if(data == 0)
				{
					alert("사용 가능한 아이디입니다");
					checkedID = true;
				}
				else
					alert("data 에러");
				
				
/* 				var obj = JSON.parse(data);//!?
				//console.log(obj.result);//1  !!
				
				if(obj.result == 1)
					alert("아이디가 중복입니다.");
				else if(obj.result == 0)
				{
					alert("아이디가 사용가능합니다.");
					checkedID = true;
				}
				else
					alert("data 에러"); */
			},
			error : function() {
				alert("ajax id check 실패");
			}
		});
		
	}
	
</script>

</head>
<body>


<div align=center><br><br><br>
<a href="mainPage.jsp"><img src="./img/logo.gif"></a>

<br><br><br>
<h2>회원가입</h2>
		
		<form action="memJoin.do" method="post" name="userInfo" onsubmit="return checkValue()">
			<table width="550" align="center">
				<tr><td>아이디</td>
					<td><div class="textbox">
					<input type="text" id="input" name="id" placeholder="ID" required>
					</div></td>
				</tr>
				<tr><td></td>
					<!-- <td><input type="submit" value="중복체크"></td> -->
					<td><button type="button" onclick="button_click()">아이디 중복체크</button></td>
					<!-- type=button  ==>>  not submit -->
				</tr>
				
				<tr><td>
					<div class="check_font" id="id_check"></div>
					</td></tr>	
						
				<tr><td>비밀번호</td>
					<td><div class="textbox">
					<input type="password" name="pw" placeholder="Password" required>
					</div></td>
				</tr>
				
				<tr><td>비밀번호확인</td>
					<td><div class="textbox">
					<input type="password" name="pw2" placeholder="Password" required>
					</div></td>
				</tr>
					
				<tr><td>이름</td>
					<td><div class="textbox">
					<input type="text" name="name" placeholder="Name" required>
					</div></td>
				</tr>
				
				<tr><td>전화번호</td>
					<td><div class="textbox">
					<input type="text" name="tel" placeholder="010-0000-0000" required>
					</div></td>
				</tr>
				
				<tr><td>주소</td>
					<td><div class="textbox">
					<input type="text" name="addr" placeholder="Address" required>
					</div></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="회원가입">
			
		</form>

</div>
</body>
</html>