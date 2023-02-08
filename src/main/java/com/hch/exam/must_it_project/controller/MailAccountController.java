package com.hch.exam.must_it_project.controller;

import com.hch.exam.must_it_project.service.RegisterMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/usr/mail")
public class MailAccountController {

  @Autowired
  RegisterMailService registerMail;

  @PostMapping("/mailConfirm")
  @ResponseBody
  public String mailConfirm(@RequestParam("email") String email) throws Exception{

    String code =  registerMail.sendSimpleMessage(email);
    System.out.println("사용자에게 발송한 인증코드 ==> " + code);

    return code;
  }

  @PostMapping("/mailConfirmPw")
  @ResponseBody
  public String mailConfirmPw(@RequestParam("email") String email) throws Exception{

    String code =  registerMail.sendSimpleMessagePw(email);
    System.out.println("사용자에게 발송한 인증코드 ==> " + code);

    return code;
  }
}
