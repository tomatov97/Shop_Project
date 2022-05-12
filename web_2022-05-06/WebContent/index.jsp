<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/logo.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">
               		<i class="bi bi-hand-index-thumb" id="rightHandLogo"></i>
               		<i class="bi bi-hand-index-thumb" id="leftHandLogo"></i>
                	두두몰
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/shoppingmall/index.jsp">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">브랜드 소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="/shoppingmall/login/login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/shoppingmall/join/join.jsp">회원가입</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">쇼핑</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/shoppingmall/shop/product_list.jsp">모든 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">인기 상품</a></li>
                                <li><a class="dropdown-item" href="#!">새로운 상품</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">홈</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop homepage template</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
			      <div class="col-10 col-sm-8 col-lg-6">
			        <img src="https://getbootstrap.kr/docs/5.1/examples/heroes/bootstrap-themes.png" class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes" width="700" height="500" loading="lazy">
			      </div>
			      <div class="col-lg-6">
			        <h1 class="display-5 fw-bold lh-1 mb-3">Responsive left-aligned hero with image</h1>
			        <p class="lead">Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit, featuring Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful JavaScript plugins.</p>
			        <div class="d-grid gap-2 d-md-flex justify-content-md-start">
			          <button type="button" class="btn btn-primary btn-lg px-4 me-md-2" id="login-btn">로그인</button>
			          <button type="button" class="btn btn-outline-secondary btn-lg px-4" id="join-btn">회원가입</button>
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
        <script src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
        	$("#login-btn").on("click", function(){location.href="/shoppingmall/login/login.jsp"});
        	$("#join-btn").on("click", function(){location.href="/shoppingmall/join/join.jsp"});

        </script>
    </body>
</html>
