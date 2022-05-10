package member;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;

import exception.BadParameterException;
import util.Validator;
import vo.MemberInfo;

/**
 * Servlet implementation class JoinController
 */
@WebServlet("/member/join")
public class JoinController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			
			// 1. 전달받은 값을 꺼낸다
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String pwchk = request.getParameter("pwChk");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			LocalDateTime joinDate = LocalDateTime.now();
			
			
			// 2. 전달받은 값을 검증

			Validator validator = new Validator();
					
			if 		(!validator.idValidator(id)) 		throw new BadParameterException();
			else if (!validator.pwValidator(pw)) 		throw new BadParameterException();
			else if (!pw.equals(pwchk))					throw new BadParameterException();
			else if (!validator.nameValidator(name))	throw new BadParameterException();
			else if (!validator.telValidator(tel))		throw new BadParameterException();
			else if (!validator.addrValidator(addr))	throw new BadParameterException();
			else if (!validator.emailValidator(email))	throw new BadParameterException();
			
			System.out.println("id = " + id);
			System.out.println("pw = " + pw);
			System.out.println("name = " + name);
			System.out.println("tel = " + tel);
			System.out.println("addr = " + addr);
			System.out.println("email = " + email);
			
			// 3. 전달받은 값을 하나의 정보로 뭉친다
			MemberInfo newMemberInfo = new MemberInfo(id, pw, name, tel, addr, email, joinDate);
			
			// 4. 새로운 회원의 정보를 DB에 저장한다
			MemberService service = new MemberService();
			if (service.isAlreadyIdorTelorEmail(newMemberInfo)) response.setStatus(HttpServletResponse.SC_CONFLICT);
			else {
				// 5-1. 회원 가입에 성공했을 경우 성공 시그널 보냄
				int status = service.join(newMemberInfo);
				response.setStatus(status);
			}
			
			
			// 5-2. 회원 가입에 실패했을 경우 실패 시그널 보냄
			//  - 아이디나, 이메일, 연락처가 이미 사용 중일 때 : 409
			//  - 파라미터가 규칙에 맞지 않을 때 : 400

		} catch (BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
	}

}
