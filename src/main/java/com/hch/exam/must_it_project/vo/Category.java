package com.hch.exam.must_it_project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
  private int id;
  private String regDate;
  private String updateDate;
  private String parent_id;
  private String c_name;
}
