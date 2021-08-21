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
				 top: 1px; /* input ����� border-top ������ ��ŭ */ 
				 left: 1px; /* input ����� border-left ������ ��ŭ */ 
				 padding: .5em .5em; /* input ����� padding �� ��ŭ */ 
				 color: #999; 
				 cursor: text; } 
				 
.textbox input[type="text"], 
.textbox input[type="password"] { width: 100%; /* ���ϴ� �ʺ� ���� */ 
								  height: auto; /* ���̰� �ʱ�ȭ */ 
								  line-height : normal; /* line-height �ʱ�ȭ */ 
								  padding: .8em .5em; /* ���ϴ� ���� ����, ���ϴ� �������� ���̸� ���� */ 
								  font-family: inherit; /* ��Ʈ ��� */ 
								  border: 1px solid #999; 
								  border-radius: 0; /* iSO �ձٸ𼭸� ���� */ 
								  outline-style: none; /* ��Ŀ���� �߻��ϴ� ȿ�� ���Ÿ� ���Ѵٸ� */ 
								  -webkit-appearance: none; /* �������� �⺻ ��Ÿ�ϸ� ���� */ 
								  -moz-appearance: none; 
								  appearance: none; }	
								  
</style>

<script src="./js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var checkedUsername = false;
	var checkedID = false;	//���̵� �ߺ� üũ
	
	function checkValue(){
		if(document.userInfo.pw.value != document.userInfo.pw2.value){
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
			return false;
		}
		
		if(!checkedID){
			alert("���̵� �ߺ�üũ�� ���ּ���");
			return false;
		}
		
	}
	
	//���̵� ��ø üũ
	function button_click(){
		var userid = $("#input").val();
		
		if(userid == "")
		{
			alert("���̵� �Է����ּ���");
			return;
		}
		
		
		//alert("id="+userid);
		$.ajax({
			url : "memCheckID.do?userid="+userid,
			
			//dataType:"text", //responseText, responseXML
			//type:"get", //open
			
			success : function(data) {
				//alert("����="+data);
				//console.log(data);
				
/* 				if( data == '1')
					alert("'1'�ΰ���???");
				if( data == "1")
					alert("'1'�ΰ���?.."); 
				if( data == 1)
					alert("1�ΰ���!!");//this!!  */
				
				if(data == 1)
					alert("�ߺ��� ���̵��Դϴ�");
				else if(data == 0)
				{
					alert("��� ������ ���̵��Դϴ�");
					checkedID = true;
				}
				else
					alert("data ����");
				
				
/* 				var obj = JSON.parse(data);//!?
				//console.log(obj.result);//1  !!
				
				if(obj.result == 1)
					alert("���̵� �ߺ��Դϴ�.");
				else if(obj.result == 0)
				{
					alert("���̵� ��밡���մϴ�.");
					checkedID = true;
				}
				else
					alert("data ����"); */
			},
			error : function() {
				alert("ajax id check ����");
			}
		});
		
	}
	
</script>

</head>
<body>


<div align=center><br><br><br>
<a href="mainPage.jsp"><img src="./img/logo.gif"></a>

<br><br><br>
<h2>ȸ������</h2>
		
		<form action="memJoin.do" method="post" name="userInfo" onsubmit="return checkValue()">
			<table width="550" align="center">
				<tr><td>���̵�</td>
					<td><div class="textbox">
					<input type="text" id="input" name="id" placeholder="ID" required>
					</div></td>
				</tr>
				<tr><td></td>
					<!-- <td><input type="submit" value="�ߺ�üũ"></td> -->
					<td><button type="button" onclick="button_click()">���̵� �ߺ�üũ</button></td>
					<!-- type=button  ==>>  not submit -->
				</tr>
				
				<tr><td>
					<div class="check_font" id="id_check"></div>
					</td></tr>	
						
				<tr><td>��й�ȣ</td>
					<td><div class="textbox">
					<input type="password" name="pw" placeholder="Password" required>
					</div></td>
				</tr>
				
				<tr><td>��й�ȣȮ��</td>
					<td><div class="textbox">
					<input type="password" name="pw2" placeholder="Password" required>
					</div></td>
				</tr>
					
				<tr><td>�̸�</td>
					<td><div class="textbox">
					<input type="text" name="name" placeholder="Name" required>
					</div></td>
				</tr>
				
				<tr><td>��ȭ��ȣ</td>
					<td><div class="textbox">
					<input type="text" name="tel" placeholder="010-0000-0000" required>
					</div></td>
				</tr>
				
				<tr><td>�ּ�</td>
					<td><div class="textbox">
					<input type="text" name="addr" placeholder="Address" required>
					</div></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="ȸ������">
			
		</form>

</div>
</body>
</html>