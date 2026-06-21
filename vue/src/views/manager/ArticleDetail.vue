<template>
  <div style="width: 60%; margin:  0 auto;">
    <div class="card" style="padding: 50px; position: relative; margin-bottom: 20px">
      <el-button @click="router.back()" style="position: absolute; top: 10px; left: 10px">返回论坛列表</el-button>
      <div style="position: absolute; top: 10px; right: 10px; width: fit-content; cursor: pointer">
        <img src="@/assets/imgs/赞-1.png" alt="" style="width: 30px" v-if="!data.likes?.id" @click="addLike">
        <img src="@/assets/imgs/赞.png" alt="" style="width: 30px" v-if="data.likes?.id"  @click="removeLike">
      </div>
      <div style="font-size: 28px; font-weight: bold; text-align: center; margin-bottom: 15px">{{ data.article.title }}</div>
      <div style="font-size: 14px; color: #666; text-align: center; margin-bottom: 30px">发布人：{{ data.article.userName }}   <span style="margin-left: 20px">发布时间：{{ data.article.time }}</span></div>
      <div v-html="data.article.content"></div>
    </div>

    <div class="card" style="padding: 20px">
      <div style="font-size: 20px; margin-bottom: 15px; font-weight: bold">评论列表（{{ data.total }}）</div>
      <div style="margin-bottom: 20px">
        <el-input type="textarea" :maxlength="200" v-model="data.content" placeholder="请输入评论内容，限200字" :rows="3"></el-input>
        <div style="text-align: right">
          <el-button style="margin-top: 5px;" type="primary" @click="addComment">发布评论</el-button>
        </div>
      </div>

      <div v-for="item in data.commentList" :key="item.id" style="display: flex; gap: 15px; margin-bottom: 15px">
        <img :src="item.avatar" alt="" style="width: 48px; height: 48px; border-radius: 50%">
        <div style="flex: 1; padding-bottom: 15px; border-bottom: 1px solid #e3e5e7; ">
          <div style="margin-bottom: 6px; font-size: 13px; color: #61666d; font-weight: bold">{{ item.userName }}</div>
          <div style="color: #18191c; font-size: 15px; margin-bottom: 8px; line-height: 24px">{{ item.content }}</div>
          <div style="display: flex; align-items: center; color: #9499a0; font-size: 13px;">
            <div style="margin-right: 20px">{{ item.time }}</div>
          </div>
        </div>
      </div>

      <div style="margin-top: 20px">
        <el-pagination @current-change="loadComment" layout="total, prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total"/>
      </div>
    </div>
  </div>

</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request";
import router from "@/router";
import {ElMessage} from "element-plus";

const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}'),
  id: router.currentRoute.value.query.id,
  article: {},
  likes: {},
  pageNum: 1,
  pageSize: 10,
  total: 0,
  content: null,
  commentList: []
})

request.get('/article/selectById/' + data.id).then(res => {
  data.article = res.data
})

const loadLikes = () => {
  request.get('/likes/selectAll', {
    params: {
      articleId: data.id,
      userId: data.user.id
    }
  }).then(res => {
    data.likes = res.data.length ? res.data[0] : {}
  })
}
loadLikes()


const addLike = () => {
  request.post('/likes/add', { userId : data.user.id, articleId: data.id }).then(res => {
    ElMessage.success('操作成功')
    loadLikes()
  })
}

// 分页查询
const loadComment = () => {
  request.get('/comments/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      articleId: data.id
    }
  }).then(res => {
    data.commentList = res.data?.list
    data.total = res.data?.total
  })
}
loadComment()

const addComment = () => {
  request.post('/comments/add', { userId : data.user.id, articleId: data.id, content: data.content}).then(res => {
    ElMessage.success('评论成功')
    data.content = null  // 清空旧评论
    loadComment()
  })
}
</script>

<style scoped>
.action-item:hover {
  color: #127cdd;
}
</style>