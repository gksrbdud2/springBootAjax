package com.example.demo.board.service;

import java.util.List;

import com.example.demo.board.domain.CommentVO;

public interface CommentService {
	public List<CommentVO> commentListService(int bno) throws Exception;
	
	public int commentInsertService(CommentVO comment) throws Exception;
	
	public int commentUpdateService(CommentVO comment) throws Exception;
	
	 public int commentDeleteService(int cno) throws Exception;
}
