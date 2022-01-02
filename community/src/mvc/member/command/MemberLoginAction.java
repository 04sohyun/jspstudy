package mvc.member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.Command;
import mvc.member.dao.MemberDAO;
import mvc.member.model.MemberDTO;

public class MemberLoginAction implements Command{
	private static final String FORM_VIEW = "./member/loginForm.jsp?error=1";

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//DB저장 객체 생성 
		MemberDAO dao = MemberDAO.getInstance();
		
		//파라미터로 넘어온 값 얻기 
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDTO dto = new MemberDTO();
			dto=dao.loginCheck(id, password);
			request.getSession().setAttribute("dto", dto);
			if(dto==null) {
				response.sendRedirect(FORM_VIEW);
			}
			
		return "index.jsp";
	}
}
