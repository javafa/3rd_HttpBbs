<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.google.gson.*" %>
<%!
	class Data{
		String title;
		String author;
		String content;
	}
%>
<%
	// 요청값에 대한 한글처리
	request.setCharacterEncoding("utf-8");

	// json 데이터를 받아서
	String json = request.getParameter("json");

	out.println(json);

	// json 오브젝트로 변경하고
	Gson gson = new Gson();
	Data data = gson.fromJson(json, Data.class);

	// Database 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/bbs";
	Connection con = DriverManager.getConnection(url,"root","mysql");

	String query = "insert into board(title,author,content,date) value(?,?,?,now())";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setString(1, data.title);
	pstmt.setString(2, data.author);
	pstmt.setString(3, data.content);
	pstmt.executeUpdate();

	con.close();
%>
<html>
<head>
	<meta charset="utf-8"/>
</head>
<body>

<h1>
성공적으로 입력 되었습니다.
</h1>
<a href="/bbs">목록으로</a>

</body>
</html>