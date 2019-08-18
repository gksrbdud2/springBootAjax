package com.example.demo.board.service;

import java.util.List;

import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.domain.FileVO;

public interface BoardService {

	 List<BoardVO> boardListService() throws Exception;
	 
	 int boardInsertService(BoardVO board) throws Exception;
	    
	 int boardUpdateService(BoardVO board) throws Exception;
	    
	 int boardDeleteService(int bno) throws Exception;
	 
	 int fileInsertService(FileVO file) throws Exception;
}
