<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 회원방 입니다.</h2>
  <hr>
  <div>
  <p><font color="blue"><b>${sNickName}</b></font>님 로그인 중...</p><br/>
  <p>회원님의 현재 등급은 <font color="orange"><b>${sStrLevel}</b></font></p><br/>
  <!-- 회원의 기본정보들을 출력 (포인트... 방문횟수... 등등...) -->
  </div>
  
  <c:if test="${!empty sImsiPwd}">
  	<hr>
  	현재 임시비밀번호를 발급받아 사용중이십니다.<br/>
  	개인정보를 확인하시고 비밀번호를 변경해 주세요.<br/>
  	<a href="${ctp}/member/memberPwdUpdate">비밀번호 변경</a>
  </c:if>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>