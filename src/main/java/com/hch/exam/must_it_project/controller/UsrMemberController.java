package com.hch.exam.must_it_project.controller;

import com.hch.exam.must_it_project.service.MemberService;
import com.hch.exam.must_it_project.util.Ut;
import com.hch.exam.must_it_project.vo.Member;
import com.hch.exam.must_it_project.vo.ResultData;
import com.hch.exam.must_it_project.vo.Rq;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;

@Controller
public class UsrMemberController {

  private MemberService memberService;

  private Rq rq;

  public UsrMemberController(MemberService memberService, Rq rq) {
    this.memberService = memberService;
    this.rq = rq;
  }

  @RequestMapping("/usr/member/join")
  public String showJoin (HttpSession httpSession){
    return "/usr/member/join";
  }

  @RequestMapping("/usr/member/doJoin")
  @ResponseBody
  public String doJoin (String loginId, String loginPw, String name, String nickname, String cellphoneNo,
                        String sample4_postcode, String sample4_roadAddress, String sample4_detailAddress, String email ){
    
//    base64μνΈν
    String enLoginPw=  Base64Utils.encodeToString(loginPw.getBytes(StandardCharsets.UTF_8));

    System.out.println(enLoginPw);
    System.out.println(sample4_postcode);
    System.out.println(sample4_roadAddress);
    System.out.println(sample4_detailAddress);

    ResultData joinRd= memberService.join(loginId, enLoginPw, name, nickname, cellphoneNo,
        sample4_postcode, sample4_roadAddress, sample4_detailAddress, email);

      return rq.jsReplace(joinRd.getMsg(),"/");
    }

  @RequestMapping("/usr/member/login")
  public String showLogin(HttpSession httpSession){
    return "/usr/member/login";
  }

  @RequestMapping("/usr/member/doLogin")
  @ResponseBody
  public String doLogin(String loginId, String loginPw){

    Member member = memberService.getMemberByLoginId(loginId);

    rq.login(member);

    return rq.jsReplace(Ut.f("%sλ νμν©λλ€", member.getNickname()), "/");
  }

  @RequestMapping("/usr/member/doLogout")
  @ResponseBody
  public String doLogout() {
    rq.logout();

    return rq.jsHistoryBack("λ‘κ·Έμμ λμμ΅λλ€.");
  }
//λ§μ΄νμ΄μ§
  @RequestMapping("/usr/member/myPage")
  public String showMyPage (HttpSession httpSession){
    return "usr/member/myPage";
  }

  @RequestMapping("/usr/member/checkPassword")
  public String showCheckPassword (HttpSession httpSession){
    return "usr/member/checkPassword";
  }

  @RequestMapping("/usr/member/doCheckPassword")
  @ResponseBody
  public String doCheckPassword (String loginPw, String replaceUri){

    String enLoginPw=  Base64Utils.encodeToString(loginPw.getBytes(StandardCharsets.UTF_8));

    if( Ut.empty(loginPw)) {
      return rq.jsHistoryBack("loginPw(μ)λ₯Ό μλ ₯ ν΄μ£ΌμΈμ.");
    }

    if( rq.getLoginedMember().getLoginPw().equals(enLoginPw) == false ) {
      return rq.jsHistoryBack("λΉλ°λ²νΈκ° μΌμΉνμ§ μμ΅λλ€.");
    }
    return rq.jsReplace("", replaceUri="../member/modify");
  }

  @RequestMapping("/usr/member/modify")
  public String showModify (HttpSession httpSession){
    return "usr/member/modify";
  }

  @RequestMapping("/usr/member/doModify")
  @ResponseBody
  public String doModify (String nickname, String cellphoneNo, String email) {

    memberService.modifyInfo(rq.getLoginedMemberId(), nickname, cellphoneNo, email);

    return rq.jsReplace("μ μ₯λμμ΅λλ€.", "/");
  }
    //μ€λ³΅νμΈ λ° μ ν¨μ± μ²΄ν¬

//λ‘κ·ΈμΈ μ ν¨μ±μ²΄ν¬
  @RequestMapping("/usr/member/memberCheck")
  @ResponseBody
  public int memberCheck(String userId, String userPw){

    String enLoginPw=  Base64Utils.encodeToString(userPw.getBytes(StandardCharsets.UTF_8));

    int cnt = memberService.getMemberByCheck(userId, enLoginPw);

    return cnt;
  }

  //μμ΄λ μ€λ³΅νμΈ
  @RequestMapping("/usr/member/memberIdCheck")
  @ResponseBody
  public int memberIdCheck(String loginId){

    int cnt = memberService.getMemberIdCheck(loginId);

    return cnt;
  }
// λλ€μ μ€λ³΅νμΈ
  @RequestMapping("/usr/member/memberNickCheck")
  @ResponseBody
  public int memberNickCheck(String nickname){

    int cnt = memberService.getMemberNickCheck(nickname);

    return cnt;
  }
}
