package com.example.demo.board.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.board.service.BoardService;
 
@Controller
public class BoardController {
	
	@Autowired
    BoardService mBoardService;
    
    @RequestMapping("/list")
    private String boardList(Model model) throws Exception{
        
        model.addAttribute("list", mBoardService.boardListService());
        
        return "list";
    }
}