<%@ page language="java" contentType="text/javascript; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%@page import="org.json.simple.*" %> --%>
<%-- lib/json_simple.jar  need.. --%>
<%
/* 	String id		= request.getParameter("id");//"���̵�"; */
	String result	= request.getParameter("result");//"���";
	
/* 	JSONObject json = new JSONObject();
	json.put("id", id);
	json.put("result", result);
	
	out.println(json); 
*/
	
	out.println(result);
%>
<%-- JSON!! --%>
<%-- {id:<%=id %> , result:<%=result %> } --%>