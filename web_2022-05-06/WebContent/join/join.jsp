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
    <link rel="stylesheet" href="../css/join.css">
    <link href="../css/logo.css" rel="stylesheet" />
</head>
<body class="text-center">
    
  <main class="form-signin">
    <form>
      <h1 class="h3 mb-3 fw-normal">
    	<i class="bi bi-hand-index-thumb" id="rightHandLogo"></i>
        <i class="bi bi-hand-index-thumb" id="leftHandLogo"></i>
        �εθ�
      </h1>
  
      <div class="form-floating">
        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
        <label for="floatingInput">���̵�(�̸���)</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">��й�ȣ</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">��й�ȣ Ȯ��</label>
      </div>
      <div class="form-floating">
        <input type="text" class="form-control" id="floatingName" placeholder="Name">
        <label for="floatingName">�̸�</label>
      </div>
      
      <div class="form-floating">
        <ul class="list-group">
          <li class="list-group-item">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="term1">
              <label class="form-check-label" for="term1">
                ��� ��� ����
              </label>
            </div>
          </li>
          <li class="list-group-item">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="term2">
              <label class="form-check-label" for="term2">
                �̿� ��� ����
              </label>
            </div>
            <div class="terms">
              õ�ϸ� �ִ� ��¦�̴� �����Ѵ� ���̴� �󸶳� ������ ������ ǰ�� �Ǵ�. �� ������ ���ڴ� ������ ������, ã�� ������ ������ ���л��̴�. �׷��Ƿ� ������ ������ �׵��� ���. �츮�� �Ͽ�����, �۰� �ִ� �󸶳� �츮 ���� ���� �������, ���´�. �׵��� ���̴� �׷��Ƿ� �ϴ� �ε��ϰڴٴ� ���� �Ǻΰ� ����, ������ ���̴�. ������ ���, ������ �ִ� ����, �Ҿ� ���л��̴�. ���� õ���� ���̸�, ���踦 ��⿡�Լ� ������ �̴� �ູ������ �̻��� ���ٶ��̴�. ��ī�ο쳪 ������ ����� ���� �ƴϴ���, ������� ���� ����, ������ �Ǵ�. �׵��� ������ ������ �� �λ��� ����� �� ���̴�.

              �׵鿡�� Ŀ�ٶ� ������ ǳ���ϰ� ������ ���̴�. ���꿡�� �ٸ� ���� ���Ͽ���. �ʴ� ���Ÿ� ���� ������, ������ ���̴�. �߰�, ���ϱ� ���� �׸��Ͽ��°�? ������ ���� ����, ���� �ִ°�? ���� �ƴϴ���, �� �� ����, ������ �̼��� �׵��� ���̴�. ��� �ִ� �׸��ڴ� ������ ��ȭ������ ����ϴ� �ε��ϰڴٴ� �ƴϴ�. �츮 ���� Ǯ�翡 �󸶳� ���̴�. �ִ� ���ٳ���, ���� ��ģ ưư�ϸ�, ���� �Ǵ� �ִ�. �λ��� ������ õ���� �ΰ��� �ٳ�� �̻��� ��ī�ο쳪 ���� ���ٶ��̴�. ���� ����� ������ ������ ���� Ʈ��, �μ��� ���Ͽ� ���� �ִ�.

              ���� �̹��� ���� ũ�� ������, Ŀ�ٶ� ǳ���ϰ� �ִ°�? �ٷ� �׷��Ƿ� �̴� �װ��� ���� ��ȭ������ Ȳ�ݽô��. �׵��� �׵��� ���� ������ ���� ������ �׵��� ���� ����. ���� �׵��� Ǯ�� ���, ������ �ƴϴ�. �װ��� �λ��� Ʈ��, ���� ���̸� ������ û�� �ִ�. �ұ��̶� ��°� �츮 �׵��� ���� �°� ���� ���ִ�. �׵��� �׵��� ǰ����, �ǰ�, �׵��� �̰��̴�. Ʈ��, �λ��� ǰ�� ������ �������ν� �λ��� ��ġ�� ���̴�. �ż��� ���� �����ϰ� �׵��� �ִ� ���Ͽ�, �η��� �Ǵ�.
            </div>
          </li>
          <li class="list-group-item">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="term3">
              <label class="form-check-label" for="term3">
                �������� ���� �� �̿� ����
              </label>
            </div>
            <div class="terms">
              õ�ϸ� �ִ� ��¦�̴� �����Ѵ� ���̴� �󸶳� ������ ������ ǰ�� �Ǵ�. �� ������ ���ڴ� ������ ������, ã�� ������ ������ ���л��̴�. �׷��Ƿ� ������ ������ �׵��� ���. �츮�� �Ͽ�����, �۰� �ִ� �󸶳� �츮 ���� ���� �������, ���´�. �׵��� ���̴� �׷��Ƿ� �ϴ� �ε��ϰڴٴ� ���� �Ǻΰ� ����, ������ ���̴�. ������ ���, ������ �ִ� ����, �Ҿ� ���л��̴�. ���� õ���� ���̸�, ���踦 ��⿡�Լ� ������ �̴� �ູ������ �̻��� ���ٶ��̴�. ��ī�ο쳪 ������ ����� ���� �ƴϴ���, ������� ���� ����, ������ �Ǵ�. �׵��� ������ ������ �� �λ��� ����� �� ���̴�.

              �׵鿡�� Ŀ�ٶ� ������ ǳ���ϰ� ������ ���̴�. ���꿡�� �ٸ� ���� ���Ͽ���. �ʴ� ���Ÿ� ���� ������, ������ ���̴�. �߰�, ���ϱ� ���� �׸��Ͽ��°�? ������ ���� ����, ���� �ִ°�? ���� �ƴϴ���, �� �� ����, ������ �̼��� �׵��� ���̴�. ��� �ִ� �׸��ڴ� ������ ��ȭ������ ����ϴ� �ε��ϰڴٴ� �ƴϴ�. �츮 ���� Ǯ�翡 �󸶳� ���̴�. �ִ� ���ٳ���, ���� ��ģ ưư�ϸ�, ���� �Ǵ� �ִ�. �λ��� ������ õ���� �ΰ��� �ٳ�� �̻��� ��ī�ο쳪 ���� ���ٶ��̴�. ���� ����� ������ ������ ���� Ʈ��, �μ��� ���Ͽ� ���� �ִ�.

              ���� �̹��� ���� ũ�� ������, Ŀ�ٶ� ǳ���ϰ� �ִ°�? �ٷ� �׷��Ƿ� �̴� �װ��� ���� ��ȭ������ Ȳ�ݽô��. �׵��� �׵��� ���� ������ ���� ������ �׵��� ���� ����. ���� �׵��� Ǯ�� ���, ������ �ƴϴ�. �װ��� �λ��� Ʈ��, ���� ���̸� ������ û�� �ִ�. �ұ��̶� ��°� �츮 �׵��� ���� �°� ���� ���ִ�. �׵��� �׵��� ǰ����, �ǰ�, �׵��� �̰��̴�. Ʈ��, �λ��� ǰ�� ������ �������ν� �λ��� ��ġ�� ���̴�. �ż��� ���� �����ϰ� �׵��� �ִ� ���Ͽ�, �η��� �Ǵ�.
            </div>
          </li>
        </ul>
      </div>

      <button class="w-100 btn btn-lg btn-secondary" type="button">ȸ������</button>
    </form>
  </main>
  
  </body>
</html>
