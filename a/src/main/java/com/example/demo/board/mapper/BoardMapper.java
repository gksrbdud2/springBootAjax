package com.example.demo.board.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.domain.FileVO;

@Mapper
public interface BoardMapper {

	//게시글 목록
    public List<BoardVO> boardList() throws Exception;

    //게시글 작성  
    public int boardInsert(BoardVO board) throws Exception;
    
    //게시글 수정  
    public int boardUpdate(BoardVO board) throws Exception;
    
    //게시글 삭제  
    public int boardDelete(int bno) throws Exception;
    
    //파일업로드
    int fileInsert(FileVO file) throws Exception;
    
}