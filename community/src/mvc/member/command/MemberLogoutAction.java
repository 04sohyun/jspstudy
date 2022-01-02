package mvc.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.command.Command;

public class MemberLogoutAction implements Command{

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session!=null) session.invalidate();
		
		return "/index.jsp";
	}

}
