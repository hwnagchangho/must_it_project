package com.hch.exam.must_it_project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductCom {
  private int id;
  private String regDate;
  private String updateDate;
  private String brandName;
  private String productName;
  private String price;
  private String image;
  private String color;
  private String size;
  private int productCount;
  private int discount;
  private int category_id;
  private String description;
  private String sellerName;
  private String installment;
  private String delivery;
  private String origin;
  private String shippingPlace;
  private String sellType;
}