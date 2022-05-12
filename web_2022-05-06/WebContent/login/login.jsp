<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/login.css">
    <link href="css/logo.css" rel="stylesheet" />
    <script src="/shoppingmall/js/jquery-3.6.0.min.js"></script>
</head>
<body class="text-center">
    
  <main class="form-signin">
    <form action="/shoppingmall/member/login" method="post">
      <h1 class="h3 mb-3 fw-normal">
        <i class="bi bi-hand-index-thumb" id="rightHandLogo"></i>
        <i class="bi bi-hand-index-thumb" id="leftHandLogo"></i>
        �εθ�
      </h1>
  
      <div class="form-floating">
        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="id">
        <label for="floatingInput">���̵�(�̸���)</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="pw">
        <label for="floatingPassword">��й�ȣ</label>
      </div>
  
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> ���̵� ����ϱ�
        </label>
      </div>
      <button class="w-100 btn btn-lg btn-primary" id="login-btn" type="submit">�α���</button>
      <button class="w-100 btn btn-lg btn-secondary" id="join-btn" type="button">ȸ������</button>
    </form>
  </main>
  <script>
  	$("#join-btn").on("click", function(){
  		location.href="/shoppingmall/join/join.jsp";
  	})
  </script>
  </body>
</html>


