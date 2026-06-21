<template>
  <div>
    <div style="height: 60px; background-color: #2c3e50; color: white; display: flex; align-items: center; box-shadow: 0 2px 4px rgba(0,0,0,0.1); z-index: 1000; position: relative;">
      <div style="flex: 1; display: flex; align-items: center">
        <div style="padding-left: 20px; display: flex; align-items: center">
          <img src="@/assets/imgs/logo.png" alt="" style="width: 34px; height: 34px;">
          <div style="font-weight: 600; font-size: 20px; margin-left: 10px; margin-right: 40px; letter-spacing: 1px;">校园好物分享平台</div>
        </div>

        <div style="display: flex; align-items: center">
          <div v-if="data.user.role === '普通用户'"
               class="top-menu-item"
               :class="{ 'active': router.currentRoute.value.path === '/manager/itemsView' }"
               @click="router.push('/manager/itemsView')">
            <el-icon style="margin-right: 6px; font-size: 18px;"><Promotion /></el-icon> 物品分享
          </div>
          <div v-if="data.user.role === '普通用户'"
               class="top-menu-item"
               :class="{ 'active': router.currentRoute.value.path === '/manager/globalArticle' }"
               @click="router.push('/manager/globalArticle')">
            <el-icon style="margin-right: 6px; font-size: 18px;"><School /></el-icon> 校园论坛
          </div>
        </div>
      </div>
      <div style="width: fit-content; padding-right: 20px; display: flex; align-items: center; cursor: pointer" class="user-profile">
        <img style="width: 36px; height: 36px; border-radius: 50%; border: 2px solid rgba(255,255,255,0.2)" :src="data.user.avatar || 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'" alt="">
        <span style="margin-left: 10px; font-size: 14px;">{{ data.user.name }}</span>
      </div>
    </div>

    <div style="display: flex">
      <div style="width: 220px; background-color: #ffffff; min-height: calc(100vh - 60px); border-right: 1px solid #e1e4e8;">
        <el-menu
            router
            style="border: none; padding-top: 10px"
            :default-active="router.currentRoute.value.path"
            :default-openeds="['user','info']"
            active-text-color="#409eff"
            background-color="#ffffff"
            text-color="#555"
        >
          <el-menu-item index="/manager/home">
            <el-icon><HomeFilled /></el-icon>
            <span>系统首页</span>
          </el-menu-item>
          <el-sub-menu index="info" >
            <template #title>
              <el-icon><DataAnalysis /></el-icon>
              <span>信息管理</span>
            </template>
            <el-menu-item index="/manager/article">
              <el-icon><List /></el-icon>
              <span>帖子信息</span>
            </el-menu-item>
            <el-menu-item index="/manager/charge" v-if="data.user.role === '普通用户'">
              <el-icon><InfoFilled /></el-icon>
              <span>物品申请</span>
            </el-menu-item>
            <el-menu-item index="/manager/charge1" v-if="data.user.role === '普通用户'">
              <el-icon><EditPen /></el-icon>
              <span>申请审核</span>
            </el-menu-item>
            <el-menu-item index="/manager/category" v-if="data.user.role === '管理员'">
              <el-icon><Postcard /></el-icon>
              <span>物品分类</span>
            </el-menu-item>
            <el-menu-item index="/manager/items">
              <el-icon><Box /></el-icon>
              <span>物品信息</span>
            </el-menu-item>
            <el-menu-item index="/manager/userCollect" v-if="data.user.role === '普通用户'">
              <el-icon><Star /></el-icon>
              <span>我的收藏</span>
            </el-menu-item>
            <el-menu-item index="/manager/collect" v-if="data.user.role === '管理员'">
              <el-icon><Postcard /></el-icon>
              <span>收藏信息</span>
            </el-menu-item>
            <el-menu-item index="/manager/comments">
              <el-icon><Comment /></el-icon>
              <span>评论信息</span>
            </el-menu-item>
            <el-menu-item index="/manager/notice" v-if="data.user.role === '管理员'">
              <el-icon><Postcard /></el-icon>
              <span>系统公告</span>
            </el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="user" v-if="data.user.role === '管理员'">
            <template #title>
              <el-icon><Memo /></el-icon>
              <span>用户管理</span>
            </template>
            <el-menu-item index="/manager/user">
              <el-icon><User /></el-icon>
              <span>普通用户信息</span>
            </el-menu-item>
            <el-menu-item index="/manager/admin">
              <el-icon><User /></el-icon>
              <span>管理员信息</span>
            </el-menu-item>
          </el-sub-menu>
          <el-menu-item index="/manager/person">
            <el-icon><User /></el-icon>
            <span>个人资料</span>
          </el-menu-item>
          <el-menu-item index="/manager/password">
            <el-icon><Lock /></el-icon>
            <span>修改密码</span>
          </el-menu-item>
          <el-menu-item index="/login" @click="logout" style="margin-top: 20px; border-top: 1px solid #eee;">
            <el-icon><SwitchButton /></el-icon>
            <span>退出系统</span>
          </el-menu-item>
        </el-menu>
      </div>

      <div style="flex: 1; width: 0; background-color: #f6f8fb; padding: 20px">
        <router-view @updateUser="updateUser" />
      </div>
    </div>

  </div>
</template>

<script setup>
import { reactive } from "vue";
import router from "@/router";
import {ElMessage} from "element-plus";

const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}')
})

if (!data.user?.id) {
  ElMessage.error('请登录！')
  router.push('/login')
}

const updateUser = () => {
  data.user = JSON.parse(localStorage.getItem('system-user') || '{}')
}

const logout = () => {
  ElMessage.success('退出成功')
  localStorage.removeItem('system-user')
  router.push('/login')
}
</script>

<style scoped>
.el-menu-item {
  margin: 4px 8px;
  border-radius: 4px;
  height: 45px;
  line-height: 45px;
}
.el-menu-item:hover {
  background-color: #ecf5ff !important;
  color: #409eff;
}
.el-menu-item.is-active {
  background-color: #e6f7ff !important;
  color: #409eff;
  font-weight: bold;
  border-right: 3px solid #1890ff; /* 增加右侧选中指示条 */
}

/* 顶部菜单样式优化 */
.top-menu-item {
  display: flex;
  align-items: center;
  padding: 0 20px;
  height: 60px;
  cursor: pointer;
  font-size: 15px;
  color: rgba(255, 255, 255, 0.7); /* 降低未选中透明度 */
  transition: all 0.3s;
  position: relative;
}
.top-menu-item:hover {
  color: #fff;
  background-color: rgba(255, 255, 255, 0.05);
}
.top-menu-item.active {
  color: #fff;
}
/* 选中下划线动画效果 */
.top-menu-item.active::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 3px;
  background-color: #409eff;
}

:deep(th)  {
  color: #555;
  background-color: #fafafa !important; /* 表头背景更淡雅 */
  font-weight: 600;
}
</style>