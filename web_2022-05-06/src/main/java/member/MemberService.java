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
}
