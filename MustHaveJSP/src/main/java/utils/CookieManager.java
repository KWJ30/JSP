package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
	//쿠키 생성
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int CTime) {
		Cookie cookie = new Cookie(cName, cValue);
		
		cookie.setPath("/");
		cookie.setMaxAge(CTime);
		response.addCookie(cookie);
	}
	//쿠키 key값으로 value값 찾기
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals(cName)) {
					cookieValue = c.getValue();
				}
			}
		}
		
		return cookieValue;
	}
	//쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}

}
