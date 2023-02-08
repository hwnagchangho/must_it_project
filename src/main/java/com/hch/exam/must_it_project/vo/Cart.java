package com.hch.exam.must_it_project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
  private int id;
  private String regDate;
  private String updateDate;
  private int userId;
  private int productId;
}
