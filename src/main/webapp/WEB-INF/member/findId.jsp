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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${cpath}/resources/css/login.css">
</head>
<body>
	<form action="">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="https://colorlib.com/etc/lf/Login_v1/images/img-01.png" alt="IMG" id="logo-img">
				</div>
				<!-- <form class="login100-form validate-form" method="post"> -->
				<div "login100-form validate-form">
					<span class="login100-form-title" style="font-weight: bold; letter-spacing: 2px;">
						<a href="${cpath}/member/findId" data-oper="ID">Forgot ID</a>  <a href="${cpath}/member/findPw" data-oper="PW">Forgot PW</a>
					</span>
					
					<div class="box6" id="radioContent" border: 1px;">
						<div id="div_regMobile" class="box_inn">
						
							<label for="r_pn1" class="label_rd">
							<!-- 라디오 버튼 -->
							<input type="radio" id="r_pn1" name="authType" onclick="selectAuthType('regMobile')" class="input_rd">
								<b>"회원정보에 등록한 휴대전화로 인증"</b>
								<div class="box_inn_sub" id="sub_mobile" style="display: none">
									<dl>
										<dt>
											<label for="nm" class="label_txt">이름</label>
										</dt>
										<dd>
											<input class="input100" type="text" id="name1" name="name1" maxlength="40" class="input_txt">
										</dd>
										<dt>
											<label for="mob2" class="label_txt">휴대전화</label>
										</dt>
										<dd>
											<input class="input100" type="txt" id="phone" name="phone" maxlength="100" class="input_txt">
										</dd>
									</dl>
								</div>
							</label>
						</div>
						
						<div id="div_regEmail" class="box_inn">
							
							<label for="r_pn2" class="label_rd">
							<!-- 라디오 버튼 -->
							<input type="radio" id="r_pn2" name="authType" onclick="selectAuthType('regEmail')" class="input_rd">
								<b>"본인확인 이메일로 인증"</b>
								<div class="box_inn_sub" id="sub_email" style="display: none">
									<dl>
										<dt>
											<label for="t_nm1" class="label_txt">이름</label>
										</dt>
										<dd>
											<input class="input100" type="text" id="name2" name="name2" maxlength="40" class="input_txt">
										</dd>
										<dt>
											<label for="t_ml1" class="label_txt">이메일 주소</label>
										</dt>
										<dd>
											<input class="input100" type="txt" id="email" name="email" maxlength="100" class="input_txt">
										</dd>
									</dl>
								</div>
							</label>
						</div>
						
					</div>
					
					<div>
						<div id="h2_div" style="display: none;">
							<h4 id="my_h2" style="font-weight: bold; text-align: center;"></h4>
						</div>
					</div>

					<div class="container-login100-form-btn" id="check_id_info">
						<button class="login100-form-btn" type="button" onclick="checkBtn()">
							확인
						</button>
					</div>
					
					<div class="container-login100-form-btn" id="login_findPw" style="display: none; width: 320px; margin-top: 20px;">
						<button class="login100-form-btn" type="button" onclick="login()" style="width: 150px; float: left; margin-right: 10px;">
							로그인 하기
						</button>
						<button class="login100-form-btn" type="button" onclick="pwFind()" style="width: 150px;">
							비밀번호 찾기
						</button>
					</div>

					<div class="text-center p-t-136">
					</div>
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
	</form>
	
	<input type="hidden" id="checkType" value="">
	
	<script type="text/javascript">
		$(document).ready(function () {
		    $("#logo-img").click(function () {
		        window.location.href = "${cpath}/member/login";
		    });
		});
	</script>
		
	<script type="text/javascript">
		function selectAuthType(type) {
			
		    if (type === 'regMobile') {
		    	console.log("모바일");
		    	$("#sub_mobile").css("display", "block");
		        $("#sub_email").css("display", "none");
		        
		        $("#checkType").val("1");
		    } else if (type === 'regEmail') {
		    	console.log("이메일");
		    	$("#sub_email").css("display", "block");
		        $("#sub_mobile").css("display", "none");
		        
		        $("#checkType").val("2");
		    }
		}
		
		function checkBtn(){
            var checkType =  $("#checkType").val();
            
            if(checkType == 1){
            	var input_name1 = $("#name1").val();
	        	var input_phone = $("#phone").val();
	        	
	        	$.ajax({
	        		url : "${cpath}/member/mobileId",
	        		type : "post",
	        		data : {"fullname" : input_name1,
	        				"phone" : input_phone},
	        		success : function(response){
	        			if(typeof response[0] === "undefined"){
	        				alert("다시 한번 확인해주세요.");
	        			}else{
	        				findId(response[0].username);
	        			}
	        		}
	        	});
            }else{
	        	var input_name2 = $("#name2").val();
	        	var input_email = $("#email").val();
	        	
	        	$.ajax({
	        		url : "${cpath}/member/emailId",
	        		type : "post",
	        		data : {"fullname" : input_name2,
	        				"email" : input_email},
	        		success : function(response){
	        			if(typeof response[0] === "undefined"){
	        				alert("다시 한번 확인해주세요.");
	        			}else{
	        				findId(response[0].username);
	        			}
	        		}
	        	});
            }
		}
		
		function findId(username){
			$("#radioContent").css("display","none");
			$("#check_id_info").css("display","none");
			
			var h4Element = document.getElementById("my_h2");
			h4Element.textContent = "아이디 : "+ username;
			
			$("#h2_div").css("display","block");
			$("#login_findPw").css("display","block");
			
		}
		
		function login(){
			window.location.href = "${cpath}/member/login";
		}
		
		function pwFind(){
			window.location.href = "${cpath}/member/findPw";
		}
		
	</script>
		
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