<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

	후기 페이지<br/>
	<table border="1">
		<tr>
			<td>작성일자</td>
			<td>평점</td>
			<td>업체명</td>
			<td>후기 글</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="reviewList" items="${reviewList}">
				<tr>
					<td>
						<fmt:formatDate value="${reviewList.write_date}" var="write_date" type="both" pattern="yyyy-MM-dd"/>
						${write_date}
					</td>
					<td>${reviewList.ranking}</td>
					<td>${reviewList.e_name}</td>
					<td>${reviewList.comments}</td>
					<td><input type="button" value="Modify"></td>
					<td>
						<a href="C_Review_Delete.do?comments=${reviewList.comments}&&userid=${reviewList.userid}&&write_date=${write_date}">Delete</a>
					</td>
				</tr>
		</c:forEach>
	</table>
