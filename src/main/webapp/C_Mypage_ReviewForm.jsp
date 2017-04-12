<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
	<div id="modal_form">
		<div id="review_view" style="height: 300px"></div>
		<form id="reviewForm" name="reviewForm" action="insertReview.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="reserve_date" value="${reserve_date}">
			<input type="hidden" id="restaurant_number" value="${restaurant_number}">
			<input type="hidden" id="userid" value="a">
			Review 이미지
			<br/>
			<input type="file" name="review_image" id="review_image" onclick="imageViewer('review_image','review_view')"/>
			<br/>
			<br/>
			코멘트
			<br/>
			<br/>
			<textarea rows="5" cols="40" id="comments"></textarea>
			<br/>
			<br/>
			평점 : 
			<c:forEach var="i" begin="1" end="5" step="1">
				<input type="checkbox" value="${i}" name="ranking"> <c:out value="${i}"/>
			</c:forEach>
			<br/>
			<input type="button" value="작성완료" id="btn_revSubmit">
			<input type="button" value="취소" id="btn_revCancel">
		</form>
	</div>
	<script type="text/javascript">
	
	// 고객 후기등록
	
	$(document).on('click','#btn_revSubmit',function(){
		
		alert("후기 등록")
		
		alert(query)
	})
	
	</script>
	
	
</body>
</html>