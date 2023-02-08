<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--css-->
<link rel="stylesheet" href="/static/css/find.css">

<c:set var="pageTitle" value="아이디 찾기 결과" />
<%@ include file="../common/header.jspf"%>
<div class="find-area mt-10">
  <div class="find-area__header">
    <div class="mini_title">회원님의 아이디 찾기 결과입니다.</div>
    <div class="line"></div>
  </div>

  <div class="find_box">
    <div class="text-center">
      <span>${member.email}과 동일한 이메일로</span>
      <p>머스트잇에 가입한 정보가 있습니다.</p>
    </div>

    <div class="find_result mt-5">
      <div class="flex justify-center">
        <span class="font-bold mr-5">${member.loginId}</span>
        <span class="font-medium mb-5">(${member.regDate} 가입)</span>
      </div>
    </div>
    <div class="find_button flex">
      <input type="button" onClick="location.href='../member/login'" value="로그인하기">
      <input type="button" onClick="location.href='../member/findPw'" value="비밀번호 찾기">
    </div>
  </div>
</div>
<%@ include file="../common/footer.jspf"%>