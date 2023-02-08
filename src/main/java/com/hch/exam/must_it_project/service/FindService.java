package com.hch.exam.must_it_project.service;

import com.hch.exam.must_it_project.repository.FindRepository;
import com.hch.exam.must_it_project.vo.Member;
import org.springframework.stereotype.Service;

@Service
public class FindService {
  private FindRepository findRepository;

  public FindService(FindRepository findRepository) {
    this.findRepository = findRepository;
  }


  public Member nameAndEmailCheck(String name, String email) {
    return findRepository.nameAndEmailCheck(name, email);
  }

  public Member loginIdAndNameCheck(String loginId, String name) {
    return findRepository.loginIdAndNameCheck(loginId, name);
  }

  public void setPwUpdate(int id, String loginPw) {
    findRepository.setPwUpdate(id, loginPw);
  }
}
