<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!-- 로그인한 계정정보 -->
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />

<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AI TALK</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${cpath}/resources/img/favicon.ico">

	<link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <!-- CSS here -->
    <link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/slicknav.css">
    <link rel="stylesheet" href="${cpath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${cpath}/resources/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="${cpath}/resources/css/gijgo.css">
    <link rel="stylesheet" href="${cpath}/resources/css/animate.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/animated-headline.css">
    <link rel="stylesheet" href="${cpath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${cpath}/resources/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${cpath}/resources/css/slick.css">
    <link rel="stylesheet" href="${cpath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/themify-icons/0.1.2/css/themify-icons.css">
    
    
    
    <style type="text/css">
    
    .team-member-image {
    width: 150px; 
    height: auto;
    object-fit: cover;
}
    
    </style>
</head>

<body>
    <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${cpath}/resources/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <%@ include file="header.jsp" %>
    <main>
        <!--? slider Area Start-->
        <section class="slider-area ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-7 col-md-12">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay="0.2s">AITALK</h1>
                                    <p data-animation="fadeInLeft" data-delay="0.4s">음성인식 AI 기반 외국어 회화 서비스 플랫폼</p>
                                    <a href="${cpath}/member/join" class="btn hero-btn" data-animation="fadeInLeft" data-delay="0.7s">7일 무료체험</a>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </section>
        <!-- ? services-area -->
        <div class="services-area">
            <div class="container">
                <div class="row justify-content-sm-center">
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="single-services mb-30">
                            <div class="features-icon">
                                <img src="${cpath}/resources/img/icon/icon1.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>Random Quiz</h3>
                                <p>매일 다르게 즐기는 회화 퀴즈</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="single-services mb-30">
                            <div class="features-icon">
                                <img src="${cpath}/resources/img/icon/icon2.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>AI Insturctor</h3>
                                <p>AI와 진행하는 회화 연습</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="single-services mb-30">
                            <div class="features-icon">
                                <img src="${cpath}/resources/img/icon/icon3.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>Whenever & Wherever</h3>
                                <p>원하는 시간과 장소에서 언제든</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
        <!-- Courses area End -->
        <!--? About Area-1 Start -->
        <section class="about-area1 fix pt-10">
            <div class="support-wrapper align-items-center">
                <div class="left-content1" style="width: 100%; margin: 0 auto;  margin-left: 90px;">
                    <div class="about-icon">
                        <img src="${cpath}/resources/img/icon/about.svg" alt="">
                    </div>
                    <!-- section tittle -->
                    <div class="section-tittle section-tittle2 mb-55">
                        <div class="front-text">
                            <h2 class="">번역기가 있는데, 외국어 공부해야 할까?</h2>
                            <p>클릭 한 번으로, 또는 음성 인식으로 원하는 언어로 번역이 가능한 시대! 나보다 똑똑한 번역기가 있는데 외국어 공부를 계속해야 할까?</p>
                        </div>
                        
                    </div>
                    <h3 class="">외국어를 배워야하는 이유는 충분합니다.</h3> <br>
                    <div class="single-features">
                    
                        <div class="features-icon">
                            <img src="${cpath}/resources/img/icon/right-icon.svg" alt="">
                        </div>
                        <div class="features-caption">
                            <p>다양한 문화와 세계관을 이해하는 소통의 도구로서의 외국어 교육</p>
                        </div>
                    </div>
                    <div class="single-features">
                        <div class="features-icon">
                            <img src="${cpath}/resources/img/icon/right-icon.svg" alt="">
                        </div>
                        <div class="features-caption">
                            <p>문제 해결 능력을 향상시키며, 인지 능력을 향상시키는 데 도움주는 외국어 교육</p>
                        </div>
                    </div>

                    <div class="single-features">
                        <div class="features-icon">
                            <img src="${cpath}/resources/img/icon/right-icon.svg" alt="">
                        </div>
                        <div class="features-caption">
                            <p>외국어를 구사할 수 있는 능력에 따른 자신감을 향상</p>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>
        <!-- About Area End -->
        <!--? top subjects Area Start -->
       <%--  <div class="topic-area section-padding40">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8">
                        <div class="section-tittle text-center mb-55">
                            <h2>Explore top subjects</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic1.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic2.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic3.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic4.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic5.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic6.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic7.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="${cpath}/resources/img/gallery/topic8.png" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="#">Programing</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-12">
                        <div class="section-tittle text-center mt-20">
                            <a href="courses.html" class="border-btn">View More Subjects</a>
                        </div>
                    </div>
                </div>
            </div>
        </div> --%>
        <!-- top subjects End -->
        <!--? About Area-3 Start -->
        <section class="about-area3 fix">
           
        </section>
        <!-- About Area End -->
        <!--? Team -->
        <section class="team-area section-padding40 fix">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8">
                        <div class="section-tittle text-center mb-55">
                            <h2>개발 인원</h2>
                        </div>
                    </div>
                </div>
                <div class="team-active">
                    <div class="single-cat text-center">
                        <div class="cat-icon">
                            <img src="${cpath}/resources/img/gallery/team1.png" alt="" class="team-member-image">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="services.html">이영재</a></h5>
                            <p>팀장</p>
                            <p>PM</p>
                            <p>AWS EB 배포</p>
                            <p>로그인/회원가입 기능</p>
                            <p>버그 픽싱</p>
                            <p>DB 설계</p>
                        </div>
                    </div>
                    <div class="single-cat text-center">
                        <div class="cat-icon">
                            <img src="${cpath}/resources/img/gallery/team2.png" alt="" class="team-member-image">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="services.html">백형준</a></h5>
                            <p>팀원</p>
                            <p>결제 기능</p>
                            <p>오늘의 퀴즈 페이지</p>
                            <p>DB 설계</p>
                        </div>
                    </div>
                    <div class="single-cat text-center">
                        <div class="cat-icon">
                            <img src="${cpath}/resources/img/gallery/team3.png" alt="" class="team-member-image">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="services.html">박호용</a></h5>
                            <p>팀원</p>
                            <p>유튜브 API 연결</p>
                            <p>게시판 기능 (검색, 페이징)</p>
                            <p>회원정보 수정</p>
                        </div>
                    </div>
                    <div class="single-cat text-center">
                        <div class="cat-icon">
                            <img src="${cpath}/resources/img/gallery/team4.png" alt="" class="team-member-image">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="services.html">김호정</a></h5>
                            <p>팀원</p>
                            <p>서비스 기획</p>
                            <p>게시판 기능 (글 쓰기, 수정, 삭제)</p>
                            <p>AWS S3 파일 업로드</p>
                        </div>
                    </div>
                    <div class="single-cat text-center">
                        <div class="cat-icon">
                            <img src="${cpath}/resources/img/gallery/team5.png" alt="" class="team-member-image">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="services.html">최종화</a></h5>
                            <p>팀원</p>
                            <p>AI 1:1 대화 기능(STT, TTS API 연결)</p>
                            <p>ChatGPT API 연결</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services End -->
        <!--? About Area-2 Start -->
        <section class="about-area2 fix pb-padding">
            <div class="support-wrapper align-items-center">
                <div class="right-content2">
                    <!-- img -->
                    <div class="right-img">
                        <img src="${cpath}/resources/img/gallery/ai_img.png" alt="">
                    </div>
                </div>
                <div class="left-content2">
                    <!-- section tittle -->
                    <div class="section-tittle section-tittle2 mb-20">
                        <div class="front-text">
                            <h2 class="">Take the next step
                                toward your personal
                                and professional goals
                            with us.</h2>
                            <p>AITALK과 함께 더 멋진 미래를
                               <br>AITALK과 함께 문화의 문턱을 넘어 무한한 가능성의 다리를 건넙니다
                               <br>세계로 향하는 여정에 AITALK이 당신의 가장 믿음직한 동반자가 되어 줄 것입니다
                            </p>
                            
                            <a href="${cpath}/member/join" class="btn">7일 무료체험</a>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Area End -->
    </main>
 	<%@ include file="footer.jsp" %>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
  </div>

