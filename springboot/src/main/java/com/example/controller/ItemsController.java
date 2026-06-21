package com.example.controller;

import com.example.common.Result;
import com.example.entity.Items;
import com.example.service.ItemsService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 管理员前端操作接口
 **/
@RestController
@RequestMapping("/items")
public class ItemsController {

    @Resource
    private ItemsService itemsService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Items items) {
        itemsService.add(items);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        itemsService.deleteById(id);
        return Result.success();
    }

    // 用户上架或下架物品
    @PutMapping("/updateStatus")
    public Result updateStatus(@RequestBody Items items) {
        itemsService.updateById(items);
        return Result.success();
    }


    /**
     * 用户修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Items items) {
        items.setCheckStatus("待审核");
        items.setReason("");
        itemsService.updateById(items);
        return Result.success();
    }

    /**
     * 管理员审核
     */
    @PutMapping("/updateForAdmin")
    public Result updateByIdForAdmin(@RequestBody Items items) {
        itemsService.updateById(items);
        return Result.success();
    }


    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Items items = itemsService.selectById(id);
        return Result.success(items);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Items items) {
        List<Items> list = itemsService.selectAll(items);
        return Result.success(list);
    }

    /**
     * 分页查询
     * userID当前登录的用户ID
     */
    @GetMapping("/selectPage")
    public Result selectPage(Items items,
                             @RequestParam(required = false) Integer loginUserId,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Items> page = itemsService.selectPage(items, loginUserId, pageNum, pageSize);
        return Result.success(page);
    }

}