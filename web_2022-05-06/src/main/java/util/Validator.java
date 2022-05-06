package util;

public class Validator {
	// 아이디 규칙 : 최소 4자 ~ 최대 10자, 영어 대소문자, 숫자가 최소 하나씩
	// 비밀번호 규칙 : 최소 8자 ~ 최대 16자, 영어 대소문자, 숫자가 최소 하나씩
	// 이름 규칙 : 3자, 한글만
	// 연락처 규칙 : 010-0000-1111 형식, 각 자리마다 하이픈이 들어가야하고 3자,4자,4자로 이루어짐
	// 주소 규칙 : 특별시, 광역시, 시, 도까지만 입력
	// 이메일 규칙 : 반드시 @를 포함해야함
	public boolean idValidator(String id) {
		boolean correctId = false;
		char[] idArray = id.toCharArray();
		
		if (id.length() <= 10 && id.length() >= 4) {
			boolean lower = false;
			boolean upper = false;
			boolean number = false;
			
			for (char nthChar : idArray) {
				lower = (nthChar >= 'a' && nthChar <= 'z');
				upper = (nthChar >= 'A' && nthChar <= 'Z');
				number = (nthChar >= '1' && nthChar <= '0');
			}
			correctId = lower && upper && number;
		}
		return correctId;
	}
	
	public boolean pwValidator(String pw) {
		boolean correctPw = false;
		char[] pwArray = pw.toCharArray();
		
		if (pw.length() <= 16 && pw.length() >= 8) {
			boolean lower = false;
			boolean upper = false;
			boolean number = false;
			
			for (char nthChar : pwArray) {
				lower = (nthChar >= 'a' && nthChar <= 'z');
				upper = (nthChar >= 'A' && nthChar <= 'Z');
				number = (nthChar >= '1' && nthChar <= '0');
			}
			correctPw = lower && upper && number;
		}
		return correctPw;
	}
	
	public boolean nameValidator(String name) {
		boolean correctName = false;
		
		return correctName;
	}
	
	public boolean telValidator(String tel) {
		boolean correctTel = false;
		
		return correctTel;
	}
	
	public boolean addrValidator(String pw) {
		boolean correctTel = false;
		
		return correctTel;
	}
	
	public boolean emailValidator(String pw) {
		boolean correctTel = false;
		
		return correctTel;
	}
	
}
