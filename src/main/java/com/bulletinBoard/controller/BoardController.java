package com.bulletinBoard.controller;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;

    @GetMapping("/list")
    public String list(Model m) {
        System.out.println("Controller");
        List<BoardDto> list = boardService.getList();
        m.addAttribute("list", list);
        return "boardList";
    }
}
