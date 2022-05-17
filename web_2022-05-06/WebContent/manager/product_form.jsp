<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="controller" value="/shoppingmall/product/add" />
<c:set var="btn_title" value="상품 등록" />

<c:if test="${param.active eq 'product_update'}">
	<c:set var="controller" value="/shoppingmall/product/update" />
	<c:set var="btn_title" value="상품 수정" />
</c:if>

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
        <link rel="stylesheet" href="../css/product_form.css">
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
                  <div class="col-lg">
                    <form action="${controller }" method="post" enctype="multipart/form-data">
                    	<input type="hidden" name="productId" value="${param.productId }">
                    	
                        <div class="input-group input-group-lg" id="product_name_wrapper">
                            <span class="input-group-text" id="inputGroup-sizing-lg">상품명</span>
                            <input type="text" class="form-control" name="productName" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                        </div>

                        <div class="input-group" id="product_category_wrapper">
                            <label class="input-group-text" for="inputGroupSelect01">카테고리</label>
                            <select class="form-select" id="inputGroupSelect01" name="category">
                              <option value="notebook">노트북</option>
                              <option value="tablet">테블릿</option>
                              <option value="smartphone">스마트폰</option>
                            </select>
                        </div>
                        
                        <div class="input-group" id="product_stock_wrapper">
                            <span class="input-group-text">재고</span>
                            <input type="number" class="form-control" name="stock" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                        </div>

                        <div class="input-group" id="product_price_wrapper">
                            <span class="input-group-text">가격</span>
                            <input type="number" class="form-control" name="price" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                        </div>

                        <div class="input-group" id="product_file_wrapper">
                            <label class="input-group-text" for="inputGroupFile01">상품 이미지</label>
                            <input type="file" class="form-control" id="inputGroupFile01" name="productImg">                            
                        </div>

                        <div class="input-group" id="product_content_wrapper">
                            <span class="input-group-text">상품 소개</span>
                            <textarea class="form-control" aria-label="With textarea"></textarea>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                      		<button type="submit" class="btn btn-primary btn-lg px-4 me-md-2" id="submit-btn">${btn_title }</button>
                    	</div>
                    </form>                    
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
        console.log("productId="+productId);
        if (productId != null) {
        	
            $.ajax({
            	url: "/shoppingmall/product/detail",
            	type: "get",
            	data: "productId="+productId,
            	dataType: "json",
            	success: function(productInfo){
            		let productName = productInfo.productName;
            		let category = productInfo.category;
            		if (category == "노트북") category = "notebook";
            		else if (category == "스마트폰") category = "smartphone";
            		else if (category == "테블릿") category = "tablet";
            		let stock = productInfo.stock;
            		let price = productInfo.price;
            		let productImg = productInfo.productImg;
            		console.log(productImg);

            		$("input[name=productName]").val(productName);
            		$("select[name=category]").val(category);
            		$("input[name=stock]").val(stock);
            		$("input[name=price]").val(price);
            		// 상품에 등록된 이미지가 있을 때에는 이미지 경로만 출력하고
            		// 이미지 경로 옆에 이미지 삭제 버튼을 추가
            		if (productImg != null) {
            			$("#inputGroupFile01").css("display","none");
                		$("#product_file_wrapper").append("<span class=\"product_file_path\">" + productImg + "</span>");
                		$("#product_file_wrapper").append("<button type=\"submit\" class=\"btn btn-secondary btn-lg px-4 me-md-2\">삭제</button>");
            		}            		
            	},
            	error: function(){
            		
            	}
            })
        }

        </script>
    </body>
</html>