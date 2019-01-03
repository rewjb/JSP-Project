package crawlingUtil;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

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

		Document doc;
		// jsoup 연결 doc
		Elements element;
		// 주소값 및 다른 값들도 다 같고 있는 element
		Elements subElement;
		// 고유 아이디를 갖고 있는 element
		ArrayList<String[]> inURL;
		// 안에 접속할 페이지

		for (int j = 0; j < outURLarray.length; j++) {
			// 총 갖고 있는 url

			doc = Jsoup.connect(outURLarray[j]).get();

			element = doc.select("ul.prdList p.prdImg a[href]");

			subElement = doc.select("ul.prdList li[id^=anchorBoxId]");

			inURL = new ArrayList<>();

			for (int i = 0; i < element.size(); i++) {
				inURL.add(new String[] { new String("http://gtwatch.co.kr" + element.get(i).attr("href")),
						new String(subElement.get(i).attr("id")) });
			} // 이미지 클릭시 넘어가는 페이지 주소

			for (int i = 0; i < inURL.size(); i++) {
				System.out.println("고유 아이디=" + inURL.get(i)[1]);
				getDetailInfo(inURL.get(i)[0]);
			}

		}

	}// 크롤링() : 생성자 종료

	private StringBuffer getDetailInfo(String detailURL) throws IOException {

		Document doc = Jsoup.connect(detailURL).get();

		Elements subjectElements = doc.select("div[class=xans-element- xans-product xans-product-detaildesign] th");
		Elements contentElements = doc.select("div[class=xans-element- xans-product xans-product-detaildesign] td");
		Elements imageElements = doc
				.select("div[class=xans-element- xans-product xans-product-image imgArea] div[class=keyImg] img");

		StringBuffer resultInfo = new StringBuffer();
		// 결과값을 받을 stringbuffer

		if (imageElements.attr("src").contains("http:")) {
			resultInfo.append("이미지 주소=" + imageElements.attr("src") + "\n");
//			System.out.println("아미지 주소=" + imageElements.attr("src"));
//			값 확인용 출력
		} else {
			resultInfo.append("이미지 주소=" + "http:" + imageElements.attr("src") + "\n");
//			 System.out.println("이미지 주소 ="+"http:"+imageElements.attr("src"));
//			값 확인용 출력
		}

		for (int i = 0; i < subjectElements.size(); i++) {

			resultInfo.append(subjectElements.get(i).text() + "=");
			resultInfo.append(contentElements.get(i).text() + "\n");

//			System.out.print(subjectElements.get(i).text() + "=");
//			System.out.println(contentElements.get(i).text());
//		         값 확인용 출력
		}

		System.out.println(resultInfo.toString());
//		최종 값 확인용 
		return resultInfo;
	}// getDetailInfo() : 메서드 종료

	private void imageSave(String source, String fileName) {
		
		File outputFile = new File("asdasd/"+fileName+".jpg");
		outputFile.
		try {

			URL url = new URL(source);
			// 이미지 소스를 url에 넣기
			BufferedImage imgBuffer = ImageIO.read(url);
			// 해당  소스를 읽어오기
			ImageIO.write(imgBuffer, "jpg", outputFile);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
		
		
		
		
	}// imageSave() : 메서드 종료

	public static void main(String[] args) throws Exception {
		new asd();
	}// main() : 메서드 종료

}// 클래스 종료