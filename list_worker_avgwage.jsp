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
				<h2>지역에 따른 평균 시급 </h2>
					<form method="post" action = "list_firm_type.jsp">
				
	</form>
	<table border="1" width="600">
		<tr>
			<td>평균 시급</td>
		</tr>
		<%
			//db 에서 회원목록 얻어와 테이블에 출력하기.
			
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String time = request.getParameter("name");
			try {
				String url = "jdbc:mysql://localhost:3306/test"; 
		         String dbid = "root"; 
		         String pw = "autoset"; 
		         Class.forName("com.mysql.jdbc.Driver"); 
		         con=DriverManager.getConnection(url,dbid,pw); 
				String sql = "SELECT AVG(w.wage) as avg from workers w where w.worker_region=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,time);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String avgwage = rs.getString("avg");
				
		
		%>
		<tr>
			<td><%=avgwage%></td>
			
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
</body>
</html>
