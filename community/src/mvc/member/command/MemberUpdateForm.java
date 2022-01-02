package mvc.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.Command;
import mvc.member.dao.MemberDAO;
import mvc.member.model.MemberDTO;

public class MemberUpdateForm implements Command{

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		
		String id = request.getParameter("id");
		MemberDTO dto = new MemberDTO();
		dto=dao.selectedById(id);
		
		request.setAttribute("dto", dto);
		
		return "/member/updateForm.jsp";
	}

}
