<template>
  <div>

    <div class="card" style="margin-bottom: 5px;">
      <el-input v-model="data.name" style="width: 300px; margin-right: 10px" placeholder="请输入名称查询"></el-input>
      <el-button type="primary" @click="load">查询</el-button>
      <el-button type="info" style="margin: 0 10px" @click="reset">重置</el-button>
    </div>

    <div class="card" style="margin-bottom: 5px">
      <div style="margin-bottom: 10px" v-if="data.user.role === '普通用户'">
        <el-button type="primary" @click="handleAdd">新增</el-button>
      </div>
      <el-table :data="data.tableData" stripe>
        <el-table-column prop="name" label="名称"></el-table-column>
        <el-table-column prop="categoryName" label="分类"></el-table-column>
        <el-table-column prop="img" label="图片">
          <template #default="scope">
            <img :src="scope.row.img" alt="" style="width: 50px; height: 50px; border-radius: 5px">
          </template>
        </el-table-column>
        <el-table-column prop="description" label="描述" show-overflow-tooltip></el-table-column>
        <el-table-column prop="requirement" label="交换条件" show-overflow-tooltip></el-table-column>
        <el-table-column prop="userName" label="上传人" v-if="data.user.role === '管理员'"></el-table-column>
        <el-table-column prop="time" label="上传时间"></el-table-column>
        <el-table-column prop="checkStatus" label="审核状态">
          <template v-slot="scope">
            <el-tag type="warning" v-if="scope.row.checkStatus === '待审核'">待审核</el-tag>
            <el-tag type="success" v-if="scope.row.checkStatus === '通过'">通过</el-tag>
            <el-tag type="danger" v-if="scope.row.checkStatus === '拒绝'">拒绝</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="reason" label="审核理由"></el-table-column>
        <el-table-column prop="status" label="上架状态">
          <template #default="scope">
            <el-switch :disabled="data.user.role === '管理员'" @change="changeStatus(scope.row)" v-model="scope.row.status"></el-switch>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="160">
          <template #default="scope">
            <el-button v-if="data.user.role === '管理员'" type="primary" @click="handleEdit(scope.row)">审核</el-button>
            <el-button v-if="data.user.role === '普通用户'" :disabled="scope.row.checkStatus === '待审核'" type="primary" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div class="card">
      <el-pagination @current-change="load" background layout="total, prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total"/>
    </div>

    <el-dialog title="物品信息" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form ref="formRef" :model="data.form" :rules="data.rules" label-width="100px" style="padding-right: 50px">
        <div v-if="data.user.role === '普通用户'">
          <el-form-item label="分类" prop="categoryId">
            <el-select v-model="data.form.categoryId">
              <el-option v-for="item in data.categoryList" :key="item.id" :label="item.name" :value="item.id"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="名称" prop="name">
            <el-input placeholder="请输入名称" v-model="data.form.name" autocomplete="off" />
          </el-form-item>
          <el-form-item label="图片" prop="img">
            <el-upload
                :action="baseUrl + '/files/upload'"
                :headers="{ 'token': data.user.token }"
                :on-success="handleFileUpload"
                list-type="picture"
                :show-file-list="false"
            >
              <img v-if="data.form.img" style="width: 200px; height: 100px; border-radius: 5px; " :src="data.form.img" alt="">
              <div v-else style="width: 100px; height: 100px; border-radius: 5px; border: 1px dashed #ccc; display: flex; align-items: center; justify-content: center">上传图片</div>
            </el-upload>
          </el-form-item>
          <el-form-item label="描述" prop="description">
            <el-input type="textarea" :rows="3" maxlength="200" placeholder="请输入描述" v-model="data.form.description" autocomplete="off" />
          </el-form-item>
          <el-form-item label="交换条件" prop="requirement">
            <el-input type="textarea" :rows="3" maxlength="200" placeholder="请输入交换条件" v-model="data.form.requirement" autocomplete="off" />
          </el-form-item>
        </div>
        <div v-if="data.user.role === '管理员'">
          <el-form-item label="审核状态" prop="checkStatus">
            <el-radio-group v-model="data.form.checkStatus">
              <el-radio-button label="通过" value="通过"></el-radio-button>
              <el-radio-button label="拒绝" value="拒绝"></el-radio-button>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="审核理由" prop="reason">
            <el-input type="textarea" :rows="3" maxlength="200" placeholder="请输入审核理由" v-model="data.form.reason" autocomplete="off" />
          </el-form-item>
        </div>
      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="data.formVisible = false">取 消</el-button>
        <el-button type="primary" @click="save" v-if="data.user.role === '普通用户'">保 存</el-button>
        <el-button type="primary" @click="audit" v-if="data.user.role === '管理员'">保 存</el-button>
      </span>
      </template>
    </el-dialog>

  </div>
</template>

<script setup>
import request from "@/utils/request";
import {reactive, ref} from "vue";
import {ElMessageBox, ElMessage} from "element-plus";

const baseUrl = import.meta.env.VITE_BASE_URL
const formRef = ref()
const data = reactive({
  user: JSON.parse(localStorage.getItem('system-user') || '{}'),
  pageNum: 1,
  pageSize: 10,
  total: 0,
  formVisible: false,
  form: {},
  tableData: [],
  categoryList: [],
  name: null,
  rules: {
    categoryId: [
      { required: true, message: '请选择分类', trigger: 'change' }
    ],
    name: [
      { required: true, message: '请输入名称', trigger: 'blur' }
    ],
    img: [
      { required: true, message: '请上传图片', trigger: 'blur' }
    ],
    description: [
      { required: true, message: '请输入描述', trigger: 'blur' }
    ],
    requirement: [
      { required: true, message: '请输入交换条件', trigger: 'blur' }
    ],
    checkStatus: [
      { required: true, message: '请选择审核状态', trigger: 'change' }
    ],
  }
})

const handleFileUpload = (res) => {
  data.form.img = res.data
}

// 分页查询
const load = () => {
  request.get('/items/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name,
      userId: data.user.role === '管理员' ? null : data.user.id
    }
  }).then(res => {
    data.tableData = res.data?.list
    data.total = res.data?.total
  })
}

// 查询分类数据
request.get('/category/selectAll').then(res =>{
  data.categoryList = res.data
})

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
  data.form.status = false
  request.post('/items/add', data.form).then(res => {
    if (res.code === '200') {
      load()
      ElMessage.success('操作成功')
      data.formVisible = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 审核
const audit = () => {
  request.put('/items/updateForAdmin', data.form).then(res => {
    if (res.code === '200') {
      load()
      ElMessage.success('操作成功')
      data.formVisible = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}
// 上架状态
const changeStatus = (row) => {
  request.put('/items/updateStatus', row).then(res => {
    if (res.code === '200') {
      load()
      ElMessage.success('操作成功')
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 编辑保存
const update = () => {
  request.put('/items/update', data.form).then(res => {
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
    request.delete('/items/delete/' + id).then(res => {
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
  data.name = null
  load()
}

load()
</script>