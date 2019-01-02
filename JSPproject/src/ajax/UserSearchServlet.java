package ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dtodao.MemberDAO;

/**
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset=UTF-8");

		String userName = request.getParameter("userName");
		
		response.getWriter().write(getJSON(userName));

	}
	public String getJSON(String userName) {
	
		if(userName==null) { userName="";}
		
		StringBuffer result = new StringBuffer("");
		
		MemberDAO memberDAO = new MemberDAO();
		
		String selectedID = memberDAO.searchID(userName);
		
		if (selectedID==null) {
			selectedID = "";
		}
		
		result.append( "{ \"result\" : \"");
		result.append(selectedID);
		result.append( "\"}");
		
		return result.toString();
	}

}
