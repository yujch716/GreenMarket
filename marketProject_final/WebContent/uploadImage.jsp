<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String folder = "D:/java-gookbe/workspace2/marketProject_final/WebContent/pro_insert";

	MultipartRequest mr1 = new MultipartRequest(request,
       				 folder,10*1024*1024,"euc-kr",new DefaultFileRenamePolicy());
	
	String vpro_imagename = mr1.getParameter("pro_imagename");
	
	Enumeration enum1 = mr1.getFileNames();
	
	while(enum1.hasMoreElements()){
		String fname1=(String)enum1.nextElement();
        String vfilename1 = mr1.getFilesystemName("fname1");
		//파일의 이름 얻기
	}
%>
<script>
	location.href='close.jsp';
</script>
</body>
</html>