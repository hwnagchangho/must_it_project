package com.hch.exam.must_it_project.repository;

import com.hch.exam.must_it_project.vo.Cart;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CartRepository {

  @Insert("""
          INSERT INTO cart
          SET regDate = NOW(),
          updateDate = NOW(),
          userId = #{userId},
          productId = #{productId}
          """)
  void doAddProduct(@Param("userId") int userId, @Param("productId") int productId);

  @Select("""
          SELECT LAST_INSERT_ID()
          """)
  int getLastInsertId();

  @Select("""
          SELECT * 
          FROM cart
          WHERE userId = #{userId}
          AND productId = #{productId}
          """)
  Cart getForPrintCart(@Param("userId") int userId, @Param("productId")int productId);

  @Select("""
          SELECT *
          FROM cart
          WHERE userId = #{userId}
          """)
  List<Cart> getForPrintCarts(@Param("userId") int userId);

  @Delete("""
          DELETE 
          FROM cart
          WHERE productId = #{productId}
          """)
  void deleteProduct(@Param("productId") int productId);
}
