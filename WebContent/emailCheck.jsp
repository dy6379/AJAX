<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = request.getParameter("email");
//이메일이 널값이 아니고 공백이 아닐경우에만 DB접속
if(email != null && !email.isEmpty()){
	try {
		String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection( url , "root", "telly6379");
		
		PreparedStatement ps = con.prepareStatement("select * from USER where email=?");
		ps.setString(1, email); //첫번째 ?에 email넣음
		ResultSet rs = ps.executeQuery(); //SQL문 실행수 결과 rs리턴
		if (rs.next()) { //결과 rs가 있으면 true
			out.print("이미 존재하는 이메일 입니다.");
		} else {
			out.print("사용가능한 이메일 입니다.");
		}
	} catch (Exception e) {
		out.print(e); //예외 발생시
	}
} else {
	out.print("잘못된 이메일 형식입니다.");

}
%>