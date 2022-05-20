package member;

import javax.servlet.http.HttpServletResponse;

import dao.MemberInfoDao;
import vo.MemberInfo;

public class MemberService {
	public int join(MemberInfo memberInfo) {
		MemberInfoDao dao = new MemberInfoDao();
		
		boolean result = dao.insertMemberInfo(memberInfo);
		
		if (result) {
			return 200;
		} else {
			return 409;
		}
	}
	
	private boolean isAlreadyId(String id) {
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo memberInfo = dao.selectMemberById(id);
		if (memberInfo == null) return false;
		else return true;		
	}
	
	private boolean isAlreadyTel(String tel) {
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo memberInfo = dao.selectMemberByTel(tel);
		if (memberInfo == null) return false;
		else return true;		
	}
	
	private boolean isAlreadyEmail(String email) {
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo memberInfo = dao.selectMemberByEmail(email);
		if (memberInfo == null) return false;
		else return true;		
	}
	
	public boolean isAlreadyIdorTelorEmail(MemberInfo memberInfo) {
		String id = memberInfo.getId();
		String tel = memberInfo.getTel();
		String email = memberInfo.getEmail();
		
		if 		(isAlreadyId(id)) 		return true;
		else if (isAlreadyTel(tel)) 	return true;
		else if (isAlreadyEmail(email)) return true;
		else 							return false;
	}
	
	public boolean isAlreadyTelorEmail(String id, String tel, String email) {
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo oldMemberInfo = dao.selectMemberById(id);
		boolean isAlreadyEmail = false;
		boolean isAlreadyTel = false;
		
		// 회원 정보를 수정할때 연락처를 바꾼다면 연락처 중복 여부를 체크
		if (!tel.equals(oldMemberInfo.getTel())) {
			isAlreadyTel = isAlreadyTel(tel);
		}
		// 회원 정보를 수정할때 이메일을 바꾼다면 이메일 중복 여부를 체크
		if (!email.equals(oldMemberInfo.getEmail())) {
			isAlreadyEmail = isAlreadyEmail(email);
		}	
		return isAlreadyTel || isAlreadyEmail;
	}
	
	public MemberInfo selectLoginInfo(MemberInfo loginInfo) {
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo memberInfo = dao.selectMemberById(loginInfo.getId());
		
		if (memberInfo == null) {
			return null;
		} else {
			if (!loginInfo.getPw().equals(memberInfo.getPw())) {
				return null;
			} else return memberInfo;
		}
	}
	
	public void updateMemberInfo(MemberInfo memberInfo) {
		MemberInfoDao dao = new MemberInfoDao();		
		dao.updateById(memberInfo);
	}
	
	public void deleteMemberInfoById(String id) {
		MemberInfoDao dao = new MemberInfoDao();
		dao.deleteMemberInfoById(id);
	}
	
	public String loadMemberInfoById (String id) {
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo memberInfo = dao.selectMemberById(id);
		String data = null;
		
		if(memberInfo != null) {
			data = "{\"id\":\"(1)\", \"pw\": \"(2)\", \"name\":\"(3)\", \"tel\":\"(4)\", \"addr\":\"(5)\", \"email\":\"(6)\"}";
			
			String pw = memberInfo.getPw() == null ? "" : memberInfo.getPw();
			String name = memberInfo.getName() == null ? "" : memberInfo.getName();
			String tel = memberInfo.getTel() == null ? "" : memberInfo.getTel();
			String addr = memberInfo.getAddr() == null ? "" : memberInfo.getAddr();
			String email = memberInfo.getEmail() == null ? "" : memberInfo.getEmail();
			
			data = data.replace("(1)", memberInfo.getId());
			data = data.replace("(2)", pw);
			data = data.replace("(3)", name);
			data = data.replace("(4)", tel);
			data = data.replace("(5)", addr);
			data = data.replace("(6)", email);
		}
		
		return data;
	}	
}
