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



<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>테마/주제학습</title>   
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="shortcut icon" type="image/x-icon" href="${cpath}/resources/img/favicon.ico">
   
   <!-- CSS here -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/slicknav.css">
    <link rel="stylesheet" href="${cpath}/resources/css/animate.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/hamburgers.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${cpath}/resources/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${cpath}/resources/css/slick.css">
    <link rel="stylesheet" href="${cpath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="${cpath}/resources/css/responsive.css">

   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
   
   <style type="text/css">
      body{
      background:#eee; 
      margin-top:10px;
      }
      
      .ibox {
        clear: both;
        margin-bottom: 25px;
        margin-top: 0;
        padding: 0;
      }
      .ibox.collapsed .ibox-content {
        display: none;
      }
      .ibox.collapsed .fa.fa-chevron-up:before {
        content: "\f078";
      }
      .ibox.collapsed .fa.fa-chevron-down:before {
        content: "\f077";
      }
      .ibox:after,
      .ibox:before {
        display: table;
      }
      .ibox-title {
        -moz-border-bottom-colors: none;
        -moz-border-left-colors: none;
        -moz-border-right-colors: none;
        -moz-border-top-colors: none;
        background-color: #ffffff;
        border-color: #e7eaec;
        border-image: none;
        border-style: solid solid none;
        border-width: 3px 0 0;
        color: inherit;
        margin-bottom: 0;
        padding: 14px 15px 7px;
        min-height: 48px;
      }
      .ibox-title h5 {
          display: inline-block;
          font-size: 14px;
          margin: 0 0 7px;
          padding: 0;
          text-overflow: ellipsis;
          float: left;
      }
      .ibox-tools a {
          cursor: pointer;
          margin-left: 5px;
          color: #c4c4c4;
      }
      .ibox-tools {
          display: block;
          float: none;
          margin-top: 0;
          position: relative;
          padding: 0;
          text-align: right;
      }
      .ibox-content {
        background-color: #ffffff;
        color: inherit;
        padding: 15px 20px 20px 20px;
        border-color: #e7eaec;
        border-image: none;
        border-style: solid solid none;
        border-width: 1px 0;
      }
      .ibox-footer {
        color: inherit;
        border-top: 1px solid #e7eaec;
        font-size: 90%;
        background: #ffffff;
        padding: 10px 15px;
      }
      video {
        width: 100% !important;
        height: auto !important;
      }
         
         
      .video-list {
          background-color: #f5f5f5;
          padding: 15px;
          height: auto;
          overflow-y: auto; /* For scrolling */
      }
      
      .video-list ul {
          list-style: none;
          padding: 0;
      }
      
      .video-list ul li {
          padding: 5px 0;
          border-bottom: 1px solid #ddd;
      }
            
      /* Responsive iframe */
      .responsive-iframe-container {
          position: relative;
          overflow: hidden;
          padding-top: 56.25%; /* 16:9 Aspect Ratio */
      }
      
      .responsive-iframe-container iframe {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          border: 0;
      }   
      
	    .videolist {
	        color: black; /* 기본 색상 */
	        text-decoration: none; /* 링크 밑줄 제거 */
	    }
	
	    /* videolist 클래스가 있는 링크에 마우스를 올렸을 때의 스타일 */
	    .videolist:hover {
	        color: #6c5ce7; /* 마우스 오버 시 색상 - 원하는 색상으로 변경 가능 */
	    }
	    
			    /* 클릭된 링크에 적용될 색상 */
		.active-link {
		    color: #6c5ce7; /* 클릭된 링크의 색상 - 원하는 색상으로 변경 가능 */
		}

		.video-list-sidebar {
		    display: none;
		    /* 기타 스타일 설정 */
		}
		
		.video-list-sidebar.active {
		    display: block;
		    /* 활성화 시 추가 스타일 */
		}



}
   </style>
   
   
