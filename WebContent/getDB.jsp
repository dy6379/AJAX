<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String strId = request.getParameter("id"); //(아이디 파라메터를 입력받음
if (strId == null || strId.trim().equals("")) { // id 입력값이 널값인 경우에
	out.print("아이디를 입력해주세요!");
} else {
	int id = Integer.parseInt(strId);
	//System.out.println(id); 
	try {
		String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url, "root", "telly6379");
		
		PreparedStatement ps = con.prepareStatement("select * from emp where id=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery(); //SQL문 실제 실행후 결과 rs 리턴
		if (rs.next()) {
			out.print(rs.getInt(1) + " " + rs.getString(2) );
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace(); //예외 발생시
	} 
}
%>