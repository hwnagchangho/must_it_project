#아이디생성
GRANT ALL PRIVILEGES ON *.* TO hwangchangho IDENTIFIED BY 'dhtwo19843!';

DROP DATABASE IF EXISTS ch_app_2022_12_15;
CREATE DATABASE ch_app_2022_12_15;
USE ch_app_2022_12_15;


#회원 테이블 생성

 CREATE TABLE `member`(
 	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 	regDate DATETIME NOT NULL,
 	updateDate DATETIME NOT NULL,
 	loginId CHAR(20) NOT NULL,
 	loginPw CHAR(80) NOT NULL,
 	`authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한레벨(3=일반, 7=관리자)',
 	`name` CHAR(20) NOT NULL,
 	nickName CHAR(20) NOT NULL,
 	cellphoneNo CHAR(20) NOT NULL,
 	sample4_postcode CHAR(20) NOT NULL,
 	sample4_roadAddress CHAR(20) NOT NULL,
 	sample4_detailAddress CHAR(20) NOT NULL,
 	email CHAR(20) NOT NULL,
 	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴전, 1=탈퇴)',
 	delDate DATETIME COMMENT '탈퇴날짜'
 );

# 회원 테스트 데이터 생성(관리자)
INSERT INTO `member`
SET regdate = NOW(),
updateDate = NOW(),
loginId = "admin",
loginPw = "admin",
`authLevel` = 7,
`name` = "황창호",
nickname = "관리자",
cellphoneNo = "010-4828-1573",
email = "chang2210@naver.com";

# 회원 테스트 데이터 생성(일반 회원)
INSERT INTO `member`
SET regdate = NOW(),
updateDate = NOW(),
loginId = "user1",
loginPw = "user1",
`name` = "홍길동",
nickname = "user1",
cellphoneNo = "010-1111-2222",
email = "33333@naver.com";

INSERT INTO `member`
SET regdate = NOW(),
updateDate = NOW(),
loginId = "user2",
loginPw = "user2",
`name` = "홍길순",
nickname = "user2",
cellphoneNo = "010-4444-5555",
email = "6666@naver.com";

SELECT * FROM MEMBER;
DESCRIBE MEMBER;

#카테고리 테이블 생성
CREATE TABLE category(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	parent_id CHAR(50) NOT NULL COMMENT'women=여성, man=남성, kids=어린이, life=생활',
	c_name  CHAR(20) NOT NULL
);

INSERT INTO category
SET regDate = NOW(),
updateDate = NOW(),
parent_id = 'man',
c_name = '코트/자켓';

INSERT INTO category
SET regDate = NOW(),
updateDate = NOW(),
parent_id = 'man',
c_name = '니트';

INSERT INTO category
SET regDate = NOW(),
updateDate = NOW(),
parent_id = 'man',
c_name = '스니커즈';


#상품게시물 테이블 생성
CREATE TABLE product(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	brandName CHAR(20) NOT NULL,
	productName CHAR(100) NOT NULL,
	price CHAR(20) NOT NULL,
	image CHAR(200) NOT NULL,
	color VARCHAR(200) NOT NULL,
	size VARCHAR(200) NOT NULL,
	productCount INT(10) NOT NULL,
	discount INT(10) NOT NULL,
	category_id INT(10) NOT NULL,
	sellerName CHAR(20) NOT NULL,
	installment CHAR(50) NOT NULL,
	delivery CHAR(50) NOT NULL,
	origin CHAR(10) NOT NULL,
	shippingPlace CHAR(20) NOT NULL,
	sellType CHAR(20) NOT NULL,
	`description` TEXT NOT NULL
);

# 댓글 테이블
CREATE TABLE review (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	memberId INT(10) UNSIGNED NOT NULL,
	relTypeCode CHAR(30) NOT NULL COMMENT '관련데이터타입코드',
	relId INT(10) UNSIGNED NOT NULL COMMENT '관련데이터번호',
	`body` TEXT NOT NULL
);

#장바구니 테이블 생성
CREATE TABLE cart (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	userId INT(10) UNSIGNED NOT NULL,
	productId INT(10) UNSIGNED NOT NULL
);