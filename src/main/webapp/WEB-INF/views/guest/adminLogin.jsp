<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		th {
			background-color : #eee;
			text-align: center;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
	<p><br/></p>
	<div class="container">
		<form name="myform" method="post">
			<h2 class="text-center mb-3"> 관리자 로그인 </h2>
			<table class="table table-bordered">
				<tr>
					<th>관리자 ID: </th>
					<td>
						<input type="text" name="mid" id="mid" class="form-control" required/>
					</td>
				<tr>
					<th>비밀번호: </th>
					<td>
						<input type="password" name="pwd" id="pwd" class="form-control" required/>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type="submit" value="관리자 로그인" class="btn btn-success"/>
						<input type="reset" value="다시입력" class="btn btn-danger"/>
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/guest/guestList';" class="btn btn-secondary"/>
					</td>
				</tr>
			</table>
		</form> 
	</div>
	<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>