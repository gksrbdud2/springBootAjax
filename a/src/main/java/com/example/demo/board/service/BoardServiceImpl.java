package com.example.demo.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
    BoardMapper mBoardMapper;

	@Override
	public List<BoardVO> boardListService() throws Exception {		
		return mBoardMapper.boardList();
	}

}
