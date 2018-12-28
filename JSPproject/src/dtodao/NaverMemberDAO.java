package dtodao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class NaverMemberDAO {

	public String getID(StringBuffer inputToken) {
		try {

			JSONParser token1 = new JSONParser();
			JSONObject token2 = (JSONObject) token1.parse(inputToken.toString());


			String token = (String) token2.get("access_token");// 네이버 로그인 접근 토큰;
			String header = "Bearer " + token; // Bearer 다음에 공백 추가
			token1.reset();

			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			token2 = (JSONObject) token1.parse(response.toString());
			return "naver-" + ((String) ((JSONObject) token2.get("response")).get("email")).split("@")[0];
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}
