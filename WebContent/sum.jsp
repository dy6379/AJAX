<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int n = Integer.parseInt(request.getParameter("val"));
	int total = 0;
	for(int i=1; i<=n; i++){
		total += i;
	}
	out.print(total); //문자열로 total값을 리턴
%>