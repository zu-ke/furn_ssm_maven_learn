<template>
  <div style="width: 90%; height: 50px; line-height: 50px; border-bottom: 1px solid #ccc; display: flex">
    <div style="width: 200px; padding-left: 30px; font-weight: bold; color: dodgerblue">后台管理</div>
    <div style="flex: 1"></div>
    <div style="width: 100px;">
      <el-dropdown>
      <span class="el-dropdown-link">
        <p  style="width: 100px; line-height: 50px; font-weight: bold; color: dodgerblue; font-size: 30px; text-align: center">zk</p>
        <el-icon class="el-icon--right">
          <arrow-down />
        </el-icon>
      </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item>Action 1</el-dropdown-item>
            <el-dropdown-item>Action 2</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>

  </div>
</template>

<script>

</script>

<style scoped>

</style>