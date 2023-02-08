package com.hch.exam.must_it_project.controller;

import com.hch.exam.must_it_project.service.FindService;
import com.hch.exam.must_it_project.service.MemberService;
import com.hch.exam.must_it_project.vo.Member;
import com.hch.exam.must_it_project.vo.Rq;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;

@Controller
public class UsrFindController {
  private FindService findService;

  private MemberService memberService;

  private Rq rq;


  public UsrFindController(FindService findService, MemberService memberService, Rq rq) {
    this.findService = findService;
    this.memberService = memberService;
    this.rq = rq;
  }

  @RequestMapping("/usr/member/findId")
  public String findId(HttpSession httpSession){
    return "/usr/member/findId";
  }

  @RequestMapping("/usr/member/doFinId")
  @ResponseBody
  public Member doFindId(String name, String email){

   Member member = findService.nameAndEmailCheck(name, email);

    System.out.println(member);

    return member;
  }

  @RequestMapping("/usr/member/findId_ok")
  public String findId_ok(HttpSession httpSession, Model model, int id){
    Member member = memberService.getMemberById(id);

    model.addAttribute("member", member);

    return "/usr/member/findId_ok";
  }

  @RequestMapping("/usr/member/findPw")
  public String findPw(HttpSession httpSession){
    return "/usr/member/findPw";
  }

  @RequestMapping("/usr/member/doFindPw")
  @ResponseBody
  public Member doFindPw(String loginId, String name){

    Member member = findService.loginIdAndNameCheck(loginId, name);

    System.out.println(member);

    return member;
  }
  @RequestMapping("/usr/member/findPw_ok")
  public String findPw_ok(HttpSession httpSession, Model model, int id){

    Member member = memberService.getMemberById(id);

    model.addAttribute("member", member);

    return "/usr/member/findPw_ok";
  }

  @RequestMapping("/usr/member/changePw")
  @ResponseBody
  public void changPw(int id, String newPw){

    String enNewPw=  Base64Utils.encodeToString(newPw.getBytes(StandardCharsets.UTF_8));

    findService.setPwUpdate(id, enNewPw);
  }
}
