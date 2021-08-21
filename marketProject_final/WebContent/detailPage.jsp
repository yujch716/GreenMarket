<%@page import="memberVO.MemberVO"%>
<%@page import="productVO.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ��������</title>

<script type="text/javascript">
	
	function btn() {
		var session = '<%=(MemberVO)session.getAttribute("log")%>';
		if(session == "null"){ //�α������� �޾ƿ���
			alert('�α����� �ʿ��� ������ �Դϴ�');
			window.location = 'loginPage.jsp';
		}else {
			var cart_name = '${requestScope.d_vo.pro_name}';
			var cart_amount = document.getElementById("amount").value;

			location.href='cart.do?cart_name='+cart_name+'&cart_amount='+cart_amount;
			
			
		}
	}
</script>

<style>

a { text-decoration: none; }

table { border : 0;
		padding : 10px;
		/* float : left; */
		 }

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

</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
response.setCharacterEncoding("euc-kr");
%>



<!-- �� ���� -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_main.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_cate.jsp"/></td>
	<td width="1000">
	
	<!-- .jsp ���� ���� -->
	
			<br><br>
			<table>
			<tr>
				<td rowspan="4" width="300"><!-- ��ǰ�̹��� uri -->
					<img src="${requestScope.d_vo.pro_uri }" width="200" height="200"/></td>
				<td style="width: 500;"><!-- ��ǰ�̸�. ����. ���Ű��ɼ��� -->
					<h2>${requestScope.d_vo.pro_name }<br>
					${requestScope.d_vo.pro_price }��</h2>
					</td>
			</tr>
			
			<tr>
				<td style="padding-bottom:10px"><b>( ���Ű��ɼ��� : ${requestScope.d_vo.pro_amount }�� )</b></td>
			</tr>
			
			<tr><td style="padding-bottom:10px"><!-- ���ż����Է��� -->
				<div class="textbox"><input type="text" name="amount" id="amount" placeholder="������ �Է��ϼ���"/>
				</div></td>
			</tr>
			
			<tr>
				<td><input type="button" value="��ٱ��Ͽ� ���" onclick="btn()"/></td>
				
			</tr>
			
			<tr>
				<td colspan="2">
							<!-- ���̹��� �ִ� �κ� 
								�ʿ�� ���̺� ����-->
						<br /><br />${requestScope.d_vo.pro_dec }
								
				</td><!--��ǰ �󼼼��� �ҷ����� �κ�  -->
			</tr>
			
			</table>
			
			
<!-- .jsp ���� ���� -->
	
	</td>
	</tr>
</table>
</div>
<!-- �� ���� -->
</body>
</html>