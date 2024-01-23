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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<link rel="stylesheet" href="${cpath}/resources/css/login.css">
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login10" >
				<div class="login100-pic js-tilt" data-tilt>
					<img src="https://colorlib.com/etc/lf/Login_v1/images/img-01.png" width="290px" height="290px"  alt="IMG" id="logo-img">
				</div>
							
				<!-- 비밀번호 확인 -->
				<form class="login100-form validate-form" id="passwordcheck-form" >
					<br>
						<input class="input100" id="username" name="username" type="hidden"
							placeholder="ID" value="${user.member.username}">

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" id="password"
							name="password" placeholder="Password"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="container-login100-form-btn">
						<button id="passwordcheck-submit" type="submit" class="login100-form-btn">password check</button>
					</div>
					<br>
					<a class="login100-form-btn" style="background-color: #8e44ad;" href="${cpath}/" width="290px" height="50px" >home</a>
					<br>
				</form>

				<!-- 개인정보 수정 -->	
				<form class="login100-form validate-form" action="${cpath}/member/modify" method="post" id="modify-form">
					<br>
						<input class="input100" id="username" name="username" type="hidden"
							placeholder="ID" value="${user.member.username}">
					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" value="${user.password}"
							name="password" placeholder="Password"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Address is required">
						<input class="input100" type="text" id="addr" name="addr" placeholder="Address" >
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-map-marker" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Age is required">
						<input class="input100" type="number" id="age" name="age" placeholder="Age">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Email is required">
						<input class="input100" type="email" id="email" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Name is required">
						<input class="input100" type="text" id="fullname" name="fullname" placeholder="Name">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-id-card-o" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Phone is required">
						<input class="input100" type="text" id="phone" name="phone" placeholder="Phone">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-mobile" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Gender is required">
						<input class="input100" type="text" id="gender" name="gender" placeholder="Gender">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-venus-mars" aria-hidden="true"></i>
						</span>
					</div>
					<input type="hidden" id="role" name="role" value="MEMBER">					

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Edit
						</button>
					</div>
					<br>
					<a class="login100-form-btn" style="background-color: #8e44ad;" href="${cpath}/" width="290px" height="50px" >home</a>
					<br>
					<div class="text-center p-t-136">
					</div>
				</form>				
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			var username = '${user.member.username}';
            $("#modify-form").hide();
			$.ajax({
		    	url : "${cpath}/member/viewInfo",
		    	type : "post",
		    	data : {"username": username},
		    	success : function(response){
		    		$("#addr").val(response["addr"]);
		    		$("#age").val(response["age"]);
		    		$("#email").val(response["email"]);
		    		$("#fullname").val(response["fullname"]);
		    		$("#phone").val(response["phone"]);
		    		$("#gender").val(response["gender"]);
		    	}
		    });
		    $("#logo-img").click(function () {
		        window.location.href = "${cpath}/";
		    });
		});
		
	    // 비밀번호 일치확인
	    $(document).ready(function () {
	        $("#passwordcheck-form").submit(function (e) {
	            e.preventDefault();

	            var inputPassword = $("#password").val();
	            
	            var username = '${user.member.username}';

	            $.ajax({
	                url: "${cpath}/member/passwordcheck", // 서버 측 비밀번호 확인 엔드포인트
	                type: "post",
	                data: {
	                    "inputPassword": inputPassword,
	                    "username": username
	                },
	                success: function(data) {
	                    if (data) {
	                        $("#modify-form").show();
	                        $("#passwordcheck-form").hide();
	                    } else {
	                        alert("비밀번호가 일치하지 않습니다.");
	                    }
	                },
	                error: function() {
	                    alert("서버 요청 오류");
	                }
	            });
	        });
	    });	    
	    
		
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