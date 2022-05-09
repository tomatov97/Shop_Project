package util;

public class Validator {
	// 아이디 규칙 : 최소 4자 ~ 최대 10자, 영어 대소문자, 숫자가 최소 하나씩
	// 비밀번호 규칙 : 최소 8자 ~ 최대 16자, 영어 대소문자, 숫자가 최소 하나씩
	// 이름 규칙 : 3자, 한글만
	// 연락처 규칙 : 010-0000-1111 형식, 각 자리마다 하이픈이 들어가야하고 3자,4자,4자로 이루어짐
	// 주소 규칙 : 특별시, 광역시, 시, 도까지만 입력
	// 이메일 규칙 : 반드시 @를 포함해야함
	public boolean idValidator(String id) {
		/* 
		 boolean correctId = false;
		 char[] idArray = id.toCharArray();
		
		if (id.length() <= 10 && id.length() >= 4) {
			boolean lower = false;
			boolean upper = false;
			boolean number = false;
			boolean other = false;
			
			for (char nthChar : idArray) {
				if (nthChar >= 'a' && nthChar <= 'z') {
					lower = true;
				} else if (nthChar >= 'A' && nthChar <= 'Z') {
					upper = true;
				} else if (nthChar >= '1' && nthChar <= '0') {
					number = true;
				} else {
					other = true;
				}
			}
			correctId = lower && upper && number && !other;
		}*/
		
		String regId = "/^[a-zA-Z0-9]{4,10}$";
		boolean correctId = id.matches(regId);
		return correctId;
	}
	
	public boolean pwValidator(String pw) {
		/*
		char[] pwArray = pw.toCharArray();
		
		if (pw.length() <= 16 && pw.length() >= 8) {
			boolean lower = false;
			boolean upper = false;
			boolean number = false;
			boolean other = false;
			
			for (char nthChar : pwArray) {
				if (nthChar >= 'a' && nthChar <= 'z') {
					lower = true;
				} else if (nthChar >= 'A' && nthChar <= 'Z') {
					upper = true;
				} else if (nthChar >= '1' && nthChar <= '0') {
					number = true;
				} else {
					other = true;
				}
			}
			correctPw = lower && upper && number && !other;
		}
		*/
		String regPw = "/^[a-zA-Z0-9]{8,16}$";
		boolean correctPw = pw.matches(regPw);
		return correctPw;
	}
	
	public boolean nameValidator(String name) {
		String regName = "/^[가-힣]{3}$";
		boolean correctName = name.matches(regName);
		return correctName;
	}
	
	public boolean telValidator(String tel) {
		String regTel = "\\[0-9]{3}-\\[0-9]{4}-\\[0-9]{4}$";
		boolean correctTel = tel.matches(regTel);
		return correctTel;
	}
	
	public boolean addrValidator(String addr) {
		String regAddr = "?";
		boolean correctAddr = addr.matches(regAddr);
		return correctAddr;
	}
	
	public boolean emailValidator(String email) {
		String regEmail = "/^[A-Za-z0-9.\\-_]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,6}$";		
		boolean correctEmail = email.matches(regEmail);		
		return correctEmail;
	}
	
}
