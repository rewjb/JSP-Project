package util;

import java.lang.reflect.GenericArrayType;

import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;

public class mail extends Authenticator {

    @Override
    
    protected PasswordAuthentication getPasswordAuthentication() {
    	// 얻다 ! 비밀번호 인증
    	//이것에 대한 설명은 정확히 하기 어렵다.
        return new PasswordAuthentication("아이디","비밀번호");
    }
}



