<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<title>MemberPwdFind</title>
	<style>
		th{
			text-align: center;
			background-color: #eee;
		}
	</style>
	<script>
		'use strict';
		
		function pwdCheck(){
			let pwd = $("#pwd").val();
			let rePwd = $("#rePwd").val();
			let newPwd = $("#newPwd").val();
			
			if(pwd == "" || rePwd == ""){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
			} 
			else if(newPwd != rePwd){
				alert("비밀번호가 일치하지 않습니다");
				$("#rePwd").focus();
			}
			else{
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
		<h2>비밀번호 수정</h2>
		<p>  </p>
		<form method="post" name="myform">
			<table class="table table-bordered">
				<c:if test="${!empty sPwdFlag}">
				<tr>
					<th>기존 비밀번호</th>
					<td><input type="password" name="pwd" id="pwd" class="form-control" autofocus required></td>
				</tr>
				</c:if>
				<tr>
					<th>변경할 비밀번호</th>
					<td><input type="password" name="newPwd" id="newPwd" class="form-control" autofocus required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호 재입력</th>
					<td><input type="password" name="rePwd" id="rePwd" class="form-control" required></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
					<input type="button" onclick="pwdCheck()" value="비밀번호 변경" class="btn btn-success">
					<input type="reset" value="재입력" class="btn btn-warning">
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/member/memberMain';" class="btn btn-secondary">
					</td>
				</tr>
			</table>
			<input type="hidden" name="mid" value="${sMid}"/>
		</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>