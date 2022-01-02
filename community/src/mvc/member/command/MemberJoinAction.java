package mvc.member.command;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.Command;
import mvc.member.dao.MemberDAO;
import mvc.member.model.MemberDTO;

public class MemberJoinAction implements Command{

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//DB저장 객체 생성
		MemberDAO dao = MemberDAO.getInstance();
		
		//파라미터로 넘어온 값 MemberDTO에 저장하기
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPassword(request.getParameter("password"));
		dto.setName(request.getParameter("name"));
		String email=request.getParameter("mail1")+"@"+request.getParameter("mail2");
		dto.setEmail(email);
		String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		dto.setPhone(phone);
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setRoadAddress(request.getParameter("roadAddress"));
		dto.setJibunAddress(request.getParameter("jibunAddress"));
		dto.setDetailAddress(request.getParameter("detailAddress"));
		dto.setExtraAddress(request.getParameter("extraAddress"));
		//회원 가입일자 타임스탬프 정보 생성
		Date currentDateTime = new Date(System.currentTimeMillis());
		java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDateTime.getTime());
		dto.setRegister_day(timestamp);
		
		dao.insert(dto);
		
		
		return "index.jsp";
	}

}
