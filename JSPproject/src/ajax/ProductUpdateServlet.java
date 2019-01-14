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

import dtodao.ProductDTO;

/**
 * Servlet implementation class TestAjax
 */
@WebServlet("/ProductUpdateServlet")
public class ProductUpdateServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "C:\\Users\\user\\git\\JSP-Project\\JSPproject\\WebContent\\img\\Dimage";


		MultipartRequest mr = new MultipartRequest(request, path, 1100 * 6000, "UTF-8",new DefaultFileRenamePolicy());
		Enumeration asd = mr.getParameterNames();	
		
		
//		System.out.println("기존아이디 = "+mr.getParameter("hiPID"));
//		System.out.println("모델명 = "+mr.getParameter("model"));
//		System.out.println("제목 = "+mr.getParameter("subject"));
//		System.out.println("가격 = "+mr.getParameter("price"));
//		System.out.println("배달비 = "+mr.getParameter("delMoney"));
//		System.out.println("세이브 머니 = "+mr.getParameter("saveMoney"));
//		System.out.println("구성품 = "+mr.getParameter("components"));
//		System.out.println("브랜드 = "+mr.getParameter("brand"));
//		System.out.println("이미지  = "+mr.getFilesystemName("myFile"));
//		System.out.println("입력받은 아이디  = "+mr.getParameter("inputPID"));
//		확인용  프린터
		
		
		String 배달비 = mr.getParameter("delMoney");
		
		String  imgAddr= "/JSPproject/img/Dimage/" + mr.getParameter("inputPID");
		
		
		int price;
		int deliverPrice;
		int saveMoney;
		
        if (mr.getParameter("price").equals("")) {
        	price = 0;
		}else {
			price = Integer.parseInt(mr.getParameter("price"));
		} 		
		
        if (mr.getParameter("delMoney").equals("")) {
        	deliverPrice =0;
        }else {
        	deliverPrice = Integer.parseInt(mr.getParameter("delMoney"));
        } 		
			
        if (mr.getParameter("saveMoney").equals("")) {
        	saveMoney =0;
        }else {
        	saveMoney =  Integer.parseInt(mr.getParameter("saveMoney"));
        } 		
		
		
		ProductDTO productDTO =  new ProductDTO();
		
		productDTO.setId(mr.getParameter("hiPID"));
		productDTO.setModelName(mr.getParameter("model"));
		productDTO.setName(mr.getParameter("subject"));
		productDTO.setPrice(price);
		productDTO.setDeliverPrice(deliverPrice);
		productDTO.setSaveMoney(saveMoney);
		productDTO.setComponents(mr.getParameter("components"));
		productDTO.setBrand(mr.getParameter("brand"));
		productDTO.setImgaddr(imgAddr);
		
		
		
		
		
		

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
