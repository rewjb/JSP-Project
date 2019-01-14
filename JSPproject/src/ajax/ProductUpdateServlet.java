package ajax;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class TestAjax
 */
@WebServlet("/ProductUpdateServlet")
public class ProductUpdateServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "C:\\Users\\user\\git\\JSP-Project\\JSPproject\\WebContent\\img\\Dimage";


		MultipartRequest mr = new MultipartRequest(request, path, 1100 * 6000, "UTF-8",new DefaultFileRenamePolicy());
		Enumeration asd = mr.getParameterNames();	
		

	}
	
	
	
	

}


//hiPID
//model
//subject
//price
//components
//inputPID
//delMoney
//saveMoney
