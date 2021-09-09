<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>가입이 완료되었습니다.</h1>
<div><%= request.getParameter("id") %> 님이 가입이 완료되었습니다</div>

<%
	Connection conn;	
	String USERNAME = "root";//DBMS접속 시 아이디
	String PASSWORD = "1234";//DBMS접속 시 비밀번호
	String URL = "jdbc:mysql://localhost:3306/Project";//DBMS접속할 db명

		try {
			System.out.println("[ 생성자 ]");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("[ 드라이버 로딩 성공 ]");

			String sql = "insert into table01 values(?)";
			String id = request.getParameter("id");

			PreparedStatement pstmt = null;
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				int result = pstmt.executeUpdate();
				if(result == 1) {
					System.out.println("[ Create 메서드 삽입 성공 ]");
				}

			}catch (Exception e) {
				System.out.println("[ Create 메서드 삽입 실패 ]");
			} 
			
			
		}
	
		catch (Exception e) {
			System.out.println("[ 드라이버 로딩 실패 ]");
		}

%>

</body>
</html>