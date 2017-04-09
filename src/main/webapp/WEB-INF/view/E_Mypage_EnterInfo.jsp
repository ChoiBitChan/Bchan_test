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
	
	<form name="enterInfo" action="E_insertInfo.do" method="post" enctype="multipart/form-data">
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
		영업 시간 : <input type="text" name="r_time">
		<br/>
		Main 이미지 : 
		<br/>
		Detail 이미지 : 
		<br/>
		Menu 이미지 : 
		<br/>
	</form>	

</body>
</html>