<%@page import="java.sql.*"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"><meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
		<div id="page-wrapper">
<!-- Header -->
				<header id="header">
					
					<nav id="nav">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="insert_1.html">회원가입-회사</a></li>
							<li><a href="insert_2.html">회원가입-구직인</a></li>
							<li><a href="로그인.html">로그인</a></li>
							<li><a href ="mypage_firm.html">마이페이지-회사</a></li>
							<li><a href ="mypage_worker.html">마이페이지-구직인</a></li>
						</ul>
					</nav>
				</header>
				<h2>회사목록 </h2>
	<form method="post" action = "list_firm_type.jsp">
		<fieldset id="regbox">
				<label for="id">직종</label><input type="text" name="name"/><br />
				<input type="submit" value="검색"> <input type="reset" value="취소" />
		</fieldset>
	</form>
	<table border="1" width="600">
		<tr>
			<td>회사ID</td>
			<td>회사 연락처</td>
			<td>회사 지역</td>
			<td>필요시간대</td>
			<td>직종</td>
			<td>금액(시급)</td>
			<td>필요 알바 횟수</td>
		</tr>
	<%
		request.setCharacterEncoding("euc-kr");
		String firm_type = request.getParameter("name"); 
	%>

		<%
			//db 에서 회원목록 얻어와 테이블에 출력하기.
			
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String name;
			try {
				String url = "jdbc:mysql://localhost:3306/test"; 
		         String dbid = "root"; 
		         String pw = "autoset"; 
		         Class.forName("com.mysql.jdbc.Driver"); 
		         con=DriverManager.getConnection(url,dbid,pw); 
				String sql = "select f.firm_id, f.firm_number, f.firm_region, f.firm_time, f.type, f.wage, f.workday from firm f where f.type=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,firm_type);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String firmid = rs.getString("firm_id");
					String firmnumber= rs.getString("firm_number");
					String firmregion = rs.getString("firm_region");
					String firmtime = rs.getString("firm_time");
					String type = rs.getString("type");
					String wage = rs.getString("wage");
					String workday = rs.getString("workday");
					
		
		%>
		<tr>
			<td><%=firmid%></td>
			<td><%=firmnumber%></td>
			<td><%=firmregion%></td>
			<td><%=firmtime%></td>
			<td><%=type%></td>
			<td><%=wage%></td>
			<td><%=workday%></td>
		</tr>
		<%
			}
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (SQLException se) {
					System.out.println(se.getMessage());
				}
			}
		%>
	</table>
	
	
<!-- Footer -->
			
			
				<footer id="footer">
				
				<h4><font size="3" color="grey">산업경영공학부 2014170834 이정수 </br> 산업경영공학부 2014170852 조영관
						</font>
						</h4>
					<ul class="icons">
						<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
						<li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
						<li><a href="#" class="icon alt fa-envelope"><span class="label">Email</span></a></li>
					</ul>
					
					
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li> 주소: 서울특별시 성북구 안암로 145</li>
						
					</ul>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	
</body>
</html>
