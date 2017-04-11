<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script type="text/javascript">

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

</head>
<body>
	<div id="review_view" style="height: 300px"></div>
	<form name="reviewForm" action="insertReview.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="restaurant_number" value="${restaurant_number}">
		Review 이미지
		<br/>
		<input type="file" name="review_image" id="review_image" onclick="imageViewer('review_image','review_view')"/>
		<br/>
		<input type="hidden" value="" name="restaurant_number" value="">
		<input type="hidden" value="" name="userid" value="">
		<br/>
		코멘트
		<br/>
		<br/>
		<textarea rows="5" cols="40" name="comments"></textarea>
		<br/>
		<br/>
		평점 : 
		<c:forEach var="i" begin="1" end="5" step="1">
			<input type="checkbox" value="${i}" name="ranking"> <c:out value="${i}"/>
		</c:forEach>
	</form>
	
</body>
</html>