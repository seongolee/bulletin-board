package com.bulletinBoard.controller;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.SearchCondition;
import com.bulletinBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;

    @GetMapping("/list")
    public String list(Model m, SearchCondition sc, HttpServletRequest request) {
        // 로그인이 되어있는지 확인
        if(!loginCheck(request))
            return "redirect:/login/login";

        List<BoardDto> list = boardService.getList();
        m.addAttribute("list", list);
        return "boardList";
    }

    private boolean loginCheck(HttpServletRequest request) {
        // session 확인 session이 없으면 생성하지 않고 null 값을 반환
        HttpSession session = request.getSession(false);
        // session 이 존재하며, id 값이 존재 여부
        return session!=null && session.getAttribute("id")!=null;
    }
}
