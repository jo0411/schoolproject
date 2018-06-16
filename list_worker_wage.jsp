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
							<li><a href="insert_1.html">ȸ������-ȸ��</a></li>
							<li><a href="insert_2.html">ȸ������-������</a></li>
							<li><a href="�α���.html">�α���</a></li>
							<li><a href ="mypage_firm.html">����������-ȸ��</a></li>
							<li><a href ="mypage_worker.html">����������-������</a></li>
						</ul>
					</nav>
				</header>
				<h2>������ ��� </h2>
	<form method="post" action = "list_worker_wage.jsp">
		
				<label for="id">�ñ�</label><input type="text" name="name"/><br />
				<input type="submit" value="�˻�"> <input type="reset" value="���" />
		
	</form>
	<table border="1" width="600">
		<tr>
			<td>������ID</td>
			<td>������ ����ó</td>
			<td>������ ����</td>
			<td>���ɽð���</td>
			<td>����</td>
			<td>�ݾ�(�ñ�)</td>
			<td>���� �˹� Ƚ��</td>
		</tr>
		<%
			//db ���� ȸ����� ���� ���̺� ����ϱ�.
			
		
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
				String sql = "select w.worker_id, w.worker_number, w.worker_region, w.worker_time, w.type, w.wage, w.workday from workers w where w.wage=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,time);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String workerid = rs.getString("worker_id");
					String workernumber= rs.getString("worker_number");
					String workerregion = rs.getString("worker_region");
					String workertime = rs.getString("worker_time");
					String type = rs.getString("type");
					String wage = rs.getString("wage");
					String workday = rs.getString("workday");
					
		
		%>
		<tr>
			<td><%=workerid%></td>
			<td><%=workernumber%></td>
			<td><%=workerregion%></td>
			<td><%=workertime%></td>
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
</body>
</html>
