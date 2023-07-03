<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String comment=request.getParameter("comment");  
String email=request.getParameter("email");

//댓글내용이 없거나 이메일 주소가 없을경우
if(comment == null || email == null || comment.isEmpty() || email.isEmpty()){
	out.print("<p>댓글 내용과 이메일을 적어주세요</p>");
} else {
	//DB에 댓글 내용을 저장하고 모든 댓글을 불러와서 화면을 업데이트 할수있게 데이터보내기.
	try {
		String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection( url , "root", "telly6379");
		
		String sql = "INSERT INTO comment(comment, email) VALUES(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, comment); //첫번째 ?에 comment넣음
		ps.setString(2, email); //첫번째 ?에 email넣음
		ps.executeUpdate(); //입력,수정,삭제시 rs가 없고 숫자로 리턴되면 업데이트
		//입력 완료후 다시 모든 테이블행을 검색하기(전체 댓글을 최신순 리턴하기)
		PreparedStatement ps2 = 
		con.prepareStatement("SELECT * FROM comment ORDER BY id DESC");
		ResultSet rs =  ps2.executeQuery();//Select일때 Query결과있음
		
		out.print("<hr><h2>댓글 : </h2>");
		while(rs.next()){
			out.print("<div class='box'>");
			out.print("<p>" + rs.getString("comment") + "</p>");
			out.print("<p><strong>글쓴이 : " + rs.getString("email") + "</string></p>");
			out.print("</div>");
		}
		con.close();
	} catch (Exception e) {
		out.print(e); //예외 발생시
	}
}
%>