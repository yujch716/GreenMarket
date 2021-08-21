
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
<!-- 폼 시작 -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_ad.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_ad.jsp"/></td>
	<td widtt="1000">
	
	<!-- .jsp 내용 시작 -->
		<br>
		<img src="./img/ad_pro_cate.gif" alt="" usemap="#map1">
		<map name="map1" id="map1">
		<area shape="rect" coords="11,67,100,97" href="ad_mainPage.jsp?name=fresh" alt=""> <!-- 신선식품 -->
		<area shape="rect" coords="124,67,210,97" href="ad_mainPage.jsp?name=gagong" alt=""> <!-- 가공식품 -->
		<area shape="rect" coords="236,67,352,97" href="ad_mainPage.jsp?name=milk" alt=""> <!-- 유제품/음료 -->
		<area shape="rect" coords="376,67,462,97" href="ad_mainPage.jsp?name=bakery" alt=""> <!-- 베이커리 -->
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
	 		<tr><td><img src="<%=tmp.getPro_uri()%>" width="100" height="100"/></td></tr> <!-- 상품경로 -->
	 		<tr><td style="font-size: 10pt; font-weight:bold;" align="center"><%=tmp.getPro_name() %></td></tr><!-- 상품이름 -->
	 		<tr><td style="font-size: 10pt; font-weight:bold;" align="center">재고 : <%=tmp.getPro_amount() %>개</td></tr><!-- 상품재고 -->
	 		<tr><td>
	 			<button onclick="window.open('pop_change.jsp?name=<%=tmp.getPro_name() %>','수정','width=300, height=300')"> 
	 			수량 수정하기
	 			</button>
	 			</td></tr>
	 		<tr>
	 		<td><button type="button" onclick="pro_remove(this);" value="<%=tmp.getPro_name() %>">상품 삭제하기</button></td>
	 		</tr>	
	 		</table>
	 		
	 		<script>
	 			function pro_remove(bt) {
					var remove_confirm =  confirm("정말 삭제하시겠습니까?");
					
					if (remove_confirm == false){
						return;
					}else {
						location.href='pro_del.do?pro_delName='+bt.value;
					}
				}
	 		</script>
	 		<%} %>
	 		
	 		
<!-- .jsp 내용 종료 -->
	
	</td>
	</tr>
</table>
</div>
<!-- 폼 종료 -->
 
</body>
</html>