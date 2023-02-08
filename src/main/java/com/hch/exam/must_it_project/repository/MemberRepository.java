package com.hch.exam.must_it_project.repository;

import com.hch.exam.must_it_project.vo.Member;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MemberRepository {

  @Select("""
          SELECT *
          FROM member
          WHERE loginId = #{loginId}
          """)
  Member getMemberByLoginId(@Param("loginId") String loginId);

  @Select("""
          SELECT *
          FROM member
          WHERE id = #{id}
          """)
  Member getMemberById(@Param("id") int id);

  @Insert("""
          INSERT into member
          SET regDate = NOW(),
          updateDate = NOW(),
          loginId = #{loginId},
          loginPw = #{loginPw},
          name = #{name},
          nickname = #{nickname},
          cellphoneNo = #{cellphoneNo},
          sample4_postcode = #{sample4_postcode},
          sample4_roadAddress = #{sample4_roadAddress},
          sample4_detailAddress = #{sample4_detailAddress},
          email = #{email}
          """)
  public void join(@Param("loginId") String loginId, @Param("loginPw")String loginPw,
            @Param("name") String name, @Param("nickname") String nickname,
            @Param("cellphoneNo") String cellphoneNo, @Param("sample4_postcode") String sample4_postcode,
            @Param("sample4_roadAddress") String sample4_roadAddress, @Param("sample4_detailAddress") String sample4_detailAddress, @Param("email") String email);

  @Select("""
          SELECT *
          FROM member
          WHERE nickname = #{nickname}
          AND email = #{email}
          """)
  Member getCheckNicknameAndEmail(@Param("nickname") String nickname, @Param("email") String email);

  @Select("""
          SELECT LAST_INSERT_ID()
          """)
  int getLastInsertId();

//  유효성검사

  @Select("""
          SELECT count(*)
          FROM member
          WHERE loginId = #{loginId}
          AND loginPW = #{loginPw}
          """)
  public int getMemberByCheck(@Param("loginId") String loginId, @Param("loginPw") String loginPw);

  @Select("""
          SELECT count(*)
          FROM member
          WHERE loginId = #{loginId}
          """)
  int getMemberIdCheck(@Param("loginId") String loginId);
  @Select("""
          SELECT count(*)
          FROM member
          WHERE nickname = #{nickname}
          """)
  int getMemberNickCheck(@Param("nickname") String nickname);

  @Select("""
          SELECT *
          FROM member
          """)
  Member getForMember();

  @Update("""
          UPDATE member
          SET nickname = #{nickname},
          cellphoneNo = #{cellphoneNo},
          email = #{email}
          WHERE id = #{id}
          """)
  void modifyInfo(@Param("id") int id, @Param("nickname") String nickname, @Param("cellphoneNo") String cellphoneNo, @Param("email") String email);

}
