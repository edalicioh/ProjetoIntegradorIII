<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="./img/icons/calendar.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Lista de Chamada</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="./img/icons/school-1.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"> Coordenação</a>
          <small>cor@cor.com</small>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!--
                lista de acoes da coordenacao para com os professores
            -->
          <li class="nav-item has-treeview ">
            <a href="#" class="nav-link">
                    <i class="fas fa-chalkboard-teacher"></i>
              <p> professores
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <!----------->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/lista-prof" class="nav-link">
                    <i class="fas fa-list-ul"></i>
                    <p>Lista</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/adicionar" class="nav-link">
                    <i class="fas fa-plus"></i>
                    <p>Adicionar</p>
                </router-link>
                </a>
              </li>
            </ul>
          </li>
            <!--
                lista de acoes da coordenacao para com os alunos
            -->
            <li class="nav-item has-treeview ">
                <a href="#" class="nav-link ">
                    <i class="fas fa-user-graduate"></i>
                    <p> Alunos
                    <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <!----------->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-plus"></i>
                        <p>Adicionar</p>
                    </a>
                    </li>
                </ul>
            </li>
            <!--
                lista de acoes da coordenacao para com os alunos
            -->
            <li class="nav-item has-treeview ">
                <a href="#" class="nav-link ">
                        <i class="fas fa-users"></i>
                    <p> Classes
                    <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <!----------->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <router-link to="/classe" class="nav-link">
                            <i class="fas fa-plus"></i>
                            <p>Adicionar</p>
                        </router-link>
                    </li>
                </ul>
            </li>

          <!----------------->
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
