package com.hch.exam.must_it_project.repository;

import com.hch.exam.must_it_project.vo.Category;
import com.hch.exam.must_it_project.vo.Product;
import com.hch.exam.must_it_project.vo.ProductCom;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ProductRepository {

  @Select("""
          <script>
          SELECT P.*
          FROM product AS P
          LEFT JOIN category AS C
          ON P.category_id = C.id
          WHERE C.id=#{id}
          <if test="limitTake != -1">
            LIMIT #{limitStart}, #{limitTake}
          </if>
          </script> 
          """)
  List<ProductCom> getForPrintProducts(@Param("id") int id, @Param("limitStart") int limitStart, @Param("limitTake") int limitTake);

  @Select("""
          SELECT *
          FROM category
          WHERE id = #{id}
          """)
  Category getForPrintCategory(@Param("id") int id);

  @Select("""
          SELECT COUNT(*)
          FROM product AS P
          LEFT JOIN category AS C
          ON P.category_id = C.id
          WHERE C.id=#{id}
          """)
  int getProductCount(@Param("id") int id);

@Insert("""
          INSERT INTO product
          SET regDate = NOW(),
          updateDate = NOW(),
          brandName = #{dto.brandName},
          productName = #{dto.productName},
          price = #{dto.price},
          image = #{dto.image},
          color = #{dto.color},
          size = #{dto.size},
          productCount = #{dto.productCount},
          discount = #{dto.discount},
          category_id = #{dto.category_id},
          description = #{dto.description},
          sellerName = #{dto.sellerName},
          installment = #{dto.installment},
          delivery = #{dto.delivery},
          origin = #{dto.origin},
          shippingPlace = #{dto.shippingPlace},
          sellType = #{dto.sellType}
          """)
  void writeProduct(@Param("dto") ProductCom dto);
  @Select("""
          SELECT LAST_INSERT_ID()
          """)
  int getLastInsertId();

  @Select("""
          SELECT *
          FROM product
          WHERE id = #{id}
          """)
  ProductCom getForPrintProduct(@Param("id") int id);

  @Delete("""
          DELETE
          FROM product
          WHERE id = #{id}
          """)
  void deleteProduct(@Param("id") int id);

  @Select("""
          SELECT *
          FROM product
          WHERE id = #{id}
          """)
  Product getProduct(@Param("id") int id);
}
