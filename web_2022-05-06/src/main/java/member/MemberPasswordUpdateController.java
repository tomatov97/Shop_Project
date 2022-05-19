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

/**
 * Servlet implementation class MemberPasswordUpdateController
 */
@WebServlet("/member/password/update")
public class MemberPasswordUpdateController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			String oldPw = request.getParameter("oldPassword");
			String newPw = request.getParameter("newPassword");
			String newPwChk = request.getParameter("newPasswordChk");
			
			Validator validator = new Validator();
			if 		(!validator.pwValidator(oldPw)) 	 	throw new BadParameterException();
			else if (!validator.pwValidator(newPw)) 	 	throw new BadParameterException();
			else if (!validator.pwValidator(newPwChk)) 	 	throw new BadParameterException();
			
			HttpSession session = request.getSession();	
			MemberInfo loginUserInfo = (MemberInfo) session.getAttribute("loginUserInfo");
			if (loginUserInfo.getPw().equals(oldPw)) {
				if (newPw.equals(newPwChk)) {
					MemberInfoDao dao = new MemberInfoDao();
					dao.updatePasswordById(id, newPw);
				} else throw new BadParameterException();			
			} else throw new BadParameterException();
		} catch (BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
	}

}
