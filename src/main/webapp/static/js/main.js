//인포메뉴 시작
// 빅배너 시작
    let swiper1 = new Swiper('.info-menu-box > .big-banner > .swiper', {
    loop: true,
    navigation: {
        nextEl: '.big-banner__btn-group > .swiper-button-next',
        prevEl: '.big-banner__btn-group > .swiper-button-prev',
    },
    pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
    },
    autoplay: {
    			delay: 3000, // 넘어가는 시간
    			disableOnInteraction: false,//클릭시 자동멈춤 해제
    },
    effect: 'fade',
});
$('.info-menu-box > .big-banner > .swiper').on('mouseenter', function() {
	swiper1.autoplay.stop();
})

$('.info-menu-box > .big-banner > .swiper').on('mouseleave', function() {
	swiper1.autoplay.start();
})
// 빅배너 끝

//핫아이템 시작

    let swiper2 = new Swiper('.info-menu-box > .box > .hot-item > .swiper', {
    loop: true,
    navigation: {
            nextEl: '.hot-item__btn-group > .swiper-button-next',
            prevEl: '.hot-item__btn-group > .swiper-button-prev',
        },
    pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
        clickable: true,
    },
    autoplay: {
    			delay: 2000, // 넘어가는 시간
    			disableOnInteraction: false//클릭시 자동멈춤 해제
    },
});
$('.info-menu-box > .box > .hot-item > .swiper').on('mouseenter', function() {
	swiper2.autoplay.stop();
})

$('.info-menu-box > .box > .hot-item > .swiper').on('mouseleave', function() {
	swiper2.autoplay.start();
})
//핫아이템 끝


// 인포메뉴 끝

//베스트메뉴 시작
    let swiper3 = new Swiper('.best-menu-box .swiper', {
    slidesPerView: 5,
    spaceBetween: 20,
    slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    loop: true,
    navigation: {
        nextEl: '.best-menu-box__btn-group > .swiper-button-next',
        prevEl: '.best-menu-box__btn-group > .swiper-button-prev',
    },
});


// 베스트메뉴 끝



//MD CHOICE 시작
    let swiper4 = new Swiper('.md-choice-box .swiper', {
    slidesPerView: 4,
    spaceBetween: 20,
    slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    loop: true,
    navigation: {
        nextEl: '.md-choice-box__btn-group > .swiper-button-next',
        prevEl: '.md-choice-box__btn-group > .swiper-button-prev',
    },
});


// MD CHOICE 끝




