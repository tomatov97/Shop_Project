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
                    <form action="/shoppingmall/product/update" method="post" enctype="multipart/form-data">
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
                      		<button type="submit" class="btn btn-primary btn-lg px-4 me-md-2" id="update-btn">상품 수정</button>
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
		// 수정할 상품 정보 불러오기
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
            		console.log("productImg="+productImg);

            		$("input[name=productName]").val(productName);
            		$("select[name=category]").val(category);
            		$("input[name=stock]").val(stock);
            		$("input[name=price]").val(price);
            		// 상품에 등록된 이미지가 있을 때에는 이미지 경로만 출력하고
            		// 이미지 경로 옆에 이미지 삭제 버튼을 추가
            		if (productImg != "") {
            			$("#inputGroupFile01").css("display","none");
                		$("#product_file_wrapper").append("<span class=\"product_file_path\">" + productImg + "</span>");
                		$("#product_file_wrapper").append("<button type=\"button\" class=\"btn btn-secondary btn-lg px-4 me-md-2\" id=\"delete-img-btn\">삭제</button>");
                        // 이미지 항목의 삭제 버튼을 누르면 이미지가 삭제되고, 새로운 상품을 선택할 수 있게 inputGroupFile01 태그가 보이도록
                		$("#delete-img-btn").on("click", function(){
                       		removeImg(productId);
                       		$("#inputGroupFile01").css("display","initial");                       		
                       	})
            		}            		
            	},
            	error: function(){
            		
            	}
            })
        }
        
		// 상품 수정
        $("#update-btn").on("click", function(event){
        	event.preventDefault();
        	let productName = $("input[name=productName]").val();
        	let category = $("select[name=category]").val();
        	let stock = $("input[name=stock]").val();
        	let price = $("input[name=price]").val();
        	
        	 $.ajax({
             	url: "/shoppingmall/product/update",
             	type: "post",
             	data: "productId="+productId+"&productName="+productName+"&category="+category+"&stock="+stock+"&price="+price,
             	success: function(){
           			alert("상품 수정이 완료되었습니다.");
           			location.href="/shoppingmall/shop/product_detail.jsp?active=product_detail&productId="+productId;
             	},
             	error: function(){
             		alert("상품을 수정하지 못 했습니다.");
             	}
             })
        })
	
        // ajax를 이용하여 이미지 파일 업로드 서비스와 연결/ 이미지 파일 업로드 서비스의 인터페이스 필요함
        $("#inputGroupFile01").on("change", function(){
        	if(!$("#inputGroupFile01").is(":empty")){
        		// 파일업로드 후 새로고침(음... 그럼 다른 입력 정보 날아가는 거 아닌가)
        		// 이거 해결해서 product_form2.jsp와 이미지 파일 업로드 서비스(서블릿 파일)을 카페에 업로드
        	}
        })
        
		function removeImg(productId) {
        	$.ajax({
       			url: "/shoppingmall/product/img_delete",
       			type: "post",
       			data: "productId="+productId,
       			success: function(){
       				alert("이미지가 삭제되었습니다.");
       				location.reload();       				
       			},
       			error: function(){
       				alert("이미지가 삭제되지 않았습니다.");
       			}
       		})
		}
        </script>
    </body>
</html>