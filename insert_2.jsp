<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������-ȸ���</title>
</head>
<body><%
		request.setCharacterEncoding("euc-kr");
		String workerid = request.getParameter("worker_id");
		String workernumber = request.getParameter("worker_number");
		String workerregion = request.getParameter("worker_region");
		String workertime = request.getParameter("worker_time");
		String type = request.getParameter("type");
		String wage = request.getParameter("wage");
		String workday = request.getParameter("workday");

		//db�� �����ϱ�
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into workers values(?,?,?,?,?,?,?)";
		int n = 0;

		try {
			String url = "jdbc:mysql://localhost:3306/test"; 
	         String dbid = "root"; 
	         String pw = "autoset"; 
	         Class.forName("com.mysql.jdbc.Driver"); 
	         con=DriverManager.getConnection(url,dbid,pw); 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,workerid);
			pstmt.setString(2,workernumber);
			pstmt.setString(3,workerregion);
			pstmt.setString(4,workertime);
			pstmt.setString(5,type);
			pstmt.setString(6,wage);
			pstmt.setString(7,workday);
			n = pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		// ��� �����ϱ�
	%>
	<script type="text/javascript">
		if (
	<%=n%>
		> 0) {
			alert("���������� ȸ�����ԵǾ����ϴ�.");
			location.href = "mypage_worker.html";
		} else {
			alert("ȸ�����Կ� �����߽��ϴ�.");
			history.go(-1);//������������ ����
		}
	</script>
</body>
</html>