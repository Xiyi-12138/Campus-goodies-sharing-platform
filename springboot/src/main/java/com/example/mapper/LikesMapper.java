package com.example.mapper;

import com.example.entity.Likes;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作likes相关数据接口
*/
public interface LikesMapper {

    /**
      * 新增
    */
    int insert(Likes likes);

    /**
      * 删除
    */
    @Delete("delete from `likes` where id = #{id}")
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Likes likes);

    /**
      * 根据ID查询
    */
    @Select("select * from `likes` where id = #{id}")
    Likes selectById(Integer id);

    /**
      * 查询所有
    */
    List<Likes> selectAll(Likes likes);


}