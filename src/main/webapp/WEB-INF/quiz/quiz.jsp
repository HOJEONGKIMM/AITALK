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
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>오늘의 퀴즈</title>	
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
                                    <h1 data-animation="bounceIn" data-delay="0.2s">오늘의 퀴즈</h1>
                                    <!-- breadcrumb Start-->
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><h3 class="text-white"><Strong id="languageView"></Strong></h3></li> 
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
		<div class="container" style="padding: 50px;">
		    <div class="row justify-content-center">
		        <div class="col-md-8">
		            <div class="question-container" style="background-color: #ffffff; border: 1px solid #dee2e6; padding: 20px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
		            	<div style="display: flex; justify-content: center; align-items: center;">
		            		<img id="robotImage" src="${cpath}/resources/img/icon/robot0.png">
		            	</div>
		            	<div class="progress" style="height: 30px; margin-bottom: 30px;">
						   	<div id="progress_bar" class="progress-bar" style="width:%; background-image: linear-gradient(to right, rgb(102, 102, 255), rgb(204, 51, 204));">0%</div>
						</div>
		            	<input type="hidden" id="language_info" value="">
		            	
		                <div class="mb-3"><h5><Strong id="question"></Strong></h5></div>
		                <div class="mb-3"><span id="translate"></span></div>
		                <input type="text" id="answer" class="form-control mb-3" placeholder="정답을 입력하세요">
		                <div class="buttons-container" id="btn_set" style="margin-top: 20px;">
						    <button type="button" id="check-button" style="background-color: #f8f9fa; color: black; border: 1px solid #ced4da; padding: 10px 20px; border-radius: 5px; cursor: pointer;">제출</button>
						    <button type="button" id="next-button" style="background-color: #f8f9fa; color: black; border: 1px solid #ced4da; padding: 10px 20px; border-radius: 5px; cursor: pointer; display: none;">다음 문제</button>
						    <button type="button" id="answerView-button" style="background-color: #f8f9fa; color: black; border: 1px solid #ced4da; padding: 10px 20px; border-radius: 5px; cursor: pointer; display: none;">정답 확인</button>
						</div>
						<div>
							<button type="button" id="restart-button" onclick="restartQuestion()" style="background-color: #f8f9fa; color: black; border: 1px solid #ced4da; padding: 10px 20px; border-radius: 5px; cursor: pointer; display: none;">퀴즈 더 풀기</button>
						</div>
		                <div class="answer-view" id="answerView" style="font-weight: bold; margin-top: 10px;"></div>
		            </div>
		            
		        </div>
		    </div>
		</div>
		
	</main>
	<%@ include file="../footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var quiz;
    var index = [];
    var currentQuestionIndex;
    var questionNumber = 1;
    var user_id = '${user.member.username}';
    var userLanguage;
    var answer = 0;
    
    document.addEventListener("DOMContentLoaded", function() {
        // 페이지가 로드될 때 실행되는 코드
        $.ajax({
        	url: '${cpath}/member/find_lang',
            type: 'GET',
        	data : {"username" : user_id},
        	success : function(response){
        		examplePrint(response.language);
        		console.log("유저 언어 받아오기"+response);
        	},
        	error : function(){
        		console.log("유저 언어 받아오기 실패")
        		examplePrint("ENG");
        	}
        });
        
        function examplePrint(language){
        	console.log("문제프린트" + language);
        	userLanguage = language;
        	if(userLanguage == "ENG") {
            	$('#languageView').text("[English]");
            } else if(userLanguage == "JPN") {
            	$('#languageView').text("[日本語]")
            } else if(userLanguage == "CHN") {
            	$('#languageView').text("[汉语]")
            } else if(userLanguage == "SPN") {
            	$('#languageView').text("[Español]")
            } else {
            	$('#languageView').text("[English]");
            }
        	$.ajax({
                url: '${cpath}/quiz/initial-quiz',
                type: 'GET',
                data: { language: userLanguage },
                dataType: 'json',
                success: function(data) {
                    quiz = data;
                    showNextQuestion();
                },
                error: function() {
                    console.error('초기 퀴즈 데이터를 불러오는 데 실패했습니다.');
                }
            });
        }
    });
	
    
    
    $(document).ready(function() {
    	setTimeout(function() {
            $('.preloader').remove();
        }, 1300);
    	// 정답 입력란에서 엔터 키를 누르면 정답을 체크합니다.
        $('#answer').on('keyup', function(event) {
        	
            if (event.key === 'Enter') {
                var userAnswer = $('#answer').val();
                if (userAnswer == quiz[currentQuestionIndex].answer) {
                	document.getElementById("robotImage").src = "${cpath}/resources/img/icon/robot2.png";
                    $('#answerView').text('정답입니다!(20점)');
                    $('#answerView').removeClass('text-danger').addClass('text-success');
                    $('#next-button').css('display', 'block');
                    $('#answerView-button').css('display', 'none');
                    $('#check-button').css('display', 'none');
                    answer = answer + 20;
                } else {
                	document.getElementById("robotImage").src = "${cpath}/resources/img/icon/robot3.png";
                    $('#answerView').text('틀렸습니다.');
                    $('#answerView').removeClass('text-success').addClass('text-danger');
                    $('#check-button').css('display', 'none');
                    $('#next-button').css('display', 'block');
                    $('#answerView-button').css('display', 'block');
                }
                $('#answerView').css('display', 'block');
            }
        });
    	
        // 정답을 체크하고 결과를 표시합니다.
        $('#check-button').on('click', function() {
            var userAnswer = $('#answer').val();
            if (userAnswer == quiz[currentQuestionIndex].answer) {
            	document.getElementById("robotImage").src = "${cpath}/resources/img/icon/robot2.png";
                $('#answerView').text('정답입니다!');
                $('#answerView').removeClass('text-danger').addClass('text-success');
                $('#next-button').css('display', 'block');
                $('#answerView-button').css('display', 'none');
                $('#check-button').css('display', 'none');
                answer = answer + 20;
            } else {
            	document.getElementById("robotImage").src = "${cpath}/resources/img/icon/robot3.png";
            	$('#answerView').text('틀렸습니다.');
                $('#answerView').removeClass('text-success').addClass('text-danger');
                $('#check-button').css('display', 'none');
                $('#next-button').css('display', 'block');
                $('#answerView-button').css('display', 'block');
            }
            $('#answerView').css('display', 'block');
        });

        // 정답 확인 버튼을 클릭할 때 정답을 표시합니다.
        $('#answerView-button').on('click', function() {
        	document.getElementById("robotImage").src = "${cpath}/resources/img/icon/robot4.png";
            $('#answerView').text('정답은 ' + quiz[currentQuestionIndex].answer);
            $('#answerView').addClass('text-primary');
            $('#answerView').css('display', 'block');
        });

        // 다음 문제로 넘어갑니다.
        $('#next-button').on('click', function() {
        	document.getElementById("robotImage").src = "${cpath}/resources/img/icon/robot1.png";
            showNextQuestion();
            $('#answerView').text('');
            $('#answerView').removeClass('text-success text-danger text-primary');
            $('#answer').val('');
            $('#next-button').css('display', 'none');
            $('#answerView-button').css('display', 'none');
        });
    });

    function showNextQuestion() {
    	
        var languageQuiz = quiz.filter(item => item.language === userLanguage);
        if(index.length < 5) {
            for (var i = 0; i < languageQuiz.length; i++) {
                currentQuestionIndex = Math.floor(Math.random() * languageQuiz.length);
                if(index.includes(currentQuestionIndex)) {
                    i--;
                } else {
                    index.push(currentQuestionIndex);
                    $('#question').text(questionNumber + '. Q : ' + quiz[currentQuestionIndex].sentence);
                    $('#translate').text('　　　　' + quiz[currentQuestionIndex].translate);
                    $('#answer').val('');
                    $('#answerView').text('');
                    $('#answerView').css('display', 'none');
                    $('#check-button').css('display', 'block');
                    if(questionNumber == 1) {
	                    $('#progress_bar').css('width', '%');
                    } else if(questionNumber == 2) {
                    	$('#progress_bar').css('width', '20%');
                    	$('#progress_bar').text('20%');
                    } else if(questionNumber == 3) {
                    	$('#progress_bar').css('width', '40%');
                    	$('#progress_bar').text('40%');
                    } else if(questionNumber == 4) {
                    	$('#progress_bar').css('width', '60%');
                    	$('#progress_bar').text('60%');
                    } else if(questionNumber == 5) {
                    	$('#progress_bar').css('width', '80%');
                    	$('#progress_bar').text('80%');
                    }
                    questionNumber++;
                    break;
                }
            }
        } else {
        	// 퀴즈가 끝났음을 알려주는 메시지를 표시합니다.
        	document.getElementById("robotImage").src = "${cpath}/resources/img/icon/robot5.png";
        	$('#progress_bar').css('width', '100%');
            $('#progress_bar').text('100%');
            $('#question').text(answer +'점 오늘의 퀴즈가 끝났습니다.');
            $('#translate').text('');
            $('#check-button').css('display', 'none');
            $('#next-button').css('display', 'none');
            $('#answer').css('display', 'none');
            $('#answerView-button').css('display', 'none');
            $('#restart-button').css('display', 'block');
        }
    }
    function restartQuestion() {
    	window.location.href = "${cpath}/quiz/quiz";
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
