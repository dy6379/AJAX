<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int n = Integer.parseInt(request.getParameter("val"));
	
	for(int i=1; i<=9; i++){
		String s = String.format("<p>%d X %d = %d </p>", n,i,n*i);
		out.print(s);
	}
	
%>