<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Lista de Chamada</title>
  <link rel="shortcut icon" href="./img/icons/calendar.png" type="image/x-icon">

  <link rel="stylesheet" href="/css/app.css">
  <meta name="csrf-token" content="{{ csrf_token() }}">

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper" id="app">

  <!-- Navbar -->
    @include('layout.navbar')
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  @include('layout.sidebar')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
   <div class="content">
       <div class="container-fluid">
        <router-view></router-view>
       </div>
   </div>
    <!-- /.content -->
  </div>
</div>
<!-- ./wrapper -->

<script src="/js/app.js"></script>
</body>
</html>
