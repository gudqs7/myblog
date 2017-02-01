package com.guddqs.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.guddqs.blog.entity.Broken;
import com.guddqs.blog.entity.BrokenExample;
import com.guddqs.blog.entity.Pager;

public interface BrokenMapper {
    int countByExample(@Param("example")BrokenExample example);

    int deleteByExample(BrokenExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Broken record);

    int insertSelective(Broken record);

    List<Broken> selectByExample(@Param("example")BrokenExample example,@Param("pager") Pager pager);

    Broken selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Broken record, @Param("example") BrokenExample example);

    int updateByExample(@Param("record") Broken record, @Param("example") BrokenExample example);

    int updateByPrimaryKeySelective(Broken record);

    int updateByPrimaryKey(Broken record);
}