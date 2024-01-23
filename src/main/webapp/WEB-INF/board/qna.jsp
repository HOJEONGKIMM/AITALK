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
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

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
   		.paginate_button.active a {
			color: #D980FA;
		} 
   		

        .pagination a {
      
          margin:0 3px;
      
          float:left;
      
          border:1px solid #e6e6e6;
      
          width:28px;
      
          height:28px;
      
          line-height:28px;
      
          text-align:center;
      
          background-color:#fff;
      
          font-size:13px;
      
          color:black;
      
          text-decoration:none;
      
          font-weight:bold;


        }
        
		
		table {
		  border: 1px #a39485 solid;
		  font-size: .9em;
		  box-shadow: 0 2px 5px rgba(0,0,0,.25);
		  width: 100%;
		  border-collapse: collapse;
		  border-radius: 5px;
		  overflow: hidden;
		}
		
		th {
		  text-align: left;
		}
		  
		thead {
		  font-weight: bold;
		  color: #fff;
		  background: #D980FA;
		}
		  
		 td, th {
		  padding: 1em .5em;
		  vertical-align: middle;
		}
		  
		 td {
		  border-bottom: 1px solid rgba(0,0,0,.1);
		  background: #fff;
		}
		
		a {
		  color: #73685d;
		}
		  
		 @media all and (max-width: 768px) {
		    
		  table, thead, tbody, th, td, tr {
		    display: block;
		  }
		  
		  th {
		    text-align: right;
		  }
		  
		  table {
		    position: relative; 
		    padding-bottom: 0;
		    border: none;
		    box-shadow: 0 0 10px rgba(0,0,0,.2);
		  }
		  
		  thead {
		    float: left;
		    white-space: nowrap;
		  }
		  
		  tbody {
		    overflow-x: auto;
		    overflow-y: hidden;
		    position: relative;
		    white-space: nowrap;
		  }
		  
		  tr {
		    display: inline-block;
		    vertical-align: top;
		  }
		  
		  th {
		    border-bottom: 1px solid #a39485;
		  }
		  
		  td {
		    border-bottom: 1px solid #e5e5e5;
		  }        
        
        
        /* 각 요소를 인라인 블록 요소로 설정 */
	    .cmt_list li .username_div,
	    .cmt_list li .content_div,
	    .cmt_list li .indate_div,
	    .cmt_list li button {
	        display: inline-block;
	    }
	
	    /* 버튼 사이의 간격을 조절 */
	    .cmt_list li button {
	        margin: 2px;
	    }
	
	    /* 버튼의 글자색을 검정색으로 설정 */
	    .cmt_list li button {
	        color: black;
	    }
	
	    /* 버튼를 오른쪽으로 플로팅 */
	    .cmt_list li button {
	        float: right;
	    }
    </style>
    
</head>
<body>
    <!--? Preloader Start -->
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
                                    <h1 data-animation="bounceIn" data-delay="0.2s">학습 Q&A</h1>
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
        <!--? Blog Area Start-->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0" id=""> 
						  <div class="card" style="border: 0px;">
						    <div class="card-header" style="padding: 20px; padding-bottom: 0px; background: white;">
								  <div class="container">
								    <h1 style="margin-top: 8px; text-align: center; color: #D980FA;">학습 Q&A</h1>
								  </div>
							</div>
						    <div class="card-body" id="card-body">
						    	<div class="row">
						    		<table class="table table-bordered table-hover" id="list-table">
			    						<thead>
			    							<th>번호</th>
			    							<th>제목</th>
			    							<th>작성일</th>
			    							<th>조회수</th>
			    						</thead>
			    						
			    						<!-- 바꿈 시작 -->
										<tbody>
											<c:if test="${pageMaker2.criteria.keyword ne ''}">
												<c:forEach var="board" items="${list}" varStatus="i">
													<tr>
														<td>${i.count}</td>
														<td><a class="shareLink" id="bd_click" href="${board.board_idx}" style="color: black;">${board.title}</a></td>
														<td><fmt:formatDate value="${board.indate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${board.count}</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:forEach var="board" items="${list2}" varStatus="i">
												<tr>
													<td>${board.board_idx}</td>
													<td><a href="${board.board_idx}" style="color: black;">${board.title}</a></td>
													<td><fmt:formatDate value="${board.indate}"
															pattern="yyyy-MM-dd" /></td>
													<td>${board.count}</td>
												</tr>
											</c:forEach>
										</tbody>

			    					</table>
			    					<div style="display: flex; justify-content: space-between; align-items: center; width: 100%; height: 100%;">
			    						<c:if test="${user.member.username ne null}">
				    					<div style="text-align: right;"> <!-- 이 div를 추가하여 버튼을 오른쪽 정렬 -->
										    <button id="newPostButton" class="btn btn-primary" data-oper="create">새 글 쓰기</button>
										</div> 
						    			</c:if>
						    	  
								<!-- 페이징 -->                            
							      <c:if test="${pageMaker.criteria.keyword eq '' }">                            
							          <div >
							           <ul class="pagination">                 
							                                          <!-- 이전버튼처리 -->
							              <c:if test="${pageMaker.prev}">
							                 <li class="paginate_button previous">
							                    <a href="${pageMaker.startPage - 1}">◀</a>
							                 </li>
							              </c:if>
							              <!-- 페이지번호 처리 -->
							             <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							                
							                <c:if test="${pageMaker.criteria.page == pageNum }">
							                   <li class="paginate_button active"><a href="${pageNum}">${pageNum}</a></li>
							                </c:if>
							                
							                <c:if test="${pageMaker.criteria.page != pageNum }">
							                   <li class="paginate_button"><a href="${pageNum}">${pageNum}</a></li>
							                </c:if>
							             </c:forEach>
							             <!-- 다음버튼처리 --> 
							             <c:if test="${pageMaker.next}">
							                 <li class="paginate_button previous">
							                    <a href="${pageMaker.endPage + 1}">▶</a>
							                 </li>
							              </c:if>
							         </ul>
							           
							           <form action="${cpath}/board/qna" id="pageFrm">
							              <input type="hidden" id="page" name="page" value="${pageMaker.criteria.page}">           
							              <input type="hidden" id="perPageNum" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
							              <!-- type과 keyword를 넘기기위한 부분 추가 -->
							              <input type="hidden" name="type" value="${pageMaker.criteria.type}">           
							              <input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">           
							           </form>
							         </div>
							         </c:if>
							         
							         <!-- 페이징 -->
							      <c:if test="${pageMaker2.criteria.keyword ne null}">                            
							          <div >
							           <ul class="pagination">                 
							                                          <!-- 이전버튼처리 -->
							              <c:if test="${pageMaker2.prev}">
							                 <li class="paginate_button previous">
							                    <a href="${pageMaker2.startPage - 1}">◀</a>
							                 </li>
							              </c:if>
							              <!-- 페이지번호 처리 -->
							             <c:forEach var="pageNum" begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}">
							                
							                <c:if test="${pageMaker2.criteria.page == pageNum }">
							                   <li class="paginate_button active"><a href="${pageNum}">${pageNum}</a></li>
							                </c:if>
							                
							                <c:if test="${pageMaker2.criteria.page != pageNum }">
							                   <li class="paginate_button"><a href="${pageNum}">${pageNum}</a></li>
							                </c:if>
							             </c:forEach>
							             <!-- 다음버튼처리 --> 
							             <c:if test="${pageMaker2.next}">
							                 <li class="paginate_button previous">
							                    <a href="${pageMaker2.endPage + 1}">▶</a>
							                 </li>
							              </c:if>
							         </ul>
							           
							           <form action="${cpath}/board/qna" id="pageFrm" method="post">
							              <input type="hidden" id="page" name="page" value="${pageMaker2.criteria.page}">           
							              <input type="hidden" id="perPageNum" name="perPageNum" value="${pageMaker2.criteria.perPageNum}">
							              <!-- type과 keyword를 넘기기위한 부분 추가 -->
							              <input type="hidden" name="type" value="${pageMaker2.criteria.type}">           
							              <input type="hidden" name="keyword" value="${pageMaker2.criteria.keyword}">           
							           </form>
							         </div>
							         </c:if>   
							     </div>    
							   </div>
						    </div> 	
						  </div>
						  
						<div id="newPostForm" class="col-lg-15" style="display: none;">
			    			<div class="card" style="min-height: 500px; max-height: 1000px;">
			    				<div class="card-body">
			    					<form id="regForm" action="${cpath}/board/register" method="post" enctype="multipart/form-data">
			    						<input type="hidden" name="category" value="qna">
			    						<input type="hidden" id="board_idx" name="board_idx" value="${board.board_idx}">
			    						
			    						<div class="form-group">
			    							<label for="title">제목</label>
			    							<input type="text" class="form-control" id="title" name="title" placeholder="Enter Title">
			    						</div>
			    						<div class="form-group">
			    							<label for="content">내용</label>
			    							<textarea id="content" name="content" class="form-control" placeholder="Enter Content" rows="7" cols=""></textarea>
			    						</div>
			    						
			    						<!-- 파일 업로드 필드 -->
			                            <div id="fileUploadDiv" style="display: block;">
			                                <input type="file" name="file" multiple>
			                            </div>                                 
			                            <div>
			                               <!-- 이미지를 표시할 img 태그 추가 -->
			                               <img id="displayImage" name="file" src="" alt="" style="max-width: 30%; max-height: 30%;">
			                            </div>
										
										<br>                                  
                                  		<br>
										
			    						<div class="form-group">
			    							<label for="username">작성자</label>
			    						</div>
			    							<input readonly="readonly" type="text" class="form-control" id="username" name="username" value="${user.member.username}" placeholder="Enter Writer">
			    							<br>
			    						<div id="regDiv">
			    							<button class="btn btn-sm btn-primary" data-oper="list" type="button">목록</button>
				    						<button type="button" data-oper="register" class="btn btn-sm btn-primary">등록</button>
				    						<button type="button" data-oper="reset" class="btn btn-sm btn-warning">취소</button>
			    						</div>
			    						
			    						<div id="updateDiv" style="display: none;">
			    							<button class="btn btn-sm btn-primary" data-oper="list" type="button">목록</button>
			    							<span id="update">
			    							<button class="btn btn-sm btn-warning" data-oper="updateForm" type="button">수정</button>
			    							</span>
			    							<button class="btn btn-sm btn-success" data-oper="remove" type="button">삭제</button>
			    						</div>
			    					</form>
			    				</div>
			    						
			    				
			    			</div>
			    		</div>
			    		<c:if test="${user.member.username ne null}">
			    		<!-- 댓글 기능 -->
			    		<div id="commentSection" class="card-body" style="display: none;">
							<h5>댓글</h5>
							<div id="commentList">
								<div id="commentResult" class="comment" style="margin-bottom: 20px; padding: 15px; border: 1px solid #ddd; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); border-radius: 5px; background-color: #fff">
								</div>
							</div>
								<div id="commentForm">
									<textarea id="commentContent" name="content" style="width: 100%; height: 100px"></textarea>
									<button onclick="addComment()" style="float: right; color: black; margin-left: 10px; border: 1px solid black;">댓글 작성</button>
								</div>
						   </div>
						   <!-- 댓글 기능 끝 -->
						   </c:if>
						  
                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget search_widget">
                                <form action="${cpath}/board/qna" method="post">
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                        
                                        	<div class="form-group">
		                                      <select name="type" class="form-control">
		                                         <option value="username" ${pageMaker2.criteria.type=='username' ? 'selected' : ''}>이름</option>
		                                         <option value="title" ${pageMaker2.criteria.type=='title' ? 'selected' : ''}>제목</option>
		                                         <option value="content" ${pageMaker2.criteria.type=='content' ? 'selected' : ''}>내용</option>
		                                      </select>
		                                    </div>  
                                        
                                            <input type="text" class="form-control" placeholder="검색" name="keyword" value="${pageMaker2.criteria.keyword}"
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = '검색'">
                                        </div>
                                    </div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">검색</button>
                                </form>
                                
                            <!-- 바꿈 끝 -->
                            
                            </aside>
                            <aside class="single_sidebar_widget post_category_widget">
                                <h4 class="widget_title" style="color: #2d2d2d;">Category</h4>
                                <ul class="list cat-list">
                                    <li>
                                        <a href="${cpath}/board/notice" class="d-flex">
                                            <p>공지사항 </p>
                                            <c:set var="counts" value="0" />
                                            <c:forEach var="board" items="${AllList}">
	                                            <c:if test="${board.category eq 'notice'}">
	                                 	           <c:set var="counts" value="${counts + 1}" />
	                                            </c:if>
	                                        </c:forEach>
                                 	        <p>(${counts})</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${cpath}/board/share" class="d-flex">
                                            <p>공부법 공유</p>
                                            <c:set var="counts" value="0" />
                                            <c:forEach var="board" items="${AllList}">
	                                            <c:if test="${board.category eq 'share'}">
	                                 	           <c:set var="counts" value="${counts + 1}" />
	                                            </c:if>
	                                        </c:forEach>
                                 	        <p>(${counts})</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${cpath}/board/qna" class="d-flex">
                                            <p>학습 Q&A </p>
                                            <c:set var="counts" value="0" />
                                            <c:forEach var="board" items="${AllList}">
	                                            <c:if test="${board.category eq 'qna'}">
	                                 	           <c:set var="counts" value="${counts + 1}" />
	                                            </c:if>
	                                        </c:forEach>
                                 	        <p>(${counts})</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${cpath}/board/review" class="d-flex">
                                            <p>학습 후기 </p>
                                            <c:set var="counts" value="0" />
                                            <c:forEach var="board" items="${AllList}">
	                                            <c:if test="${board.category eq 'review'}">
	                                 	           <c:set var="counts" value="${counts + 1}" />
	                                            </c:if>
	                                        </c:forEach>
                                 	        <p>(${counts})</p>
                                        </a>
                                    </li>
                                </ul>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Area End -->
        <script type="text/javascript">
		    // a tag 클릭시 상세보기
		    var board_idx;
		    var isEditing = false; // 함수 실행 여부를 체크하는 변수
		    var username = '${user.member.username}';
		    $(document).ready(function () {
		        $(".shareLink").on("click", function (e) {
		            e.preventDefault();
		            var idx = $(this).attr("href");
		            board_idx = idx;
		            $.ajax({
		                url: "${cpath}/board/get",
		                type: "get",
		                data: {"board_idx": idx},
		                dataType: "json",
		                success: function (data) {
		                    currentVo = data; // vo를 함수 외부 변수에 저장
		                    printBoard(data);
		                    $("#commentSection").show();
		                 	// 파일 업로드 필드 숨기기
		                    $("#fileUploadDiv").hide();
		                 	$("#displayImage").show();
		                },
                      error: function (request, status, error) {
                        console.log("code: " + request.status)
                        console.log("message: " + request.responseText)
                        console.log("error: " + error);
                        alert("error 게시글");
                      }

                    });
		            
		            $.ajax({
		                url: "${cpath}/board/UpdateCount",
		                type: "put",
		                data: { "board_idx": idx },
		                dataType: "text",
		                success: function () {
		                },                
		                error: function () { alert("error 조회수"); }
		            });
		            
		            loadComments();
		            
		        });
		        
		        var regForm = $("#regForm");
		        
		        $("button").on("click", function(){
		  			console.log('check')
		  			var oper = $(this).data("oper");
		  			
		  			if(oper == "register"){
		  				regForm.submit();		
		  			}else if(oper == "reset"){
		  				regForm[0].reset();
		  			}else if(oper == "list"){
		  				location.href = "${cpath}/board/qna";
		  			}else if(oper == "remove"){
		  				if (currentVo) {
		  	                location.href = "${cpath}/board/remove?board_idx=" + currentVo.board_idx;
		  	            } else {
		  	                alert("오류");
		  	            }
		  			}else if(oper == "updateForm"){
		  				regForm.find("#title").attr("readonly", false);
		  				regForm.find("#content").attr("readonly", false);
		  				var upBtn = "<button onclick='goUpdate()' class='btn btn-sm btn-info' type='button'>수정완료</button>";
		  				$("#update").html(upBtn);
		  			}else if(oper == "create"){
		  				$("#newPostForm").css("display","block");
		  				$("#card-body").hide();
		  				$("#commentSection").hide(); // 댓글 섹션 숨기기
		  				// 파일 업로드 필드 보이기
		  		        $("#fileUploadDiv").show();
		  		        $("#displayImage").hide();
		  		        
		  			}
		  			
		  		});
		        
		    });
			
		    function printBoard(board) {
		    	$("#card-body").hide();

		    	var newPostForm = $("#newPostForm");
		    	
		    	if (newPostForm.css("display") === "none") {
		    	    newPostForm.css("display", "block");
		    	} else {
		    	    newPostForm.css("display", "none");
		    	}
		    	
		        var regForm = $("#regForm");
		        console.log(board);
		        console.log(board.title);
		        console.log(board.file);
		        
		        regForm.find("#title").val(board.title);
		        regForm.find("#content").val(board.content);
		        regForm.find("#username").val(board.username);
		
		    	// JSON 문자열을 파싱하여 배열로 변환하고 첫 번째 요소를 사용합니다.
			    var fileUrls = board.fileURLs ? JSON.parse(board.fileURLs) : [];
			    var imageUrl = fileUrls.length > 0 ? fileUrls[0] : '';
			 
			    if (imageUrl) {
			        $("#displayImage").attr("src", imageUrl).show();
			    } else {
			        $("#displayImage").removeAttr("src").hide();
			    }
		
			    regForm.find("input, textarea").attr("readonly", true);
			    
		        
		        $("#regDiv").css("display", "none");
		        $("#updateDiv").css("display", "block");
				
		        regForm.find("#board_idx").val(board.board_idx);
		        if ("${user.member.username}" === board.username) {
		        	$("button[data-oper='updateForm']").attr("disabled", false);
		            $("button[data-oper='remove']").attr("disabled", false);
		        } else {
		            $("button[data-oper='updateForm']").attr("disabled", true);
		            $("button[data-oper='remove']").attr("disabled", true);
		        }
		        
		    }
		    
		    function goUpdate(){
		  		var regForm = $("#regForm");
		  		regForm.attr("action", "${cpath}/board/modify");
		  		regForm.submit();
		  		$("#fileUploadDiv").css("display","none");
		  	}
		    
	      $(document).ready(function(){
	          
	          // 페이지 번호 클릭 시 이동하기
	          var pageFrm = $("#pageFrm");
	          
	          
	          $(".paginate_button a").on("click", function(e){
	              // e -> 현재 클릭한 a태크 요소 자체
	              e.preventDefault(); // a태그의 href속성 작동 막기
	              var page = $(this).attr("href"); // 클릭한 a태그의 href값 가져오기
	              pageFrm.find("#page").val(page);
	              pageFrm.submit();
	           });
	          
	       });
		    
	   	  
	    function addComment() {
	    	
	    	var user_id = '${user.member.username}';
	    	var content = $("#commentContent").val();
	    	
	    	$.ajax({
	    		url : "${cpath}/comment/add",
	    		type : "post",
	    		data : {"board_idx" : board_idx,
	    				"username" : user_id,
	    				"content" : content},
	    		success : function() {
					$("#commentContent").val('');										
	    			loadComments();
				},
	    		error: function() {
                    alert("작성 실패");
                }
	    	});
	    	
  		}
	    
	    function loadComments() {
	    	// 게시글 가져올때 댓글도 가져오기
            $.ajax({
                url: "${cpath}/comment/get",
                type: "get",
                data: {"board_idx": board_idx},
                success: function (data) {
                    console.log(data);
					
                    var newHtml = "";
                    
                    $.each(data, function(index, obj){
                        var formattedDate = moment(obj.indate).format('YYYY-MM-DD');
                        newHtml += "<ul class='cmt_list'>";
                        newHtml += "<li class='up-content' style='border: 1px solid #e1e1e1; margin-bottom: 15px; padding: 10px; border-radius: 4px; background-color: #fafafa;'>";
                        newHtml += "<div class='username_div' style='width: 10%; font-weight: bold; color: #333;'>" + obj.username + "</div>";
                        newHtml += "<div class='content_div' id='content_div_"+ obj.comment_idx +"' style='width: 40%; color: #666; font-size: 14px;'>" + obj.content + "</div>";
                        newHtml += "<div class='indate_div' style='width: 20%; color: #999; font-size: 12px;'>" + formattedDate + "</div>";
                        newHtml += "<div class='btn_div' style='margin-left: 3px; margin-bottom: 31px; width: 100%;'>";
                        if(username === obj.username) {
	                        newHtml += "<button id='deleteBtn_" + obj.comment_idx + "' style='float: right; color: black; margin: 2px; border: 1px solid black;' onclick='deleteComment(" + obj.comment_idx + ")'>삭제</button>";
	                        newHtml += "<button id='editBtn_" + obj.comment_idx + "' style='float: right; color: black; margin: 2px; border: 1px solid black;' onclick='editComment(" + obj.comment_idx + ")'>수정</button>";
	                        newHtml += "<button id='saveBtn_" + obj.comment_idx + "' onclick='saveComment(" + obj.comment_idx + ")' style='display: none; float: right; color: black; margin: 2px; border: 1px solid black;'>수정 완료</button>";
	                        newHtml += "<button id='cancelBtn_" + obj.comment_idx + "' onclick='cancelComment(" + obj.comment_idx + ")' style='display: none; float: right; color: black; margin: 2px; border: 1px solid black;'>수정 취소</button>";
                        }
                        newHtml += "</div>";
                        newHtml += "</li>";
                        newHtml += "</ul>";
                     });
                    $("#commentResult").html(newHtml);
                },
                error: function () { alert("error댓글"); }
            });
		}
	    
	    function editComment(commentIdx){
	    	if (isEditing) {
	            return; // 이미 실행 중인 경우 함수를 종료
	        }

	        isEditing = true; // 함수가 실행 중임을 표시
	        var user_id = '${user.member.username}';
	        
	    	$("#editBtn_"+commentIdx).css("display", "none");
	    	$("#deleteBtn_"+commentIdx).css("display", "none");
	    	$("#saveBtn_"+commentIdx).css("display", "block");
	    	$("#cancelBtn_"+commentIdx).css("display", "block");
	    	
	    	var contentElement = $("#content_div_" + commentIdx);
	    	var content = contentElement.text();
	    	contentElement.empty(); // <div>의 내용을 비웁니다.

	    	var textAreaElement = $("<textarea id='commentTextArea_" + commentIdx + "'></textarea>");
	    	textAreaElement.val(content); // <textarea>의 값으로 기존 내용을 설정합니다.

	    	contentElement.append(textAreaElement); // <div>에 <textarea>를 추가합니다.
	    }
	    
	    function deleteComment(commentIdx){
	    	
	    	var user_id = '${user.member.username}';
	    	$.ajax({
	            url: "${cpath}/comment/delete",
	            type: "post",
	            data: {
	                "username": user_id,
	                "comment_idx": commentIdx
	            },
	            success: function () {
	                loadComments();
	            },
	            error: function () {
	                alert("삭제 실패");
	            }
	        });
	    }
	    
	    function cancelComment(commentIdx) {
	    	isEditing = false;
	    	loadComments();
		}
	   	  
	    function saveComment(commentIdx){
	    	var editedContent = $("#commentTextArea_" + commentIdx).val(); // 수정된 내용을 가져옵니다.
	    	var user_id = '${user.member.username}';
	    	
	    	$.ajax({
	    		url : "${cpath}/comment/update",
	    		type : "post",
	    		data : {
	    			"comment_idx" : commentIdx,
	    			"username" : user_id,
	    			"content" : editedContent
	    		},
	    		success: function(){
	    			isEditing = false;
	    			loadComments();
	    			console.log("댓글수정성공");
	    		},error: function(){
	    			console.log("댓글수정실패");
	    		}
	    	});
	    }
	   	  
		</script>
    </main>
    <%@ include file="../footer.jsp" %>
      <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    <!-- JS here -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script> 
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