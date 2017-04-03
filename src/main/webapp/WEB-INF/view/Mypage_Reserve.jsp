<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	예약 현황<br/>
	<c:set var="date" value="<%=new Date() %>"/>
	<fmt:formatDate value="${date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
	<table border="1">
		<tr>
			<td>예약일자</td>
			<td>업체명</td>
			<td>상태창</td>
			<td>예약취소</td>
			<td>후기</td>
		</tr>
		<c:forEach var="reserveList" items="${reserveList}">
				<tr>
					<td><fmt:formatDate value="${reserveList.reserve_date}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${reserveList.e_name}</td>
					<td>승인대기</td>
					<td><input type="button" value="Cancel"></td>
					<td><input type="button" value="Write"></td>
				</tr>
		</c:forEach>
	</table>
</body>
</html>