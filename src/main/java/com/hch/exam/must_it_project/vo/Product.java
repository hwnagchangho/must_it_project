package com.hch.exam.must_it_project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
  private int id;
  private String regDate;
  private String updateDate;
  private String brandName;
  private String productName;
  private String price;
  private MultipartFile image;
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