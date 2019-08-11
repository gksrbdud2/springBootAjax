
package com.example.demo.board.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.board.domain.BoardVO;

@Mapper
public interface BoardMapper {
	 //�Խñ� ���  
    public List<BoardVO> boardList() throws Exception;

    //�Խñ� ��
    public BoardVO boardDetail(int bno) throws Exception;
    
    //�Խñ� �ۼ�  
    public int boardInsert(BoardVO board) throws Exception;
    
    //�Խñ� ����  
    public int boardUpdate(BoardVO board) throws Exception;
    
    //�Խñ� ����  
    public int boardDelete(int bno) throws Exception;
    
}