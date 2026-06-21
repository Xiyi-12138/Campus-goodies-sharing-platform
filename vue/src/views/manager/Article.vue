<template>
  <div>

    <div class="card" style="margin-bottom: 5px;">
      <el-input v-model="data.title" style="width: 300px; margin-right: 10px" placeholder="请输入标题查询"></el-input>
      <el-button type="primary" @click="load">查询</el-button>
      <el-button type="info" style="margin: 0 10px" @click="reset">重置</el-button>
    </div>

    <div class="card" style="margin-bottom: 5px">
      <div style="margin-bottom: 10px" v-if="data.user.role === '普通用户'">
        <el-button type="primary" @click="handleAdd">发布新帖</el-button>
      </div>
      <el-table :data="data.tableData" stripe>
        <el-table-column prop="img" label="封面">
          <template #default="scope">
            <el-image style="width: 80px; height: 60px; display: block; border-radius: 5px" :src="scope.row.img" :preview-src-list="[scope.row.img]" preview-teleported></el-image>
          </template>
        </el-table-column>
        <el-table-column prop="title" label="标题" show-overflow-tooltip></el-table-column>
        <el-table-column prop="description" label="简介" show-overflow-tooltip></el-table-column>
        <el-table-column label="内容">
          <template #default="scope">
            <el-button type="primary" @click="view(scope.row.content)">查看内容</el-button>
          </template>
        </el-table-column>
        <el-table-column prop="time" label="发布时间"></el-table-column>
        <el-table-column prop="userName" label="发布人"></el-table-column>
        <el-table-column prop="likeCount" label="点赞数"></el-table-column>
        <el-table-column prop="commentCount" label="评论数"></el-table-column>
        <el-table-column prop="status" label="审核状态">
          <template #default="scope">
            <span style="color: orange" v-if="scope.row.status === '待审核'">待审核</span>
            <b style="color: #01a601" v-if="scope.row.status === '通过'">通过</b>
            <b style="color: red" v-if="scope.row.status === '拒绝'">拒绝</b>
          </template>
        </el-table-column>
        <el-table-column prop="reason" label="审核理由"></el-table-column>
        <el-table-column label="操作" align="center" width="160">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)" v-if="data.user.role === '管理员'">审核</el-button>
            <el-button type="primary" @click="handleEdit(scope.row)" v-if="data.user.role === '普通用户'">编辑</el-button>
            <el-button type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div class="card">
      <el-pagination @current-change="load" background layout="total, prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total"/>
    </div>

    <el-dialog title="内容" v-model="data.viewVisible" width="50%" :close-on-click-modal="false" destroy-on-close>
      <div class="editor-content-view" style="padding: 20px" v-html="data.content"></div>
      <template #footer>
    <span class="dialog-footer">
      <el-button @click="data.viewVisible = false">关 闭</el-button>
    </span>
      </template>
    </el-dialog>

    <el-dialog title="帖子信息" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form ref="formRef" :model="data.form" :rules="data.rules" label-width="100px" style="padding-right: 50px">
        <div v-if="data.user.role === '普通用户'">
          <el-form-item label="封面" prop="img">
            <el-upload
                :action="baseUrl + '/files/upload'"
                :headers="{ 'token': data.user.token }"
                :on-success="handleFileUpload"
                list-type="picture"
                :show-file-list="false"
            >
              <img v-if="data.form.img" style="width: 200px; height: 100px; border-radius: 5px; " :src="data.form.img" alt="">
              <div v-else style="width: 200px; height: 150px; border-radius: 5px; border: 1px dashed #ccc; display: flex; align-items: center; justify-content: center">上传图片</div>
            </el-upload>
          </el-form-item>
          <el-form-item label="标题" prop="title">
            <el-input placeholder="请输入标题" v-model="data.form.title" autocomplete="off" />
          </el-form-item>
          <el-form-item label="简介" prop="description">
            <el-input type="textarea" :rows="3" maxlength="200" placeholder="请输入简介" v-model="data.form.description" autocomplete="off" />
          </el-form-item>
          <el-form-item label="内容" prop="content">
            <div style="border: 1px solid #ccc; width: 100%">
              <Toolbar
                  style="border-bottom: 1px solid #ccc"
                  :editor="editorRef"
                  :mode="mode"
              />
              <Editor
                  style="height: 500px; overflow-y: hidden;"
                  v-model="data.form.content"
                  :mode="mode"
                  :defaultConfig="editorConfig"
                  @onCreated="handleCreated"
              />
            </div>
          </el-form-item>
        </div>
        <div v-if="data.user.role === '管理员'">
          <el-form-item label="审核状态" prop="status">
            <el-radio-group v-model="data.form.status">
              <el-radio-button label="通过" value="通过"></el-radio-button>
              <el-radio-button label="拒绝" value="拒绝"></el-radio-button>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="审核理由" prop="reason">
            <el-input type="textarea" v-model="data.form.reason" placeholder="请输入审核理由"></el-input>
          </el-form-item>
        </div>
      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="data.formVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">保 存</el-button>
      </span>
      </template>
    </el-dialog>

  </div>
