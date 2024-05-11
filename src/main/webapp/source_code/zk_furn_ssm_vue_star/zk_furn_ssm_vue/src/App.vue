<template>
<!--解读：
    1.app.vue可以用来布局页面
    2.<router-view/>解读：
      1.路由指令
      2.会把路由到的页面内容展示/替换到这个<router-view/>位置
-->
  <div>
  <!--解读：头部，引入header组件/界面-->
    <Header/>
    <!--主体-->
    <div style="display: flex">
      <!--侧边栏-->
      <Aside/>
      <!--内容区域：通过路由获取，目前我们先路由到home-->
      <router-view style="flex: 1"/>
    </div>
  </div>
</template>

<style>

</style>

<script>

import Header from "@/components/Header.vue";
import Aside from "@/components/Aside.vue";
export default {
    name: "layout",
    components: {
      Header,
      Aside
    }
}

</script>