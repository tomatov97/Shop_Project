<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<c:set var="header_title" value="홈"/>
<c:if test="${param.active eq 'product_list' }">
<c:set var="header_title" value="모든 상품"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="bg-dark py-5">
       <div class="container px-4 px-lg-5 my-5">
           <div class="text-center text-white">               
               <h1 class="display-4 fw-bolder" id="header_title">${header_title}</h1>
	          <p class="lead fw-normal text-white-50 mb-0">With this shop homepage template</p>
           </div>
       </div>
	</header>
	<script src="/shoppingmall/js/jquery-3.6.0.min.js"></script>
	<script>
		/*
		let parameter = location.search;
		parameter = parameter.substr(1);
		parameter = parameter.split("=");
		
		let active = parameter[1];
		
		if (active == "home") {
			$("#header_title").text("홈");
		} else if (active == "product_list") {
			$("#header_title").text("모든 상품");
		}
		*/		
	</script>
</body>
</html>