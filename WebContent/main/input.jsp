<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%--
	������ ����
	1) HTML
		<a>	: GET ==> URL?
		<form> => action == GET/POST
	2) Java
		sendRedirect() ==>GET
		forward() ==>GET
	3) JavaScript
		location.href="" ==>GET
		URL?id=aaa&pwd=1234
		
		==> �ѱ� 
		GET ==> server.xml
				<Connector URIEncoding="UTF-8/EUC-KR"/>
		POST ==> ����������  setCharacterEncoding("EUC-KR")
		==> ������ : ASC(8bit)
				   Unicode : 16bit
 --%>
 <a href="output.jsp?name=ȫ�浿">click</a>
</body>
</html>