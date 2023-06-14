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
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
		<h2>아이디 찾기</h2>
		<p>가입하신 아이디 정보는 다음과 같습니다. </p>
			<table class="table table-bordered">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" id="mid" value="${mid}" class="form-control" readonly></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
					<input type="button" value="로그인" onclick="location.href='${ctp}/member/memberLogin';"  class="btn btn-success">
					<input type="button" value="비밀번호 찾기" onclick="location.href='${ctp}/member/memberPwdFind';" class="btn btn-secondary">
					</td>
				</tr>
			</table>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>