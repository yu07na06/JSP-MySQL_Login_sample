<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.PreparedStatement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>

<%@ page  language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>���� �Ϸ� �Ǿ����ϴ� </h1>
	<div><%= request.getParameter("name") %> ���� ������ �Ϸ� �Ǿ����ϴ�.</div>
	
	<%
	
		Connection conn = null; //DB Ŀ�ؼ� ���� ��ü
		final String USERNAME = "root";//DBMS���� �� ���̵�
		final String PASSWORD = "1234";//DBMS���� �� ��й�ȣ
		final String URL = "jdbc:mysql://localhost:3306/Project";//DBMS������ db��

		try {
			System.out.println("[ ������ ]");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("[ ����̹� �ε� ���� ]");
			
			

			try {
				PreparedStatement pstmt = null;
				
				String sql = "insert into table01 values(?)";
				String name = request.getParameter("name");

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name); //FullName

				int result = pstmt.executeUpdate();
				if (result == 1) {
					System.out.println("[ Create �޼��� ���� ���� ]");
				}

			} catch (Exception e) {
				System.out.println("[ Create �޼��� ���� ���� ]");
			}
			
		} catch (Exception e) {
			System.out.println("[ ����̹� �ε� ���� ]");
		}
	
	%>
	

	
</body>
</html>