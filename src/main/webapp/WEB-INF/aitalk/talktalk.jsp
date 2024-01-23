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

<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<link href="path/to/bootstrap-icons.css" rel="stylesheet">
	
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AI TALK</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
        
        
.content-container {
    display: flex;
    flex-direction: row; /* 가로 방향 배치 */
}

aside {
    flex: 0 0 200px; /* 사이드바 너비 고정 */
    /* 사이드바 스타일링 추가 */
    background: green;
}

.content-container > div {
    flex-grow: 1; /* 채팅 영역이 남은 공간을 채우도록 설정 */
    /* 채팅 영역 스타일링 추가 */
}

        /* 기본 버튼 스타일 */
        .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            outline: none;
            transition: all 0.3s ease;
        }

        /* 클릭됐을 때의 버튼 스타일 */
        .button:active {
            background-color: #367c39;
            transform: translateY(4px);
        }
        
        
        .sidebar {
    height: 100%;
    width: 200px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #f1f1f1;
    overflow-x: hidden;
    padding-top: 20px;
}

.sidebar a {
    padding: 6px 8px 6px 16px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
}

.sidebar a:hover {
    color: #f1f1f1;
    background-color: #555;
}


.chat-board{
	margin-top: 2em;
}


body{
    background-color: #f4f7f6;
    margin-top:20px;
}

.card {
    background: #fff;
    transition: .5s;
    border: 0;
    margin-bottom: 30px;
    border-radius: .55rem;
    position: relative;
    width: 100%;
    box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
}
.chat-app .people-list {
    width: 280px;
    position: absolute;
    left: 0;
    top: 0;
    padding: 20px;
    z-index: 7
}

.chat-app .chat {
    margin-left: 280px;
    border-left: 1px solid #eaeaea
}

.people-list {
    -moz-transition: .5s;
    -o-transition: .5s;
    -webkit-transition: .5s;
    transition: .5s
}

.people-list .chat-list li {
    padding: 10px 15px;
    list-style: none;
    border-radius: 3px
}

.people-list .chat-list li:hover {
    background: #efefef;
    cursor: pointer
}

.people-list .chat-list li.active {
    background: #efefef
}

.people-list .chat-list li .name {
    font-size: 15px
}

.people-list .chat-list img {
    width: 45px;
    border-radius: 50%
}

.people-list img {
    float: left;
    border-radius: 50%
}

.people-list .about {
    float: left;
    padding-left: 8px
}

.people-list .status {
    color: #999;
    font-size: 13px
}

.chat .chat-header {
    padding: 15px 20px;
    border-bottom: 2px solid #f4f7f6
}

.chat .chat-header img {
    float: left;
    border-radius: 40px;
    width: 40px
}

.chat .chat-header .chat-about {
    float: left;
    padding-left: 10px
}

.chat .chat-history {
    padding: 20px;
    border-bottom: 2px solid #fff
}

.chat .chat-history ul {
    padding: 7px;
}

.chat .chat-history ul li {
    list-style: none;
    margin-bottom: 30px
}

.chat .chat-history ul li:last-child {
    margin-bottom: 0px
}

.chat .chat-history .message-data {
    margin-bottom: 15px
}

.chat .chat-history .message-data img {
    border-radius: 40px;
    width: 40px
}

.chat .chat-history .message-data-time {
    color: #434651;
    padding-left: 6px
}

.chat .chat-history .message {
    color: #444;
    padding: 18px 20px;
    line-height: 26px;
    font-size: 16px;
    border-radius: 7px;
    display: inline-block;
    position: relative
}

.chat .chat-history .message:after {
    bottom: 100%;
    left: 7%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #fff;
    border-width: 10px;
    margin-left: -10px
}

.chat .chat-history .my-message {
    background: #efefef
}

.chat .chat-history .my-message:after {
    bottom: 100%;
    left: 30px;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #efefef;
    border-width: 10px;
    margin-left: -10px
}

.chat .chat-history .other-message {
    background: #e8f1f3;
    text-align: right
}

.chat .chat-history .other-message:after {
    border-bottom-color: #e8f1f3;
    left: 93%
}

.chat .chat-message {
    padding: 20px
}

.online,
.offline,
.me {
    margin-right: 2px;
    font-size: 8px;
    vertical-align: middle
}

.online {
    color: #86c541
}

.offline {
    color: #e47297
}

.me {
    color: #1d8ecd
}

.float-right {
    float: right
}

.clearfix:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0
}

