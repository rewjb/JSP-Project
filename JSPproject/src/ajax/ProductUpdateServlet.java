package ajax;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dtodao.ProductDAO;
import dtodao.ProductDTO;

/**
 * Servlet implementation class TestAjax
 */
@WebServlet("/ProductUpdateServlet")
public class ProductUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "D:\\WebDeveloper-Jangmin2\\workspace\\JSP-Project\\JSPproject\\WebContent\\img\\Dimage";

		MultipartRequest mr = new MultipartRequest(request, path, 1100 * 6000, "UTF-8", new DefaultFileRenamePolicy());

		System.out.println("기존아이디 = " + mr.getParameter("hiPID"));
//		System.out.println("모델명 = " + mr.getParameter("model"));
//		System.out.println("제목 = " + mr.getParameter("subject"));
//		System.out.println("가격 = " + mr.getParameter("price"));
//		System.out.println("배달비 = " + mr.getParameter("delMoney"));
//		System.out.println("세이브 머니 = " + mr.getParameter("saveMoney"));
//		System.out.println("구성품 = " + mr.getParameter("components"));
//		System.out.println("브랜드 = " + mr.getParameter("brand"));
//		System.out.println("이미지  = " +"/JSPproject/img/Dimage/" +mr.getFilesystemName("myFile"));
//		System.out.println("입력받은 아이디  = " + mr.getParameter("inputPID"));
//		System.out.println("기존 이미지 주소  = " + mr.getParameter("hiImgAddr"));
//		넘오는 값을 확인하는 프린터

		String checkPath;
		ProductDTO productDTO = new ProductDTO();

		if (mr.getFilesystemName("myFile") == null) {
			
			productDTO.setImgaddr(mr.getParameter("hiImgAddr"));

		} else {
			
			productDTO.setImgaddr("/JSPproject/img/Dimage/" + mr.getFilesystemName("myFile"));

			if (mr.getParameter("hiImgAddr").contains("Cimage")) {
//				System.out.println("Cimage에 이미지가 있습니다.");
				checkPath = "D:\\WebDeveloper-Jangmin2\\workspace\\JSP-Project\\JSPproject\\WebContent\\img\\Cimage"
						+ mr.getParameter("hiImgAddr").split("/")[4];
//				System.out.println("이미 저장되어 있는 이미지 주소" + checkPath);
			} else if (mr.getParameter("hiImgAddr").contains("Dimage")) {
//				System.out.println("Dimage에 이미지가 있습니다.");
				checkPath = "D:\\WebDeveloper-Jangmin2\\workspace\\JSP-Project\\JSPproject\\WebContent\\img\\Cimage"
						+ mr.getParameter("hiImgAddr").split("/")[4];
//				System.out.println("이미 저장되어 있는 이미지 주소" + checkPath);
			} else {
//				System.out.println("기존 이미지를 삭제하는 로직이 오류입니다. 확인하세요");
				checkPath = null;
			}
			File file = new File(checkPath);
			file.delete();
//			System.out.println("실제로 존재하니 ? " + file.exists());
		}

		int price;
		int deliverPrice;
		int saveMoney;
		if (mr.getParameter("price").equals("")) {
			price = 0;
		} else {
			price = Integer.parseInt(mr.getParameter("price"));
		}

		if (mr.getParameter("delMoney").equals("")) {
			deliverPrice = 0; 
		} else {
			deliverPrice = Integer.parseInt(mr.getParameter("delMoney"));
		}

		if (mr.getParameter("saveMoney").equals("")) {
			saveMoney = 0;
		} else {
			saveMoney = Integer.parseInt(mr.getParameter("saveMoney"));
		}

		productDTO.setId(mr.getParameter("hiPID"));
		productDTO.setModelName(mr.getParameter("model"));
		productDTO.setName(mr.getParameter("subject"));
		productDTO.setPrice(price);
		productDTO.setDeliverPrice(deliverPrice);
		productDTO.setSaveMoney(saveMoney);
		productDTO.setComponents(mr.getParameter("components"));
		productDTO.setBrand(mr.getParameter("brand"));
	

//		System.out.println("1 :  제품 아이디=" + productDTO.getId());
//		System.out.println("2 :  제품 모델명=" + productDTO.getModelName());
//		System.out.println("3 :  제품 게시글 제목=" + productDTO.getName());
//		System.out.println("4 :  제품 가격=" + productDTO.getPrice());
//		System.out.println("5 :  제품 배달비=" + productDTO.getDeliverPrice());
//		System.out.println("6 :  제품 포인트=" + productDTO.getSaveMoney());
//		System.out.println("7 :  제품 구성품=" + productDTO.getComponents());
//		System.out.println("8 :  제품 브랜드=" + productDTO.getBrand());
//		System.out.println("9 :  제품 이미지 주소=" + productDTO.getImgaddr());
//		DAO에 넘기기 전에 마지막으로 확인하는 출력
		
		ProductDAO.getInstance().updateProduct(mr.getParameter("hiPID") , productDTO);

	}

}
