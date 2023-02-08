package com.hch.exam.must_it_project.repository;

import com.hch.exam.must_it_project.vo.Review;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ReviewRepository {
  @Select("""
          SELECT R.*,
          M.nickname AS extra__writerName
          FROM review AS R
          LEFT JOIN `member` AS M
          ON R.memberId = M.id
          WHERE R.relTypeCode = #{relTypeCode}
          AND R.relId = #{relId}
          ORDER BY R.id DESC
          """)
  List<Review> getForPrintReviews(@Param("relTypeCode") String relTypeCode, @Param("relId") int relId);

  @Select("""
          SELECT R.*,
          M.nickname AS extra__writerName
          FROM review AS R
          LEFT JOIN `member` AS M
          ON R.memberId = M.id
          WHERE R.id = #{id}
          """)
  Review getForPrintReview(@Param("id") int id);

  @Insert("""
          INSERT INTO review 
          SET regDate = NOW(), 
          updateDate = NOW(),
          memberId = #{memberId}, 
          relTypeCode = #{relTypeCode}, 
          relId=#{relId}, 
          body=#{body}
          """)
  void writeReview(@Param("memberId") int memberId,
                    @Param("relTypeCode") String relTypeCode,
                    @Param("relId") int relId, @Param("body") String body);

  @Select("""
          SELECT LAST_INSERT_ID()
          """)
  int getLastInsertId();


  @Delete("""
          DELETE
          FROM review
          WHERE id = #{id}
          """)
  void deleteReview(@Param("id") int id);

  @Update("""
          UPDATE review
          SET updateDate = NOW(),
          `body` = #{body}
          WHERE id = #{id}
          """)
  void modifyReview(@Param("id") int id, @Param("body") String body);
}
