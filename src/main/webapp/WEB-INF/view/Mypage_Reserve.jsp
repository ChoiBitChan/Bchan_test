<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="toDay" class="java.util.Date"/>
	예약 현황<br/>
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
					<td>
						<fmt:formatDate value="${reserveList.reserve_date}" var="reserve_date" type="both" pattern="yyyy-MM-dd HH:mm"/>
						${reserve_date}
					</td>
					<td>${reserveList.e_name}</td>
					<td>승인대기</td>
					<td>
						<fmt:parseDate value="${reserve_date}" var="reDay" pattern="yyyy-MM-dd HH:mm"/>
						<c:if test="${reDay.time - toDay.time > 0}"><input type="button" value="Cancel"></c:if>
					</td>
					<td>
						<fmt:parseDate value="${reserve_date}" var="reDay" pattern="yyyy-MM-dd HH:mm"/>
						<c:if test="${reDay.time - toDay.time < 0}"><input type="button" value="Write"></c:if>
					</td>
				</tr>
		</c:forEach>
	</table>
	<input type="button" value="마이페이지" OnClick="window.location='/Bchan_test/Mypage_Main.do'"><br/>
</body>
</html>