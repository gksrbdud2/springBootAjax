package com.example.demo.board.controller;
 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.service.BoardService;
 
@Controller
public class BoardController {
	
	@Autowired
    BoardService mBoardService;
    
    @RequestMapping("/list")
    private String boardList(Model model) throws Exception{
        
        //model.addAttribute("list", mBoardService.boardListService());
        
        return "list";
    }
    
    @ResponseBody
    @RequestMapping(value = "/get_list", method = RequestMethod.GET)
    public List<BoardVO> get_board() throws Exception {
		return mBoardService.boardListService();
       
    }

}