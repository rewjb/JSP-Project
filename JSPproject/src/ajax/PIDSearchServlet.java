package ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dtodao.ProductDAO;

/**
 * Servlet implementation class PIDSearchServlet
 */
@WebServlet("/PIDSearchServlet")
public class PIDSearchServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String PID = request.getParameter("PID");
		
		StringBuffer result = searchPID(PID);
		
		response.getWriter().write(result.toString());
	}

	private StringBuffer searchPID(String pid) {
		
		StringBuffer stringbuffer = new StringBuffer();
		
		String selectedID = ProductDAO.getInstance().searchPID(pid);
		
		if (selectedID==null) {
			selectedID = "";
		}
		
		stringbuffer.append( "{ \"result\" : \"");
		stringbuffer.append(selectedID);
		stringbuffer.append( "\"}");
		
		return stringbuffer;
	}

}
