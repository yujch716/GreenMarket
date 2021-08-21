
<%@page import="java.util.ArrayList"%>
<%@page import="productVO.ProductVO"%>
<%@page import="productDAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<style>

a { text-decoration: none; }

table { border : 0;
		padding : 10px;
		/* float : left; */
		 }

</style>

</head>
<body>
<!-- �� ���� -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_ad.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_ad.jsp"/></td>
	<td widtt="1000">
	
	<!-- .jsp ���� ���� -->
		<br>
		<img src="./img/ad_pro_cate.gif" alt="" usemap="#map1">
		<map name="map1" id="map1">
		<area shape="rect" coords="11,67,100,97" href="ad_mainPage.jsp?name=fresh" alt=""> <!-- �ż���ǰ -->
		<area shape="rect" coords="124,67,210,97" href="ad_mainPage.jsp?name=gagong" alt=""> <!-- ������ǰ -->
		<area shape="rect" coords="236,67,352,97" href="ad_mainPage.jsp?name=milk" alt=""> <!-- ����ǰ/���� -->
		<area shape="rect" coords="376,67,462,97" href="ad_mainPage.jsp?name=bakery" alt=""> <!-- ����Ŀ�� -->
		</map>
		<br /><br />
	 	
	 	
	 	<%
	 	String cate = null;
	 	cate = request.getParameter("name");
		ProductDAO pdao = new ProductDAO();
		ArrayList<ProductVO> pdArr = null;
		if (cate != null){
			 pdArr = pdao.viewCate(cate);
		}else{
			pdArr = pdao.getAllInfo();
		}
	
		%>
	 	
	 		
	 		
	 	 	
	 	 		<%for(ProductVO tmp : pdArr){ %>
	 	 		
	 	 	<table style="float:left;">
	 		<tr><td><img src="<%=tmp.getPro_uri()%>" width="100" height="100"/></td></tr> <!-- ��ǰ��� -->
	 		<tr><td style="font-size: 10pt; font-weight:bold;" align="center"><%=tmp.getPro_name() %></td></tr><!-- ��ǰ�̸� -->
	 		<tr><td style="font-size: 10pt; font-weight:bold;" align="center">��� : <%=tmp.getPro_amount() %>��</td></tr><!-- ��ǰ��� -->
	 		<tr><td>
	 			<button onclick="window.open('pop_change.jsp?name=<%=tmp.getPro_name() %>','����','width=300, height=300')"> 
	 			���� �����ϱ�
	 			</button>
	 			</td></tr>
	 		<tr>
	 		<td><button type="button" onclick="pro_remove(this);" value="<%=tmp.getPro_name() %>">��ǰ �����ϱ�</button></td>
	 		</tr>	
	 		</table>
	 		
	 		<script>
	 			function pro_remove(bt) {
					var remove_confirm =  confirm("���� �����Ͻðڽ��ϱ�?");
					
					if (remove_confirm == false){
						return;
					}else {
						location.href='pro_del.do?pro_delName='+bt.value;
					}
				}
	 		</script>
	 		<%} %>
	 		
	 		
<!-- .jsp ���� ���� -->
	
	</td>
	</tr>
</table>
</div>
<!-- �� ���� -->
 
</body>
</html>