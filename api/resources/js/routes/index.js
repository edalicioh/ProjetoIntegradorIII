import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Home from './../pages/dashboard/Home'
import ListaProf from './../pages/dashboard/Coordination/ListaProf'
import AdicionarEditar from './../pages/dashboard/Coordination/AdicionarEditar'
import CreatClass from './../pages/dashboard/Coordination/CreatClass'

const routes = [
    { path: '/', component:  Home , beforeEnter:requireLogin },
    { path: '/lista-prof', component:  ListaProf , beforeEnter:requireLogin},
    { path: '/adicionar', component:  AdicionarEditar , beforeEnter:requireLogin},
    { path: '/classe', component:  CreatClass , beforeEnter:requireLogin},
    { path: '/editar/:id', component:  AdicionarEditar , beforeEnter:requireLogin}
]

const router = new VueRouter({
    mode: 'history',
    routes
})

function requireLogin(to, from, next) {
    const token = localStorage.getItem("token");
    const user = localStorage.getItem("user");
    if (token && user) {
        next(true);
    } else {
        next( window.location.href = '/login' )
    }
}

export default router
