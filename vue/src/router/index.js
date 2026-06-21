import {createRouter, createWebHistory} from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', redirect: '/login' },
    {
      path: '/manager',
      component: () => import('@/views/Manager.vue'),
      redirect: '/manager/home',
      children: [
        { path: 'person', component: () => import('@/views/manager/Person.vue')},
        { path: 'password', component: () => import('@/views/manager/Password.vue')},
        { path: 'home', component: () => import('@/views/manager/Home.vue')},
        { path: 'admin', component: () => import('@/views/manager/Admin.vue')},
        { path: 'user', component: () => import('@/views/manager/User.vue')},
        { path: 'notice', component: () => import('@/views/manager/Notice.vue')},
        { path: 'category', component: () => import('@/views/manager/Category.vue')},
        { path: 'items', component: () => import('@/views/manager/Items.vue')},
        { path: 'itemsView', component: () => import('@/views/manager/ItemsView.vue')},
        { path: 'charge', component: () => import('@/views/manager/Charge.vue')},
        { path: 'charge1', component: () => import('@/views/manager/Charge1.vue')},
        { path: 'collect', component: () => import('@/views/manager/Collect.vue')},
        { path: 'userCollect', component: () => import('@/views/manager/UserCollect.vue')},
        { path: 'article', component: () => import('@/views/manager/Article.vue')},
        { path: 'globalArticle', component: () => import('@/views/manager/GlobalArticle.vue')},
        { path: 'articleDetail', component: () => import('@/views/manager/ArticleDetail.vue')},
        { path: 'comments', component: () => import('@/views/manager/Comments.vue')},
      ]
    },
    { path: '/login', component: () => import('@/views/Login.vue')},
    { path: '/register', component: () => import('@/views/Register.vue')},
  ]
})

export default router
