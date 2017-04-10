<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>

	function findZipcode() {
		url = "findZipcode.do";
		window.open(url,"post","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
	}

</script>

</head>
<body>

	업체정보 페이지<br/>
	
	<form name="enterInfo" id="enterInfo" action="E_insertInfo.do" method="post" enctype="multipart/form-data">
	
		사업자 등록 번호 : <input type="hidden" name="restaurant_number" value="${restaurant_number}">${restaurant_number}
		<br/>
		우편번호 : <input type="text" name="zipcode"><input type="button" value="우편번호찾기" onClick="findZipcode()">
		<br/>
		주소 : <input type="text" name="address" size="50" maxlength="50">
		<br/>
		수용 가능 Team : <input type="text" name="teamCount">
		<br/>
		업체명 : <input type="text" name="e_name">
		<br/>
		업체 소개 : <input type="text" name="r_info">
		<br/>
		분류 : <input type="text" name="type">
		<br/>
		영업 시간 : <input type="text" name="r_time">
		<br/>
		영업 시간 : 
		<select name="openingTime">
			<c:forEach var="i" begin="0" end="24" step="1">
				<option value="${i}">
					<c:out value="${i}"/>
				</option>
			</c:forEach>
		</select>
		~
		<select name="closingTime">
			<c:forEach var="i" begin="0" end="24" step="1">
				<option value="${i}">
					<c:out value="${i}"/>
				</option>
			</c:forEach>
		</select>
		<br/>
		가맹점 식별코드 : <input type="text" name="pay_key">
		<br/>
		Main 이미지 : <input type="file" name="main_image" />
		<br/>
		Detail 이미지 :  <input type="file" name="detail_image" />
		<br/>
		Menu 이미지 :  <input type="file" name="menu_image" />
		<br/>
		<input type="submit" value="등록">
		
	</form>	

</body>
</html>