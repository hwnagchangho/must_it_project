<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" href="/static/css/join.css">

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../common/header.jspf"%>
<section class="mt-5 mb-28">
  <div class="join-area con">
    <div class="join-area__top">
      <span>회원정보 입력</span>
    </div>
    <form class="table-box-type-1" name="frm" method="post" action="../member/doJoin" onsubmit="return availability_join();">
      <div class="form-control">
        <label class="input-group input-group-vertical w-10/12">
          <span>아이디</span>
          <input type="text" id="loginId" name="loginId" placeholder="영문 및 숫자 4-10글자" class="input input-bordered" />
          <input type="button" id="btnIdCheck" name="btnIdCheck" value="중복검사" class="btn"/>
        </label>
      </div>
      <div class="form-control">
        <label class="input-group input-group-vertical w-10/12">
          <span>비밀번호</span>
          <input type="password" id="loginPw" name="loginPw" placeholder="최소 8자리, 숫자,문자,특수문자 최소 1개" class="input input-bordered" />
        </label>
      </div>
        <div class="form-control">
          <label class="input-group input-group-vertical w-10/12">
            <span>비밀번호 확인</span>
            <input type="password" id="loginPwConfirm" name="loginPwConfirm" placeholder="최소 8자리, 숫자,문자,특수문자 최소 1개" class="input input-bordered" />
          </label>
        </div>
      <div class="form-control">
        <label class="input-group input-group-vertical w-10/12">
          <span>이름</span>
          <input type="text" id="name" name="name" placeholder="실명을 입력해주세요." class="input input-bordered" />
        </label>
      </div>
      <div class="form-control">
        <label class="input-group input-group-vertical w-10/12">
          <span>닉네임</span>
          <input type="text" id="nickname" name="nickname" placeholder="영문/한글/숫자 2-10글" class="input input-bordered" />
          <input type="button" id="btnNickCheck" name="btnNickCheck" value="중복검사" class="btn"/>
        </label>
      </div>
      <div class="form-control">
        <label class="input-group input-group-vertical w-10/12">
          <span>전화번호</span>
          <input type="text" id="cellphoneNo" name="cellphoneNo" placeholder="하이픈(-) 없이 입력" class="input input-bordered" />
        </label>
      </div>
      <div class="form-control">
        <label class="input-group input-group-vertical w-10/12">
          <span>주소</span>
          <input type="text" id="sample4_postcode" name="sample4_postcode" placeholder="우편번호" class="input input-bordered">
          <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn">
          <input type="text" id="sample4_roadAddress" name="sample4_roadAddress" placeholder="도로명주소" class="input input-bordered">
          <span id="guide" style="color:#999;display:none"></span>
          <input type="text" id="sample4_detailAddress" name="sample4_detailAddress" placeholder="상세주소" class="input input-bordered">
        </label>
      </div>
      <div class="form-control">
        <label class="input-group input-group-vertical w-10/12">
          <span>이메일</span>
          <input type="text" id="email" name="email" placeholder="이메일 형식에 맞게 입력" class="input input-bordered" />
          <input type="button" value="인증번호" id="checkEmail" name="checkEmail" class="btn"/>
        </label>
        <label class="input-group input-group-vertical w-10/12">
          <span>인증번호</span>
          <input type="text" id="mailConfirm" name="mailConfirm" placeholder="인증번호를 입력해주세요" class="input input-bordered" />
          <input type="button" value="인증번호 확인" id="mailConfirmCheck" name="mailConfirmCheck" class="btn"/>
        </label>
      </div>
      <input type="submit" value="가입하기" class="btn btn-success" label="가입하기">
    </form>
  </div>
</section>
<%@ include file="../common/footer.jspf"%>


<script type="text/javascript">

  let nickCheck = false;
  let idCheck = false;
  let chkEmailConfirm = "";
  let emailCheck = false;

  var frm = document.frm;

<!--  아이디 중복검사 -->

  $('#btnIdCheck').click(function () {

    var loginId = $('#loginId').val();

    if(loginId.length == 0){
      alert('아이디를 입력해주세요.');
      $('#loginId').focus();
      return false;
    }

    $.ajax({
        url: '../member/memberIdCheck',
        type: 'post',
        data: {"loginId": loginId},
        success: function (cnt) {
            if (cnt != 1) {
                alert('사용가능한 아이디입니다.')
                idCheck = true;
            } else {
                alert('이미 사용하고 있는 아이디입니다.')
                idCheck = false;
            }
        }
    });
});

