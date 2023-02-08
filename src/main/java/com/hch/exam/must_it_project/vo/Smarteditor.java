package com.hch.exam.must_it_project.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class Smarteditor {
  private MultipartFile filedata;
  private String callback;
  private String callback_func;
}
