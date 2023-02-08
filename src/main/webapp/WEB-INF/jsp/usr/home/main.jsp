<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/static/css/main.css">
<script src="/static/js/main.js" defer></script>

<c:set var="pageTitle" value="머스트잇(MUSTIT)" />
<%@ include file="../common/header.jspf"%>

<!--info-menu-box 시작-->
<div class="info-menu-box con flex">
<!--  빅 배너  시작-->
  <div class="big-banner">
    <div class="swiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <a href="/etc/selling_event_view/1950?click=mainBigBanner">
            <img src="https://image.mustit.co.kr/lib/upload/banner/0c21de6dd3963643454aa7da4282355f.jpeg" alt="빅배너">
          </a>
        </div>
        <div class="swiper-slide">
          <a href="/etc/selling_event_view/1949?click=mainBigBanner">
            <img src="https://image.mustit.co.kr/lib/upload/banner/d0a367c06d6feffb55f830bbcf9ddc7d.jpeg" alt="빅배너">
          </a>
        </div>
        <div class="swiper-slide">
          <a href="/etc/selling_event_view/1956?click=mainBigBanner" >
            <img src="https://image.mustit.co.kr/lib/upload/banner/768174f50dae8e64fad6694cf2a6430e.jpeg" alt="빅배너">
          </a>
        </div>
        <div class="swiper-slide">
          <a href="/etc/selling_event_view/1954?click=mainBigBanner">
            <img src="https://image.mustit.co.kr/lib/upload/banner/ba09483f11570572357f86557042d4dc.jpeg" alt="빅배너">
          </a>
        </div>
        <div class="swiper-slide">
          <a href="/etc/selling_event_view/1947?click=mainBigBanner">
            <img src="https://image.mustit.co.kr/lib/upload/banner/be169ce79c9568b7576109afa457742a.jpeg" alt="빅배너">
          </a>
        </div>
      </div>
      <div class="big-banner__btn-group">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
  </div>
  <!--  빅 배너  끝-->


  <div class="box flex flex-col">
    <!-- 핫 아이템 시작 -->
    <div class="hot-item">
      <div class="hot_title">Hot Item</div>
      <div class="swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="https://image.mustit.co.kr/Spac_Editor/qupload/202212/74538d00461c0b5b37e99eda3aa77fdb.jpeg" alt="핫아이템 이미지">
            <span class="desc_box">
              <span class="item_brand">
                PRADA
              </span>
              <span class="item_txt">시어링 양털 슬리퍼 뮬</span>
              <span class="item_price_box">
                <span class="price">1,444,800</span>
                <span class="discount">9%</span>
              </span>
          </span>
          </div>
          <div class="swiper-slide">
            <img src="https://image.mustit.co.kr/Spac_Editor/qupload/202212/3fe7adf01d610f6c82a6b6b2f328500f.jpeg" alt="핫아이템 이미지">
            <span class="desc_box">
              <span class="item_brand">
                PRADA
              </span>
              <span class="item_txt">삼각로고 사피아노 키링 블랙</span>
              <span class="item_price_box">
                <span class="price">262,000</span>
                <span class="discount">52%</span>
              </span>
          </span>
          </div>
          <div class="swiper-slide">
            <img src="https://image.mustit.co.kr/Spac_Editor/qupload/202212/5ad167baf669810d66bbba080336ca65.jpeg" alt="핫아이템 이미지">
            <span class="desc_box">
              <span class="item_brand">
                Maison Margiela
              </span>
              <span class="item_txt">블랙 타비 캔버스 스니커즈</span>
              <span class="item_price_box">
                <span class="price">474,000</span>
                <span class="discount">47%</span>
              </span>
          </span>
          </div>
          <div class="swiper-slide">
            <img src="https://image.mustit.co.kr/Spac_Editor/qupload/202212/bf8f4e16a759d857d2d5fb3e4c868e57.jpeg" alt="핫아이템 이미지">
            <span class="desc_box">
              <span class="item_brand">
                G/FORE
              </span>
              <span class="item_txt">G/DRIVE 남성 보아 골프화</span>
              <span class="item_price_box">
                <span class="price">308,400</span>
                <span class="discount">33%</span>
              </span>
          </span>
          </div>
          <div class="swiper-slide">
            <img src="https://image.mustit.co.kr/Spac_Editor/qupload/202212/23ba476dc2c55c52c93d2fc847d63a5b.jpeg" alt="핫아이템 이미지">
            <span class="desc_box">
              <span class="item_brand">
                Maison Margiela
              </span>
              <span class="item_txt">스티치 그레인 레더 카드지갑</span>
              <span class="item_price_box">
                <span class="price">289,000</span>
                <span class="discount">26%</span>
              </span>
          </span>
          </div>
        </div>
        <div class="hot-item__btn-group">
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
    <!-- 핫 아이템 끝 -->

    <!--이벤트시작-->
    <div class="event">
      <a href="https://mustit.co.kr/etc/grand_prize_year?click=mainEventBanner">
        <img src="https://cdn.mustit.co.kr/lib/upload/main_marketing_banner/d22f618fc0f54f4219613297ddae0cc2.png" alt="올해의브랜드대상">
      </a>
    </div>
  </div>
  <!--이벤트끝-->
