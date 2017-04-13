<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	정보수정 페이지<br/>
	
	<c:set var="userInfo" value="${userInfo}"/>
	고객ID : <input type="hidden" id="userid" value="${userInfo.userid}">${userInfo.userid}<br/>
	비밀번호 : <input type="password" id="password" value="${userInfo.password}"><br/>
	고객명 : <input type="text" id="name" value="${userInfo.name}"><br/>
	전화번호 : <input type="text" id="mobile" value="${userInfo.mobile}"><br/>
	이메일 : <input type="email" id="email" value="${userInfo.email}"><br/>
	<button type="submit" id="submit">수정</button>
	<button type="button">취소</button>
	<button type="button" id="leave">탈퇴</button>
	
	<script type="text/javascript">
    
	$('#submit').on('click',function(){
		
		var url='C_modifyInfo.do'
		
		var userid = $('#userid').val();
		var password = $('#password').val();
		var name = $('#name').val();
		var mobile = $('#mobile').val();
		var email = $('#email').val();

		var query = 'userid=' + userid + '&password=' + password + '&name=' + name + '&mobile=' + mobile + '&email=' + email;
		
		
		$.ajax({
			 type:"GET"
			 ,url:url
			 ,data:query
			 ,dataType:"text"
			 ,success:function(data){
				console.log(data);
			 }
			 ,error:function(e){
			  console.log(e.responseText);
			 }
			
		})
		
	})
    
    
    </script>
	
