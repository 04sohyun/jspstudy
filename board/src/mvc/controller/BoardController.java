package mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//게시글 페이지당 조회결과 건수 상수 선언 
	static final int LISTCOUNT = 5;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURL = request.getRequestURL().toString();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		System.out.println("requestURL:"+requestURL);
		System.out.println("requestURI:"+requestURI);
		System.out.println("contextPath:"+contextPath);
		System.out.println("command:"+command);
	}
}
