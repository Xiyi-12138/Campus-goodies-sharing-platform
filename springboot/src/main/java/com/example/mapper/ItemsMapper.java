package com.example.mapper;

import com.example.entity.Items;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作items相关数据接口
*/
public interface ItemsMapper {

    /**
      * 新增
    */
    int insert(Items items);

    /**
      * 删除
    */
    @Delete("delete from `items` where id = #{id}")
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Items items);

    /**
      * 根据ID查询
    */
    @Select("select * from `items` where id = #{id}")
    Items selectById(Integer id);

    /**
      * 查询所有
    */
    List<Items> selectAll(Items items);


}