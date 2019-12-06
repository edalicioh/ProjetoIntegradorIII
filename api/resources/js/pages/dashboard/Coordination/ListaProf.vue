<template>
  <div>
    <div class="row mt-3">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Lista de Professores</h3>

            <div class="card-tools">
              <div class="input-group input-group-sm" style="width: 150px;">
                <input
                  type="text"
                  name="table_search"
                  class="form-control float-right"
                  placeholder="Buscar.."
                />

                <div class="input-group-append">
                  <button type="submit" class="btn btn-default">
                    <i class="fas fa-search"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body table-responsive p-0">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Nome</th>
                  <th>E-mail</th>
                  <th>Status</th>
                  <th>Telefone</th>
                  <th>Período | Sala</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(p , i) in listPro" :key="p.id">
                  <td>{{ i + 1 }}</td>
                  <td>{{ p.full_name }}</td>
                  <td>{{ p.email }}</td>
                  <td>
                    <span class="tag tag-primary">{{ p.status ? "ativo" : "desativado" }}</span>
                  </td>
                  <td>{{ p.phone }}</td>
                  <td>{{ p.period === 'M' ? "Matutino" : " Vespertino" }} | {{ p.class_number }}</td>
                  <td class="text-right py-0 align-middle">
                    <div class="btn-group btn-group-sm" >
                      <a href="#" class="btn btn-info" @click.prevent="edit(p.user_id)">
                        <i class="fas fa-edit"></i>
                      </a>
                      <template v-if="p.status ">
                        <a href="#" @click.prevent="excluir(p.user_id , p.status)" class="btn btn-danger">
                          <i class="fas fa-trash"></i>
                        </a>
                      </template>
                      <template v-else>
                        <a href="#" @click.prevent="excluir(p.user_id , p.status)" class="btn btn-success">
                          <i class="fas fa-check"></i>
                        </a>
                      </template>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      api: "/api/auth/coordenacao/professores",
      listPro: {}
    };
  },
  methods: {
    list() {
      const token = `Bearer ${localStorage.getItem("token")}`;
      axios
        .get(this.api, {
          headers: { Authorization: token }
        })
        .then(({ data }) => {
          this.listPro = data;
          console.log(data);
        });
    },
    edit (id) {
        return this.$router.push(`/editar/${id}`)
    },
    excluir(id , status) {
      const token = `Bearer ${localStorage.getItem("token")}`;
      axios
        .put(
          `${this.api}/${id}`,
          { status: !status },
          {
            headers: { Authorization: token }
          }
        )
        .then(({ data }) => {
          this.list();
          console.log(data);
        });
    }
  },
  created() {
    this.list();
  }
};
</script>

<style>
</style>
