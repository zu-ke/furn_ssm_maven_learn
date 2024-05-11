/*解读：用于引入资源*/
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
/*解读：引入我们的全局css处理*/
import '@/assets/css/globle.css'
/*结束*/

/*解读：国际化（中文）*/
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
/*结束*/

/*解读：引入elementUI*/
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

/*createApp(App).use(store).use(router).mount('#app')*/
// createApp(App).use(store).use(router).use(ElementPlus).mount('#app')
createApp(App).use(store).use(router).use(ElementPlus,{locale: zhCn,}).mount('#app')
/*结束*/