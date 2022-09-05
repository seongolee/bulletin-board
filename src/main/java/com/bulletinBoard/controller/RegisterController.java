package com.bulletinBoard.controller;

import com.bulletinBoard.domain.UserDto;
import com.bulletinBoard.service.RegisterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    RegisterServiceImpl registerService;

    @GetMapping("/add")
    public String register() {
        return "registerForm";
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestBody UserDto userDto) throws Exception {
        int idCheck = registerService.idCheck(userDto.getId());
        return idCheck != 0 ? "false" : "true";
    }
}
