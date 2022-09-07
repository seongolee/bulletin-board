package com.bulletinBoard.controller;

import com.bulletinBoard.domain.UserDto;
import com.bulletinBoard.service.RegisterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    RegisterServiceImpl registerService;

    // 회원가입 페이지
    @GetMapping("/add")
    public String register() {
        return "registerForm";
    }

    // 회원등록(미완성)
    @PostMapping("/add")
    public String save(@RequestBody UserDto userDto) {
        System.out.println(userDto.toString());
        return "";
    }

    // 아이디 중복확인
    @PostMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestBody UserDto userDto) throws Exception {
        return registerService.idCheck(userDto.getId());
    }
}
