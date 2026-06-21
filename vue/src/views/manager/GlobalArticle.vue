<template>
  <div>
    <div style="margin-bottom: 20px">
      <el-input @keyup.enter="load" clearable placeholder="请输入您想搜索的内容" v-model="data.title" style="height: 40px; width: 300px"></el-input>
      <el-button type="primary" style="height: 40px; margin-left: 5px" @click="load">搜索</el-button>
    </div>

    <div>
      <el-row :gutter="10">
        <el-col :span="12" v-for="item in data.articleList" :key="item.id" style="margin-bottom: 10px">
          <div class="card" style="display: flex; gap: 10px; cursor: pointer" @click="router.push('/manager/articleDetail?id=' + item.id)">
            <img :src="item.img" alt="" style="display: block; width: 130px; height: 100px; border-radius: 5px">
            <div>
              <div style="font-size: 18px; font-weight: bold; margin-bottom: 10px">{{ item.title }}</div>
              <div style="color: #666; font-size: 13px; margin-bottom: 10px">{{ item.description }}</div>
              <div style="font-size: 14px; color: #666">发布人：{{ item.userName }}
                <span style="margin-left: 20px">发布时间：{{ item.time }}</span>
              </div>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>

    <div style="margin-top: 20px">
      <el-pagination @current-change="load" layout="total, prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total"/>
    </div>
  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request";
import router from "@/router";

const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}'),
  articleList: [],
  pageNum: 1,
  pageSize: 8,
  total: 0,
  title: null
})

// 分页查询
const load = () => {
  request.get('/article/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      title: data.title,
      status: '通过'
    }
  }).then(res => {
    data.articleList = res.data?.list
    data.total = res.data?.total
  })
}
load()
</script>