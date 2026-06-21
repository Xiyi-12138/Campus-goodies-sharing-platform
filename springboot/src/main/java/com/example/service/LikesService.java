package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Likes;
import com.example.mapper.LikesMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务处理
 **/
@Service
public class LikesService {

    @Resource
    private LikesMapper likesMapper;

    /**
     * 新增
     */
    public void add(Likes likes) {
        likesMapper.insert(likes);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        likesMapper.deleteById(id);
    }

    /**
     * 修改
     */
    public void updateById(Likes likes) {
        likesMapper.updateById(likes);
    }

    /**
     * 根据ID查询
     */
    public Likes selectById(Integer id) {
        return likesMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Likes> selectAll(Likes likes) {
        return likesMapper.selectAll(likes);
    }

    /**
     * 分页查询
     */
    public PageInfo<Likes> selectPage(Likes likes, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Likes> list = likesMapper.selectAll(likes);
        return PageInfo.of(list);
    }


}