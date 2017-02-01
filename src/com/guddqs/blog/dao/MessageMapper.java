package com.guddqs.blog.dao;

import com.guddqs.blog.entity.Message;
import com.guddqs.blog.entity.MessageExample;
import com.guddqs.blog.entity.Pager;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MessageMapper {
    int countByExample(@Param("example") MessageExample example);

    int deleteByExample(MessageExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    List<Message> selectByExample(@Param("example")MessageExample example,@Param("pager") Pager pager);

    Message selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Message record, @Param("example") MessageExample example);

    int updateByExample(@Param("record") Message record, @Param("example") MessageExample example);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
}