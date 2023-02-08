package com.hch.exam.must_it_project.controller;

import com.hch.exam.must_it_project.vo.Smarteditor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

@Controller
public class smartImageController {
  @RequestMapping(value="/singleImageUploader.do")
  public String smarteditorMultiImageUpload(HttpServletRequest req, Smarteditor smarteditor) throws  UnsupportedEncodingException{
      String callback = smarteditor.getCallback();
      String callback_func = smarteditor.getCallback_func();
      String file_result = "";
      String result = "";
      MultipartFile multiFile = smarteditor.getFiledata();

      try{
        if(multiFile != null && multiFile.getSize() > 0 && StringUtils.isNotBlank(multiFile.getName())){
          if(multiFile.getContentType().toLowerCase().startsWith("image/")){
            String oriName = multiFile.getName();
            String uploadPath = req.getServletContext().getRealPath("/img");
            String path = uploadPath + "/smarteditor";

            File file = new File(path);
            if(!file.exists()){
              file.mkdirs();
            }

            String fileName = UUID.randomUUID().toString();
            smarteditor.getFiledata().transferTo(new File(path + fileName));
            file_result += "&bNewLine=true&sFileName=" + oriName + "&sFileURL=/img/smarteditor/" + fileName;
          } else {
            file_result += "&errstr=error";
          }
        } else {
          file_result += "&errstr=error";
        }
      }catch (Exception e){
        e.printStackTrace();
      }
      result = "redirect:" + callback + "?callback_func=" + URLEncoder.encode(callback_func, "UTF-8") + file_result;

      return result;

  }
}