@media only screen and (max-width: 767px) {
    .chat-app .people-list {
        height: 115px;
        width: 100%;
        overflow-x: auto;
        background: #fff;
        top: -117px;
        border: 2px solid #efefef;
        border-radius: 3px;
    }
    .chat-app .people-list.open {
        left: 0
    }
    .chat-app .chat {
        margin: 0
    }
    .chat-app .chat .chat-header {
        border-radius: 0.55rem 0.55rem 0 0
    }
    .chat-app .chat-history {
        height: 300px;
        overflow-x: auto
    }
    
    .chat-background {
    	height: 650px;
    }
    
    .chat-app {
    	bottom: -110px;
    }
}

@media only screen and (min-width: 768px) {
    .chat-app .chat-list {
        height: 350px;
        overflow-x: auto
    }
    .chat-app .chat-history {
        height: 400px;
        overflow-x: auto
    }
    
    #plist {
    	height: 100%;
    	overflow-x: auto
    }
    
    .chat-background {
    	height: 540px;
    }
}

@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
    .chat-app .chat-list {
        height: 480px;
        overflow-x: auto
    }
    .chat-app .chat-history {
        height: calc(100vh - 350px);
        overflow-x: auto
    }
    
}

.form-control {
	height: 50px; /* 원하는 높이 값으로 설정 */
	font-size: 20px;
}

.message {
	position: relative; /* 가상 요소의 위치 기준점으로 설정합니다. */
}

.message::after {
	content: "";
    position: absolute; /* 가상 요소를 절대 위치로 설정합니다. */
    top: 7; /* 상위 요소의 상단과 맞춥니다. */
    transform: translateX(-50%); /* 요소의 너비만큼 추가로 왼쪽으로 이동시킵니다. */
}

         
</style>

   
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
    <%@ include file="../header.jsp" %>
    <main>
        <!--? slider Area Start-->
        <section class="slider-area slider-area2">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height2">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-8 col-lg-11 col-md-12">
                                <div class="hero__caption hero__caption2">
                                    <h1 data-animation="bounceIn" data-delay="0.2s">AI 1:1 대화</h1>
                                    <!-- breadcrumb Start-->
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="${cpath}/">Home</a></li>
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
    
<!-- 메세지 폼 -->
<div class="container chat-background">
<div class="row clearfix">
    <div class="col-lg-12 chat-board">
        <div class="card chat-app">
            <div id="plist" class="people-list" style="overflow-y: scroll;">
                <div class="input-group">
                    <div class="input-group-prepend">
                    	<div class="col-md=6"><span class="input-group-text"></i><h3 style="padding-top: 7px; padding-left: 7px;">AI 1:1 대화방 목록</h3></span></div>
                  			<div class="col-md=6" style="margin-left: 5px;">
                          	<button id="myAjaxButton" style="background-color: #db58ce; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
                          	<i class="fa fa-plus"></i>
                      		</button>
                   		</div>
                    </div>
                </div>
                <ul class="list-unstyled chat-list mt-2 mb-0" style="overflow-y: auto; height: 480px;">
                    <li class="clearfix">
                        <div class="about">
                            <div class="name">타이틀</div>
                            <div class="status"> <i class="fa fa-circle offline"></i> 마지막 날짜 가져오기 </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="chat">
                <div class="chat-history">
                    <ul class="talk-list m-b-0" style="height: 450px;">
                        <li class="clearfix">
                            <div class="message-data text-right">
                                <span class="message-data-time"></span>
                            </div>
                            <div class="message other-message float-right"></div>
                        </li>
                    </ul>
                </div>
                <div class="chat-message clearfix">
                    <div class="input-group mb-0">
	                    <div class="input-group">
						    <span class="input-group-text"><i  class="fa fa-send fa-2x"></i></span>
						    	<input id="pchange" type="text" class="form-control" placeholder="Enter text here..." style="height: 100%;">
						    <span onclick="startRecording()" id="audiostart" class="input-group-text" style="border-radius: 0 20px 20px 0; padding-left: 1.5rem; padding-right: 2rem;"><i class="fa fa-microphone fa-2x";></i></span>
							<span onclick="stopRecording()" id="audiostop" class="input-group-text" style="border-radius: 0 20px 20px 0; padding-left: 1.5rem; padding-right: 2rem; display: none;"><i class="fa fa-stop-circle fa-2x";></i></span>
							<span onclick="sendAudioToServer()" id="audiogo" class="input-group-text" style="border-radius: 0 20px 20px 0; padding-left: 1.5rem; padding-right: 2rem; display: none;"><i class="fa fa-check fa-2x";></i></span>
							<audio style="display: none;" id="myAudio" src="" controls="controls" />				    	
						</div>
                	</div>
            	</div>
        	</div>
		</div>
	</div>
</div>
    </main>
    <%@ include file="../footer.jsp" %>