</div>
<!--  빅 배너  끝-->

<!--info-menu-box 끝-->

<!--베스트메뉴 시작-->
<div class="best-menu-box con">
  <div class="best_title">베스트 리뷰</div>
  <div class="swiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/22/edit/8fdc31be4779880740a223409ff9e757.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          실물이 진짜 이뻐요! 착화감도 좋고 데일리로 자주 신을 거 같아용~ 배송도 빨랐어요!
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/21/b77e0586161ed14b6dfb4e29d329d683.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          배송도 빠르고 포장도 이쁘게 잘해주셨어여!! 물건은 말 안해도 너무 이쁘구여!! 여자친구가 좋아합니다!
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/20/edit/892e2acf73211d7e5e1948c921a49b57.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          여자친구 선물해줬는데 엄청 좋아하네요 제가 봐도 여성분들한테 잘 어울리는 가방인 것 같습니다 ☺️ 배송도 빠르고 구성품도 좋습니다 감사합니다 ❤️
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/20/03f8acadbf308c692e2702ff77ecb7ff.png/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          구하기힘들었는데 ㅠㅠ ㅇㅕ기서찾았네요 배송적당하고 가격 백화점보다 저렴합니다
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/20/4ca2c1feb57c211ce0621461809b399b.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          여자아기인데 초록색 상큼하니 너무 예뻐요 잘샀어요
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/23/6b259fb3aa870352e41173b6b39c36e3.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          로우라이즈 안에 입으려고 샀는데 괜찮아요
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/19/edit/35b03970bb5e0b9609bae982b79c7a13.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          백화점에서 산 것과 구성품이 동일하지는 않아요. 그래도 더스트백과 상자에 안전하게 잘 들어서 왔습니다.
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/18/edit/49fc046c37bc247b9874e2d447ae2f23.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          실물 완죤 이뻐요.쿠션감도있고 발이 편해요. 호ㅏ이트라 옷매칭하기도 편하고 좋습니다
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/17/f47973a77ccfc32f186496eadb7f5afc.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          실물로 보니 사진보다 은색이 더 반짝반짝 영롱하고 이뻐서 기분이 좋네요:)
        </span>
      </div>
      <div class="swiper-slide">
        <a href="/review/list?list_type=other&amp;click=mainBestReview&amp;review_number=944126" class="mi-block">
          <img src="https://image.mustit.co.kr/review/2022/12/21/edit/7795217b77acc4a039086d79447f8656.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
          <span class="mi-block mi-font-black line2 fs13" onclick="window.location.href='/review/list?list_type=other&amp;click=mainBestReview';">
          사이즈 고민 많이 했는데 잘 산것 같아요! 질도 너무 좋고 기다린 보람이 있는 옷.. 유니크해서 더 좋아요
        </span>
        </a>
      </div>
    </div>
  </div>
  <div class="best-menu-box__btn-group">
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
</div>


<!--베스트메뉴 끝-->

