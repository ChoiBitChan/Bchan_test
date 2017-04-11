<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">

	function writeForm(restaurant_number) {
		url = "writeForm.do?restaurant_number="+restaurant_number;
		window.open(url,"post","toolbar=no ,width=350 ,height=600 ,directories=no,status=yes,scrollbars=yes,menubar=no");
	}
	
</script>

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
					<td>
						<c:if test="${reserveList.r_state==1}">
							승인대기
						</c:if>
						<c:if test="${reserveList.r_state==2}">
							예약완료
						</c:if>
						<c:if test="${reserveList.r_state==3}">
							취소요청
						</c:if>
						<c:if test="${reserveList.r_state==4}">
							취소완료
						</c:if>
						<c:if test="${reserveList.r_state==5}">
							이용완료
						</c:if>
					</td>
					<td>
						<fmt:parseDate value="${reserve_date}" var="reDay" pattern="yyyy-MM-dd HH:mm"/>
						<c:if test="${reserveList.r_state==1 or reserveList.r_state==2}">
							<input type="button" value="Cancel">
						</c:if>
					</td>
					<td>
						<fmt:parseDate value="${reserve_date}" var="reDay" pattern="yyyy-MM-dd HH:mm"/>
						<c:if test="${reDay.time - toDay.time < 0}">	
							<c:if test="${reDay.time - toDay.time > -3*(1000*60*60*24)}">
								<input type="button" value="Write" id="btn_write" onclick="writeForm('${reserveList.restaurant_number}')">
							</c:if>
						</c:if>
					</td>
				</tr>
		</c:forEach>
	</table>
	
	
	<a href="C_Mypage_Main.do">고객 마이페이지</a><br/>
</body>
</html>