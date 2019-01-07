package ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dtodao.CartDAO;

/**
 * Servlet implementation class InsertCartServlet
 */
@WebServlet("/InsertCartServlet")
public class InsertCartServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset=UTF-8");

		String pid = request.getParameter("pid");
		String mid = request.getParameter("mid");

		response.getWriter().write(registerCart());
	}

	private String registerCart(String pid , String mid) {
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.registerCart(pid, mid);
	
		
		return null;
	}

}
