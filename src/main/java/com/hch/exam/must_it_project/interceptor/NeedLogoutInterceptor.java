package com.hch.exam.must_it_project.interceptor;

import com.hch.exam.must_it_project.vo.Rq;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class NeedLogoutInterceptor implements HandlerInterceptor {
  private Rq rq;

  public NeedLogoutInterceptor(Rq rq) {
    this.rq = rq;
  }
  @Override
  public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handle) throws Exception {

    if( !rq.isLogined() ) {
      rq.printHistoryBackJs("로그아웃 후 이용해주세요.");
      return false;
    }

    return HandlerInterceptor.super.preHandle(req, resp, handle);
  }
}