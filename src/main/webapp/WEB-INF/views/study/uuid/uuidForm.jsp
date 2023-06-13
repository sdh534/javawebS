<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<title>uuid.jsp</title>
	<script>
		'use strict';
		let str = "";
		let cnt = 0;
		
		function uuidCheck(){
			
			$.ajax({
				type: "post",
				url: "${ctp}/study/uuid/uuidForm",
				success: function(res){
					cnt++;
					str += cnt + " : " + res + "<br/>";
					$("#demo").html(str);
				},
				error: function(){
					alert("전송 오류");
				}
				
			});
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<h2>UUID</h2>
	<p>
		UUID(Univerally Unique Identifier)란, 네트워크 상에서 고유성이 보장되는 id를 만들기 위한 규약
		32 자리의 16진수 (128Bit)로 표현된다
		표시: 8-4-4-4-12자리로 표시
		예: 523532ad-52ed-fjs1-eeea-242cea1581ab
	</p>
	<hr/>
	<p>
		<input type="button" value="UUID 생성" onclick="uuidCheck()" class="btn btn-success"/>
		<input type="button" value="다시하기" onclick="location.reload()" class="btn btn-primary"/>
	</p>
	<hr/>
	<div>출력결과 : </div>
	<span id="demo"></span>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
