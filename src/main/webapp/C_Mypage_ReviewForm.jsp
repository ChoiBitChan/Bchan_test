<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<div id="review_image" style="height: 300px"></div>
	
	<form action="">
	<input type="hidden" value="" name="restaurant_number" value="">
	<input type="hidden" value="" name="userid" value="">
	코멘트 : <textarea rows="5" cols="25" name="comments"></textarea>
	<br/>
	평점 : 
	<c:forEach var="i" begin="1" end="5" step="1">
		<input type="checkbox" value="${i}" name="ranking"> <c:out value="${i}"/>
	</c:forEach>
	
	</form>
	
</body>
</html>