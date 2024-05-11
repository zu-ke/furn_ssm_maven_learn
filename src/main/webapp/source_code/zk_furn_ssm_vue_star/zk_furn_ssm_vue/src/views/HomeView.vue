<template>
  <div>
    <!--增加按钮和搜索框-->
    <div style="margin: 10px 5px">
      <!--解读：@click="add"表示点击新增，触发add方法-->
      <el-button type="primary" @click="add()">新增</el-button>
      <el-button type="primary">其他</el-button>
    </div>

    <div style="margin: 10px 5px">
      <el-input v-model="search" style="width: 30%" placeholder="请输入关键字"/>
      <el-button style="margin-left: 10px" type="primary" @click="getAllFurns">查找</el-button>
    </div>

    <el-table :data="tableData" stripe style="width: 90%">
      <el-table-column sortable prop="id" label="ID"/>
      <el-table-column prop="name" label="家居名称"/>
      <el-table-column prop="maker" label="制造厂商"/>
      <el-table-column prop="price" label="价格"/>
      <el-table-column prop="sales" label="销量"/>
      <el-table-column prop="stock" label="库存"/>
      <el-table-column fixed="right" label="操作" width="140">
        <!--解读：
            #default="scope" @click="handleEdit(scope.row)
            将这一行的参数传递给那个方法
        -->
        <template #default="scope">
          <el-button type="primary" size="small" @click="handleEdit(scope.row)">编辑</el-button>
          <!--解读：如果点击确定就会调用方法，点击取消则不会触发-->
          <el-popconfirm title="确认删除吗？" @confirm="handleDel(scope.row.id)">
            <template #reference>
              <el-button type="danger" size="small">删除</el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <!--解读：前端对象的属性是可以动态生成的，furn属性和后端javaBean的属性相同，接收json后好处理-->
    <el-dialog v-model="dialogVisible" title="提示" width="30%" :before-close="handleClose">
      <!--解读：绑定规则 :rules="rules" 作用在表单上 ref="form"-->
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-form-item label="家居名" prop="name">
          <el-input v-model="form.name" style="width: 50%"></el-input>
          {{serverValidErrors.name}}
        </el-form-item>
        <el-form-item label="厂商" prop="maker">
          <el-input v-model="form.maker" style="width: 50%"></el-input>
          {{serverValidErrors.maker}}
        </el-form-item>
        <el-form-item label="价格" prop="price">
          <el-input v-model="form.price" style="width: 50%"></el-input>
          {{serverValidErrors.price}}
        </el-form-item>
        <el-form-item label="销量" prop="sales">
          <el-input v-model="form.sales" style="width: 50%"></el-input>
          {{serverValidErrors.sales}}
        </el-form-item>
        <el-form-item label="库存" prop="stock">
          <el-input v-model="form.stock" style="width: 50%"></el-input>
          {{serverValidErrors.stock}}
        </el-form-item>
      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="save">确定</el-button>
      </span>
      </template>
    </el-dialog>

    <!--解读：分页-->
    <div style="margin: 10px 0">
      <el-pagination
          @size-change="handlePageSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[2,5,10]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request"

