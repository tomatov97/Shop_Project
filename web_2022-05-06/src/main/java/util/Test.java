package util;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String id = "tngusdsdfs";
		String regId = "^[a-zA-Z0-9]{8,16}$";
		boolean correctId = id.matches(regId);
		System.out.println("correctId = " + correctId);
		System.out.println("contains = " + id.contains("^[a-z]$"));
		boolean lower = id.matches(".*[0-9].*");
		System.out.println("lower = " + lower);
		
	}

}
