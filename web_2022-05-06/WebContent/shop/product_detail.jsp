<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>두두몰</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
        <link href="../css/logo.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
      	<%@ include file="../includes/navigation.jsp" %>
        <!-- Header-->
		<%@ include file="../includes/header.jsp" %>
        <!-- Section-->
        <section class="py-5">
            <div class="container col-xxl-8 px-4 py-5">
                <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
                  <div class="col-10 col-sm-8 col-lg-6 product_image" >                    
                  </div>
                  <div class="col-lg-6 product_detail">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                   		<button type="button" class="btn btn-primary btn-lg px-4 me-md-2" id="buy-btn">구매 하기</button>
                    	<c:if test="${loginUserInfo.id eq 'Admin1234'}">
                    		<button type="button" class="btn btn-secondary btn-lg px-4 me-md-2" id="update-btn">상품 수정</button>
                      		<button type="button" class="btn btn-danger btn-lg px-4 me-md-2" id="delete-btn">상품 삭제</button>
                    	</c:if> 
                    </div>
                  </div>
                </div>
              </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
        <script src="../js/functions.js"></script>
        <script src="../js/URLs.js"></script>
        <script src="../js/jquery-3.6.0.min.js"></script>
        <script>
	        let productId = getParameter("productId");
	     	$("#update-btn").on("click", function(){
	        	location.href="/shoppingmall/manager/product_form2.jsp?active=product_update&productId="+productId;
	        });
	        
			$("#delete-btn").on("click", function(){
				$.ajax({
		        	url: "/shoppingmall/product/delete",
		        	type: "post",
		        	data: "productId="+productId,
		        	success: function(){
		        		alert("상품이 삭제되었습니다.");
		        		location.href="/shoppingmall/shop/product_list.jsp?active=product_list&pageNumber=1"
		        	},
		        	error: function(){
		        		alert("상품이 삭제되지 않았습니다.");
		        	}
		        })
	
	        });            
        </script>
        <!-- 로그인을 하지 않고 구매 -->
        <c:if test="${loginUserInfo eq null}">
        	<script type="text/javascript">
        		$("#buy-btn").on("click", function(){
        			alert("로그인이 필요한 서비스입니다.");
        			location.href=LOGIN_PAGE;
        		})
        	</script>
        </c:if>
        <!-- 로그인을 하고 구매 -->
        <c:if test="${loginUserInfo ne null}">
        	<script type="text/javascript">
	        	let userId = "${loginUserInfo.id}";
        		$("#buy-btn").on("click", function(){
        			location.href="/shoppingmall/buy/form.jsp?active=buy&productId="+productId;
        		})
        	</script>
        </c:if>
        
        
        <script>
        $.ajax({
        	url: "/shoppingmall/product/detail",
        	type: "get",
        	data: "productId="+productId,
        	dataType: "json",
        	success: function(productInfo){
        		let productName = productInfo.productName;
        		let category = productInfo.category;
        		let price = productInfo.price;
        		let productImg = productInfo.productImg;
        		
        		let imgTag = "<img src=\"/shoppingmall/images/product/(1)\" class=\"d-block mx-lg-auto img-fluid\" alt=\"Bootstrap Themes\" width=\"700\" height=\"500\ loading=\"lazy\">";
        		
        		imgTag = imgTag.replace("(1)", productImg);
        		$(".product_image").prepend(imgTag);
        		
        		let infoTag = "<h1 class=\"display-5 fw-bold lh-1 mb-3\">(1)</h1>" +
                	"<p class=\"lead\">상품 소개 / Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit, featuring Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful JavaScript plugins.</p>" +
                	"<p class=\"lead\">(2)</p>" +
                	"<p class=\"lead\">(3) 원</p>";
                	
                infoTag = infoTag.replace("(1)", productName);
                infoTag = infoTag.replace("(2)", category);
                infoTag = infoTag.replace("(3)", price);				
               	$(".product_detail").prepend(infoTag);
        	},
        	error: function(){
        		
        	}
        })
        </script>
    </body>
</html>