export default {
  name: 'HomeView',
  components: {},
  data() {
    return {
      /*存放后端校验的信息*/
      serverValidErrors: {},
      /*添加表单的校验规则*/
      rules: {
        name: [
            /*这里可以写多个针对name属性的校验规则*/
            /*解读：必须输入*/
          {required: true, message: "请输入家居名", trigger: "blur"}
        ],
        maker: [
          /*这里可以写多个针对name属性的校验规则*/
          /*解读：必须输入*/
          {required: true, message: "请输入制造商名", trigger: "blur"}
        ],
        price: [
          /*这里可以写多个针对name属性的校验规则*/
          /*解读：必须输入*/
          {required: true, message: "请输入价格", trigger: "blur"},
            /*解读：使用正则表达式对输入的数据进行校验，数字*/
          {pattern: /^([1-9]\d*|0)(\.\d+)?$/, message: "请输入数字", trigger: "blur"}
        ],
        sales: [
          /*这里可以写多个针对name属性的校验规则*/
          /*解读：必须输入*/
          {required: true, message: "请输入销量", trigger: "blur"},
          /*解读：使用正则表达式对输入的数据进行校验，整数*/
          {pattern: /^([1-9]\d*|0)?$/, message: "请输入整数", trigger: "blur"}
        ],
        stock: [
          /*这里可以写多个针对name属性的校验规则*/
          /*解读：必须输入*/
          {required: true, message: "请输入库存", trigger: "blur"},
          /*解读：使用正则表达式对输入的数据进行校验，整数*/
          {pattern: /^([1-9]\d*|0)?$/, message: "请输入整数", trigger: "blur"}
        ]
      },
      /*结束*/
      /*增加分页相应的数据绑定*/
      currentPage: 1,
      pageSize: 5,
      total: 10,
      /*结束*/
      form: {},
      dialogVisible: false,
      search: "",
      tableData: []
    }
  },
  methods: {
    /*解读：显示用于添加的对话框*/
    add() {
      /*解读：显示对话框*/
      this.dialogVisible = true;
      /*解读：清空添加表单数据*/
      this.form = {};
      /*解读：清空上次的前端校验信息*/
      this.$nextTick(() => {
        this.$refs['form'].resetFields();
      });
      /*解读：清空上次的后端校验信息*/
      this.$nextTick(() => {
        this.serverValidErrors ={}
      });

    },

    /*将填写的表单数据，发送给后端*/
    save() {
      /*增加表单验证：表单验证是否通过*/
      this.$refs["form"].validate(valid => {
        /*valid：表单校验结果*/
        if (!valid){
          /*表单校验通过*/
          /*解读：修改和添加走同一个方法*/
          /*如果是添加，表单是空的，如果是修改，则表单数据不为空*/
          if (this.form.id) {
            request.put(
                /*url*/
                "/api/updateFurnById",
                /*data*/
                this.form
            ).then(res => {
              if (res.code === 200) {
                /*修改成功*/
                /*消息提示*/
                this.$message(
                    {
                      type: "success",
                      message: "修改成功"
                    }
                )
                this.dialogVisible = false;
                /*解读：修改完成后刷新页面*/
                this.getAllFurns()
              } else if (res.code === 400){
                /*修改失败*/
                /*消息提示*/
                this.serverValidErrors = res.extend.errorMsg;
                this.$message(
                    {
                      type: "error",
                      message: "修改失败"
                    }
                )
              }
            })
          } else {
            request.post(
                /*url*/
                "/api/save",
                /*data*/
                this.form
            ).then(res => {
              if (res.code === 200) {
                /*新增成功*/
                /*消息提示*/
                this.$message(
                    {
                      type: "success",
                      message: "新增成功"
                    }
                )

                this.dialogVisible = false;
                /*解读：修改完成后刷新页面*/
                this.getAllFurns()
              } else if (res.code === 400){
                this.serverValidErrors = res.extend.errorMsg;
                /*修改失败*/
                /*消息提示*/
                this.$message(
                    {
                      type: "error",
                      message: "新增失败"
                    }
                )
              }
            })
          }
        }else {
          /*表单没有校验通过*/
          this.$message(
              {
                type:"error",
                message:"请正确填写家居信息"
              }
          )
          /*放弃提交*/
          return false;
        }
      })
    },

    /*查询所有家居*/
    getAllFurns() {
      /*1.原查询所有家居*/
      /*request.get(
          "/api/getAllFurns"
      ).then(res => {
        /!*this.tableData = res.data.extend.furnList*!/
        /!*在request.js进行了响应结果统一处理*!/
        this.tableData = res.extend.furnList
      })*/

      /*2.请求分页接口*/
      /*request.get(
          "/api/listFurnByPage",
          {
            /!*指定请求携带的参数*!/
            params: {
              pageSize: this.pageSize,
              pageNum: this.currentPage
            }
          }
      ).then(res => {
        this.tableData = res.extend.pageInfo.list;
        /!*!!!别忘了*!/
        this.total = res.extend.pageInfo.total;
      })*/

      /*3.请求加上检索条件的分页接口*/
      request.get(
          "/api/getAllFurnsByCondition",
          {
            /*指定请求携带的参数*/
            params: {
              pageSize: this.pageSize,
              pageNum: this.currentPage,
              search: this.search
            }
          }
      ).then(res => {
        this.tableData = res.extend.pageInfo.list;
        /*!!!别忘了*/
        this.total = res.extend.pageInfo.total;
      })
    },

    /*根据id查询家居信息（修改前的回显）*/
    handleEdit(row) {
      /*解读：将当前家居信息绑定到弹出对话框的form*/
      /*方式1：可以通过row.id到后端-db去获取对应的家居信息，返回后将其绑定*/
      /*方式2：把row的数据通过处理，绑定到this.form进行显示*/
      /*下面是方式1的展示*/
      request.get(
          "/api/getFurnById/" + row.id
      ).then(res => {
        this.add();
        this.form = res.extend.furn
      })
    },

    /*根据id删除家居*/
    handleDel(id) {
      request.delete(
          "/api/deleteFurnById/" + id
      ).then(res => {
        if (res.code === 200) {
          /*删除成功*/
          /*消息提示*/
          this.$message(
              {
                type: "success",
                message: res.msg
              }
          )
        } else {
          /*删除失败*/
          /*消息提示*/
          this.$message(
              {
                type: "error",
                message: res.msg
              }
          )
        }
        /*解读：修改完成后刷新页面*/
        this.getAllFurns()
      })
    },

    /*解读：处理分页请求，改变当前是第几页*/
    handleCurrentChange(pageNum) {
      /*当用户点击分页超链接时，会携带pageNum*/
      this.currentPage = pageNum;
      this.getAllFurns();
    },

    /*解读：处理分页请求。改变每页显示的条目数*/
    handlePageSizeChange(pageSize){
      this.pageSize = pageSize;
      this.getAllFurns();
    }

  },
  created() {
    this.getAllFurns()
  }
}
</script>
