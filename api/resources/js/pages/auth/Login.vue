<template>
    <div class="card-body text-center card-login-sign">
        <h2>Faça seu login</h2>
        <form class="mt-4">
            <div class="form-group">
                <input v-model="form.email" type="email" class="form-control" name="email"  placeholder="Email">
            </div>
            <div class="form-group">
                <input v-model="form.password" type="password" class="form-control" name="password" placeholder="Senha">
            </div>
            <button  @click.prevent="login()"  class="btn btn-primary btn-lg btn-block mb-3">Entra</button>
            <a href="/sign">Não possuo login </a>
        </form>
    </div>
</template>

<script>
export default {
      data() {
        return {
            form: new Form({
                email: '',
                password: ''
            })
        }
    },
    methods:{
        login () {
            this.form.post('/api/auth/login')
            .then( ({ data })=> {
                localStorage.setItem("token" , data.token)
                localStorage.setItem("user" , btoa(JSON.stringify(data.user)))
                const destino = this.$route.query.redirecionar || '/'
                window.location.href = destino
            })
        }
    },

}
</script>

<style>

</style>
