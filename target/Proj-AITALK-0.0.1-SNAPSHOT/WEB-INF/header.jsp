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
    <title>Courses | Education</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${cpath}/resources/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/slicknav.css">
    <link rel="stylesheet" href="${cpath}/resources/css/animate.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/hamburgers.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${cpath}/resources/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${cpath}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${cpath}/resources/css/slick.css">
    <link rel="stylesheet" href="${cpath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="${cpath}/resources/css/responsive.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
    <style>
        .pagination a {
            color: black;
    		justify-content: center;
        }
    </style>
    
</head>
<body>
	<header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="${cpath}/"><img src="${cpath}/resources/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">                                                                                          
                                                <li class="active" ><a href="${cpath}/">홈</a></li>
                                                <li><a href="#">학습</a>
                                                	<ul class="submenu">
                                                        <li><a href="${cpath}/quiz/quiz">오늘의 퀴즈</a></li>
                                                        <li><a href="${cpath}/aitalk/talktalk">AI 1:1대화</a></li>
                                                        <li><a href="${cpath}/theme/theme">주제/테마 학습</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">커뮤니티</a>
                                                    <ul class="submenu">
                                                        <li><a href="${cpath}/board/notice">공지사항</a></li>
                                                        <li><a href="${cpath}/board/share">공부법 공유</a></li>
                                                        <li><a href="${cpath}/board/qna">학습 Q&A</a></li>
                                                        <li><a href="${cpath}/board/review">학습 후기</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="${cpath}/intro">소개</a></li>
                                                <c:if test="${user.member.username ne null}">
                                                <li><a id="timer"></a></li>
                                                <script>
                                                	
                                                	window.onload = function(){
                                                		calculateRemainingTime();
                                                	}
                                                	
                                                	var timerId = setInterval(calculateRemainingTime, 1000);
                                                	
                                                	function calculateRemainingTime(){
                                                		
                                                		var timerElement = document.getElementById('timer');
                                                		
                                                		var now = new Date();
                                                		var expired_at = new Date('${sub.expired_at}');
                                                		var now_time = now.getTime();
                                                		var expired_at_time = expired_at.getTime();

                                                		if(now_time < expired_at_time){
                                                			var diffInSeconds = Math.floor( (expired_at_time - now_time) / 1000 );

                                                			var days = Math.floor(diffInSeconds / (24 * 3600)); // 남은 일수
                                                	        diffInSeconds %= (24 * 3600); 
                                                	        var hours = Math.floor(diffInSeconds / 3600); // 남은 시간
                                                	        diffInSeconds %= 3600;
                                                	        var minutes = Math.floor(diffInSeconds / 60); // 남은 분
                                                	        var seconds = diffInSeconds % 60; // 남은 초

                                                	        var timeString = "";

                                                	        if (days > 0) {
                                                	            timeString += days + "일 ";
                                                	            timeString += hours + "시간";
                                                	        } else if (hours > 0) {
                                                	            timeString += hours + "시간 ";
                                                	            timeString += minutes + "분";
                                                	        } else if (minutes > 0) {
                                                	            timeString += minutes + "분 ";
                                                	            timeString += seconds + "초";
                                                	        } else {
                                                	            timeString += seconds + "초";
                                                	        }

                                                	        timerElement.innerHTML = timeString + " 남음";
                                                	        timerElement.href = '${cpath}/member/subscription';
                                                	        
                                                		}else{
                                                			timerElement.innerHTML = '남은 시간 종료';
                                                			timerElement.href = '${cpath}/member/subscription';
                                                			clearInterval(timerId); // 타이머 정지
                                                		}
                                                	}
                                                	
                                                	
                                                </script>
                                                </c:if>
                                                <!-- 권한에 따른 화면구성 다르게 보여주기 -->
						    					<sec:authorize access="hasRole('ADMIN')">
						    					<li><a href="#">사용자정보</a>
						    						<ul class="submenu">
							    						<li><a>관리자페이지</a></li>
							    						<li><a>회원목록</a></li>
							    						<li><a href="${cpath}/member/logout">로그아웃</a></li>
						    						</ul>
						    					</li>
						    					<li><a href="#">언어</a>
                                                    <ul class="submenu">
                                                        <li><a style="cursor: pointer;" onclick="changeLanguage('ENG')">영어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('JPN')">일본어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('CHN')">중국어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('SPN')">스페인어</a></li>
                                                    </ul>
						    					</li>
						    					</li>
						    					</sec:authorize>
						    					
						    					<sec:authorize access="hasRole('PREMIUM')">
						    					<li><a href="#">사용자정보</a>
						    						<ul class="submenu">
						    							<li><a href="${cpath}/member/subscription">구독 서비스</a></li>
							    						<li><a href="${cpath}/member/modify">개인정보수정</a></li>
							    						<li><a href="${cpath}/member/logout">로그아웃</a></li>
						    						</ul>
						    					</li>
						    					<li><a href="#">언어</a>
                                                    <ul class="submenu">
                                                        <li><a style="cursor: pointer;" onclick="changeLanguage('ENG')">영어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('JPN')">일본어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('CHN')">중국어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('SPN')">스페인어</a></li>
                                                    </ul>
						    					</li>
						    					</sec:authorize>
						    					
						    					<sec:authorize access="hasRole('MEMBER')">
						    					<li><a href="#">사용자정보</a>
						    						<ul class="submenu">
						    							<li><a href="${cpath}/member/subscription">구독 서비스</a></li>
							    						<li><a href="${cpath}/member/modify">개인정보수정</a></li>
							    						<li><a href="${cpath}/member/logout">로그아웃</a></li>
						    						</ul>
						    					</li>
						    					<li><a href="#">언어</a>
                                                    <ul class="submenu">
                                                        <li><a style="cursor: pointer;" onclick="changeLanguage('ENG')">영어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('JPN')">일본어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('CHN')">중국어</a></li>
													    <li><a style="cursor: pointer;" onclick="changeLanguage('SPN')">스페인어</a></li>
                                                    </ul>
						    					</li>
						    					</sec:authorize>
						    					
                                                <!-- Button -->
                                                <sec:authorize access="isAnonymous()">
                                                <li class="button-header margin-left "><a href="${cpath}/member/join" class="btn">Join</a></li>
                                                <li class="button-header"><a href="${cpath}/member/login" class="btn btn3">Log in</a></li>
                                                </sec:authorize>
                                                
						    				</ul>
                                        </nav>
                                    </div>
                                </div>
                            </div> 
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    
    <script>
	function changeLanguage(selectedLanguage) {
	    $.ajax({
	        url: '${cpath}/member/changeLanguage', // 서버의 URL을 맞춰서 설정하세요.
	        type: 'POST',
	        data: {
	            username: '${user.member.username}', // 로그인한 사용자의 username
	            language: selectedLanguage // 선택된 언어
	        },
	        success: function(response) {
	            if(response.status === 'success') {
	            	
	                alert('언어가 변경되었습니다.');
	                // 필요하다면 페이지 새로고침
	                location.reload();
	            } else {
	                alert('언어 변경에 실패했습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('언어 변경 요청에 실패했습니다.');
	        }
	    });
	}
	
	
	</script>
    
</body>
</html>