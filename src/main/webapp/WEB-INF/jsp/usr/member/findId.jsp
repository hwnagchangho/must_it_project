<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--css-->
<link rel="stylesheet" href="/static/css/find.css">
<script src="/static/js/find.js" defer></script>

<c:set var="pageTitle" value="아이디 찾기" />
<%@ include file="../common/header.jspf"%>
<div class="findMember mt-5">
  <div class="find-area con">
    <div class="find-area__header">
      <div class="mini_title">아이디/비밀번호 찾기</div>
      <div class="line"></div>
    </div>

    <div class="find_box">
      <ul class="sub_box flex justify-center">
        <li onclick="location.href='../member/findId'">아이디 찾기</li>
        <li onclick="location.href='../member/findPw'">비밀번호 찾기</li>
      </ul>

      <form class="flex flex-col items-center" method="post" name="frm">
        <div class="sub_desc">
          <p>최초 회원가입 시 등록한 회원정보를 입력하시면</p>
          <p>아이디를 찾을 수 있습니다.</p>
        </div>
        <!-- 아이디찾기 -->
        <div class="content_box w-96">
          <input type="text" id="name" name="name" placeholder="이름" class="input input-bordered w-full mb-2" />
          <input type="text" id="email" name="email" placeholder="이메일" class="input input-bordered w-full mb-2" />
        </div>
        <div class="find_button">
          <input type="button" onclick="FindIdCheck()" value="아이디 찾기">
        </div>
      </form>
    </div>

  </div>
</div>
<%@ include file="../common/footer.jspf"%>

<script>
  function FindIdCheck(){
    var num;
    var name = $('#name').val();
    var email = $('#email').val();
    var frm = document.frm;

    if(name.length == 0){
      alert('이름을 입력해주세요.');
      $('#name').focus();
      return false;
    }
    if(email.length == 0){
      alert('이메일을 입력해주세요.');
      $('#email').focus();
      return false;
    }

    $.ajax({
      url: '../member/doFinId',
      type: 'post',
      data:{'name' : name, 'email' : email},
      success: function (member) {
          if(member.name == name && member.email == email){
              alert('인증이 완료되었습니다.');
              num = member.id;
              location.href = "findId_ok?id="+num;
						}else{
							alert("사용자정보가 없습니다.");
							return false;
						}
        }
      });
  }
</script>


