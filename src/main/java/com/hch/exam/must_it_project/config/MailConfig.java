package com.hch.exam.must_it_project.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

  @Value("${spring.mail.username}")
  private String username;
  @Value("${spring.mail.password}")
  private String password;

  @Bean
  public JavaMailSender javaMailService() {
    JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

    javaMailSender.setHost("smtp.naver.com"); // smtp 서버 주소
    javaMailSender.setUsername(username); //네이버 아이디 , 네이버 SMTP 설정 이메일
    javaMailSender.setPassword(password); //네이버 비밀번호,

    javaMailSender.setPort(465); //메일 인증 서버 포트

    javaMailSender.setJavaMailProperties(getMailProperties()); //메일 인증서버 정보 가져오기

    return javaMailSender;
  }

  private Properties getMailProperties() {
    Properties properties = new Properties();
    properties.setProperty("mail.transport.protocol", "smtp"); //프로토콜 설정
    properties.setProperty("mail.smtp.auth", "true"); //smtp 인증
    properties.setProperty("mail.smtp.starttls.enable", "true"); // smtp starttls 사용
    properties.setProperty("mail.debug", "true"); //디버그 사용
    properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com"); //ssl 인증 서버는 smtp.naver.com
    properties.setProperty("mail.smtp.ssl.enable", "true"); //ssl 사용
    return properties;
  }
}
