<%@page import="java.util.ArrayList"%>
<%@page import="test.dto.ZipcodeDTO"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.E_MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	String area4 = request.getParameter("area4");
	E_MypageDAO e_mypageDAO;
	List<ZipcodeDTO> zipCodeList = new ArrayList<ZipcodeDTO>();
	
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script>

	function Check() {
		if (document.zipForm.area4.value == "") {
			alert("도로명을 입력하세요");
			document.zipForm.area4.focus();
			return;
		}
		document.zipForm.submit();
	}

</script>

</head>
<body>
	우편번호찾기<br/>
	<form id="zipForm" action="findZipcode.jsp" method="post">
		도로명 입력 : <input id="area4" type="text">
		<input type="button" value="검색" onclick= "Check();">
	</form>
	<br/>
</body>
</html>