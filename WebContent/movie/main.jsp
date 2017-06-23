<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.movie.*, java.util.*"%>
<jsp:useBean id="mgr" class="com.sist.movie.MovieManager" />
<%
	//위의 scope 가 default는 page로 설정되어있음. 상황에 따라 request, session, application 쓰면됨.
	//데이터 읽기
	List<MovieVO> list = mgr.movieMainDate(); //수집한 데이터를 받아옴
%>
<%--
	1)JSP (Java Server Page)
	=지시자
	  1. page : jsp에 대한 정보
	  	 contentType : text/html, text/xml
	  	 import : 자바라이브러리 읽기
	  	 errorPage
	  	 	=404 : 파일이 없는 경우
	  	 	=500 : 소스번역에 에러
	  	 	=401 : 인증
	  	 	=415 : 변환 코드 => ex.EUC-KR을 ECU-KR로 잘못 입력
	  	 	=200 : 정상 수행
	  2. taglib : 자바문법(제어문) => 태그형으로 제작
	  	  core	==> 제어문, URL
	  	  	<c:forEach>, <c:if>, <c:redirect>
	  	  format
	  	  	<fmt:formatDate> SimpleDateFormat
	  	  sql => DAO
	  	  			*******
	  	  xml => JAXP-xml 파서의 약자, JAXB(****)-xml 바인드의 약자
	  	  fn =>function(String, List)
	  	 JSP는 재사용성이 떨어져서 이를 보완하고자 MVC 패턴을 많이 사용한다
	  3. include
	  	 <%@ include>->고정된 파일(정적)을 집어넣을때, 자바소스가 합쳐져서 컴파일됨 ->같은 변수 쓰는 경우에 좋고 ex)상단 메뉴 바 ,푸터
	  	 <jsp:include>->수시로 바뀌는 파일(동적)일 경우, 각자 컴파일된 파일이 합쳐짐 ex)로그인 창, 부메뉴
	  	 
	  = 스크립트
	  	<%	%>	스크립트릿 (일반 자바)
	  	<%!	%>	선언문
	  	<%=	%>	표현문(브라우저 출력)
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
	  	
	  = jsp 액션태그 
	  	<jsp:useBean id="mem" class="Member">
	  	==>Member mem=new Member();
	  	<jsp:serProperty><jsp:getProperty>
	  	====> <jsp:include>
	  		  <jsp:forward> ==> jsp 흐름
	  =내장 객체
	   http://localhost:8080/MovieProject/movie/main.jsp :URL ->전체를 갖고올때 
	   =====================
	   						============================URI ->내가 요청한 폴더를 갖고올때
	   ====	  ========= === =============
	       프로토콜	      서버 주소		 포트	 ContextPath
	   *****request		:HttpServletRequest
	   	=> 서버 정보
	   	   getServerInfo()
	   	   getPort()
	   	=> 클라이언트
	   	   getRequestURI()
	   	   getRequestURL()
	   	   getContextPath()
	   	   getRemoteAdress()
	   	=> 요청 정보
	   	   String getParameter()
	   	   String[] getParameterValues()
	   	    ==> public void insert(MemberVO vo)
	   	=> 추가 정보
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
	   	
	   	2.아래의 코드가 훨씬 간결하고 편리
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
					for (int i = 0; i < list.size(); i++) //forEach 구문 쓰면 편리하다
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
					for (int i = 0; i < list.size(); i++) //forEach 구문 쓰면 편리하다
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