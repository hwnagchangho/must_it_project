package com.hch.exam.must_it_project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.io.UnsupportedEncodingException;
import java.util.Random;

@Service
public class RegisterMailService implements MailServiceInter {

  @Autowired
  JavaMailSender emailSender;

  private String ePw;

  //회원가입 인증 코드
  @Override
  public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
    System.out.println("메일받을 사용자" + to);
    System.out.println("인증번호" + ePw);

    MimeMessage message = emailSender.createMimeMessage();

    message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
    message.setSubject("Must it 회원가입 이메일 인증"); // 이메일 제목

    String msgg = "";
    // msgg += "<img src=../resources/static/image/emailheader.jpg />"; // header image
    msgg += "<h1>안녕하세요</h1>";
    msgg += "<h1>No.1 온라인 명품 플랫폼 Must'it 입니다.</h1>";
    msgg += "<br>";
    msgg += "<p>아래 인증코드를 회원가입 페이지에 입력해주세요</p>";
    msgg += "<br>";
    msgg += "<br>";
    msgg += "<div align='center' style='border:1px solid black font-family:verdana'>";
    msgg += "<h3 style='color:blue'>회원가입 인증코드 입니다</h3>";
    msgg += "<div style='font-size:130%'>";
    msgg += "CODE : <string>";
    msgg += ePw + "</strong></div><br/>" ; // 메일에 인증번호 ePw 넣기
    msgg += "</div>";
    // msgg += "<img src=../resources/static/image/emailfooter.jpg />"; // footer image

    message.setText(msgg, "utf-8", "html"); // 메일 내용, charset타입, subtype
    // 보내는 사람의 이메일 주소, 보내는 사람 이름
    message.setFrom(new InternetAddress("chang22100@naver.com", "Must'it_admin"));

    return message;
  }

  // 랜덤 인증코드 생성
  @Override
  public String createKey() {
    StringBuffer key = new StringBuffer();
    Random random = new Random();

    for(int i = 0; i < 8; i++){ //인증코드 8자리
      int index = random.nextInt(3); // 0~2까지 랜덤, random 값에 따라서 아래 switch 문이 실행됨

      switch (index) {
        case 0:
          key.append((char) ((int) (random.nextInt(26)) + 97));
          //a~z (ex. 1+97=98 => (char)98 = 'b')
          break;
        case 1:
          key.append((char) ((int) (random.nextInt(26)) + 65));
          //A~Z
          break;
        case 2:
          key.append((random.nextInt(10)));
          //0~9
          break;
      }
    }
    return key.toString();
  }

  // 메일 발송
  // sendSimpleMessage 의 매개변수로 들어온 to는 이메일 주소가 되고,
  // MimeMessage 객체 안에 내가 전송할 메일의 내용을 담는다
  // bean 으로 등록해둔 javaMail 객체를 사용하여 이메일을 발송한다

  //회원가입 인증 코드
  @Override
  public String sendSimpleMessage(String to) throws Exception {

    ePw = createKey(); // 랜덤 인증코드 생성

    System.out.println("********생성된 랜덤 인증코드******** => " + ePw);

    MimeMessage message = createMessage(to); // "to" 로 메일 발송

    try {//예외처리
      emailSender.send(message);
    }catch (MailException es){
      es.printStackTrace();
      throw new IllegalArgumentException();
    }

    System.out.println("********생성된 메시지******** => " + message);

    return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함
  }

  //비밀번호 인증 코드
  @Override
  public MimeMessage createMessagePw(String to) throws MessagingException, UnsupportedEncodingException {
    System.out.println("메일받을 사용자" + to);
    System.out.println("인증번호" + ePw);

    MimeMessage message = emailSender.createMimeMessage();

    message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
    message.setSubject("Must it 비밀번호찾기 이메일 인증"); // 이메일 제목

    String msgg = "";
    // msgg += "<img src=../resources/static/image/emailheader.jpg />"; // header image
    msgg += "<h1>안녕하세요</h1>";
    msgg += "<h1>머스트잇 비밀번호 찾기 결과입니다.</h1>";
    msgg += "<br>";
    msgg += "<p>비밀번호 찾기를 위한 인증코드를 안내해드립니다.</p>";
    msgg += "<br>";
    msgg += "<br>";
    msgg += "<div align='center' style='border:1px solid black font-family:verdana'>";
    msgg += "<h3 style='color:blue'>비밀번호 찾기 인증코드 입니다</h3>";
    msgg += "<div style='font-size:130%'>";
    msgg += "CODE : <string>";
    msgg += ePw + "</strong></div><br/>" ; // 메일에 인증번호 ePw 넣기
    msgg += "</div>";
    // msgg += "<img src=../resources/static/image/emailfooter.jpg />"; // footer image

    message.setText(msgg, "utf-8", "html"); // 메일 내용, charset타입, subtype
    // 보내는 사람의 이메일 주소, 보내는 사람 이름
    message.setFrom(new InternetAddress("chang22100@naver.com", "Must'it_admin"));

    return message;
  }

  @Override
  public String sendSimpleMessagePw(String to) throws Exception {

    ePw = createKey(); // 랜덤 인증코드 생성

    System.out.println("********생성된 랜덤 인증코드******** => " + ePw);

    MimeMessage message = createMessagePw(to); // "to" 로 메일 발송

    try {//예외처리
      emailSender.send(message);
    }catch (MailException es){
      es.printStackTrace();
      throw new IllegalArgumentException();
    }

    System.out.println("********생성된 메시지******** => " + message);

    return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함
  }

}
