<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--css-->
<link rel="stylesheet" href="/static/css/write.css">

<c:set var="pageTitle" value="상품등록"/>
<%@ include file="../common/header.jspf"%>
<div class="write-wrapper mt-5">
  <div class="con px-3">
    <form class="table-box-type-1" name="frm" method="POST" modelAttribute="Product" enctype="multipart/form-data" action="../product/doWrite">
      <table border="1" class="mx-auto">
        <colgroup>
          <col width="200"/>
        </colgroup>
        <tbody>
        <tr>
          <th>작성자</th>
          <td>
            <strong>${rq.loginedMember.nickname}</strong>
          </td>
        </tr>
        <tr>
          <th>게시판</th>
          <td>
            <select class="select selected-boarded" name="category_id" >
              <option selected disabled>카테고리를 선택해주세요.</option>
              <option value="1">man->코트/자켓</option>
              <option value="2">man-> 니트</option>
              <option value="3">man-> 스니커즈</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>브랜드이름</th>
          <td>
            <input required="required" id="brandName" name="brandName" class="input input-bordered w-96 max-w-xs" type="text" placeholder="브랜드이름을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>상품 이름</th>
          <td>
            <input required="required" id="productName" name="productName" class="input input-bordered w-96 max-w-xs" type="text" placeholder="상품 이름을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>상품 사진</th>
          <td>
            <input type="file" id="image" name="image" multiple="multiple"/>
          </td>
        </tr>
        <tr>
          <th>가격</th>
          <td>
            <input required="required" id="price" name="price" class="input input-bordered w-96 max-w-xs" type="text" placeholder="가격을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>색깔</th>
          <td>
            <input required="required" id="color" name="color" class="input input-bordered w-96 max-w-xs" type="text" placeholder="색깔을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>사이즈</th>
          <td>
            <input required="required" id="size" name="size" class="input input-bordered w-96 max-w-xs" type="text" placeholder="사이즈을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>수량</th>
          <td>
            <input required="required" id="productCount" name="productCount" class="input input-bordered w-96 max-w-xs" type="text" placeholder="수량을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>할인율</th>
          <td>
            <input required="required" id="discount" name="discount" class="input input-bordered w-96 max-w-xs" type="text" placeholder="할인율을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>판매자이름</th>
          <td>
            <input required="required" id="sellerName" name="sellerName" class="input input-bordered w-96 max-w-xs" type="text" placeholder="판매자이름을 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>할부</th>
          <td>
            <input required="required" id="installment" name="installment" class="input input-bordered w-96 max-w-xs" type="text" placeholder="할부를 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>배송정보</th>
          <td>
            <input required="required" id="delivery" name="delivery" class="input input-bordered w-96 max-w-xs" type="text" placeholder="배송정보를 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>원산지</th>
          <td>
            <input required="required" id="origin" name="origin" class="input input-bordered w-96 max-w-xs" type="text" placeholder="원산지를 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>출고지</th>
          <td>
            <input required="required" id="shippingPlace" name="shippingPlace" class="input input-bordered w-96 max-w-xs" type="text" placeholder="출고지를 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>판매형태</th>
          <td>
            <input required="required" id="sellType" name="sellType" class="input input-bordered w-96 max-w-xs" type="text" placeholder="판매형태를 입력해주세요."/>
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea required="required"  id="description" name="description" style="width: 600px" rows="10" cols="10" placeholder="내용을 입력해주세요"></textarea>
          </td>
        </tr>
        <tr>
          <th>등록</th>
          <td>
            <input type="button" id="save" class="btn btn-outline btn-success" value="작성">
            <button type="button" class="btn btn-outline btn-info" onclick="history.back();">뒤로가기</button>
          </td>
        </tr>
        </tbody>
      </table>
    </form>
  </div>
</div>
<%@ include file="../common/footer.jspf"%>

<script id="smartEditor2" type="text/javascript">
  var oEditors = [];
  nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "description",  //textarea ID 입력
      sSkinURI: "/smarteditor2/SmartEditor2Skin.html",  //SmartEditor2Skin.html 경로 입력
      fCreator: "createSEditor2",
      htParams : {
        // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseToolbar : true,
    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
    bUseVerticalResizer : false,
    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
    bUseModeChanger : false
      }
  });

  $(document).ready(function(){
  var frm = document.frm;
  $('#save').click(function(){
  var brandName = $('#brandName').val();
    var productName = $('#productName').val();
    var price = $('#price').val();
    var color = $('#color').val();
    var size = $('#size').val();
    var productCount = $('#productCount').val();
    var discount = $('#discount').val();
    var sellerName = $('#sellerName').val();
    var installment = $('#installment').val();
    var delivery = $('#delivery').val();
    var origin = $('#origin').val();
    var shippingPlace = $('#shippingPlace').val();
    var sellType = $('#sellType').val();
    var description = $('#description').val();


      // 브랜드이름 공백 확인
      if (brandName == "" || brandName == null) {
          alert('브랜드 이름을 입력해주세요.');
          $('#brandName').focus();
          return false;
      }

      // 상품이름 공백 확인
      if (productName == "" || productName == null) {
          alert('상품이름을 입력해주세요.');
          $('#productName').focus();
          return false;
      }

      // 가격 공백 체크
      if (price == "" || price == null) {
          alert('가격을 입력해주세요.');
          $('#price').focus();
          return false;
      }

      if (color == "" || color == null) {
          alert('색깔을 입력해주세요.');
          $('#color').focus();
          return false;
      }

      if (size == "" || size == null) {
          alert('사이즈를 입력해주세요.');
          $('#size').focus();
          return false;
      }

      if (productCount == "" || productCount == null) {
          alert('수량을 입력해주세요.');
          $('#productCount').focus();
          return false;
      }

      if (discount == "" || discount == null) {
          alert('할인율을 입력해주세요.');
          $('#discount').focus();
          return false;
      }

      if (sellerName == "" || sellerName == null) {
          alert('판매자를 입력해주세요.');
          $('#sellerName').focus();
          return false;
      }

      if (installment == "" || installment == null) {
          alert('할부를 입력해주세요.');
          $('#installment').focus();
          return false;
      }

      if (delivery == "" || delivery == null) {
          alert('배송정보를 입력해주세요.');
          $('#delivery').focus();
          return false;
      }

      if (origin == "" || origin == null) {
          alert('원산지를 입력해주세요.');
          $('#origin').focus();
          return false;
      }

      if (shippingPlace == "" || shippingPlace == null) {
          alert('출고지를 입력해주세요.');
          $('#shippingPlace').focus();
          return false;
      }

      if (sellType == "" || sellType == null) {
          alert('판매형태를 입력해주세요.');
          $('#sellType').focus();
          return false;
      }

  oEditors.getById["description"].exec("UPDATE_CONTENTS_FIELD", []);
		frm.submit();
  });
 });
</script>
