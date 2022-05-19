<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>두두몰</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="../css/join.css" />
    <link rel="stylesheet" href="../css/logo.css" />
</head>
<body class="text-center">
    
  <main class="form-signin">
    <form>
      <h1 class="h3 mb-3 fw-normal">
    	<i class="bi bi-hand-index-thumb" id="rightHandLogo"></i>
        <i class="bi bi-hand-index-thumb" id="leftHandLogo"></i>
        두두몰
      </h1>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="아이디" disabled>
        <label for="floatingInput">아이디</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingOldPassword" placeholder="Password">
        <label for="floatingOldPassword">현재 비밀번호</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingNewPassword" placeholder="Password">
        <label for="floatingNewPassword">새 비밀번호</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingNewPasswordCheck" placeholder="Password">
        <label for="floatingNewPasswordCheck">새 비밀번호 확인</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingName" placeholder="Name">
        <label for="floatingName">이름</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingTel" placeholder="Tel">
        <label for="floatingTel">연락처</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingAddr" placeholder="Address">
        <label for="floatingAddr">주소</label>
      </div>
      <div class="form-floating">
        <input type="email" class="form-control" id="floatingEmail" placeholder="Email" name="email">
        <label for="floatingEmail">이메일</label>
      </div>
      
      <button class="w-100 btn btn-lg btn-primary" type="button" id="update-btn">정보수정</button>
      <button class="w-100 btn btn-lg btn-secondary" type="button" id="delete-btn">회원 탈퇴</button>
    </form>
  </main>
  <script src="../js/jquery-3.6.0.min.js"></script>
  <script>
  let id = "${sessionScope.loginUserInfo.id}";
  // 수정할 상품 정보 불러오기
  if (id != null) {        	
      $.ajax({
      	url: "/shoppingmall/member/search",
      	type: "get",
      	data: "id="+id,
      	dataType: "json",
      	success: function(memberInfo){
      		let id = memberInfo.id;
			let name = memberInfo.name;
			let tel = memberInfo.tel;
			let addr = memberInfo.addr;
			let email = memberInfo.email;

      		$("#floatingInput").val(id);
      		$("#floatingName").val(name);
      		$("#floatingTel").val(tel);
      		$("#floatingAddr").val(addr);
      		$("#floatingEmail").val(email);         		
      	},
      	error: function(response){
      		console.log(response);
      	}
      })
  }
  
  $("#update-btn").on("click", function(){
		let id = $("#floatingInput").val();
		let oldPw = $("#floatingOldPassword").val();
		let newPw = $("#floatingNewPassword").val();
  		let newPwChk = $("#floatingNewPasswordCheck").val();
  		let name = $("#floatingName").val();
  		let tel = $("#floatingTel").val();
  		let addr = $("#floatingAddr").val();
  		let email = $("#floatingEmail").val();
  		
  		console.log(id);
  		console.log(name);
  		console.log(tel);
  		console.log(addr);
  		$.ajax({
  			url: "/shoppingmall/member/update",
  			type: "post",
  			data: "name="+name+"&tel="+tel+"&addr="+addr+"&email="+email,
  			success: function(){
  				console.log("정보가 변경되었습니다.");
  				location.reload();
  			},
  			error: function(){
  				alert("회원 정보 수정 실패");
  			}
  		})

  		if(oldPw != "" && newPw != "" && newPwChk != ""){
  			$.ajax({
  	  			url: "/shoppingmall/member/password/update",
  	  			type: "post",
  	  			data: "id="+id+"&oldPassword="+oldPw+"&newPassword="+newPw+"&newPasswordChk="+newPwChk,
  	  			success: function(){
  	  				alert("정보가 변경되었습니다.");
  	  				location.reload();  	  				
  	  			},
  	  			error: function(){
  	  				alert("비밀번호 변경 실패");
  	  			}
  	  		})
  		}
  		
  })
  
  // 회원 탈퇴
  $("#delete-btn").on("click", function(){
	  $.ajax({
  			url: "/shoppingmall/member/delete",
  			type: "post",
  			data: "id="+id,
  			success: function(){
  				alert("탈퇴되었습니다.");
  				location.href="/shoppingmall/index.jsp?active=home";
  			},
  			error: function(){
  				alert("회원 탈퇴 실패");
  			}
  		})
  })
  </script>
  </body>
</html>


