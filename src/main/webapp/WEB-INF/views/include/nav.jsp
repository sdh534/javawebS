<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="http://192.168.50.95:9090/javawebS" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <!-- <a href="http://49.142.157.251:9090/javawebS" class="w3-bar-item w3-button w3-padding-large">HOME</a> -->
    <%-- <a href="${ctp}/" class="w3-bar-item w3-button w3-padding-large">HOME</a> --%>
    <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Guest</a>
    
    <c:if test="${sLevel <= 3}">
	    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Board</a>
	    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Pds</a>
	    <div class="w3-dropdown-hover w3-hide-small">
	      <button class="w3-padding-large w3-button" title="More">Study1 <i class="fa fa-caret-down"></i></button>     
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <a href="${ctp}/study/password/sha256" class="w3-bar-item w3-button">암호화(SHA256)</a>
	        <a href="${ctp}/study/password/aria" class="w3-bar-item w3-button">암호화(ARIA)</a>
	        <a href="${ctp}/study/password/bCryptPassword" class="w3-bar-item w3-button">암호화(Security)</a>
	        <a href="${ctp}/study/mail/mailForm" class="w3-bar-item w3-button">메일</a>
	        <a href="${ctp}/study/mail/mailForm2" class="w3-bar-item w3-button">메일(주소록)</a>
	        <a href="${ctp}/study/uuid/uuidForm" class="w3-bar-item w3-button">UUID</a>
	        <a href="${ctp}/study/ajax/ajaxForm" class="w3-bar-item w3-button">ajax</a>
	      </div>
	    </div>
	    <div class="w3-dropdown-hover w3-hide-small">
	      <button class="w3-padding-large w3-button" title="More">My Page<i class="fa fa-caret-down"></i></button>     
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <a href="${ctp}/member/memberMain" class="w3-bar-item w3-button">메인 페이지</a>
	        <a href="${ctp}/member/memberList" class="w3-bar-item w3-button">회원 리스트</a>
	        <a href="${ctp}/member/memberPwdUpdate?pwdFlag=member" class="w3-bar-item w3-button">비밀번호 변경</a>
	        <a href="${ctp}/member/memberUpdate" class="w3-bar-item w3-button">정보 수정</a>
	        <a href="javascript:memberDelete()" class="w3-bar-item w3-button">회원 탈퇴</a>
	        <c:if test="${sLevel == 0}"><a href="${ctp}/admin/adminMenu" class="w3-bar-item w3-button">관리자</a></c:if>
	      </div>
	    </div>
    </c:if>
    <c:if test="${empty sLevel}">
	    <a href="${ctp}/member/memberLogin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Login</a>
	    <a href="${ctp}/member/memberJoin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Join</a>
    </c:if>
    <c:if test="${!empty sLevel}">
	    <a href="${ctp}/member/memberLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
    </c:if>
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Guest</a>
  <a href="#tour" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Board</a>
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Pds</a>
  <hr/>
  <a href="${ctp}/study/password/sha256" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Sha256</a>
  <a href="${ctp}/study/password/aria" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">ARIA</a>
  <a href="${ctp}/study/password/bCryptPassword" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">암호화(Security)</a>
</div>