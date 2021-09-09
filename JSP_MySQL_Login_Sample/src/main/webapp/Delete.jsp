<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn=null; //DB 커넥션 연결 객체
		String USERNAME = "root";//DBMS접속 시 아이디
		String PASSWORD = "1234";//DBMS접속 시 비밀번호
		String URL = "jdbc:mysql://localhost:3306/Project";//DBMS접속할 db명
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

		String s = request.getParameter("FullName");
		String sql = "Delete from table01 where FullName='"+s+"';";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
		} finally {
			try {
				conn.close();
				if(pstmt!=null && !pstmt.isClosed()) {
					pstmt.close();
					conn.close();
					return;
				}
			} catch (Exception e2) {}
		}
	%>
	<h1><%=s%>님이 삭제되었습니다.</h1>
</body>
</html>