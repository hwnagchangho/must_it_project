<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--css-->
<link rel="stylesheet" href="/static/css/find.css">
<script src="/static/js/find.js" defer></script>

<c:set var="pageTitle" value="비밀번호 찾기" />
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
          <p>비밀번호를 찾을 수 있습니다.</p>
        </div>
        <!-- 아이디찾기 -->
        <div class="content_box w-96">
          <label class="flex">
            <input type="text" id="loginId" name="loginId" placeholder="아이디" class="input input-bordered w-8/12 mb-2 " />
            <input type="button" id="btnIdCheck" name="btnIdCheck" value="아이디  확인" class="btn ml-auto"/>
          </label>
          <input type="text" id="name" name="name" placeholder="이름" class="input input-bordered w-full mb-2" />
          <label class="flex">
            <input type="text" id="email" name="email" placeholder="이메일" class="input input-bordered w-8/12 mb-2" />
            <input type="button" value="인증번호 발송" id="checkEmail" name="checkEmail" class="btn ml-auto"/>
          </label>
          <label class="flex">
            <input type="text" id="mailConfirm" name="mailConfirm" placeholder="인증번호" class="input input-bordered w-8/12 mb-2" />
            <input type="button" value="인증번호 확인" id="mailConfirmCheck" name="mailConfirmCheck" class="btn ml-auto"/>
          </label>
        </div>
        <div class="find_button">
          <input type="button" id="btnFindPw" name="btnFindPw" value="비밀번호 찾기">
        </div>
      </form>
    </div>

  </div>
</div>
<%@ include file="../common/footer.jspf"%>

<script type="text/javascript">

  let idCheck = false;
  let chkEmailConfirm = "";
  let emailCheck = false;

  var frm = document.frm;

<!--  아이디 확인 -->

  $('#btnIdCheck').click(function () {

    var loginId = $('#loginId').val();
    var name = $('#name').val();

    if(loginId.length == 0){
      alert('아이디를 입력해주세요.');
      $('#loginId').focus();
      return false;
    }

    $.ajax({
      url: '../member/memberIdCheck',
      type: 'post',
      data:{'loginId' : loginId},
      success: function (cnt) {
          if(cnt == 1){
              alert('아이디가 확인되었습니다.');
              idCheck = true;
						}else{
							alert("입력하신 정보로 가입된 아이디가 없습니다. 미가입 또는 탈퇴한 아이디 입니다.");
							return false;
						}
        }
      });
});



  <!--이메일 인증번호-->
  $('#checkEmail').click(function(){

    var email = $('#email').val();

    if(email.length == 0){
        alert('이메일을 입력해주세요.');
        $('#email').focus();
        return false;
     }
    $.ajax({
      url: '../mail/mailConfirmPw',
      type:'post',
      data: {'email' : email},
      success: function(data){
        alert('해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.')
        console.log("data : "+data);
        chkEmailConfirm = data;
      }
    });
 });

 //이메일 인증번호 체크 함수
  $('#mailConfirmCheck').click(function(){

    var mailConfirm = $('#mailConfirm').val();

    if(mailConfirm.length == 0){
      alert('인증번호를 입력해주세요.');
      $('#mailConfirm').focus();
      return false;
    }

    if(chkEmailConfirm == mailConfirm){
      alert('인증이 완료되었습니다..');
      emailCheck = true;
    }else{
      alert('인증코드가 잘못 입력되었습니다.');
      emailCheck = false;
      return false;
    }
  });


<!--비밀번호찾기 유효성 검사-->

  $('#btnFindPw').click(function() {

      var loginId = $('#loginId').val();
      var name = $('#name').val();
      var email = $('#email').val();
      var num;

      // 아이디 유효성 검사 (영문 및 숫자 4-10글자)
      var check_id = RegExp(/^[a-zA-Z0-9]{4,10}$/);
      // 이메일 형식만 가능
      var check_email = RegExp(/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/);


      // 아이디 공백 확인
      if (loginId == "" || loginId == null) {
          alert('아이디를 입력해주세요.');
          $('#loginId').focus();
          return false;
      }

      // 아이디 유효성 체크
      if (!check_id.test(loginId)) {
          alert('영문 및 숫자만 4-10자리까지 입력해주세요.');
          $('#loginId').val("");
          $('#loginId').focus();
          return false;
      }

      // 이름 공백 확인
      if (name == "" || name == null) {
          alert('이름을 입력해주세요.');
          $('#name').focus();
          return false;
      }

      // 이메일 공백 체크
      if (email == "" || email == null) {
          alert('이메일을 입력해주세요.');
          $('#email').focus();
          return false;
      }

      // 이메일 유효성 체크
      if (!check_email.test(email)) {
          alert('이메일 형식으로 입력해주세요');
          $('#email').val("");
          $('#email').focus();
          return false;
      }

      // 아이디 중복 체크 여부
      if (idCheck == false) {
          alert('아이디 확인을 해주세요');
          return false;
      }

      // 이메일 인증 여부
      if (emailCheck == false) {
          alert('이메일 인증을 해주세요.');
          $('#mailConfirm').focus();
          return false;
      }

      //이름, 아이디 정보 확인
      $.ajax({
      url: '../member/doFindPw',
      type: 'post',
      data:{'loginId' : loginId, 'name' : name},
      success: function (member) {
          if(member.loginId == loginId && member.name == name){
              alert('아이디,이름 정보가 확인되었습니다.');
              num = member.id;
              location.href = "findPw_ok?id="+num;
						}else{
							alert("사용자정보가 없습니다.");
							return false;
						}
        }
      });

  });
</script>
