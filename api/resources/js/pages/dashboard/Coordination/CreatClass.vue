<template>
  <div>
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-12 text-center">
            <h1>Nova Sala de Aula</h1>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
    </section>
    <section class="content">
      <div class="card bg-success" v-if="alert">
        <div class="card-header">
          <h3 class="card-title">Sucesso</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <div class="card-body">Sala salva com sucesso</div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">Período do Dia</h3>

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
              <select v-model="form.period" class="form-control custom-select">
                <option selected disabled>Selecione Período</option>
                <option value="M">Matutino</option>
                <option value="V">Vespertino</option>
              </select>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">Numero da Sala</h3>

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
              <input
                type="number"
                v-model="form.class_number"
                id="class-number"
                class="form-control"
              />
            </div>
          </div>
        </div>
      </div>
      <!------------------>
      <div class="row pb-2">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">Cancel</a>
          <button @click.prevent="creat()" class="btn btn-success float-right">Adicionar</button>
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
      api: "api/auth/coordenacao/classes",
      alert: false,
      form: Object.assign({
        period: "",
        class_number: null
      })
    };
  },
  methods: {
    creat() {
      const token = `Bearer ${localStorage.getItem("token")}`;
      axios
        .post(
          this.api,
          {
            class_number: parseInt(this.form.class_number),
            period: this.form.period
          },
          { headers: { Authorization: token } }
        )
        .then(data => {
          if (data.status === 200) {
            this.alert = true;
            this.form.class_number = "";
            this.form.period = null;
            setInterval(() => {
              this.alert = false;
            }, 2000);
          }
        });
    }
  }
};
</script>

<style>
</style>
