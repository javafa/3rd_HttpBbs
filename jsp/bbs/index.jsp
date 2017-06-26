<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page language="java" import="java.sql.*" %>
<html>
<head>
	<meta charset="utf-8"></meta>
	<title>목록</title>
	<script language="javascript">
		function goWrite() {
			location.href = "write.html";
		}
	</script>
</head>
<body>

<h1>목록</h1>
<p>
<a href="#" onclick="goWrite()">글쓰기</a>
</p>
<%
	// 데이터베이스 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/bbs";
	Connection con = DriverManager.getConnection(url,"root","mysql");

	Statement stmt = con.createStatement();
	String query = "select * from board";

	// 데이터 가져오기
	ResultSet cursor = stmt.executeQuery(query);
	// 데이터 반복문으로 화면에 출력
	while(cursor.next()){
		int id = cursor.getInt("id");
		String title = cursor.getString("title");
		String author = cursor.getString("author");
		String date = cursor.getString("date");
		out.print(id + "|" + title + "|" + author + "|" + date + "<br/>");
	}
	con.close();
%>
</body>
</html>