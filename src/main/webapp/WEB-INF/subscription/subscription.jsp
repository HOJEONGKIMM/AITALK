<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!-- 로그인한 계정정보 -->
<c:set var="user"
	value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth"
	value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>구독 서비스</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="${cpath}/resources/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${cpath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/slicknav.css">
<link rel="stylesheet" href="${cpath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/hamburgers.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${cpath}/resources/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/themify-icons.css">
<link rel="stylesheet" href="${cpath}/resources/css/slick.css">
<link rel="stylesheet" href="${cpath}/resources/css/nice-select.css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<link rel="stylesheet" href="${cpath}/resources/css/responsive.css">

<style>
.subscription-service {
	padding: 40px 0;
}

.subscription-option {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	margin-bottom: 20px;
	text-align: center;
	background-color: #f9f9f9;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.subscription-option h3 {
	font-size: 24px;
	margin-bottom: 15px;
}

.subscription-option p {
	font-size: 16px;
	margin-bottom: 20px;
}

.price {
	font-size: 20px;
	font-weight: bold;
	display: block;
	margin-bottom: 20px;
}

.subscription-option button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.subscription-option button:hover {
	background-color: #0056b3;
}

.original-price {
	text-decoration: line-through;
	color: #777;
	margin-right: 10px;
}

.discounted-price {
	color: #d9534f;
	font-weight: bold;
}
</style>
</head>
<body>
	<!--? Preloader Start -->
	<div id="preloader-active"></div>
	<!-- Preloader Start -->
	<%@ include file="../header.jsp"%>
	<main style="background-color: #f8f9fa;">
		<!--? slider Area Start-->
		<section class="slider-area slider-area2">
			<div class="slider-active">
				<!-- Single Slider -->
				<div class="single-slider slider-height2">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-11 col-md-12">
								<div class="hero__caption hero__caption2">
									<h1 data-animation="bounceIn" data-delay="0.2s">구독 서비스</h1>
									<!-- breadcrumb Start-->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="${cpath}">Home</a></li>
											<li class="breadcrumb-item"><a href="#">Blog</a></li>
										</ol>
									</nav>
									<!-- breadcrumb End -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="subscription-service">
			<div class="container">
				<div class="row">
					<!-- 1개월 구독 -->
					<div class="col-md-6">
						<div class="subscription-option">
							<h3>1개월 구독 서비스</h3>
							<h6><img class="rounded" style="margin-bottom: 10px;" src="${cpath}/resources/img/icon/icon.png"><span> AI 1:1대화, 오늘의 퀴즈, 테마 및 주제학습 서비스 제공</span></h6>
							<p>1개월 기간 동안 서비스를 이용하고 싶은 사용자를 위한 옵션입니다.</p>
							<span class="price">가격: 10,000원</span>
							<button onclick="requestPay('1개월 구독 서비스', '10000')">결제하기</button>
						</div>
					</div>
					<!-- 12개월 구독 -->
					<div class="col-md-6">
						<div class="subscription-option">
							<h3>12개월 구독 할인 서비스<span style="height: 22px;" class="badge badge-danger">Hit</span></h3>
							<h6><img class="rounded" style="margin-bottom: 10px;" src="${cpath}/resources/img/icon/icon.png"><span> AI 1:1대화, 오늘의 퀴즈, 테마 및 주제학습 서비스 제공</span></h6>
							<p>12개월 기간 동안 서비스를 이용하고 싶은 사용자를 위한 옵션입니다.</p>
							<div class="price">
								<span>가격: </span><span class="original-price">120,000원</span><span
									class="discounted-price">60,000원</span><img src="${cpath}/resources/img/icon/50.png">
							</div>
							<button onclick="requestPay('12개월 구독 서비스', '80000')">결제하기</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		</main>
		<%@ include file="../footer.jsp" %>

		<script type="text/javascript"
			src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

		<script>
			var user_id = '${user.member.username}';
			var userdata;
			
			$(document).ready(function(){
				
				$.ajax({
					url: '${cpath}/member/find_lang',
	                type: 'GET',
	                data: { "username" : user_id },
	                success: function(data) {
	                	userdata = data;
	                },
	                error: function() {
	                    console.error('사용자 데이터를 불러오는 데 실패했습니다.');
	                }
				});

			});
			
			var IMP = window.IMP;
			IMP.init("imp87328525");

			function requestPay(subscriptionType, amount) {
				IMP.request_pay({
					pg : "nice",
					pay_method : "card",
					merchant_uid : "merchant_" + new Date().getTime(), // 상점에서 생성한 고유 주문번호
					name : subscriptionType,
					amount : amount,
					buyer_email : userdata.email,
					buyer_name : userdata.username,
					buyer_tel : userdata.phone,
					buyer_addr : userdata.addr,
					// buyer_postcode : "123-456",
					// language : "ko", // 결제창 언어 선택 파라미터  ko: 한국어, en: 영문
					niceMobileV2 : true, // 신규 모바일 버전 적용 시 설정
					display : {
						card_quota : [ 6 ], // 할부개월 6개월까지만 활성화
					}
				}, function(rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ' + rsp.paid_amount + '원';
						msg += '카드 승인번호 : ' + rsp.apply_num;
						msg += '상품명 : ' + rsp.name;
						msg += '할부 개월수 : ' + rsp.card_quota;
						msg += '결제 수단 : ' + rsp.pay_method;
						msg += '거래 고유 번호 : ' + rsp.merchant_uid;
						
						var jsonData = {
								  "productName": rsp.name,
								  "amount": rsp.paid_amount,
								  "cardApplyNum": rsp.apply_num,
								  "installment": rsp.card_quota,
								  "payMethod": rsp.pay_method,
								  "merchantUid": rsp.merchant_uid
								  
								};
						$.ajax({
						    url: "${cpath}/subscription/saveInfo",
						    type: "POST",
						    data: JSON.stringify(jsonData),
						    contentType: "application/json", // 데이터 유형을 JSON으로 설정
						    headers: {
						        "username": user_id // 따로 username을 헤더로 보냅니다.
						    },
						    success: function () {
						        window.location.href = "${cpath}/";
						    },
						    error: function() {
			                    console.error('결제 데이터를 불러오는 데 실패했습니다.');
			                }
						});

					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			}
		</script>
</body>
</html>