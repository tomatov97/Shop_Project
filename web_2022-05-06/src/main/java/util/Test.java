package util;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String id = "asFJd3";
		String regId = "/^[a-zA-Z0-9]{4,10}$";
		boolean correctId = id.matches(regId);
		System.out.println(correctId);
	}

}
