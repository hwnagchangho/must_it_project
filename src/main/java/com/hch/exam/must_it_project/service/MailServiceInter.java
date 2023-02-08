package com.hch.exam.must_it_project.service;

import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
public interface MailServiceInter {

  // 회원가입 인증 메일 내용 작성
  MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;

  // 랜덤 인증코드 생성
  String createKey();

  // 회원가입 인증 메일 발송
  String sendSimpleMessage(String to) throws Exception;


  // 회원가입 인증 메일 내용 작성
  MimeMessage createMessagePw(String to) throws MessagingException, UnsupportedEncodingException;
  //비밀번호 인증 메일 발송
  String sendSimpleMessagePw(String to) throws Exception;

}
