<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.movie.*, java.util.*"%>
<jsp:useBean id="mgr" class="com.sist.movie.MovieManager" />
<%
	//���� scope �� default�� page�� �����Ǿ�����. ��Ȳ�� ���� request, session, application �����.
	//������ �б�
	List<MovieVO> list = mgr.movieMainDate(); //������ �����͸� �޾ƿ�
%>
<%--
	1)JSP (Java Server Page)
	=������
	  1. page : jsp�� ���� ����
	  	 contentType : text/html, text/xml
	  	 import : �ڹٶ��̺귯�� �б�
	  	 errorPage
	  	 	=404 : ������ ���� ���
	  	 	=500 : �ҽ������� ����
	  	 	=401 : ����
	  	 	=415 : ��ȯ �ڵ� => ex.EUC-KR�� ECU-KR�� �߸� �Է�
	  	 	=200 : ���� ����
	  2. taglib : �ڹٹ���(���) => �±������� ����
	  	  core	==> ���, URL
	  	  	<c:forEach>, <c:if>, <c:redirect>
	  	  format
	  	  	<fmt:formatDate> SimpleDateFormat
	  	  sql => DAO
	  	  			*******
	  	  xml => JAXP-xml �ļ��� ����, JAXB(****)-xml ���ε��� ����
	  	  fn =>function(String, List)
	  	 JSP�� ���뼺�� �������� �̸� �����ϰ��� MVC ������ ���� ����Ѵ�
	  3. include
	  	 <%@ include>->������ ����(����)�� ���������, �ڹټҽ��� �������� �����ϵ� ->���� ���� ���� ��쿡 ���� ex)��� �޴� �� ,Ǫ��
	  	 <jsp:include>->���÷� �ٲ�� ����(����)�� ���, ���� �����ϵ� ������ ������ ex)�α��� â, �θ޴�
	  	 
	  = ��ũ��Ʈ
	  	<%	%>	��ũ��Ʈ�� (�Ϲ� �ڹ�)
	  	<%!	%>	����
	  	<%=	%>	ǥ����(������ ���)
	  	***** HTML+JAVA
	  	
	  	a.jsp
	  	<html>
	  	<body>
	  	<%!
	  		int a=10;
	  	%>
	  	 <%= "Hello Java" %>
	  	</body>
	  	</html>
	  	
	  	==>a_jsp.java
	  	public class a_jsp extends HttpServlet
	  	{
	  		int i=10;
	  		public void service(HttpSerbletRequest request, HttpServleResponse response){
			  	out.println("<html>");
		  		out.println("<body>");
		  		out.println("Hello Java");
			  	out.println("</body>");
			  	out.println("</html>");
	  		}
	  	}
	  	
	  = jsp �׼��±� 
	  	<jsp:useBean id="mem" class="Member">
	  	==>Member mem=new Member();
	  	<jsp:serProperty><jsp:getProperty>
	  	====> <jsp:include>
	  		  <jsp:forward> ==> jsp �帧
	  =���� ��ü
	   http://localhost:8080/MovieProject/movie/main.jsp :URL ->��ü�� ����ö� 
	   =====================
	   						============================URI ->���� ��û�� ������ ����ö�
	   ====	  ========= === =============
	       ��������	      ���� �ּ�		 ��Ʈ	 ContextPath
	   *****request		:HttpServletRequest
	   	=> ���� ����
	   	   getServerInfo()
	   	   getPort()
	   	=> Ŭ���̾�Ʈ
	   	   getRequestURI()
	   	   getRequestURL()
	   	   getContextPath()
	   	   getRemoteAdress()
	   	=> ��û ����
	   	   String getParameter()
	   	   String[] getParameterValues()
	   	    ==> public void insert(MemberVO vo)
	   	=> �߰� ����
	   		setAttribute()
	   		getAttribute()
	   *****response	:HttpServletResponse
	   *****session		:HttpSession
	   out				:JspWriter
	   *****application	:ServletContext
	   exception		:Exception	
	   config			:ServletContext => web.xml
	   page				:Object
	   *****pageContext  :PageContext
	   
	   <table border=1 width=800>
	   <tr>
	   	<td>2</td>
	   	<td>3</td>
	   	<td>4</td>
	   	<td>5</td>
	   	<td>6</td>
	   	-----
	   </tr>
	   <%
		   	for(int i=1; i<=9; i++)
		   	{
		%>
				<tr>
		   		<%
		   		for(int j=2; j<=9; j++){
		   		
		   		}
		   		%> 
		   		<td><%=j+"*"+i+"="+i*j%></td>
		   		<%
		   	}
		   	%>
		   	</tr>
	   	%>
	   	
	   	2.�Ʒ��� �ڵ尡 �ξ� �����ϰ� ��
	   	<c:forEach var="i" begin="1" end="9">
	   		<tr>
   			<c:forEach var="i" begin="1" end="9">
   				<td></td>
   			</c:forEach>
   			</tr>
   		</c:forEach>
	   			
	   			
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">

</head>

<body>
	<center>
		<table id="table_content" width=800>
			<tr>
				<%
					for (int i = 0; i < list.size(); i++) //forEach ���� ���� ���ϴ�
					{
						MovieVO vo = list.get(i);
				%>
				<td>
					<a href="detail.jsp?midx=<%=vo.getLink()%>">
					<img src="<%=vo.getPoster() %>" width=180 height=220>
					</a>
				</td>
				<%
					}
				%>
			</tr>
			<tr>
				<%
					for (int i = 0; i < list.size(); i++) //forEach ���� ���� ���ϴ�
					{
						MovieVO vo = list.get(i);
				%>
				<td><%=vo.getGrade() %></td>
				
				<%
					}
				%>
			</tr>
		</table>
	</center>
</body>
</html>