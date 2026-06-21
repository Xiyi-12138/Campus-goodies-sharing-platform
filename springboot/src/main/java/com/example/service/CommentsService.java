package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Comments;
import com.example.mapper.CommentsMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务处理
 **/
@Service
public class CommentsService {

    @Resource
    private CommentsMapper commentsMapper;

    /**
     * 新增
     */
    public void add(Comments comments) {
        comments.setTime(DateUtil.now());
        commentsMapper.insert(comments);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        commentsMapper.deleteById(id);
    }

    /**
     * 修改
     */
    public void updateById(Comments comments) {
        commentsMapper.updateById(comments);
    }

    /**
     * 根据ID查询
     */
    public Comments selectById(Integer id) {
        return commentsMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Comments> selectAll(Comments comments) {
        return commentsMapper.selectAll(comments);
    }

    /**
     * 分页查询
     */
    public PageInfo<Comments> selectPage(Comments comments, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Comments> list = commentsMapper.selectAll(comments);
        return PageInfo.of(list);
    }


}