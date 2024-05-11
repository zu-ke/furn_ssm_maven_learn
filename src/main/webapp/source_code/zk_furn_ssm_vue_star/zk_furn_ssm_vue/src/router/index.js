import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

/*解读：
*   1.index.js是用于配置路由的
*   2.path："/"，代表访问路径，当访问http://localhost:8080/ 就路由的HomeView组件
*   3.就会把HomeView这个组件的内容返回给<router-view/>
*   4.HomeView组件对应的文件就是'../views/HomeView.vue'
* */
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