<!--  닉네임 중복검사 -->

  $('#btnNickCheck').click(function () {

      var nickname = $('#nickname').val();

      if(nickname.length == 0){
      alert('닉네임을 입력해주세요.');
      $('#nickname').focus();
      return false;
    }

      $.ajax({
          url: '../member/memberNickCheck',
          type: 'post',
          data: {nickname: nickname},
          success: function (cnt) {
              if (cnt != 1) {
                  alert('사용가능한 닉네임입니다.')
                  nickCheck = true;
              } else {
                  alert('이미 사용하고 있는 닉네임입니다.')
                  nickCheck = false;
              }
          }
      });
  });

  //주소 api
  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("memAddress").value = extraRoadAddr;
						} else {
							document.getElementById("memAddress").value = '';
						}
						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}


  <!--이메일 인증번호-->
  $('#checkEmail').click(function(){

    var email = $('#email').val();

    if(email.length == 0){
        alert('이메일을 입력해주세요.');
        $('#email').focus();
        return false;
     }
    $.ajax({
      url: '../mail/mailConfirm',
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

<!--회원가입 유효성 검사-->

  function availability_join() {

      var loginId = $('#loginId').val();
      var loginPw = $('#loginPw').val();
      var loginPwConfirm = $('#loginPwConfirm').val();
      var name = $('#name').val();
      var nickname = $('#nickname').val();
      var cellphoneNo = $('#cellphoneNo').val();
      var sample4_postcode = $('#sample4_postcode').val();
      var sample4_roadAddress = $('#sample4_roadAddress').val();
      var sample4_detailAddress = $('#sample4_detailAddress').val();
      var email = $('#email').val();

      // 아이디 유효성 검사 (영문 및 숫자 4-10글자)
      var check_id = RegExp(/^[a-zA-Z0-9]{4,10}$/);
      // 비밀번호 유효성 검사 (최소 8자리, 숫자,문자,특수문자 최소 1개)
      var check_pw = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
      //한글 이름 2~6자 이내
      var check_name = RegExp(/^[가-힣]{2,6}$/);
      // 닉네임 유효성 검사 (영문/한글/숫자 2-10글)
      var check_nick = RegExp(/^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{2,10}$/);
      //전화번호형식
      var check_cellphoneNo = RegExp(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/);
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

      // 비밀번호 공백 확인
      if (loginPw == "" || loginPw == null) {
          alert('비밀번호를 입력해주세요.');
          $('#loginPw').focus();
          return false;
      }

      // 비밀번호 유효성 체크
      if (!check_pw.test(loginPw)) {
          alert('영문, 숫자, 특수문자를 포함한 비밀번호를 입력해주세요.');
          $('#loginPw').val("");
          $('#loginPw').focus();
          return false;
      }

      // 비밀번호확인 공백 확인
      if (loginPwConfirm == "" || loginPwConfirm == null) {
          alert('비밀번호확인을 입력해주세요.');
          $('#loginPwConfirm').focus();
          return false;
      }

      // 비밀번호확인 유효성 검사
      if ( loginPw != loginPwConfirm) {
          alert('비밀번호가 일치하지 않습니다.');
          $('#loginPwConfirm').focus();
          return false;
      }


      // 이름 공백 확인
      if (name == "" || name == null) {
          alert('이름을 입력해주세요.');
          $('#name').focus();
          return false;
      }

      // 이름 유효성 체크
      if (!check_name.test(name)) {
          alert('실명을 2~6자 이내로 입력해주세요');
          $('#name').val("");
          $('#name').focus();
          return false;
      }

      // 닉네임 공백 체크
      if (nickname == "" || nickname == null) {
          alert('닉네임을 입력해주세요.');
          $('#nickname').focus();
          return false;
      }

      // 닉네임 유효성 체크
      if (!check_nick.test(nickname)) {
          alert('닉네임은 영문과 한글, 숫자로 생성 가능합니다.');
          $('#nickname').val("");
          $('#nickname').focus();
          return false;
      }

      // 전화번호 공백 체크
      if (cellphoneNo == "" || cellphoneNo == null) {
          alert('전화번호를 입력해주세요.');
          $('#cellphoneNo').focus();
          return false;
      }

      // 전화번호 유효성 체크
      if (!check_cellphoneNo.test(cellphoneNo)) {
          alert('- 빼고 입력해주세요');
          $('#cellphoneNo').val("");
          $('#cellphoneNo').focus();
          return false;
      }

      // 우편번호 공백 체크
      if (sample4_postcode == "" || sample4_postcode == null) {
          alert('우편번호를 입력해주세요.');
          $('#sample4_postcode').focus();
          return false;
      }

      // 도로명주소 공백 체크
      if (sample4_roadAddress == "" || sample4_roadAddress == null) {
          alert('도로명주소를 입력해주세요.');
          $('#sample4_roadAddress').focus();
          return false;
      }

      // 상세주소 공백 체크
      if (sample4_detailAddress == "" || sample4_detailAddress == null) {
          alert('상세주소를 입력해주세요.');
          $('#ample4_detailAddress').focus();
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
          alert('아이디 중복검사를 해주세요');
          return false;
      }

      // 닉네임 중복 체크 여부
      if (nickCheck == false) {
          alert('닉네임 중복검사를 해주세요');
          return false;
      }

      // 이메일 인증 여부
      if (emailCheck == false) {
          alert('이메일 인증을 해주세요.');
          $('#mailConfirm').focus();
          return false;
      }
      return true;
  }
</script>

