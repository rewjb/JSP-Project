package crawlingUtil;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dtodao.ProductDAO;
import dtodao.ProductDTO;

public class PullData {

	public PullData() throws Exception {

		String outURLarray[] = { "http://gtwatch.co.kr/product/list.html?cate_no=197", // 브랜드 : 가이거
				"http://gtwatch.co.kr/product/list.html?cate_no=194", // 브랜드 : 다니엘 웰링턴(남)
				"http://gtwatch.co.kr/product/list.html?cate_no=190", // 브랜드 : 디젤
				"http://gtwatch.co.kr/product/list.html?cate_no=219", // 브랜드 : 루미녹스
				"http://gtwatch.co.kr/product/list.html?cate_no=186", // 브랜드 : 구찌
				"http://gtwatch.co.kr/product/list.html?cate_no=208", // 브랜드 : 다니엘 웰링턴(여)
				"http://gtwatch.co.kr/product/list.html?cate_no=184", // 브랜드 : DKNY
				"http://gtwatch.co.kr/product/list.html?cate_no=324", // 브랜드 : 마크제이콥스
				"http://gtwatch.co.kr/product/list.html?cate_no=28" // 브랜드 : 커플시계
		};
		
		String brandArray[] = {"가이거","다니엘 웰링턴(남)","디젤","루미눅스","구찌","다니엘 웰링턴(여)","DKNY","마크제이콥스","커플시계"};

		Document doc;
		// jsoup 연결 doc
		Elements element;
		// 주소값 및 다른 값들도 다 같고 있는 element
		Elements subElement;
		// 고유 아이디를 갖고 있는 element
		ArrayList<String[]> inURL;
		// 안에 접속할 페이지
		JSONParser startJson = new JSONParser();
		// 처음 제이슨을 팔스할 객체
		JSONObject Json;
		// 선택 제이슨
		String brand;
		//브랜드
		ArrayList<ProductDTO> productList = new ArrayList<>();
		//DTO LIST !
		ProductDTO productDTO;
		//내용을 넣을 DTO
		ProductDAO productDAO = new ProductDAO();
		
//		int testInt = 0;
//		출력 갯수 표시용 인트

		for (int j = 0; j < outURLarray.length; j++) {
			// 총 갖고 있는 url

			doc = Jsoup.connect(outURLarray[j]).get();

			element = doc.select("ul.prdList p.prdImg a[href]");
			
			subElement = doc.select("ul.prdList li[id^=anchorBoxId]");

			inURL = new ArrayList<>();
			
			brand = brandArray[j];
			
			for (int i = 0; i < element.size(); i++) {
				inURL.add(new String[] { new String("http://gtwatch.co.kr" + element.get(i).attr("href")),
						new String(subElement.get(i).attr("id")) });
			} // 이미지 클릭시 넘어가는 페이지 주소
			

			for (int i = 0; i < inURL.size(); i++) {
				
				Json = (JSONObject)startJson.parse(getDetailInfo(inURL.get(i)[0]).toString());
				//제품 상세내용이 있는 Json 객체 얻기
				
				if (Json.get("모델")==null || Json.get("상품명")==null || ((String)Json.get("판매가")).replaceAll(",", "").replaceAll("원", "")==null
					|| ((String)Json.get("배송비")).split("원")[0].replaceAll(",", "")==null || ((String)Json.get("적립금")).split("원")[0].replaceAll(",", "")==null
					|| (String)Json.get("구성품")==null)
						 {
					continue;
				}
				
				
				productDTO = new ProductDTO();
				
				productDTO.setId(inURL.get(i)[1]);
				productDTO.setBrand(brand);
				productDTO.setModelName((String)Json.get("모델"));
				productDTO.setName((String)Json.get("상품명"));
				productDTO.setPrice(Integer.parseInt(((String)Json.get("판매가")).replaceAll(",", "").replaceAll("원", "")));
				productDTO.setDeliverPrice(Integer.parseInt(((String)Json.get("배송비")).split("원")[0].replaceAll(",", "")));
				productDTO.setSaveMoney(Integer.parseInt(((String)Json.get("적립금")).split("원")[0].replaceAll(",", "")));
				productDTO.setComponents((String)Json.get("구성품"));
				productDTO.setImgaddr("/JSPproject/img/Cimage/"+inURL.get(i)[1]+".jpg");
				
				productList.add(productDTO);
				
				System.out.println(productDTO.getBrand());
				System.out.println("아이디=" + productDTO.getId());
				System.out.println("이미지 = "+productDTO.getImgaddr());
				System.out.println("상품명 = "+productDTO.getName());
				System.out.println("판매가 = "+productDTO.getPrice());
				System.out.println("배송비 = "+productDTO.getDeliverPrice());
				System.out.println("적립금 = "+productDTO.getSaveMoney());
				System.out.println("모델 = "+productDTO.getModelName());
				System.out.println("구성품 = "+productDTO.getComponents());
//				DTO에 값이 잘 들어갔는지 확인
				
				imageSave((String)Json.get("이미지"), inURL.get(i)[1]);
				
//				getDetailInfo(inURL.get(i)[0]);
//				제이슨 오류 찾기용
				
//				System.out.println(++testInt);
//				출력 갯수 표시용
			}
		}
		
		productDAO.joinProduct(productList);

	}// 크롤링() : 생성자 종료

	private StringBuffer getDetailInfo(String detailURL) throws IOException {

		Document doc = Jsoup.connect(detailURL).get();

		Elements subjectElements = doc.select("div[class=xans-element- xans-product xans-product-detaildesign] th");
		Elements contentElements = doc.select("div[class=xans-element- xans-product xans-product-detaildesign] td");
		Elements imageElements = doc
				.select("div[class=xans-element- xans-product xans-product-image imgArea] div[class=keyImg] img");

		StringBuffer resultInfo = new StringBuffer();
		// 결과값을 받을 stringbuffer
		
		resultInfo.append("{\n");

		if (imageElements.attr("src").contains("http:")) {
			resultInfo.append("\"이미지\":" +"\""+ imageElements.attr("src") + "\",\n");
//			System.out.println("아미지 주소=" + imageElements.attr("src"));
//			값 확인용 출력
		} else {
			resultInfo.append("\"이미지\":" + "\"http:" + imageElements.attr("src") + "\",\n");
//			 System.out.println("이미지 주소 ="+"http:"+imageElements.attr("src"));
//			값 확인용 출력
		}

		

		for (int i = 0; i < contentElements.size(); i++) {

			resultInfo.append("\"" + subjectElements.get(i).text() + "\":");

			if (i == (subjectElements.size() - 1)) {
				resultInfo.append("\"" + contentElements.get(i).text().replaceAll("\"", "") + "\"");
			} else {
				resultInfo.append("\"" + contentElements.get(i).text().replaceAll("\"", "") + "\",\n");
			}


		}
		resultInfo.append("\n}\n");

//		System.out.println(resultInfo.toString());
//		최종 값 확인용 
		return resultInfo;

	}// getDetailInfo() : 메서드 종료

	private void imageSave(String source, String fileName) {
		
		File outputFile = new File("C:\\Users\\user\\Desktop\\JSP\\JSPproject\\WebContent\\img\\Cimage\\"+fileName+".jpg");
		try {

			URL url = new URL(source);
			// 이미지 소스를 url에 넣기
			BufferedImage imgBuffer = ImageIO.read(url);
			// 해당  소스를 읽어오기
			ImageIO.write(imgBuffer, "jpg", outputFile);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}	// imageSave() : 메서드 종료
		
	
	public static void main(String[] args) throws Exception {
		new PullData();
	}
		
		
		



}// 클래스 종료