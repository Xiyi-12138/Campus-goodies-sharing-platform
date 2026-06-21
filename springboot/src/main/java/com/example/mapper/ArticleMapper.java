package com.example.mapper;

import com.example.entity.Article;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作article相关数据接口
*/
public interface ArticleMapper {

    /**
      * 新增
    */
    int insert(Article article);

    /**
      * 删除
    */
    @Delete("delete from `article` where id = #{id}")
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Article article);

    /**
      * 根据ID查询
    */
    @Select("select article.*, user.name as userName, " +
            "(select count(*) from `likes` where likes.article_id = article.id) as likeCount, " +
            "(select count(*) from `comments` where comments.article_id = article.id) as commentCount " +
            "from `article` left join user on article.user_id = user.id where article.id = #{id}")
    Article selectById(Integer id);

    /**
      * 查询所有
    */
    List<Article> selectAll(Article article);


}
