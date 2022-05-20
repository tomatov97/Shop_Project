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
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
        <link href="../css/logo.css" rel="stylesheet" />
        <link href="../css/product_list.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
		<%@ include file="../includes/navigation.jsp" %>
        <!-- Header-->
        <%@ include file="../includes/header.jsp" %>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="product_list_wrapper">
                    
                </div>
                
                <nav id="pagination_wrapper" aria-label="Page navigation example">
				  <ul class="pagination pagination-lg">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/shoppingmall/js/scripts.js"></script>
        <script src="/shoppingmall/js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
        	let pageNumber=1;
        	
        	let parameters = location.search;
        	parameters = parameters.substr(1);
        	parameters = parameters.split("&");
        	
        	let pageNumberParam = parameters[1];
        	pageNumberParam = pageNumberParam.split("=");
        	
        	pageNumber = pageNumberParam[1];
        
        	$.ajax({
        		url: "http://localhost/shoppingmall/product/list",
        		type: "get",
        		data: "pageNumber="+pageNumber,
        		datatype: "json",
        		success: function(productInfo){
        			let amount = productInfo.amount;
        			let productList = productInfo.productList;
        			
        			let pageCount = Math.ceil(amount/8);
        			for(let count=1; count<=pageCount; count++) {
        				$("ul.pagination").append("<li class=\"page-item\"><a class=\"page-link\" href=\"/shoppingmall/shop/product_list.jsp?active=product_list&pageNumber="+count+"\">"+count+"</a></li>");
        			}
        			
        			let tag = "<div class=\"col mb-5\">" +
                    "<div class=\"card h-100\">" +
                    <!-- Product image-->
                    "<img class=\"card-img-top\" src=\"/shoppingmall/images/product/(1)\" alt=\"...\" />" +
                    <!-- Product details-->
                    "<div class=\"card-body p-4\">" +
                        "<div class=\"text-center\">" +
                            <!-- Product name-->
                            "<h5 class=\"fw-bolder\">(2)</h5>" +
                            <!-- Product reviews-->
                            "<div class=\"d-flex justify-content-center small text-warning mb-2\">"+
                                "<div class=\"bi-star-fill\"></div>"+
                                "<div class=\"bi-star-fill\"></div>"+
                                "<div class=\"bi-star-fill\"></div>"+
                                "<div class=\"bi-star-fill\"></div>"+
                                "<div class=\"bi-star-fill\"></div>"+
                            "</div>(3)</div>"+
                    "</div>"+
                    <!-- Product actions-->
                    "<div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">"+
                        "<div class=\"text-center\">"+
                        	"<a class=\"btn btn-outline-dark mt-auto\" href=\"/shoppingmall/shop/product_detail.jsp?active=product_detail&productId=(4)\">상세 정보</a>"+
                        	"<a class=\"btn btn-outline-dark mt-auto\" href=\"#\">카드에 담기</a>"+
                        "</div>"+
                    "</div>"+
                "</div>"+
            "</div>"
					for (let i=0; i<productList.length; i++) {
						let nthProduct = productList[i];
						console.log(nthProduct);
						
						let nthTag = tag.replace("(1)", nthProduct.productImg);
						nthTag = nthTag.replace("(2)", nthProduct.productName);
						nthTag = nthTag.replace("(3)", nthProduct.price);
						nthTag = nthTag.replace("(4)", nthProduct.productId);
						
						$("#product_list_wrapper").append(nthTag);
					}
        		},
        		error: function(){
        			alert("에러발생!");
        		}
        		
        	})
        	
        	// 이클립스 > project > clean
        	// tomcat > clean
        	// tomcat > clean tomcat work directory
        	// 를 진행하면 상품 등록처럼 업로드한 파일은 모두 사라짐
        </script>
    </body>
</html>
