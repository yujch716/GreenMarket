<%@ page language="java" contentType="text/javascript; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%@page import="org.json.simple.*" %> --%>
<%-- lib/json_simple.jar  need.. --%>
<%
/* 	String id		= request.getParameter("id");//"아이디"; */
	String result	= request.getParameter("result");//"결과";
	
/* 	JSONObject json = new JSONObject();
	json.put("id", id);
	json.put("result", result);
	
	out.println(json); 
*/
	
	out.println(result);
%>
<%-- JSON!! --%>
<%-- {id:<%=id %> , result:<%=result %> } --%>