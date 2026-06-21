<template>
  <div>

    <div class="card" style="margin-bottom: 10px">
      <div>欢迎您，<b>{{ data.user.name }}</b> 祝您今天过得开心！</div>
    </div>
    <div class="card" style="line-height:30px; margin-bottom: 10px">
      <div>今日无事</div>
      <div style="color: #6c737a; font-size: 13px">检测到您的页面展示可能受到浏览器插件影响，建议您将当前页面加入插件白名单，以保障您的浏览体验～</div>
    </div>

    <div class="card" style="padding: 20px">
      <div style="font-size: 20px; font-weight: 400; margin-bottom: 20px">系统公告</div>
      <el-timeline style="max-width: 600px">
        <el-timeline-item
            placement="top"
            v-for="(notice, index) in data.noticeList"
            :key="index"
            color="#0bbd87"
            :timestamp="notice.time"
        >
          <div style="margin-bottom: 10px; font-size: 18px">{{ notice.title }}</div>
          <div style="color: #666">{{ notice.content }}</div>
        </el-timeline-item>
      </el-timeline>
    </div>



  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request";

const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}'),
  noticeList: []
})

request.get('/notice/selectAll').then(res => {
  data.noticeList = res.data
})
</script>