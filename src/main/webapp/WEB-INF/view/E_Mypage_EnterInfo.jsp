<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>

	function findZipcode() {
		url = "findZipcode.do";
		window.open(url,"post","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
	}
	
	function imageViewer(id, viewer) {
		
		var upload = document.getElementById(id)
		var viewDiv = document.getElementById(viewer)
		
		upload.onchange = function(e) {
			e.preventDefault();
			
			var file = upload.files[0], reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.src = event.target.result;
				img.width = 300;
				viewDiv.innerHTML = '';
				viewDiv.appendChild(img);
			};
			reader.readAsDataURL(file);

			return false;
		};
		
	}

</script>


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
		<br/>
		Main 이미지 : <input type="file" name="main_image" id="main_image" onclick="imageViewer('main_image','main_view')"/>
		<div id="main_view"></div>
		<br/>
		Detail 이미지 : <input type="file" name="detail_image" id="detail_image" onclick="imageViewer('detail_image','detail_view')"/>
		<div id="detail_view"></div>
		<br/>
		Menu 이미지 : <input type="file" name="menu_image" id="menu_image" onclick="imageViewer('menu_image','menu_view')"/>
		<div id="menu_view"></div>
		<br/>
		<input type="submit" value="등록">
		
	</form>
	
	
