<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--css-->
<link rel="stylesheet" href="/static/css/list.css">

<c:set var="pageTitle" value="${category.parent_id}/${category.c_name}"/>
<%@ include file="../common/header.jspf"%>
<div class="product-list">
  <div class="con">
    <div class="product-list__head">
      <div class="flex mt-5 ml-2">
        <strong>${productCnt}</strong>개 상품
        <div class="flex-grow"></div>
        <c:if test="${rq.isLogined() && rq.loginedMemberId == 1}">
          <button type="button" class="btn btn" onclick="location.href='write'">상품 등록하기</button>
        </c:if>
      </div>
    </div>
    <div class="product-list__body flex flex-wrap">
      <c:forEach  var="product" items="${products}">
        <div class="product">
          <a href="../product/detail?id=${product.id}">
            <img src="/static/image/${product.image}" />
          </a>
          <span class="desc_box">
              <span class="item_brand">
                ${product.brandName}
              </span>
              <span class="item_txt">${product.productName}</span>
              <span class="item_price_box mt-5">
                <span class="price">${product.price}</span>
                <span class="discount">${product.discount}%</span>
              </span>
          </span>
        </div>
      </c:forEach>
    </div>

<!-- 페이징 -->
    <div class="page-menu mt-3 flex justify-center">
      <div class="btn-group">
        <c:set var="pageMenuArmLen" value="5"/>
        <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}"/>
        <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}"/>

        <c:set var="pageBaseUri" value="?categoryId=${categoryId}" />

        <c:if test="${startPage > 1}">
          <a class="btn btn-sm" href="${pageBaseUri}&page=1">1</a>
          <c:if test="${startPage > 2}">
            <a href="btn btn-disabled">...</a>
          </c:if>
        </c:if>

        <c:forEach begin="${startPage}" end="${endPage}" var="i">
          <a class="btn btn-sm ${page == i ? 'btn-active' : ''}" href="${pageBaseUri}&page=${i}">${i}</a>
        </c:forEach>

        <c:if test="${endPage < pagesCount}">
          <c:if test="${endPage < pagesCount - 1}">
            <a href="btn btn-disabled">...</a>
          </c:if>
          <a class="btn btn-sm" href="${pageBaseUri}&page=${pagesCount}">${pagesCount}</a>
        </c:if>
      </div>
    </div>
  </div>
</div>
<%@ include file="../common/footer.jspf"%>