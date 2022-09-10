package com.bulletinBoard.controller;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.PageHandler;
import com.bulletinBoard.domain.SearchCondition;
import com.bulletinBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
            // 로그인이 되어있지 않으면 로그인화면으로 보내면서 requestURL을 toURL 파람으로 저장
            return "redirect:/login/login?toURL="+request.getRequestURI();

        int totalCnt = boardService.getSearchResultCnt(sc);
        PageHandler ph = new PageHandler(sc, totalCnt);
        List<BoardDto> boardDtoList = boardService.getSearchResultPage(sc);

        m.addAttribute("totalCnt", totalCnt);
        m.addAttribute("boardDtoList", boardDtoList);
        m.addAttribute("ph", ph);

        return "boardList";
    }

    @PostMapping("/modify")
    public String update(BoardDto boardDto, HttpSession session,Model m){
        // bno, title, content -> boardDto
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try{
            if(boardService.update(boardDto) != 1)
                throw new Exception("Update failed");

            return "redirect:/board/list";

        }catch(Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "MOD_ERR");
            return "board";
        }
    }

    @GetMapping("/read")
    public String read(Integer bno, Model m){
        BoardDto boardDto = boardService.read(bno);
        m.addAttribute(boardDto);
        return "board";
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "board";
    }

    @PostMapping("/write")
    public String write(BoardDto boardDto, HttpSession session, Model m) {
        // 세션에 저장되어있는 ID 가져오기
        String writer = getSessionId(session);
        System.out.println("session id check: " + writer);
        boardDto.setWriter(writer);

        try{
            if(boardService.write(boardDto)!=1)
                throw new Exception("write failed");
        } catch(Exception e){
            e.printStackTrace();
            m.addAttribute("msg", "WRT_ERR");
            m.addAttribute("mode", "new");
            m.addAttribute(boardDto);
            return "board";
        }

        return "redirect:/board/list";
    }

    @PostMapping("/remove")
    public String delete(SearchCondition sc, Integer bno, HttpSession session){
        String writer = (String)session.getAttribute("id");
        String msg = "DEL_OK";

        try{
            // 정상적으로 실행이되면 1이 반환된다.
            if(boardService.remove(bno, writer)!=1){
                throw new Exception("delete failed");
            }
        }catch(Exception e){
            e.printStackTrace();
            msg = "DEL_ERR";
        }
        return "redirect:/board/list"+sc.getQueryString();
    }


    private boolean loginCheck(HttpServletRequest request) {
        // session 확인 session이 없으면 생성하지 않고 null 값을 반환
        HttpSession session = request.getSession(false);
        // session 이 존재하며, id 값이 존재 여부
        return session!=null && session.getAttribute("id")!=null;
    }

    private String getSessionId(HttpSession session){
        return (String)session.getAttribute("id");
    }
}
