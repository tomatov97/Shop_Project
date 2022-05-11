package util;

import java.util.ArrayList;
import java.util.List;

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
		
		// 길이와 구성 체크 (규칙 이외의 것이 들어가있는지..)
		String regId = "^[a-zA-Z0-9]{4,10}$";
		boolean correctId = id.matches(regId);
		if (!correctId) return false;
		
		// 필수 포함 요소 포함 여부 체크
		if 		(!id.matches(".*[a-z].*")) 	return false;
		else if (!id.matches(".*[A-Z].*")) 	return false;
		else if (!id.matches(".*[0-9].*"))	return false;
		else return true;
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
		
		// 길이와 구성 체크 (규칙 이외의 것이 들어가있는지..)
		String regPw = "^[a-zA-Z0-9]{6,16}$";
		boolean correctPw = pw.matches(regPw);
		if (!correctPw) { return false; }
		
		// 필수 포함 요소 포함 여부 체크
		if (!pw.matches(".*[a-z].*")) {
			return false;
		} else if (!pw.matches(".*[A-Z].*")) {
			return false;
		} else if (!pw.matches(".*[0-9].*")) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean nameValidator(String name) {
		String regName = "^[가-힣]{3}$";
		boolean correctName = name.matches(regName);
		return correctName;
	}
	
	public boolean telValidator(String tel) {
		/*
		String[] telArray = tel.split("-");
		
		for (String nthTel : telArray) {
			for (int i=0; i<nthTel.length(); i++) {
				char nthNumber = nthTel.charAt(i);
				if (!(nthNumber>= 0 && nthNumber<=9)) {
					return false;
				};
			}			
		}
		
		if (telArray.length != 3) {
			return false;
		} else if (telArray[0].length() != 3) {
			return false;
		} else if (telArray[1].length() != 4) {
			return false;
		} else if (telArray[2].length() != 4) {
			return false;
		}
		*/
		
		String regTel = "\\d{3}-\\d{4}-\\d{4}";
		boolean correctTel = tel.matches(regTel);
		return correctTel;
	}
	
	public boolean addrValidator(String addr) {
		String[] cityList = {"서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시",
				"울산광역시", "세종특별자치시", "경기도", "충청북도", "충청남도", "전라북도",
				"전라남도", "경상북도", "경상남도", "제주특별자치도"};
		for (String city : cityList) {
			if (addr.equals(city)) { return true; } 
		}		
		return false;		
	}
	
	public boolean emailValidator(String email) {
		if (email.contains("@")) {
			return true;
		}
		return false;
		
		/*
		String regEmail = "^[A-Za-z0-9.\\-_]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,6}$";		
		boolean correctEmail = email.matches(regEmail);		
		return correctEmail;
		*/
	}
	
	public boolean productNameValidator(String productName) {
		if (productName.length() <= 30) return true;
		else return false;
	}
	
	public boolean categoryValidator(String category) {
		String[] categoryList = {"스마트폰", "테블릿", "노트북"};
		for (String categ : categoryList) {
			if (category.equals(categ)) return true;				
		}
		return false;
	}
	
	public boolean stockValidator(int stock) {
		if (stock > 0) return true;
		else return false;
	}
	
	public boolean priceValidator(int price) {
		if (price > 0) return true;
		else return false;
	}
	
	public boolean productImgValidator(String productImg) {
		return false;
	}
}
