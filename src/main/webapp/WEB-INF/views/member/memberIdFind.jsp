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
		<p>성명과 이메일 주소 입력 후 아이디를 찾을 수 있습니다 </p>
		<form method="post">
			<table class="table table-bordered">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" id="mid" class="form-control" autofocus required></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td><input type="text" name="email" id="email" class="form-control" required></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
					<input type="submit" value="아이디 찾기" class="btn btn-success">
					<input type="reset" value="재입력" class="btn btn-warning">
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/member/memberLogin';" class="btn btn-secondary">
					</td>
				</tr>
			</table>
		</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>