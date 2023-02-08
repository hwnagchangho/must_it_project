<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="pageTitle" value="${board.name} 게시물 리스트" />
<%@ include file="../common/header.jspf"%>
<section class="con-min-width mt-5">
  <div class="con px-3">
    <div class="table-box-type-1">
      <table class="table table-fixed">
        <colgroup>
          <col width="150"/>
          <col width="150"/>
          <col width="500"/>
          <col width="100"/>
          <col width="60"/>
          <col />
        </colgroup>
        <thead>
        <tr>
          <th>사진</th>
          <th>브랜드이름</th>
          <th>상품이름</th>
          <th>가격</th>
          <th>배송비</th>
          <th>비고</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach  var="product" items="${products}">
          <tr>
            <th><img src="/static/image/${product.image}" /></th>
            <th>${product.brandName}</th>
            <th>${product.productName}</th>
            <th>${product.price}</th>
            <th>무료</th>
            <th><button onclick="deleteList(${product.id})">삭제</button></th>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
</section>
<%@ include file="../common/footer.jspf"%>

<script>
  function deleteList(id){
    $.ajax({
      url: '../cart/doDelete',
      type: 'post',
      data: {"id" : id},
      success : function(){
        location.reload();
      }
    });
  }
</script>
