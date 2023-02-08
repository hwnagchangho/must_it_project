<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/static/css/detail.css">
<link rel="stylesheet" href="/static/css/common.css">

<c:set var="pageTitle" value="상품세부사항"/>
<%@ include file="../common/header.jspf"%>
<div class="con">
  <c:if test="${rq.isLogined() && rq.loginedMemberId == 1}">
    <button type="button" class="btn btn" onclick="location.href='../product/doDelete?id=${product.id}&category_id=${product.category_id}'">상품 삭제하기</button>
  </c:if>
</div>
<div class="con product-detail">
  <div class="flex mt-10">
    <div class="product-detail__picture">
        <img src="/static/image/${product.image}" />
    </div>
    <div class="product-detail__body">
      <div class="detail">
        <span class="item_brand">
          ${product.brandName}
        </span>
        <p>${product.productName}</p>
        <span class="item_price_box">
          <strong>할인가</strong>
          <span class="price">${product.price}</span>
          <span class="discount">${product.discount}%</span>
        </span>
        <hr>
        <span class="item-seller flex flex-col">
          <span>
            <strong>무이자할부</strong>
            <span class="installment">${product.installment}</span>
          </span>
          <span>
            <strong>배송정보</strong>
            <span class="delivery">${product.delivery}</span>
          </span>
          <span>
            <strong>판매자</strong>
            <span class="sellerName">${product.sellerName}</span>
          </span>
        </span>
        <hr>
        <span class="order-select">
          <strong>주문선택사항</strong>
          <select class="select selected-boarded">
            <option selected disabled>옵션을 선택해주세요.</option>
            <option>${product.color} / ${product.size}</option>
          </select>
        </span>
        <hr>
        <span class="order" style="display:block; text-align:center;">
          <input type="button" value="장바구니담기" class="btn btn-wide" id="btnAddCart" name="btnAddCart" label="장바구니">
        </span>
      </div>
    </div>
  </div>
  <table class="table-box-type-1">
    <colgroup>
      <col width="180">
      <col width="360">
      <col width="180">
      <col width="360">
    </colgroup>
    <tbody>
    <tr>
      <th>상품번호</th>
      <td>
        ${product.id}
      </td>
      <th>판매형태</th>
      <td colspan="3">
        ${product.sellType}
      </td>
    </tr>
    <tr>
      <th>원산지</th>
      <td>${product.origin}</td>
      <th>출고지</th>
      <td>${product.shippingPlace}</td>
    </tr>
    </tbody>
  </table>
  <div class="content flex flex-col items-center">
    ${product.description}
  </div>
</div>

<script>
  $('#btnAddCart').click(function (){
  var userId = ${rq.loginedMember.id};
  var productId = ${product.id};
    $.ajax({
      url:'../cart/doAddProduct',
      type:'post',
      data : {"userId" : userId, "productId" : productId},
      success : function(cnt){
						if(cnt == 1){
							if(confirm('장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?') == false){
							  return false;
							}else{
							  location.href="/usr/cart/list?userId="+ userId;
							}
						}else{
							alert('이미 추가된 상품입니다.');
						}
					},
    });
  });
</script>

<!-- 리뷰 관련폼-->
<script>
// 리뷰 작성 관련
  let ReviewWrite__submitFormDone = false;

  function ReviewWrite__submitForm(form){
    if( ReviewWrite__submitFormDone ) {
      return;
     }

    // 좌우공백 제거
    form.body.value = form.body.value.trim();

    if(  form.body.value.length == 0 ) {
      alert('리뷰를 입력해주세요.');
      form.body.focus //내용으로 커서이동됌
      return;
    }

    if( form.body.value.length < 2 ){
      alert('내용을 2자 이상 입력해주세요.');
      form.body.focus //내용으로 커서이동됌
      return;
    }

    ReviewWrite__submitFormDone = true;
    form.submit(); //발송
  }
</script>

<section class="mt-5">
  <div class="con px-3">
    <h1>리뷰 작성</h1>
    <c:if test="${rq.logined}">
      <form class="table-box-type-1" method="POST" action="../review/doWrite" onsubmit="ReviewWrite__submitForm(this); return false;">
        <input type="hidden" name="relTypeCode" value="product">
        <input type="hidden" name="relId" value="${product.id}">
        <table>
          <colgroup>
            <col width="200"/>
          </colgroup>
          <tbody>
          <tr>
            <th>작성자</th>
            <td>
              ${rq.loginedMember.nickname}
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
              <textarea name="body" class="textarea textarea-bordered w-full" rows="5" placeholder="내용을 입력해주세요."></textarea>
            </td>
          </tr>
          </tbody>
        </table>
        <div class="flex justify-end my-3">
          <input type="submit" class="btn btn-outline btn-success" value="리뷰작성">
        </div>
      </form>
    </c:if>
    <c:if test="${rq.notLogined}">
      <a class="link link-primary" href="/usr/member/login">로그인</a> 후 이용해주세요.
    </c:if>
  </div>
</section>

<section class="mt-5 con-min-width">
  <div class="con mx-auto px-3">
    <h1>리뷰 개수(${reviews.size()})</h1>
    <div class="review-list mt-3">
      <c:forEach var="review" items="${reviews}">
        <div class="review-list__head">
          <div class="flex flex-col">
            <span class="font-bold">${review.extra__writerName}</span>
            <span>작성날짜 : ${review.forPrintType2RegDate}</span>
            <span>수정날짜 : ${review.forPrintType2UpdateDate}</span>
            <div class="flex">
              <div class="modifyAndDelete-btn ml-auto text-gray-400">
                <c:if test="${review.extra__actorCanModify}">
                  <a href="../review/modify?id=${review.id}">수정</a>
                </c:if>
                <c:if test="${review.extra__actorCanDelete}">
                  <a  onclick="if( confirm('정말 삭제하시겠습니까?') == false ) return false" href="../review/doDelete?id=${review.id}">삭제</a>
                </c:if>
              </div>
            </div>
          </div>
        </div>
        <div class="review-list__body border-b border-gray-300 my-3">
          <div class="flex items-center my-3">
            <span>${review.forPrintBody}</span>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>
<%@ include file="../common/footer.jspf"%>
