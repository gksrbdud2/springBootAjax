
package com.example.demo.board.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.board.domain.BoardVO;

@Mapper
public interface BoardMapper {
    //게시글 목록  
    public List<BoardVO> boardList() throws Exception;
    
}