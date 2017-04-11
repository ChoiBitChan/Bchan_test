<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
		var query = "dup=userid"
		
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
		var query = "dup=userid"
		
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