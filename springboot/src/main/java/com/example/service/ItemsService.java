package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Collect;
import com.example.entity.Items;
import com.example.mapper.CollectMapper;
import com.example.mapper.ItemsMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务处理
 **/
@Service
public class ItemsService {

    @Resource
    private ItemsMapper itemsMapper;
    @Resource
    CollectMapper collectMapper;

    /**
     * 新增
     */
    public void add(Items items) {
        items.setTime(DateUtil.now());
        items.setCheckStatus("待审核");
        itemsMapper.insert(items);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        itemsMapper.deleteById(id);
    }

    /**
     * 修改
     */
    public void updateById(Items items) {
        // 用户触发编辑
        itemsMapper.updateById(items);
    }

    /**
     * 根据ID查询
     */
    public Items selectById(Integer id) {
        return itemsMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Items> selectAll(Items items) {
        return itemsMapper.selectAll(items);
    }

    /**
     * 分页查询
     */
    public PageInfo<Items> selectPage(Items items, Integer userId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Items> list = itemsMapper.selectAll(items);
        if(userId != null){
            for(Items item:list){
                // 设置当前用户的收藏ID 获取用户收藏的信息
                Collect collect = collectMapper.selectByItemIdAndUserId(item.getId(), userId);
                if(collect != null){
                    item.setCollectId(collect.getId());
                }
            }
        }
        return PageInfo.of(list);
    }


}