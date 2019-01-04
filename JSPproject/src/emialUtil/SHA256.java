package emialUtil;

import java.security.MessageDigest;

import dtodao.ProductDAO;



public class SHA256 {

	public static String getSHA256(String input) {
		//input은 회원 이메일 주소

		StringBuffer result = new StringBuffer();
		// 결과 코드값

		try {

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			
			byte[] sentence = "Do not do to others what angers you if done to you by others.".getBytes();
			// 해킹 못하게 막는 글자

			digest.reset();
			// 리셋

			digest.update(sentence);
			// digest에 글자 입력

			byte[] chars = digest.digest(input.getBytes("UTF-8"));

			for(int i = 0; i < chars.length; i++) {

				String hex = Integer.toHexString(0xff & chars[i]);
				// UTF-8로 인코딩한 문장의 각각 글자를 16진수로 변환

				if(hex.length() == 1) result.append('0');

				result.append(hex);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return result.toString();

	}

}


