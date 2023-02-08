package com.hch.exam.must_it_project.config;

import com.hch.exam.must_it_project.interceptor.BeforeActionInterceptor;
import com.hch.exam.must_it_project.interceptor.NeedLoginInterceptor;
import com.hch.exam.must_it_project.interceptor.NeedLogoutInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {
  // beforeActionInterceptor 인터셉터 불러오기
  @Autowired
  BeforeActionInterceptor beforeActionInterceptor;

  // needLoginInterceptor 인터셉터 불러오기
  @Autowired
  NeedLoginInterceptor needLoginInterceptor;

  @Autowired
  NeedLogoutInterceptor needLogoutInterceptor;

  // 이 함수는 인터셉터를 적용하는 역할을 합니다.
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(beforeActionInterceptor)
        .addPathPatterns("/**")
        .excludePathPatterns("/css/**")
        .excludePathPatterns("/js/**")
        .excludePathPatterns("/error");

    registry.addInterceptor(needLoginInterceptor)
        .addPathPatterns("/usr/member/myPage")
        .addPathPatterns("/usr/product/write")
        .addPathPatterns("/usr/cart/list");

    registry.addInterceptor(needLogoutInterceptor)
        .addPathPatterns("/usr/member/findLoginId")
        .addPathPatterns("/usr/member/doFindLoginId")
        .addPathPatterns("/usr/member/findLoginPw")
        .addPathPatterns("/usr/member/doFindLoginPw");
  }
}