<!--MD CHOICE 시작-->
<div class="md-choice-box con">
  <div class="best_title">MD CHOICE</div>
  <div class="swiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/lib/upload/admin/webMdChoice/9b4b4e1c228743eb07eb58be0bf4f0e5.jpeg/_dims_/resize/230" alt="상품이미지">
        <span class="desc_box">
						<span class="item_brand">
							Lemaire
            </span>
						<span class="item_txt">스몰 크루아상 숄더백</span>
            <span class="item_price_box">
              <span class="price">1,248,000</span>
              <span class="discount">34%</span>
            </span>
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/lib/upload/admin/webMdChoice/ade16d794d0beea0fd9525119d5816f6.jpeg/_dims_/resize/230" alt="상품이미지">
        <span class="desc_box">
						<span class="item_brand">
							Ten C
            </span>
						<span class="item_txt">아틱 다운 패딩</span>
            <span class="item_price_box">
              <span class="price">829,200</span>
              <span class="discount">44%</span>
            </span>
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/lib/upload/admin/webMdChoice/238540be84caa485c70f6d457285bb02.jpeg/_dims_/resize/230" alt="상품이미지">
        <span class="desc_box">
						<span class="item_brand">
							Acne Studios
            </span>
						<span class="item_txt">페이스 로고 비니</span>
            <span class="item_price_box">
              <span class="price">186,000</span>
              <span class="discount">15%</span>
            </span>
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/lib/upload/admin/webMdChoice/8527e8eea2adf538fb2c4d4899212294.jpeg/_dims_/resize/230" alt="상품이미지">|
        <span class="desc_box">
						<span class="item_brand">
							Maison Margiela
            </span>
						<span class="item_txt">여성 타비 발레리나 플랫 슈즈</span>
            <span class="item_price_box">
              <span class="price">374,400</span>
              <span class="discount">64%</span>
            </span>
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/review/2022/12/23/6b259fb3aa870352e41173b6b39c36e3.jpeg/_dims_/resize/^250/cropcenter/250x250" alt="리뷰사진">
        <span class="desc_box">
						<span class="item_brand">
							LOEWE
              <img src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon-delivery-airplane-p.svg" alt="해외배송" class="icon_img">
            </span>
						<span class="item_txt">아나그램 패치 머플러</span>
            <span class="item_price_box">
              <span class="price">412,800</span>
              <span class="discount">8%</span>
            </span>
        </span>
      </div>
      <div class="swiper-slide">
        <<img src="https://image.mustit.co.kr/lib/upload/admin/webMdChoice/412255e2cd4acb449dd6de85a034be35.jpeg/_dims_/resize/230" alt="상품이미지">
        <span class="desc_box">
						<span class="item_brand">
							Moncler
              <img src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon-delivery-airplane-p.svg" alt="해외배송" class="icon_img">
            </span>
						<span class="item_txt">오베르 다운 자켓</span>
            <span class="item_price_box">
              <span class="price">1,497,600</span>
              <span class="discount">18%</span>
            </span>
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/lib/upload/admin/webMdChoice/c170818b8730454fbf1ca112306c15ef.jpeg/_dims_/resize/230" alt="상품이미지">
        <span class="desc_box">
						<span class="item_brand">
							Maison Margiela
              <img src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon-delivery-airplane-p.svg" alt="해외배송" class="icon_img">
            </span>
						<span class="item_txt">스티치 체인월럿 블랙</span>
            <span class="item_price_box">
              <span class="price">816,000</span>
              <span class="discount">31%</span>
            </span>
        </span>
      </div>
      <div class="swiper-slide">
        <img src="https://image.mustit.co.kr/lib/upload/admin/webMdChoice/2e6f2d4c1bf30bff27fc6fd15b2a9ac3.jpeg/_dims_/resize/230" alt="상품이미지">
        <span class="desc_box">
						<span class="item_brand">
							AUTRY
              <img src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon-delivery-airplane-p.svg" alt="해외배송" class="icon_img">
            </span>
						<span class="item_txt">메달리스트 화이트탭 스니커즈 남성</span>
            <span class="item_price_box">
              <span class="price">186,700</span>
              <span class="discount">59%</span>
            </span>
        </span>
      </div>
    </div>
  </div>
  <div class="md-choice-box__btn-group">
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
</div>



<!--MD CHOICE 끝-->

<%@ include file="../common/footer.jspf"%>
