<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/static/css/common.css">

<script>
  let ReviewModify__submitDone = false;

  function ReviewModify__submit(form){
    if(ReviewModify__submitDone) {
      return;
    }

    form.body.value = form.body.value.trim();

    if( form.body.value.length == 0 ) {
      alert('내용을 입력해주세요');
      form.body.focus();

      return;
   }

   ReviewModify__submitDone = true;
    form.submit();
  }
</script>

<c:set var="pageTitle" value="리뷰 수정" />
<%@ include file="../common/header.jspf"%>
<section class="con-min-width mt-5">
  <div class="con px-3">
    <form class="table-box-type-1" method="POST" action="../review/doModify" onsubmit="ReviewModify__submit(this); return false;">
      <input type="hidden" name="id" value="${review.id}">
      <table border="1">
        <colgroup>
          <col width="200"/>
        </colgroup>
        <tbody>
        <tr>
          <th>게시물 번호</th>
          <td>
              ${review.relId}
          </td>
        </tr>
        <tr>
          <th>게시물 제목</th>
          <td>
            ${reDataTitle}
          </td>
        </tr>
        <tr>
          <th>리뷰 번호</th>
          <td>
            <div class="badge badge-outline">
              ${review.id}
            </div>
          </td>
        </tr>
        <tr>
          <th>리뷰 작성날짜</th>
          <td>${review.forPrintType2RegDate}</td>
        </tr>
        <tr>
          <th>리뷰 수정날짜</th>
          <td>${review.forPrintType2UpdateDate}</td>
        </tr>
          <th>리뷰 작성자</th>
          <td>${review.extra__writerName}</td>
        </tr>
        <tr>
          <th>리뷰 내용</th>
          <td>
            <textarea name="body" class="textarea textarea-bordered w-full" placeholder="내용을 입력해주세요." rows="5">${review.body}</textarea>
          </td>
        </tr>
        <tr>
          <th>수정</th>
          <td>
            <input type="submit" class="btn btn-outline btn-success" value="수정">
            <button type="button" class="btn btn-outline btn-info" onclick="history.back();">뒤로가기</button>
          </td>
        </tr>
        </tbody>
      </table>
    </form>
  </div>
</section>
<%@ include file="../common/footer.jspf"%>