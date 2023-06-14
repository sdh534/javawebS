<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<h2 class="text-center">전체 회원 리스트</h2>
  <br/>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td class="text-right">
        <!-- 한페이지 분량처리 -->
        <select name="pageSize" id="pageSize" onchange="pageCheck()">
          <option <c:if test="${pageVO.pageSize == 3}">selected</c:if>>3</option>
          <option <c:if test="${pageVO.pageSize == 5}">selected</c:if>>5</option>
          <option <c:if test="${pageVO.pageSize == 10}">selected</c:if>>10</option>
          <option <c:if test="${pageVO.pageSize == 15}">selected</c:if>>15</option>
          <option <c:if test="${pageVO.pageSize == 20}">selected</c:if>>20</option>
        </select> 건
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>별명</th>
      <th>성명</th>
      <th>성별</th>
    </tr>
    <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${curScrStartNo}</td>
        <td>${vo.mid}</td>
        <td>${vo.nickName}</td>
        <td>
          <c:if test="${vo.userInfor == '공개'}">${vo.name}</c:if>
          <c:if test="${vo.userInfor != '공개'}"><font color="red">비공개</font></c:if>
        </td>
        <td>${vo.gender}</td>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
    </c:forEach>
    <tr><td colspan="5" class="m-0 p-0"></td></tr>
  </table>
  <!-- 블록 페이징 처리 -->
  <div class="text-center m-4">
	  <ul class="pagination justify-content-center pagination-sm">
	       <c:if test="${pageVO.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?pageSize=${pageVO.pageSize}&pag=1">첫페이지</a></li></c:if>
	    <c:if test="${pageVO.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${pageVO.curBlock* pageVO.blockSize + 1}" end="${pageVO.curBlock * pageVO.blockSize + pageVO.blockSize}" varStatus="st">
	      <c:if test="${i <= pageVO.totPage && i == pageVO.pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/member/memberList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li></c:if>
	      <c:if test="${i <= pageVO.totPage && i != pageVO.pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${pageVO.curBlock < pageVO.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock+1) * pageVO.blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pageVO.pag < pageVO.totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?pageSize=${pageVO.pageSize}&pag=${pageVO.totPage}">마지막페이지</a></li></c:if>
	  </ul>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>