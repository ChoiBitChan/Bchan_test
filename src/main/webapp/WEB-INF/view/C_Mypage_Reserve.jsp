<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>

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
	<jsp:useBean id="toDay" class="java.util.Date"/>
	예약 현황<br/>
	<table border="1" id="tbl_reserve">
		<tr>
			<td>예약번호</td>
			<td>예약일자</td>
			<td>업체명</td>
			<td>상태창</td>
			<td>예약취소</td>
			<td>후기</td>
		</tr>
		<c:forEach var="reserveList" items="${reserveList}">
				<tr>
					<td>
						${reserveList.reserveNumber}
					</td>
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
							<form name="form_cancelReserve">
								<input type="hidden" value="${reserveList.reserveNumber}" name="reserveNumber">
								<input type="button" value="Cancel" name="btn_c_reserveCancel">
							</form>
						</c:if>
					</td>
					<td>
						<fmt:parseDate value="${reserve_date}" var="reDay" pattern="yyyy-MM-dd HH:mm"/>
						<c:if test="${reDay.time - toDay.time < 0}">	
							<c:if test="${reDay.time - toDay.time > -3*(1000*60*60*24)}">
								<form name="form_writeReview">
									<input type="hidden" value="${reserveList.reserveNumber}" name="reserveNumber">
									<input type="button" value="Write" name="btn_write">
								</form>
							</c:if>
						</c:if>
					</td>
				</tr>
		</c:forEach>
	</table>
	<input type="button" value="더 보기" id="btn_more">
	
	
	

	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4>Review</h4>
	        </div>
	        <div class="modal-body" style="padding:40px 50px;">
	          <form role="form" id="writeForm" method="post" action="" enctype="multipart/form-data">
	            <div class="form-group">
	              <h4>이미지</h4>
	              <div id="review_view"></div>
	              <input type="file" class="form-control" id="review_image" onclick="imageView('review_image','review_view')">
	              <br/>
	              <input type="hidden" id="rntext" value="">
	            </div>
	            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>test</button>
	          </form>
	        </div>
	      </div>
	      
	    </div>
	  </div> 
	
	
	<script type="text/javascript">
		
		$(document).on('click','[name="btn_write"]',function(){
			
			var reserveNumber = $(this).parents("form").find('[name="reserveNumber"]').val()
			
			$('#rntext').val(reserveNumber)
			$("#myModal").modal();
			
		})
		
	</script>
	
</body>
</html>

