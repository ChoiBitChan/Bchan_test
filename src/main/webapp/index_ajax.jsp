<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<input type="button" id="btn_c_mypage" value="고객 마이페이지">
	<br/>
	<br/>
	<input type="button" id="btn_e_mypage" value="업주 마이페이지">
	<br/>
	<div id="divBox"></div>
	
	<script type="text/javascript">
	
	// 고객 마이페이지 버튼
	$('#btn_c_mypage').on('click',function(){
		
		
		var url = "C_Mypage_Main.do"
		var query = "test=test"
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	// 업주 마이페이지 버튼
	$('#btn_e_mypage').on('click',function(){
		
		
		var url = "E_Mypage_Main.do"
		var query = "test=test"
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	
	
	
	// 고객 마이페이지------------------------------------------------------------------------
	
	// 고객 예약현황
	$(document).on('click','#btn_c_reserve',function(){
		
		var url = "C_Mypage_Reserve.do"
		var query = "test=test"
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	// 예약현황 더 보기
	
	var end_rno = 10 + Number(${end_rno})
	
	$(document).on('click','#btn_more',function(){
		end_rno += 10
		var url = "C_Mypage_Reserve.do"
		var query = "end_rno="+end_rno
			
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
					
				$('#divBox').html("");
				$('#divBox').append(data);
					
			}
			
			,error:function(e){
					console.log(e.responseText);
			}
				
		})
			
	})
	
	$(document).on('click','[name="btn_c_reserveCancel"]',function(){
		var reserveNumber = $(this).parents("form").find('[name="reserveNumber"]').val()
		var url = "C_reserveCancel.do"
		var query = "reserveNumber="+reserveNumber+"&end_rno="+end_rno
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	
	
	
	// 고객 회원정보
	$(document).on('click','#btn_c_userInfo',function(){
		
		var url = "C_Mypage_UserInfo.do"
		var query = "test=test"
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	
	// 고객 후기목록
	$(document).on('click','#btn_c_review',function(){
		
		var url = "C_Mypage_Review.do"
		var query = "test=test"
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	
	
	// 업주 마이페이지------------------------------------------------------------------------
	
	
	
	// 업주 예약현황
	$(document).on('click','#btn_e_reserve',function(){
		
		var url = "E_Mypage_Reserve.do"
		var query = "test=test"
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	// 업주 예약 승인
	$(document).on('click','[name="btn_e_reserveOk"]',function(){
			
		var restaurant_number = $(this).parents("form").find('[name="restaurant_number"]').val()
		var userid = $(this).parents("form").find('[name="userid"]').val()
		var reserve_date = $(this).parents("form").find('[name="reserve_date"]').val()
		
		var url = "E_reserveOk.do"
		var query = "restaurant_number="+restaurant_number+"&userid="+userid+"&reserve_date="+reserve_date
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
		
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	// 업주 예약 취소
	$(document).on('click','[name="btn_e_reserveCancel"]',function(){
			
		var restaurant_number = $(this).parents("form").find('[name="restaurant_number"]').val()
		var userid = $(this).parents("form").find('[name="userid"]').val()
		var reserve_date = $(this).parents("form").find('[name="reserve_date"]').val()
		
		var url = "E_reserveCancel.do"
		var query = "restaurant_number="+restaurant_number+"&userid="+userid+"&reserve_date="+reserve_date
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
		
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	
	// 업주 정보등록
	$(document).on('click','#btn_e_userInfo',function(){
		
		var url = "E_Mypage_EnterInfo.do"
		var query = "test=test"
		
		$.ajax({
			
			type:"GET"
			,url:url
			,data:query
			,success:function(data){
				
				$('#divBox').html("");
				$('#divBox').append(data);
				
			}
			
			,error:function(e){
				console.log(e.responseText);
			}
			
		})
		
	})
	
	
	
	
	</script>
	
	
</body>
</html>