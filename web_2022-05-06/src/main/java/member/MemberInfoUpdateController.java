package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberInfoDao;
import exception.BadParameterException;
import util.Validator;
import vo.MemberInfo;

@WebServlet("/member/update")
public class MemberInfoUpdateController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			
			HttpSession session = request.getSession();			
			MemberInfo loginUserInfo = (MemberInfo) session.getAttribute("loginUserInfo");
			String id = loginUserInfo.getId();
			
			Validator validator = new Validator();
			if 		(!validator.pwValidator(pw)) 	 	throw new BadParameterException();
			else if (!validator.nameValidator(name)) 	throw new BadParameterException();
			else if (!validator.telValidator(tel)) 	 	throw new BadParameterException();
			else if (!validator.addrValidator(addr)) 	throw new BadParameterException();
			else if (!validator.emailValidator(email)) 	throw new BadParameterException();
			
			MemberService service = new MemberService();		
			if (!service.isAlreadyTelorEmail(id, tel, email)) {
				MemberInfo memberInfo = new MemberInfo();
				memberInfo.setId(id);
				memberInfo.setPw(pw);
				memberInfo.setName(name);
				memberInfo.setTel(tel);
				memberInfo.setAddr(addr);
				memberInfo.setEmail(email);
				
				service.updateMemberInfo(memberInfo);
				response.setStatus(HttpServletResponse.SC_OK);
			}			
			
		} catch (BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
	}

}
