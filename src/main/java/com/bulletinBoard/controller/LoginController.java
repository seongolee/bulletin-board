package com.bulletinBoard.controller;

import com.bulletinBoard.dao.UserDao;
import com.bulletinBoard.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserDao userDao;

    @GetMapping("/login")
    public String loginForm(){
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        // 세션을 종료
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, String toURL, boolean rememberId, HttpServletRequest request,
                        HttpServletResponse response) throws Exception {
        // id 와 pwd 를 확인
        if(!loginCheck(id, pwd)) {
            // 일치하지 않으면, msg 를 포함해서 로그인 화면으로 이동
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
            return "redirect:/login/login?msg="+msg;
        }

        // id 와 pwd 가 일치
        // 세션 객체를 얻어오기
        HttpSession session = request.getSession();
        // 세션 객체에 id를 저장
        session.setAttribute("id", id);

        // 쿠키를 생성
        Cookie cookie = new Cookie("id", id);

        if(!rememberId) {
            // 기존에 있을수도 있는 쿠키를 제거한다.
            cookie.setMaxAge(0);
        }
        // 브라우저에 쿠키 저장
        response.addCookie(cookie);

        // home 또는 접근한 url로 이동
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        return "redirect:"+toURL;
    }

    private boolean loginCheck(String id, String pwd) {
        UserDto userDto = null;

        // id에 맞는 user 를 검색 없을 수 있기때문에 예외처리
        try {

            userDto = userDao.selectUser(id);
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
        // 입력받은 아이디와 비밀번호가 일치하는지 체크
        return userDto != null && userDto.getPwd().equals(pwd);
    }
}
