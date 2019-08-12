package com.example.demo.board.controller;
 
import java.util.List;
 
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.example.demo.board.domain.CommentVO;
import com.example.demo.board.service.BoardService;
import com.example.demo.board.service.CommentService;
import com.example.demo.board.service.CommentServiceImpl;
 
@Controller
@RequestMapping("/comment")
public class CommentController {
 
	@Autowired
   CommentService mCommentService;
    
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    private List<CommentVO> mCommentServiceList(Model model,@RequestParam int bno) throws Exception{
        return mCommentService.commentListService(bno);
    }
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int bno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setBno(bno);
        comment.setContent(content);
        
        return mCommentService.commentInsertService(comment);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        
        return mCommentService.commentUpdateService(comment);
    }
    
    @RequestMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        
        return mCommentService.commentDeleteService(cno);
    }
    
}