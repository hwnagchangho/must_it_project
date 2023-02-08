package com.hch.exam.must_it_project.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
  @Override
  public void configure(WebSecurity web) throws Exception {
    web.ignoring().antMatchers("/css/**", "/js/**", "/images/**");
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
        .cors().disable()        //cors방지
        .csrf().disable()        //csrf방지
        .formLogin().disable()    //기본 로그인 페이지 없애기
        .headers().frameOptions().disable();
  }

}