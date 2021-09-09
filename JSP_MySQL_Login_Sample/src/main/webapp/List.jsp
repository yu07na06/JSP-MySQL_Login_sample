<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List 페이지</title>
</head>
<body>
<h1>회원 리스트</h1>

<table border="1" style="width: 250px">
	<tr>
		<th align="center">이름</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	<%
		Connection conn;
		String USERNAME = "root";
		String PASSWORD = "1234";
		String URL = "jdbc:mysql://localhost:3306/Project";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	
		
		try {
				String sql = " select * from table01 ";
				PreparedStatement pstmt = null;
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					out.print("<tr>");
					out.print("<td align='center'>" + rs.getString("FullName") + "</td>");
					out.print("<td align='center'><a href='Delete.jsp?FullName=" + rs.getString("FullName") +"'>삭제</a></td>");
					out.print("<td align='center'><a href='Update.jsp?FullName=" + rs.getString("FullName") +"'>수정</a></td>");
					out.print("</tr>");
				}
			} catch(Exception e) {
				
			} finally {
				try {
					
				} catch(Exception e) {
					conn.close();
				}
			}
	%>
</table>
</body>
</html>