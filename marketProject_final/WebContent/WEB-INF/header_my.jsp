<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>

<script>
$(function(){
	var soo=[1,2,3,4]; //value�� ó���ϱ� ���� �迭ó��. index�� 0����, value�� �迭 1����
	$.each(soo,function(index,value){ 
		$('#mypage'+value).click(function(){ 	 /* Ŭ������ �� */
			if($('#mymenu'+value).is(':hidden')) /* display:none�̸� */
					$('#mymenu'+value).show();	 /* �����ֱ� */
			else
					$('#mymenu'+value).hide();	 /* �ƴϸ� ����� */
		});	//click-end
	}); //each-end
}); //f-end
</script>


<style>

a { text-decoration : none; }

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
.textbox input[type="password"] { width: 90%; /* ���ϴ� �ʺ� ���� */ 
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
</head>
<body>

<div align="center"><br><br>
<table>
<tr>
	<td align="left"><a href="mainPage.jsp"><img src="./img/logo.gif"></a></td>
	<td width="30" align="left"><a href=#><img src="./img/search.png"></a></td>
	<td width="600" align="left">
		<div class="textbox">
		<input type="text"  id="input" name="search" placeholder="�˻�">
		</div>
	</td>
	<td width="130" align="right"><div id="mypage1"><img src="./img/header_my.gif"></div></td>
	<td width="100" align="right"><a href=#><img src="./img/header_logout.gif"></a></td></tr>

<tr><td></td><td></td><td></td> <!-- toggle �޴� ��ġ ������ ���� td -->

	<td colspan=2>
	<div id="mymenu1" style="display:none">
		<ul>
		<li><a href="memSearchOne.do?name=${applicationScope.app1}">ȸ������</a></li>
		<li><a href="my_cartPage.jsp">��ٱ���</a></li>
		<li><a href="telDelete.do?name=${stv.name}">ȸ��Ż��</a></li>
		</ul></div></td></tr>
</table>
</div>
</body>
</html>