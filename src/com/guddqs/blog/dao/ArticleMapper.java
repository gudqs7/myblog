package com.guddqs.blog.dao;

import com.guddqs.blog.entity.Article;
import com.guddqs.blog.entity.ArticleExample;
import com.guddqs.blog.entity.Pager;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleMapper {
    int countByExample(@Param("example") ArticleExample example);

    int deleteByExample(@Param("example") ArticleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    List<Article> selectByExample(@Param("example") ArticleExample example,@Param("pager") Pager pager);

    Article selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByExample(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);
}