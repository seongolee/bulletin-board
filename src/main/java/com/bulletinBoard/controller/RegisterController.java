package com.bulletinBoard.controller;

import com.bulletinBoard.domain.UserDto;
import com.bulletinBoard.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    RegisterService registerService;

    // 회원가입 페이지
    @GetMapping("/add")
    public String register(HttpSession session) {
        // 세션 종료
        session.invalidate();
        return "registerForm";
    }

    // 회원등록
    @PostMapping("/add")
    public String save(UserDto userDto) {
        try{
            registerService.insertUser(userDto);

        }catch(Exception e) {
            e.printStackTrace();
        }

        return "redirect:/";

    }

    // 아이디 중복확인
    @PostMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestBody UserDto userDto) throws Exception {
        return registerService.idCheck(userDto.getId());
    }
}
