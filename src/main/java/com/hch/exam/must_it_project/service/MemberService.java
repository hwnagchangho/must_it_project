package com.hch.exam.must_it_project.service;

import com.hch.exam.must_it_project.repository.MemberRepository;
import com.hch.exam.must_it_project.vo.Member;
import com.hch.exam.must_it_project.vo.ResultData;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

  private MemberRepository memberRepository;

  public MemberService(MemberRepository memberRepository) {
    this.memberRepository = memberRepository;
  }

  public Member getMemberByLoginId(String loginId) {
    return memberRepository.getMemberByLoginId(loginId);
  }

  public int getMemberByCheck(String loginId, String loginPw) {
    return memberRepository.getMemberByCheck(loginId, loginPw);
  }

  public Member getMemberById(int id) {
    return memberRepository.getMemberById(id);
  }

  public ResultData join(String loginId, String loginPw, String name, String nickname, String cellphoneNo,
                                  String sample4_postcode, String sample4_roadAddress, String sample4_detailAddress, String email) {

    memberRepository.join(loginId, loginPw, name, nickname, cellphoneNo, sample4_postcode,
        sample4_roadAddress, sample4_detailAddress, email);
    int id = memberRepository.getLastInsertId(); //마지막 auto_increment 값을 가져온다.

    return ResultData.from("S-1", "회원 가입이 완료 되었습니다.", "id", id);
  }

  public Member getCheckNicknameAndEmail(String nickname, String email) {
    return memberRepository.getCheckNicknameAndEmail(nickname, email);
  }

  public int getMemberIdCheck(String loginId) {
    return memberRepository.getMemberIdCheck(loginId);
  }

  public int getMemberNickCheck(String nickname) {
    return memberRepository.getMemberNickCheck(nickname);
  }

  public Member getForMember() {
    return memberRepository.getForMember();
  }

  public void modifyInfo(int id, String nickname, String cellphoneNo, String email) {
    memberRepository.modifyInfo(id, nickname, cellphoneNo, email);
  }

}
