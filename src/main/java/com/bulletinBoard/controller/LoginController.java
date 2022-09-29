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

//    @Autowired
//    JavaMailSender mailSender;

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

    @GetMapping("/findPwd")
    public String findPwdForm() {
        return "findPwd";
    }

//    @PostMapping("/findPwd")
//    @ResponseBody
//    public String findPwd(@RequestBody UserDto userDto) {
//        String findUser = Integer.toString(userDao.findPwd(userDto));
//
//        if(findUser.equals("1")){
//            // ASCII 범위 - 영숫자(0-9, a-z, A-Z)
//            final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//            SecureRandom random = new SecureRandom();
//            StringBuilder sb = new StringBuilder();
//
//            String subject = "임시 비밀번호";
//            String content;
//            String from = "";
//            String to = userDto.getEmail();
//
//            // 12자리의 임시 비밀번호 생성
//            for (int i = 0; i < 12; i++){
//                // ramdom index번호를 저장 후 chars에 index 번호로 접근해서 1개씩 sb에 추가한다.
//                int randomIndex = random.nextInt(chars.length());
//                sb.append(chars.charAt(randomIndex));
//            }
//            userDto.setPwd(sb.toString());
//            content = userDto.getPwd();
//
//            try {
//                System.out.println(mailSender);
//
//                MimeMessage mail = mailSender.createMimeMessage();
//
//                // multipart true를 하면, 단순한 이미지가 아닌 이미지나 파일첨부가 가능하다.
//                // multipart parameter를 생략하면 단순한 텍스트 데이터만 전송이 가능
//                MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
//
//                mailHelper.setFrom(from);
//                mailHelper.setTo(to);
//                mailHelper.setSubject(subject);
//                // html을 사용
//                mailHelper.setText(content, true);
//
//                mailSender.send(mail);
//            } catch(Exception e) {
//                e.printStackTrace();
//            }
//        }
//
//        userDao.updatePwd(userDto);
//
//        return findUser;
//    }

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
