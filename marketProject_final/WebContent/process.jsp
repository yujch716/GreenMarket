<%@page import="orderDAO.OrderDAO"%>
<%
	String id = request.getParameter("name");
	OrderDAO odao = new OrderDAO();
	odao.update_order(id);
%>
<script>
	window.close();
</script>