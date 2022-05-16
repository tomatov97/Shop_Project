<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/URLs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>두두몰</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/join.css">
    <link href="../css/logo.css" rel="stylesheet" />    
</head>
<body class="text-center">
    
  <main class="form-signin">
    <form action="${JOIN_SERVLET }" method="post">
      <h1 class="h3 mb-3 fw-normal">
    	<i class="bi bi-hand-index-thumb" id="rightHandLogo"></i>
        <i class="bi bi-hand-index-thumb" id="leftHandLogo"></i>
        두두몰
      </h1>
  
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="id" name="id">
        <label for="floatingInput">아이디</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="pw">
        <label for="floatingPassword">비밀번호</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingPasswordCheck" placeholder="Password" name="pwChk">
        <label for="floatingPasswordCheck">비밀번호 확인</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingName" placeholder="Name" name="name">
        <label for="floatingName">이름</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingTel" placeholder="Tel" name="tel">
        <label for="floatingName">연락처</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingAddr" placeholder="Addr" name="addr">
        <label for="floatingName">주소</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingEmail" placeholder="Email" name="email">
        <label for="floatingName">이메일</label>
      </div>
      
      <div class="form-floating">
        <ul class="list-group">
          <li class="list-group-item">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="term1">
              <label class="form-check-label" for="term1">
                모든 약관 동의
              </label>
            </div>
          </li>
          <li class="list-group-item">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="term2">
              <label class="form-check-label" for="term2">
                이용 약관 동의
              </label>
            </div>
            <div class="terms">
              천하를 주는 반짝이는 착목한는 보이는 얼마나 설레는 때까지 품고 피다. 살 얼음에 공자는 무한한 있으며, 찾아 쓸쓸한 보내는 부패뿐이다. 그러므로 지혜는 보내는 그들은 운다. 우리는 하였으며, 작고 있는 얼마나 우리 같은 것은 살았으며, 끓는다. 그들은 보이는 그러므로 하는 인도하겠다는 보는 피부가 돋고, 웅대한 말이다. 열락의 대고, 가슴이 있는 돋고, 불어 부패뿐이다. 오직 천지는 바이며, 보배를 노년에게서 고행을 이는 행복스럽고 이상의 봄바람이다. 날카로우나 낙원을 희망의 끝에 아니더면, 사라지지 밥을 같이, 설레는 피다. 그들을 무엇을 따뜻한 갑 인생에 희망의 꽃 것이다.

              그들에게 커다란 열락의 풍부하게 스며들어 것이다. 설산에서 꾸며 남는 위하여서. 않는 열매를 끓는 같으며, 지혜는 것이다. 뜨고, 구하기 못할 그리하였는가? 굳세게 고동을 돋고, 끓는 있는가? 남는 아니더면, 뼈 이 같이, 석가는 이성은 그들은 것이다. 어디 주는 그림자는 실현에 평화스러운 장식하는 인도하겠다는 아니다. 우리 생의 풀밭에 얼마나 것이다. 있는 속잎나고, 못할 거친 튼튼하며, 것은 되는 있다. 인생을 따뜻한 천지는 인간의 뛰노는 이상이 날카로우나 눈에 봄바람이다. 오직 붙잡아 심장의 열락의 싹이 트고, 두손을 위하여 것이 있다.

              것은 미묘한 길을 크고 있으며, 커다란 풍부하게 있는가? 바로 그러므로 이는 그것은 못할 평화스러운 황금시대다. 그들은 그들을 예가 때까지 구할 무엇을 그들은 고동을 보라. 같이 그들은 풀이 대고, 끝까지 아니다. 그것은 인생의 트고, 전인 찬미를 무엇을 청춘 있다. 소금이라 사는가 우리 그들의 옷을 온갖 대한 힘있다. 그들은 그들의 품으며, 피고, 그들의 이것이다. 트고, 인생의 품에 심장의 있음으로써 인생에 가치를 것이다. 거선의 가는 현저하게 그들의 있는 위하여, 인류의 피다.
            </div>
          </li>
          <li class="list-group-item">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="term3">
              <label class="form-check-label" for="term3">
                개인정보 수집 및 이용 동의
              </label>
            </div>
            <div class="terms">
              천하를 주는 반짝이는 착목한는 보이는 얼마나 설레는 때까지 품고 피다. 살 얼음에 공자는 무한한 있으며, 찾아 쓸쓸한 보내는 부패뿐이다. 그러므로 지혜는 보내는 그들은 운다. 우리는 하였으며, 작고 있는 얼마나 우리 같은 것은 살았으며, 끓는다. 그들은 보이는 그러므로 하는 인도하겠다는 보는 피부가 돋고, 웅대한 말이다. 열락의 대고, 가슴이 있는 돋고, 불어 부패뿐이다. 오직 천지는 바이며, 보배를 노년에게서 고행을 이는 행복스럽고 이상의 봄바람이다. 날카로우나 낙원을 희망의 끝에 아니더면, 사라지지 밥을 같이, 설레는 피다. 그들을 무엇을 따뜻한 갑 인생에 희망의 꽃 것이다.

              그들에게 커다란 열락의 풍부하게 스며들어 것이다. 설산에서 꾸며 남는 위하여서. 않는 열매를 끓는 같으며, 지혜는 것이다. 뜨고, 구하기 못할 그리하였는가? 굳세게 고동을 돋고, 끓는 있는가? 남는 아니더면, 뼈 이 같이, 석가는 이성은 그들은 것이다. 어디 주는 그림자는 실현에 평화스러운 장식하는 인도하겠다는 아니다. 우리 생의 풀밭에 얼마나 것이다. 있는 속잎나고, 못할 거친 튼튼하며, 것은 되는 있다. 인생을 따뜻한 천지는 인간의 뛰노는 이상이 날카로우나 눈에 봄바람이다. 오직 붙잡아 심장의 열락의 싹이 트고, 두손을 위하여 것이 있다.

              것은 미묘한 길을 크고 있으며, 커다란 풍부하게 있는가? 바로 그러므로 이는 그것은 못할 평화스러운 황금시대다. 그들은 그들을 예가 때까지 구할 무엇을 그들은 고동을 보라. 같이 그들은 풀이 대고, 끝까지 아니다. 그것은 인생의 트고, 전인 찬미를 무엇을 청춘 있다. 소금이라 사는가 우리 그들의 옷을 온갖 대한 힘있다. 그들은 그들의 품으며, 피고, 그들의 이것이다. 트고, 인생의 품에 심장의 있음으로써 인생에 가치를 것이다. 거선의 가는 현저하게 그들의 있는 위하여, 인류의 피다.
            </div>
          </li>
        </ul>
      </div>

      <button class="w-100 btn btn-lg btn-secondary" type="submit" id="submit-btn">회원가입</button>
    </form>
  </main>
  <script src="/shoppingmall/js/jquery-3.6.0.min.js"></script>
  <script src="/shoppingmall/js/URLs.js"></script>
  <script>
  	$("#term1").on("click", function(){
  		if ($("#term1").is(":checked")) {
  			$(".form-check input").prop("checked", true);	
  		}  			
  	})
  	
  	// 아무것도 입력하지 않고 회원 가입 버튼을 누르거나
  	// 잘못된 값을 입력하고 회원 가입 버튼을 누를 수도 있으므로
  	// 회원가입 버튼을 눌렀을 때 자바 스크립트에서 올바른 값을 입력했는지 입력값 검증을
  	// 체크해서 올바른 값을 입력했을 경우에만 회원 가입 서블릿으로 데이터를 전달해줘야함
  	// submit 버튼 -> form태그의 action 속성에 있는 url로 form 안의 정보를 전달한다 (method 속성에 입력되어있는 방법으로!)
	
  	$("#submit-btn").on("click", function(event){
  		event.preventDefault();
  		
  		// 사용자가 입력한 값 검증
  		// (회원가입 서블릿에서 정규표현식으로 검증했듯, 자바스크립트에도 정규표현식이 있음)
  		// 1. id 검증
		let id = $("#floatingInput").val();
  		let regId = "^[a-zA-Z0-9]{4,10}$";
  		let lower = ".*[a-z].*";
  		let upper = ".*[A-Z].*";
  		let number = ".*[0-9].*";
  		if (id =="") {
  			alert("아이디를 입력하세요.")
  			return;
  		} else if (!regId.test(id) || !lower.test(id) || !upper.test(id) || number.test(id)) {
  			alert("아이디가 올바르지 않습니다.")
  			return;
  		}
  		
  		// 2. pw 검증
  		let pw = $("#floatingPassword").val();  
  		let regPw = "^[a-zA-Z0-9]{6,16}$";
  		if (pw =="") {
  			alert("비밀번호를 입력하세요.")
  			return;
  		} else if (!regPw.test(pw) || !lower.test(pw) || !upper.test(pw) || number.test(pw)) {
  			alert("비밀번호가 올바르지 않습니다.")
  			return;
  		}
  		// 3. pwChk 검증
  		let pwChk = $("#floatingPasswordCheck").val();
  		if (pwChk =="") {
  			alert("비밀번호 확인을 입력하세요.")
  			return;
  		} else if (!(pwChk==pw)) {
  			alert("비밀번호 확인 값이 비밀번호와 일치하지 않습니다.")
  			return;
  		}
  		// 4. name
  		let name = $("#floatingName").val();
  		let regName = "^[가-힣]{3}$";
  		if (name =="") {
  			alert("이름을 입력하세요.")
  			return;
  		} else if (!regName.test(name)) {
  			alert("이름이 올바르지 않습니다.")
  			return;
  		}
  		// 5. tel
  		let tel = $("#floatingTel").val();
  		let regTel = "\\d{3}-\\d{4}-\\d{4}";
  		if (tel =="") {
  			alert("전화번호를 입력하세요.")
  			return;
  		} else if (!regTel.test(tel)) {
  			alert("전화번호가 올바르지 않습니다.")
  			return;
  		}
  		// 6. addr
  		let addr = $("#floatingAddr").val();
  		let valAddr = false;
  		let cityList = {"서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시",
				"울산광역시", "세종특별자치시", "경기도", "충청북도", "충청남도", "전라북도",
				"전라남도", "경상북도", "경상남도", "제주특별자치도"};
  		for (let city : cityList) {
			if (addr == city) { valAddr = true; } 
		}
  		if (addr =="") {
  			alert("주소를 입력하세요.")
  			return;
  		} else if (!valAddr) {
  			alert("주소가 올바르지 않습니다.")
  			return;
  		}

  		// 7. email
  		let email = $("#floatingEmail").val();
  		if (email =="") {
  			alert("이메일을 입력하세요.")
  			return;
  		} else if (!email.contains("@")) {
  			alert("이메일이 올바르지 않습니다.")
  			return;
  		}
  		// 사용자가 값을 모두 정상적으로 입력했다면
  		$.ajax({
  			url : JOIN_SERVLET,
  			type : "post",
  			data : "id="+id+"&pw="+pw+"&pwChk="+pwChk+"&name="+name+"&tel="+tel+"&addr="+addr+"&email="+email,
  			dataType : "",
  			success : function(){
  				alert("회원 가입이 되었습니다. 로그인 페이지로 이동합니다.");
  				location.href=LOGIN_PAGE;
  			},
  			error : function(response){
  				if (response.status == 409) {
  					alert("아이디, 이메일, 연락처 중 이미 사용중인 데이터가 있습니다.");
  				} else if (response.status == 400) {
  					alert("가입 정보를 올바르게 입력하세요.");
  				}
  			}
  		})
  	});
  	
  </script>
  </body>
</html>
