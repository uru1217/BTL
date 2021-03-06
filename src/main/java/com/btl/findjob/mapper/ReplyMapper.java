package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.ReplyDTO;

public interface ReplyMapper {
    //댓글 crud
    public ReplyDTO read(int reply_id);
    
    public int insert(ReplyDTO dto);
    
    public int update(ReplyDTO dto);
    
    public int delete(int reply_id);
    
    //페이징
    public List<ReplyDTO> getListWithPaging(
            @Param("cri")  BoardCriteria cri,
            @Param("board_id") int board_id);
    //조회수
    public int getCountByBoard_id(int board_id);
    
    
    
}