</head>
<body>
   <!--? Preloader Start -->
    <div id="preloader-active">
    </div>
    <!-- Preloader Start -->
    <%@ include file="../header.jsp" %>
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
                                    <h1 data-animation="bounceIn" data-delay="0.2s">테마/주제 학습</h1>
                                    <!-- breadcrumb Start-->

                                    <!-- breadcrumb End -->
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </section>
        <br>
      <div class="container">
         <div class="row">
         
         <!-- Video List -->
		<div class="col-md-3 d-md-block d-none">
		    <h3 style="color: #D980FA;">Video List</h3>
		    <div class="video-list" style="overflow-y:scroll; width:270px; height:550px;">
		        <ul>
					<c:forEach var="playlistItem" items="${playlist}" varStatus="i">
					    <li>
					        <!-- HTML 데이터 속성을 사용하여 caption과 translate 전달 -->
					        <a class="videolist" href="#" data-caption="${playlistItem.caption}" data-translate="${playlistItem.translate}" onclick="changeVideo('${playlistItem.url}'); updateVideoContent(this); setActiveLink(this); return false;">
					            ${playlistItem.title}
					        </a>
					    </li>
					</c:forEach>
		        </ul>
		    </div>
		</div>

				<button class="hamburger d-md-none d-black" style="color: #D980FA;" type="button" onclick="toggleMenu()">
					<span>video list</span>

				</button>
		<div class="col-md-3 d-md-none d-black video-list-sidebar" id="videoMenu">
		    <div class="video-list" style="overflow-y:scroll; width:420px; height:250px;">
		        <ul>
					<c:forEach var="playlistItem" items="${playlist}" varStatus="i">
					    <li>
					        <!-- HTML 데이터 속성을 사용하여 caption과 translate 전달 -->
					        <a class="videolist" href="#" data-caption="${playlistItem.caption}" data-translate="${playlistItem.translate}" onclick="changeVideo('${playlistItem.url}'); updateVideoContent(this); setActiveLink(this); return false;">
					            ${playlistItem.title}
					        </a>
					    </li>
					</c:forEach>
		        </ul>
		    </div>
		</div>		
         
         <div class="col-md-9 col-12">
             <div class="ibox float-e-margins">
                 <div class="ibox-title" >
                     <h5 style="color: #D980FA;">Video window</h5>
                 </div>
                 <div class="ibox-content">
                     <div class="responsive-iframe-container">
                         <iframe id="videoFrame" src="https://www.youtube.com/embed/mO133a-Tutw" frameborder="0" allowfullscreen="" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
                     </div>
                 </div>
             </div>
         </div>
         					  
         <div class="row">
             <!-- Video Description -->
             <div class="col-md-6 col-12">
                 <div class="ibox float-e-margins">
                     <div class="ibox-title">
                         <h5 style="color: #D980FA;">Video script</h5>
                     </div>
                     <div id="videoDescription" class="ibox-content profile-content" style="overflow-y:scroll; height:400px;">
						

                     </div>
                 </div>
             </div>
         
             <!-- Video Translation -->
             <div class="col-md-6 col-12">
                 <div class="ibox float-e-margins">
                     <div class="ibox-title">
                         <h5 style="color: #D980FA;">Video Translation</h5>
                     </div>
                     
                     <div id="videoTranslation" class="ibox-content profile-content" style="overflow-y:scroll;  height:400px;">
						
                     </div>
                 </div>
             </div>
         </div>
         
         </div>
         </div>
   </main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script>

      document.addEventListener('DOMContentLoaded', function() {
    	    // 페이지가 로드되면 첫 번째 비디오 링크를 찾아서 선택합니다.
    	    var firstVideoLink = document.querySelector('.videolist');
    	    
    	    if (firstVideoLink) {
    	        // 첫 번째 비디오의 데이터를 가져와서 업데이트합니다.
    	        updateVideoContent(firstVideoLink);
    	        setActiveLink(firstVideoLink);
    	    }
    	});      
      
      
      
      function changeVideo(url) {
    	    // 비디오 ID만 추출
    	    var videoId = url.split('v=')[1];
    	    var embedUrl = "https://www.youtube.com/embed/" + videoId;

    	    var iframe = document.getElementById('videoFrame');
    	    if (iframe) {
    	        iframe.src = embedUrl; // Embed URL로 iframe의 src 속성 변경
    	    } else {
    	        console.log('iframe not found');
    	    }
    	}
      
      function updateVideoContent(element) {
          var caption = element.getAttribute('data-caption');
          var translate = element.getAttribute('data-translate');

          // 비디오 설명 업데이트
          document.getElementById('videoDescription').innerHTML = caption;
          
          // 비디오 번역 업데이트
          document.getElementById('videoTranslation').innerHTML = translate;
      }
      
      function setActiveLink(element) {
    	    // 모든 'videolist' 클래스 링크에서 'active-link' 클래스 제거
    	    var links = document.querySelectorAll('.videolist');
    	    links.forEach(function(link) {
    	        link.classList.remove('active-link');
    	    });

    	    // 클릭된 링크에 'active-link' 클래스 추가
    	    element.classList.add('active-link');
    	}
      
      function toggleMenu() {
    	    var menu = document.getElementById('videoMenu');
    	    menu.classList.toggle('active');
    	}
      
      </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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