</template>

<script setup>
import request from "@/utils/request";
import {reactive, ref} from "vue";
import {ElMessageBox, ElMessage} from "element-plus";
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import {onBeforeUnmount, shallowRef} from "vue";
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'

const formRef = ref()
const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}'),
  pageNum: 1,
  pageSize: 10,
  total: 0,
  formVisible: false,
  form: {},
  tableData: [],
  title: null,
  viewVisible: false,
  content: null,
  rules: {
    img: [
      { required: true, message: '请上传图片', trigger: 'blur' }
    ],
    title: [
      { required: true, message: '请输入标题', trigger: 'blur' }
    ],
    description: [
      { required: true, message: '请输入简介', trigger: 'blur' }
    ],
    content: [
      { required: true, message: '请输入内容', trigger: 'blur' }
    ],
  }
})

const view = (content) => {
  data.content = content
  data.viewVisible = true
}

/* wangEditor5 初始化开始 */
const baseUrl = import.meta.env.VITE_BASE_URL
const editorRef = shallowRef()  // 编辑器实例，必须用 shallowRef
const mode = 'default'
const editorConfig = { MENU_CONF: {} }
// 图片上传配置
editorConfig.MENU_CONF['uploadImage'] = {
  server: baseUrl + '/files/wang/upload',  // 服务端图片上传接口
  fieldName: 'file'  // 服务端图片上传接口参数
}
// 组件销毁时，也及时销毁编辑器，否则可能会造成内存泄漏
onBeforeUnmount(() => {
  const editor = editorRef.value
  if (editor == null) return
  editor.destroy()
})
// 记录 editor 实例，重要！
const handleCreated = (editor) => {
  editorRef.value = editor
}
/* wangEditor5 初始化结束 */


const handleFileUpload = (res) => {
  data.form.img = res.data
}

// 分页查询
const load = () => {
  request.get('/article/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      title: data.title,
      userId: data.user.role === '管理员' ? null : data.user.id
    }
  }).then(res => {
    data.tableData = res.data?.list
    data.total = res.data?.total
  })
}

// 新增
const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}

// 编辑
const handleEdit = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.formVisible = true
}

// 新增保存
const add = () => {
  data.form.userId = data.user.id
  request.post('/article/add', data.form).then(res => {
    if (res.code === '200') {
      load()
      ElMessage.success('操作成功')
      data.formVisible = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 编辑保存
const update = () => {
  request.put('/article/update', data.form).then(res => {
    if (res.code === '200') {
      load()
      ElMessage.success('操作成功')
      data.formVisible = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 弹窗保存
const save = () => {
  formRef.value.validate(valid => {
    if (valid) {
      // data.form有id就是更新，没有就是新增
      data.form.id ? update() : add()
    }
  })
}

// 删除
const handleDelete = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗?', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/article/delete/' + id).then(res => {
      if (res.code === '200') {
        load()
        ElMessage.success('操作成功')
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {})
}

// 重置
const reset = () => {
  data.title = null
  load()
}

load()
</script>
