<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--css-->
<link rel="stylesheet" href="/static/css/find.css">

<c:set var="pageTitle" value="비밀번호 찾기 결과" />
<%@ include file="../common/header.jspf"%>
<div class="find-area mt-10">
  <div class="find-area__header">
    <div class="mini_title">비밀번호 찾기</div>
    <div class="line"></div>
  </div>

  <div class="find_box">
    <div class="text-center">
      <div>본인인증이 완료되었습니다. 새로운 비밀번호를 설정해주세요.</div>
    </div>

    <div class="find_result mt-5">
      <div class="flex flex-col items-center">
        <input type="password" id="newPw" name="newPw" placeholder="새로운 비밀번호" class="input input-bordered w-9/12 mb-2" />
        <input type="password" id="newPwConfirm" name="newPwConfirm" placeholder="새로운 비밀번호 확인" class="input input-bordered w-9/12 mb-2" />
      </div>
    </div>
    <div class="find_button flex justify-center">
      <input type="button" id="btnChangePw" value="비밀번호 변경">
    </div>
  </div>
</div>
<%@ include file="../common/footer.jspf"%>

<script type="text/javascript">
  $('#btnChangePw').click(function() {

    var newPw = $('#newPw').val();
    var newPwConfirm = $('#newPwConfirm').val();


    // 비밀번호 유효성 검사 (최소 8자리, 숫자,문자,특수문자 최소 1개)
    var check_pw = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);

    if( newPw == "" || newPw == null){
      alert('새로운 비밀번호를 입력해주세요');
      $('#newPw').focus();
      return false;
    }
    if (!check_pw.test(newPw)) {
      alert('영문, 숫자, 특수문자를 포함한 비밀번호를 입력해주세요.');
      $('#newPw').val("");
      $('#newPw').focus();
      return false;
    }
    if( newPwConfirm == "" || newPwConfirm == null){
      alert('새로운 비밀번호 확인을 입력해주세요');
      $('#newPwConfrim').focus();
      return false;
    }
    if('${member.loginPw}' == newPw){
      alert('현재 비밀번호와 일치합니다.');
      $('#newPw').focus();
      return false;
    }
    if(newPw != newPwConfirm){
      alert('비밀번호가 일치하지 않습니다.');
      $('#newPwConfirm').focus();
      return false;
    }

    $.ajax({
      url:'../member/changePw',
      type:'post',
      data:{ 'id' : '${member.id}', 'newPw' : newPw},
      success : function(){
        alert('비밀번호가 변경되었습니다.');
        location.href="/";
      }
    });

  });
</script>