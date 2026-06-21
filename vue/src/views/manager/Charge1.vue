<template>
  <div>

    <div class="card" style="margin-bottom: 5px;">
      <el-input v-model="data.itemName" style="width: 300px; margin-right: 10px" placeholder="请输入物品名称查询"></el-input>
      <el-button type="primary" @click="load">查询</el-button>
      <el-button type="info" style="margin: 0 10px" @click="reset">重置</el-button>
    </div>

    <div class="card" style="margin-bottom: 5px">
      <el-table :data="data.tableData" stripe>
        <el-table-column prop="itemName" label="被交换物品"></el-table-column>
        <el-table-column prop="requirement" label="交换条件"></el-table-column>
        <el-table-column prop="content" label="交换物品"></el-table-column>
        <el-table-column prop="remark" label="交换理由"></el-table-column>
        <el-table-column prop="userName" label="申请人"></el-table-column>
        <el-table-column prop="time" label="申请时间"></el-table-column>
        <el-table-column prop="status" label="审核状态">
          <template v-slot="scope">
            <el-tag type="warning" v-if="scope.row.status === '待审核'">待审核</el-tag>
            <el-tag type="success" v-if="scope.row.status === '通过'">通过</el-tag>
            <el-tag type="danger" v-if="scope.row.status === '拒绝'">拒绝</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="reason" label="审核理由"></el-table-column>
        <el-table-column prop="location" label="交换地点"></el-table-column>
        <el-table-column prop="shareTime" label="交换时间"></el-table-column>
        <el-table-column prop="comment" label="物品主人留言"></el-table-column>
        <el-table-column label="操作" align="center" width="120">
          <template #default="scope">
            <el-button :disabled="scope.row.status !== '待审核'" type="primary" @click="handleEdit(scope.row)">审核</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div class="card">
      <el-pagination @current-change="load" background layout="total, prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total"/>
    </div>

    <el-dialog title="审核信息" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form ref="formRef" :model="data.form" :rules="data.rules" label-width="100px" style="padding-right: 50px">
        <el-form-item label="审核状态" prop="status">
          <el-radio-group v-model="data.form.status">
            <el-radio-button label="通过" value="通过"></el-radio-button>
            <el-radio-button label="拒绝" value="拒绝"></el-radio-button>
          </el-radio-group>
        </el-form-item>
        <div v-if="data.form.status === '通过'">
          <el-form-item label="交换地点" prop="location">
            <el-input placeholder="请输入交换地点" v-model="data.form.location" autocomplete="off" />
          </el-form-item>
          <el-form-item label="交换时间" prop="shareTime">
            <el-date-picker style="width: 100%" v-model="data.form.shareTime" type="datetime" placeholder="交换时间" format="YYYY-MM-DD HH:mm:ss" value-format="YYYY-MM-DD HH:mm:ss" />
          </el-form-item>
        </div>
        <div v-if="data.form.status === '拒绝'">
          <el-form-item label="拒绝理由" prop="reason">
            <el-input placeholder="请输入拒绝理由" v-model="data.form.reason" autocomplete="off" />
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

const formRef = ref()
const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}'),
  pageNum: 1,
  pageSize: 10,
  total: 0,
  formVisible: false,
  form: {},
  tableData: [],
  itemName: null,
  rules: {
    status: [
      { required: true, message: '请选择审核状态', trigger: 'change' }
    ],
    location: [
      { required: true, message: '请输入交换地点', trigger: 'blur' }
    ],
    shareTime: [
      { required: true, message: '请输入交换时间', trigger: 'change' }
    ],
    reason: [
      { required: true, message: '请输入拒绝理由', trigger: 'blur' }
    ],
  }
})

// 分页查询
const load = () => {
  request.get('/charge/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      itemName: data.itemName,
      itemUserid: data.user.id
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

// 编辑保存
const update = () => {
  request.put('/charge/update', data.form).then(res => {
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
    request.delete('/charge/delete/' + id).then(res => {
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

<style scoped>
:deep(.el-tag--warning) {
  color: #ff5900;
}
</style>