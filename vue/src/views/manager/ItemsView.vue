<template>
  <div>
    <div class="card" style="margin-bottom: 10px; display: flex; align-items: center">
      <div style="flex: 1">
        <el-button @click="changeCategoryItem(null)" :type="data.categoryId === null ? 'primary' : 'default'">全部</el-button>
        <el-button @click="changeCategoryItem(item.id)" :type="data.categoryId === item.id ? 'primary' : 'default'" v-for="item in data.categoryList" :key="item.id">{{ item.name }}</el-button>
      </div>
      <div>
        <el-input clearable @clear="load" @keyup.enter="load" style="width: 300px" v-model="data.name" placeholder="请输入物品名称"></el-input>
        <el-button @click="load" type="primary" style="margin-left: 5px">搜索</el-button>
      </div>

    </div>

    <div v-if="data.total > 0">
      <el-row :gutter="20">
        <el-col :span="6" v-for="item in data.tableData" :key="item.id" style="margin-bottom: 20px">
          <div class="card item-card" style="padding: 0; min-height: 380px; display: flex; flex-direction: column">
            <img :src="item.img" alt="" style="width: 100%; height: 220px; object-fit: cover; display: block; border-radius: 5px 5px 0 0">
            <div style="padding: 15px; flex: 1; display: flex; flex-direction: column">
              <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 10px">
                <div style="flex: 1; font-size: 18px; font-weight: bold; overflow: hidden; text-overflow: ellipsis; white-space: nowrap" :title="item.name">{{ item.name }}</div>
                <el-button @click="addCollect(item.id)" v-if="!item.collectId" size="small" type="primary" plain round>收藏</el-button>
                <el-button @click="removeCollect(item)" v-else size="small" type="danger" plain round>取消</el-button>
              </div>
              <div class="ellipsis2" style="margin-bottom: 8px; font-size: 14px; color: #666; line-height: 1.5;" ><span style="color: #333; font-weight: 500">描述：</span>{{ item.description }}</div>
              <div class="ellipsis2" style="margin-bottom: 8px; font-size: 14px; color: #666; line-height: 1.5;" ><span style="color: #333; font-weight: 500">条件：</span>{{ item.requirement }}</div>
              
              <div style="margin-top: auto;">
                <div style="display: flex; justify-content: space-between; align-items: center; font-size: 12px; color: #999; margin-bottom: 15px;">
                  <div><span style="margin-right: 5px">👤</span>{{item.userName}}</div>
                  <div>{{ item.time }}</div>
                </div>
                <div style="text-align: center">
                  <el-button @click="handleCharge(item)" type="primary" style="width: 100%; border-radius: 20px" :disabled="item.userId === data.user.id">申请交换</el-button>
                </div>
              </div>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>

    <div v-else>
      <div class="card" style="padding: 50px; display: flex; justify-content: center; align-items: center; font-size: 20px; color: #666">暂无物品...</div>
    </div>

    <el-dialog title="申请信息" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form ref="formRef" :model="data.form" :rules="data.rules" label-width="100px" style="padding-right: 50px">
        <div style="padding-left: 30px; margin-bottom: 20px; color: #1890ff">当前申请交换：<b>{{ data.form.itemName }}</b></div>
        <el-form-item label="交换物品" prop="content">
          <el-input placeholder="请输入您提供的交换物品" v-model="data.form.content" autocomplete="off" />
        </el-form-item>
        <el-form-item label="交换理由" prop="remark">
          <el-input type="textarea" :rows="3" maxlength="200" placeholder="请输入交换理由" v-model="data.form.remark" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="data.formVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveCharge">保 存</el-button>
      </span>
      </template>
    </el-dialog>

  </div>
</template>

<script setup>
import { reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import router from "@/router";

const formRef = ref()
const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}'),
  categoryList: [],
  categoryId: null,  // 当前选中的分类ID
  name: router.currentRoute.value.query.name || null,
  pageNum: 1,
  pageSize: 10,
  total: 0,
  tableData: [],
  form: {},
  rules: {
    content: [
      { required: true, message: '请输入交换物品', trigger: 'blur' }
    ],
  }
})

const addCollect = (itemId) => {
  request.post('/collect/add', { itemId: itemId, userId: data.user.id }).then(res => {
    if (res.code === '200') {
      load()
      ElMessage.success('操作成功')
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const removeCollect = (item) => {
  request.delete('/collect/delete/' + item.collectId).then(res => {
    if (res.code === '200') {
      load()
      ElMessage.success('操作成功')
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const handleCharge = (item) => {
  data.formVisible = true
  data.form = { itemName: item.name, itemId: item.id, itemUserid: item.userId }
}

const saveCharge = () => {
  formRef.value.validate(valid => {
    if (valid) {
      data.form.userId = data.user.id
      request.post('/charge/add', data.form).then(res => {
        if (res.code === '200') {
          load()
          ElMessage.success('操作成功')
          data.formVisible = false
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}

// 查询分类数据
request.get('/category/selectAll').then(res => {
  data.categoryList = res.data
})

const changeCategoryItem = (categoryId) => {
  data.categoryId = categoryId
  load()
}

// 分页查询
const load = () => {
  request.get('/items/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name,
      loginUserId: data.user.id,  // 当前登录的用户ID
      status: true,
      checkStatus: '通过',
      categoryId: data.categoryId
    }
  }).then(res => {
    if (res.code === '500') {
      ElMessage.error(res.msg)
      return
    }
    data.tableData = res.data?.list
    data.total = res.data?.total
  })
}
load()

const clearPathParam = () => {
  let url = location.href
  url = url.replace(/(\?|#)[^'"]*/, '');           //去除参数
  window.history.pushState({},0, url);
}
clearPathParam()
</script>

<style>
.item-card {
  transition: all 0.3s;
  border: 1px solid #f0f0f0;
}
.item-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}
.ellipsis2 {
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1; /* 超出几行省略 */
  overflow: hidden;
}
</style>