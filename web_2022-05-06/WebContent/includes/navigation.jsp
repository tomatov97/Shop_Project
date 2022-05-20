<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/shoppingmall?active=home">
               		<i class="bi bi-hand-index-thumb" id="rightHandLogo"></i>
               		<i class="bi bi-hand-index-thumb" id="leftHandLogo"></i>
                	두두몰
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/shoppingmall?active=home">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">브랜드 소개</a></li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">쇼핑</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/shoppingmall/product/list?pageNumber=1">모든 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">인기 상품</a></li>
                                <li><a class="dropdown-item" href="#!">새로운 상품</a></li>
                            </ul>
                        </li>
                        
                        <li class="nav-item dropdown" >
                          <div class="dropdown text-end">
				          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				            <i class="bi bi-person-circle" style="font-size : 25px" alt="mdo" width="32" height="32" class="rounded-circle"></i>
				          </a>
				          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
				          	<%-- 로그인을 하지 않은 상태 --%>
	                        <c:if test="${loginUserInfo eq null}">
		                        <li class="dropdown-item"><a class="nav-link" href="/shoppingmall/login/login.jsp">로그인</a></li>
		                        <li class="dropdown-item"><a class="nav-link" href="/shoppingmall/join/join.jsp">회원가입</a></li>
	                        </c:if>
	                                                
	                        <%-- 로그인을 한 상태 --%>
	                        <c:if test="${loginUserInfo ne null}">
		                        <li class="dropdown-item"><a class="nav-link" href="/shoppingmall/member/form.jsp">회원 정보 수정</a></li>
		                        <li class="dropdown-item"><a class="nav-link" href="/shoppingmall/join/join.jsp">로그아웃</a></li>   
	                        </c:if>
	                        
	                        <c:if test="${loginUserInfo.id eq 'Admin1234'}">
	                        	<li class="dropdown-item"><a class="nav-link" href="/shoppingmall/manager/product_form.jsp">상품 추가</a></li>
	                        </c:if>
				          </ul>
				        </div>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>