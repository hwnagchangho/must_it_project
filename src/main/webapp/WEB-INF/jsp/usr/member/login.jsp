<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" href="/static/css/login.css">



<c:set var="pageTitle" value="로그인" />
<%@ include file="../common/header.jspf"%>
<section class="mt-5">
  <div class="login-area con">
    <div class="top_welcome">
      <span>머스트잇에 오신 것을 환영합니다!</span>
    </div>
      <div class="login-area__top">
        <span>회원 로그인</span>
    </div>
    <form  name="frm" method="post" action="../member/doLogin">
      <table class="mx-auto mt-2">
        <colgroup>
          <col width="200"/>
        </colgroup>
        <tbody>
        <tr>
          <td>
            <input id="loginId" name="loginId" class="input input-bordered w-full" type="text" placeholder="아이디를 입력해주세요.">
          </td>
        </tr>
        <tr>
          <td>
            <input id="loginPw" name="loginPw" class="input input-bordered w-full" type="password" placeholder="비밀번호를 입력해주세요.">
          </td>
        </tr>
        <tr>
          <td>
            <input type="button" value="로그인" id="btnLogin" name="btnLogin"  class="btn btn-wide w-10/12" label="로그인">
          </td>
        </tr>
      </table>
      <div class="text-center">
        <a href="../member/findId">아이디 찾기
          <span class="boundary">|</span>
        </a>
        <a href="../member/findPw">비밀번호 찾기
          <span class="boundary">|</span>
        </a>
        <a href="../member/join">회원가입</a>
      </div>
    </form>
  </div>
</section>
<%@ include file="../common/footer.jspf"%>




<script type="text/javascript">
	$(document).ready(function(){
		var frm = document.frm;


		$('#btnLogin').click(function(){
			var userId = $('#loginId').val();
			var userPw = $('#loginPw').val();
			if(frm.loginId.value && frm.loginPw.value){
				$.ajax({
					type : 'POST',
					url : "../member/memberCheck",
					data : {"userId" : userId, "userPw" : userPw},
					datatype : "text",
					success : function(cnt){
						if(cnt == 1){
							frm.submit();
						}else{
							alert("사용자정보가 없습니다.");
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}else if(!frm.loginId.value){
				alert("아이디를 입력해주세요.");
				frm.loginId.focus();
				return;
			}else if(!frm.loginPw.value){
				alert("비밀번호를 입력해주세요.");
				frm.loginPw.focus();
				return;
			}

		});

	});
</script>
