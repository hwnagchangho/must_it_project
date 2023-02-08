package com.hch.exam.must_it_project.repository;

import com.hch.exam.must_it_project.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface FindRepository {

  @Select("""
          SELECT *
          FROM member
          WHERE name = #{name}
          AND email = #{email}
          """)
  Member nameAndEmailCheck(@Param("name") String name, @Param("email") String email);

  @Select("""
          SELECT *
          FROM member
          WHERE loginId = #{loginId}
          AND name = #{name}
          """)
  Member loginIdAndNameCheck(@Param("loginId") String loginId, @Param("name") String name);
  @Update("""
          UPDATE member
          SET updateDate=NOW(),
          loginPw = #{loginPw}
          WHERE id = #{id}
          """)
  void setPwUpdate(@Param("id") int id, @Param("loginPw") String loginPw);
}
