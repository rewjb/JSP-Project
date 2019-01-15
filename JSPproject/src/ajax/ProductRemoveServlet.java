package ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dtodao.ProductDAO;

/**
 * Servlet implementation class ProductRemoveServlet
 */
@WebServlet("/ProductRemoveServlet")
public class ProductRemoveServlet extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String PID = request.getParameter("PID");	
	
//	System.out.println(PID);
//	PID 확인용
	ProductDAO.getInstance().dropProduct(PID);
	}

}
