require('./bootstrap');

window.Vue = require('vue');


import router from './routes'
import Login from './pages/auth/Login'

import { Form, HasError, AlertError } from 'vform'
window.Form = Form;



Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)


Vue.component('login', Login);




const app = new Vue({
    el: '#app',
    router,
});
