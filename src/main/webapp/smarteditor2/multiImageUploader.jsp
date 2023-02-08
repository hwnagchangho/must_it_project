<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
  //파일정보
  String fileInfo = "";
  //파일명을 받는다 - 일반 원본파일명
  String fileName = request.getHeader("file-name");
  //파일 확장자, 확장자를 소문자로 변경
  String fileName_suffix = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();

  //이미지 검증 배열변수
  String[] suffixArr = {"jpg","png","bmp","gif","jpeg"};

  //확장자 체크
  int cnt = 0;
  for(int i=0; i < suffixArr.length; i++) {
    if(fileName_suffix.equals(suffixArr[i])){
      cnt++;
    }
  }

  //이미지가 아니라면
  if(cnt == 0) {
    out.println("NOTALLOW_" + fileName);
  } else {
    //디렉토리 설정 및 업로드

    //파일경로
    String defaultPath = request.getSession().getServletContext().getRealPath("/");
    String filePath = defaultPath + "img" + File.separator + "smarteditor2" + File.separator;
    File file = new File(filePath);

    if(!file.exists()) {
      file.mkdirs();
    }

    String autoFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
    String rFileName = filePath + autoFileName;

    ///////////////// 서버에 파일쓰기 /////////////////
    InputStream is = request.getInputStream();
    OutputStream os = new FileOutputStream(rFileName);

    int num;
    byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
    while((num = is.read(b,0,b.length)) != -1){
      os.write(b,0,num);
    }
    if(is != null) {
      is.close();
    }
    os.flush();
    os.close();

    ///////////////// 이미지 /////////////////
    // 정보 출력
    fileInfo += "&bNewLine=true";
    // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
    fileInfo += "&sFileName="+ fileName;
    fileInfo += "&sFileURL=/img/smarteditor2/" + autoFileName;
    out.print(fileInfo);
  }
%>