package ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dtodao.CartDAO;

/**
 * Servlet implementation class InsertCartQuantity
 */
@WebServlet("/InsertCartQuantity")
public class InsertCartQuantity extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("MID");
		String pid = request.getParameter("PID");
		int quantity = Integer.parseInt(request.getParameter("QUANTITY"));
		response.getWriter().write(mid + pid + quantity);
		CartDAO.getInstance().updateQuantity(mid, pid, quantity);
	}
}
