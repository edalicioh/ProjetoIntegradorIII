<template>
  <div>
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-12 text-center">
            <h1>{{ id ? 'Atualizar' : 'Novo' }} Professor</h1>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
    </section>
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Dados do profissional</h3>

              <div class="card-tools">
                <button
                  type="button"
                  class="btn btn-tool"
                  data-card-widget="collapse"
                  data-toggle="tooltip"
                  title="Collapse"
                >
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="name">Nome Completo</label>
                <input type="text" v-model="form.full_name" id="name" class="form-control" />
              </div>
              <div class="form-group">
                <label for="cpf">CPF</label>
                <input type="text" id="cpf" v-model="form.cpf" class="form-control" />
              </div>
              <div class="form-group">
                <label for="email">E-mail</label>
                <input type="text" id="email" v-model="form.email" class="form-control" />
              </div>
              <div class="form-group">
                <label for="telefone">Telefone</label>
                <input type="text" id="telefone" v-model="form.phone" class="form-control" />
              </div>
              <div class="form-group">
                <label>Genero</label>
                <select v-model="form.gender" class="form-control custom-select">
                  <option selected disabled value>Selecione genero</option>
                  <option value="M">Masculino</option>
                  <option value="F">Feminino</option>
                  <option value="O">Outro</option>
                </select>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <div class="col-md-6" v-if="!id">
          <div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">Salas de atuação</h3>

              <div class="card-tools">
                <button
                  type="button"
                  class="btn btn-tool"
                  data-card-widget="collapse"
                  data-toggle="tooltip"
                  title="Collapse"
                >
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <select v-model="form.classes" class="form-control custom-select">
                <option selected disabled value>Selecione sala</option>
                <option
                  v-for="c  in classes"
                  :key="c.id"
                  :value="c.id"
                >{{c.class_number}} | {{c.period == "M" ? 'Matutino' : 'Vespertino' }}</option>
              </select>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <div class="row pb-2">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">Cancel</a>
          <template v-if="!id">
            <button @click.prevent="adicionarProf()" class="btn btn-success float-right">Adicionar</button>
          </template>
          <template v-else>
            <button @click.prevent="update()" class="btn btn-success float-right">Atualiza</button>
          </template>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      api: "/api/auth/coordenacao/",
      token: "",
      id: "",
      form: Object.assign({
        full_name: "",
        phone: "",
        cpf: "",
        gender: "",
        user_type: "PRO",
        classes: ""
      }),
      classes: {}
    };
  },
  methods: {
    adicionarProf() {
      axios
        .post(this.api + "professores", this.form, {
          headers: { Authorization: this.token }
        })
        .then(data => this.$router.push('/lista-prof') );
    },
    listClass() {
      axios
        .get(this.api + "classes", { headers: { Authorization: this.token } })
        .then(data => {
          this.classes = data.data;
        })
        .catch(e => (window.location.href = "/login"));
    },
    edit(id) {
      axios
        .get(this.api + "professores/" + id, {
          headers: { Authorization: this.token }
        })
        .then(({ data }) => {
          this.form = data[0];
          this.id = +id;
          console.log(data);
        });
    },
    update() {
      axios.put(
        this.api + "professores/" + this.id,
        this.form,
        {
          headers: { Authorization: this.token }
        }
      ).then( data => this.$router.push('/lista-prof') )
    }
  },
  created() {
    this.token = `Bearer ${localStorage.getItem("token")}`;
    this.listClass();
    if (this.$route.params.id) {
      this.edit(this.$route.params.id);
    }
  }
};
</script>

<style>
</style>
