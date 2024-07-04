<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영해요</title>
</head>
<body>
	<%
	// http://localhost:8080/jsp/welcome2.jsp
	// 내장객체중 session 객체를 사용하여 사용자 정보 여부를 확인하자.
	String username = (String) session.getAttribute("username");

	if (username == null || username.trim().isEmpty()) {
		// 여기에 들어온다면 최초 요청
		// 폼 데이터가 있는지 없는지 확인 가정
		session.setAttribute("username", "홍길동");
		session.setAttribute("visitCount", 1);
		if (username != null && !username.trim().isEmpty()) {
			// 세션 객체를 사용해서 사용자 정보를 저장(속성과 값)하자.
			session.setAttribute("username", username);
		} else {
			Integer visitCount = (Integer) session.getAttribute("visitCount");
			if (visitCount == null) {
		visitCount = 1;
			} else {
		visitCount++;
			}
			session.setAttribute("visitCount", visitCount);
		}
	}

	Date now = new Date();
	%>

	<h2>
		환영 합니다,
		<%=username%></h2>
	<p>
		현재 시간 :
		<%=now%>
	</p>
	<p>
		방문 횟수 :
		<%=session.getAttribute("visitCount")%>
	</p>
</body>
</html>