<!-- 메세지 폼/끝 -->

  
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>
		var username = '${user.member.username}';

		let mediaRecorder;
		var audioChunks;
		var count = 0;
		var roomIdx;
		var language;
		var recognition;
	    // 녹음 시작
		function startRecording() {

	    	
	    	$("#audiostop").css("display","block");
	    	$("#audiostart").css("display","none");
/* 	        navigator.mediaDevices.getUserMedia({ audio: true })
	            .then(stream => {
	                mediaRecorder = new MediaRecorder(stream);
	                mediaRecorder.start();
	                
	             	// 오디오 데이터가 사용 가능할 때 이벤트 핸들러
	                mediaRecorder.ondataavailable = function(event) {
	                    audioChunks.push(event.data);
	                };
	                console.log("녹음시작");
	            })
	            .catch(error => console.error("오디오 스트림 획득 중 오류 발생:", error)); */
	            
	            recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
	            
	            if(language === 'JPN'){
		            recognition.lang = 'ja';
	            }else if(language === 'CHN'){
	            	recognition.lang = 'zh';
	            }else if(language === 'SPN'){
	            	recognition.lang = 'es';
	            }else{
	            	recognition.lang = 'en';
	            }
	            
	            recognition.continuous = true; // 연속적인 음성 인식 활성화

	            recognition.onresult = function(event) {
	                for (var i = event.resultIndex; i < event.results.length; ++i) {
	                	audioChunks += event.results[i][0].transcript;
	                }
	            };

	            recognition.onerror = function(event) {
	                alert('음성 인식 오류: ' + event.error);
	            };

	            recognition.start();

	    }

	    // 녹음 중지
	    function stopRecording() {
	    	$("#audiostop").css("display","none");
	    	$("#audiogo").css("display","block");
/* 	    	mediaRecorder.stop(); */

			if (recognition) {
              recognition.stop();
              /* document.getElementById('result').innerText = '인식된 문장:\n' + audioChunks; */
              audioChunks = ''; // 결과 초기화
          }

			
	    	console.log("녹음 중지");
	    }

	    
	    // 오디오 데이터 서버로 전송
	    function sendAudioToServer() {
	    	$("#audiogo").css("display","none");
	    	$("#audiostart").css("display","block");
	        /* const audioBlob = new Blob(audioChunks, { type: 'audio' });
	        const formData = new FormData();
	        formData.append('audioFile', audioBlob, 'audio' + count+'.wav');
	        formData.append('language', language); // 여기에 언어 파라미터를 추가 */
	        
	        
			console.log("데이터 서버 전송");
	        $.ajax({
	            url: '${cpath}/aitalk/aitalktalk', // 서버의 엔드포인트 URL
	            type: 'POST',
	            data: {
	            	"audioChunks" : audioChunks, 
	            	"language" : language,
	            },
	         /*    processData: false,
	            contentType: false, */
	            success: function(response) {
	                console.log('서버 응답');
	               /*  audioChunks = [];
	                mediaRecorder.ondataavailable = function(event) {
	                    audioChunks.push(event.data);
	                    console.log(event); 
	                    
	                };*/
	                $('#pchange').val(response.transcription);
	                saveTalk(response);
	            },
	            error: function(xhr, status, error) {
	                console.error('에러 발생:' + error, status, xhr);
	            }
	        });
	        /* count++; */
	    }
	    
	    function saveTalk(response){
	    	console.log(response);
	    	console.log(roomIdx);
	    	console.log(username);
	    	$.ajax({
	    		url : "${cpath}/aitalk/saveTalk",
	    		type : "post",
	    		data : {"transcription" : response.transcription,
	    				"audioBase64" : response.audioBase64,
	    				"response" : response.response,
	    				"room_idx" : roomIdx,
	    				"username" : username},
	    		success : function(){
	    			console.log("저장 성공");
	    			console.log(response + "여기 출력됨");
			    	speakerTts(response.audioBase64);
	    		},
	    		error : function(){
	    			console.log("저장 실패");
	    		}
	    	});
	    }
	    
	    function speakerTts(audioBase64){
	    	// 경로 바꿔주기
	    	getTalk(roomIdx);
	    	var audio = document.getElementById('myAudio');
	    	audio.src = "data:audio/mpeg;base64," + audioBase64;
            audio.load();
	    	audio.play();
 	    }
		
	    
	    $(document).ready(function(){
	    	getRoom();
	    	getLanguage();
	    	
	    	// 방만들기 버튼 함수
		    $('#myAjaxButton').click(function(){
		        // AJAX 호출을 수행합니다.
		        $.ajax({
		            url: '${cpath}/aitalk/createRoom',  // 요청을 보낼 서버의 URL 주소
		            type: 'post',                // HTTP 요청 방식(GET, POST 등)
		            data: {"username": username},
		            success: function(response) {
		                // 요청이 성공적으로 완료되었을 때 실행할 코드
		                console.log(response);
		                getRoom();
		            },
		            error: function(xhr, status, error) {
		                // 요청이 실패했을 때 실행할 코드
		                console.error("AJAX 요청 실패: " + status + ", " + error);
		            }
		        });
		    });
	    	
	    	function getRoom(){
	    		$.ajax({
		    		url : "${cpath}/aitalk/getRoom",
		    		type : "get",
		    		data : {"username": username},
		    		success: function(data){
		    			console.log(data);
		    			// 채팅방 목록을 비웁니다.
		                var $chatList = $(".chat-list");
		                $chatList.empty();

		                // 서버에서 받은 데이터를 사용하여 각 채팅방에 대한 li 요소를 생성합니다.
		                data.forEach(function(room) {
		                	var $li = $('<li class="clearfix"></li>').attr('data-room-id', room.room_idx);
		                    var $aboutDiv = $('<div class="about"></div>');
		                    var $nameDiv = $('<div class="name"></div>').text(room.title);
		                    var $statusDiv = $('<div class="status"><i class="fa fa-circle offline"></i></div>').append(room.opened_at);
							
		                    if (room.title === null || room.title === '') {
		                        $nameDiv.text("New Chat");
		                    } else {
		                        $nameDiv.text(room.title);
		                    }
		                    
		                    // 요소를 조립합니다.
		                    $aboutDiv.append($nameDiv).append($statusDiv);
		                    $li.append($aboutDiv);
		                    $chatList.append($li);
		                    
		                 // 클릭 이벤트 핸들러를 추가합니다.
		                    $li.on('click', function() {
		                        var selectedRoomId = $(this).attr('data-room-id');
		                        // 여기에서 선택된 방 ID를 사용하여 방에 입장합니다.
		                        // 예: 특정 URL로 이동
		                        getTalk(selectedRoomId);
		                        // 또는 AJAX 요청을 통해 방의 내용을 로드할 수도 있습니다.
		                    });
		                });
		            }, error: function (){
		    			alert("불러오기 오류");
		    		}
		    	});
	    	}
	    });
	    
	    function getTalk(selectedRoomId){
	    	roomIdx = selectedRoomId;
    		$.ajax({
    			url : "${cpath}/aitalk/getTalk",
    			type : "get",
    			data : {"room_idx" : selectedRoomId},
    			success : function (data){
    				console.log(data);
    				var $talkList = $(".talk-list");
    				var $chatHistory = $(".chat-history");
    	            $talkList.empty();
    	            
    	         // 서버에서 받은 데이터를 사용하여 각 메시지에 대한 li 요소를 생성합니다.
    	            data.forEach(function(talk) {
    	                var $li = $('<li class="clearfix"></li>');
    	                var $messageData, $messageDiv;

    	                if (talk.username === username) {
    	                    // 유저일 경우 오른쪽에 메시지를 표시합니다.
    	                    $messageData = $('<div class="message-data text-right"></div>');
    	                    $messageDiv = $('<div class="message other-message float-right"></div>').text(talk.talk);
    	                    $messageDiv.css('background-color', '#dfe6e9'); // 배경색 설정
    	                } else {
    	                    // 다른 사용자일 경우 왼쪽에 메시지를 표시합니다.
    	                    $messageData = $('<div class="message-data"></div>');
    	                    $messageDiv = $('<div class="message my-message"></div>').text(talk.talk);
    	                }

    	                var $timeSpan = $('<span class="message-data-time"></span>').text(talk.talked_at);

    	                // 요소를 조립합니다.
    	                $messageData.append($timeSpan);
    	                $li.append($messageData).append($messageDiv);
    	                $talkList.append($li);
    	            });

    	            // 채팅 창을 가장 최근 메시지로 스크롤합니다.
    	            $chatHistory.scrollTop($chatHistory[0].scrollHeight);
    			},
    			error : function (){
    				alert("톡 불러오기 오류");
    			}
    		});
    	}
	    
	    function getLanguage(){
	    	$.ajax({
	    		url : "${cpath}/member/find_lang",
	    		type : "get",
	    		data : {"username" : username},
	    		success : function(data){
	    			language = data.language;
	    			console.log("언어 받아오기 성공" + language);
	    		},
	    		error : function(){
	    			console.log("언어 가져오기 실패");
	    			language = "ENG";
	    		}
	    	});
	    }
	    
</script>


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