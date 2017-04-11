<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<br/>
	고객 마이 페이지<br/>
	<br/>
	<!--
	<a href="C_Mypage_Reserve.do">고객 예약현황</a><br/>
	<a href="C_Mypage_UserInfo.do">고객 정보수정</a><br/>
	<a href="C_Mypage_Review.do">고객 후기목록</a><br/>
	 -->
	<input type="button" value="고객 예약현황" id="btn_c_reserve"><br/>
	<input type="button" value="고객 정보수정" id="btn_c_userInfo"><br/>
	<input type="button" value="고객 후기목록" id="btn_c_review"><br/>
	
	<script type="text/javascript">
	
	$('#btn_c_reserve').on('click',function(){
		
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
	
	$('#btn_c_userInfo').on('click',function(){
		
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
	
	$('#btn_c_review').on('click',function(){
		
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
	
	</script>
	
</body>
</html>