<!-- JS here -->
<script src="${cpath}/resources/js/vendor/modernizr-3.5.0.min.js"></script>

<!-- Jquery, Popper, Bootstrap -->
<script src="${cpath}/resources/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${cpath}/resources/js/popper.min.js"></script>
<script src="${cpath}/resources/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="${cpath}/resources/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="${cpath}/resources/js/owl.carousel.min.js"></script>
<script src="${cpath}/resources/js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="${cpath}/resources/js/wow.min.js"></script>
<script src="${cpath}/resources/js/animated.headline.js"></script>
<script src="${cpath}/resources/js/jquery.magnific-popup.js"></script>

<!-- Date Picker -->
<script src="${cpath}/resources/js/gijgo.min.js"></script>
<!-- Nice-select, sticky -->
<script src="${cpath}/resources/js/jquery.nice-select.min.js"></script>
<script src="${cpath}/resources/js/jquery.sticky.js"></script>
<!-- Progress -->
<script src="${cpath}/resources/js/jquery.barfiller.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script src="${cpath}/resources/js/jquery.counterup.min.js"></script>
<script src="${cpath}/resources/js/waypoints.min.js"></script>
<script src="${cpath}/resources/js/jquery.countdown.min.js"></script>
<script src="${cpath}/resources/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="${cpath}/resources/js/contact.js"></script>
<script src="${cpath}/resources/js/jquery.form.js"></script>
<script src="${cpath}/resources/js/jquery.validate.min.js"></script>
<script src="${cpath}/resources/js/mail-script.js"></script>
<script src="${cpath}/resources/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="${cpath}/resources/js/plugins.js"></script>
<script src="${cpath}/resources/js/main.js"></script>

</body>
</html>