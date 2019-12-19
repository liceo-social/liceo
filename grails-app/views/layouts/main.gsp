<!doctype html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
            <g:layoutTitle default="Grails"/>
        </title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

        <asset:stylesheet src="daterangepicker/daterangepicker.css"/>
        <asset:stylesheet src="select2/select2.css"/>
        <asset:stylesheet src="adminlte.css"/>
        <asset:stylesheet src="summernote/summernote-bs4.css"/>
        <asset:stylesheet src="all.css"/>
        <asset:stylesheet src="main.css"/>
        <asset:javascript src="jquery.js"/>
        <asset:javascript src="bootstrap/bootstrap.bundle.js" />
        <asset:javascript src="daterangepicker/moment.min.js" />
        <asset:javascript src="daterangepicker/daterangepicker.js" />
        <asset:javascript src="select2/select2.full.js" />
        <asset:javascript src="summernote/summernote-bs4.js" />

        <script>
        $(document).ready(function() {
            $('select').select2();
             $('.summernote').summernote();
        });
        </script>
        <g:layoutHead/>
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
            <g:link controller='logout' class="nav-link">
                Salir
                <i class="fas fa-sign-out-alt"></i>
            </g:link>
            </li>
        </ul>
       </nav>
         <!-- Main Sidebar Container -->
         <aside class="main-sidebar sidebar-light-olive elevation-4">
           <!-- Brand Logo -->
           <a href="index3.html" class="brand-link">
             <asset:image src="Logo.png" alt="AdminLTE Logo" class="brand-image img-circle" style="opacity: .8" />
             <span class="brand-text font-weight-light">Masiaventura</span>
           </a>

           <!-- Sidebar -->
           <div class="sidebar">
             <!-- Sidebar user panel (optional) -->
             <div class="user-panel mt-3 pb-3 mb-3 d-flex">
               <div class="image">
                  <masec:userPhoto />
               </div>
               <div class="info">
                 <a href="#" class="d-block">
                     <masec:userName />
                 </a>
               </div>
             </div>

             <!-- Sidebar Menu -->
             <nav class="mt-2">
               <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                 <!-- Add icons to the links using the .nav-icon class
                      with font-awesome or any other icon font library -->
                 <li class="nav-item has-treeview menu-open">
                   <a href="#" class="nav-link active">
                     <i class="nav-icon fas fa-home"></i>
                     <p>
                       Asociacion
                       <i class="right fas fa-angle-left"></i>
                     </p>
                   </a>
                   <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <g:link controller="person" class="nav-link" action="index">
                             <i class="far fa-user nav-icon"></i>
                             <p>Personas</p>
                           </g:link>
                       </li>
                   </ul>
                 </li>
                 <sec:ifAllGranted roles='ROLE_ADMIN'>
                     <li class="nav-item has-treeview menu-open">
                       <a href="#" class="nav-link">
                         <i class="nav-icon fas fa-list"></i>
                         <p>
                           Datos maestros
                           <i class="right fas fa-angle-left"></i>
                         </p>
                       </a>
                       <ul class="nav nav-treeview">
                          <li class="nav-item">
                              <g:link controller="project" class="nav-link" action="index">
                                <i class="fas fa-project-diagram nav-icon"></i>
                                <p><g:message code="layout.main.projects"/></p>
                              </g:link>
                          </li>
                          <li class="nav-item">
                                <g:link controller="documentType" class="nav-link" action="index">
                                  <i class="fas fa-file nav-icon"></i>
                                  <p>Tipos de documento ID</p>
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link controller="processType" class="nav-link" action="index">
                                 <i class="fas fa-calendar-plus nav-icon"></i>
                                 <p>Tipos de procesos</p>
                               </g:link>
                           </li>
                            <li class="nav-item">
                                <g:link controller="country" class="nav-link" action="index">
                                 <i class="fas fa-globe-africa nav-icon"></i>
                                 <p>Paises</p>
                               </g:link>
                           </li>
                             <li class="nav-item">
                                   <g:link controller="genre" class="nav-link" action="index">
                                    <i class="fas fa-venus-mars nav-icon"></i>
                                    <p>Generos</p>
                                  </g:link>
                              </li>
                       </ul>
                     </li>
                     <li class="nav-item has-treeview menu-open">
                         <a href="#" class="nav-link">
                           <i class="nav-icon fas fa-shield-alt"></i>
                           <p>
                             Seguridad
                             <i class="right fas fa-angle-left"></i>
                           </p>
                         </a>
                         <ul class="nav nav-treeview">
                             <li class="nav-item">
                               <g:link controller="user" class="nav-link" action="index">
                                 <i class="fas fa-users nav-icon"></i>
                                 <p>Usuarios</p>
                               </g:link>
                           </li>
                         </ul>
                     </li>
                 </sec:ifAllGranted>
               </ul>
             </nav>
           </div>
         </aside>

        <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1 class="m-0 text-dark">
                    <g:pageProperty name="page.title" />
                </h1>
              </div><!-- /.col -->
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <g:pageProperty name="page.breadcrumb" />
                </ol>
              </div><!-- /.col -->
            </div><!-- /.row -->
          </div><!-- /.container-fluid -->
        </section>
        <!-- /.content-header -->

            <section class="content">
              <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                  <div class="col-12">
                      <g:layoutBody/>
                  </div>
                </div>
              </div>
            </section>
          </div>
    </div>
    <asset:javascript src="jquery.js"/>
    <asset:javascript src="bootstrap/bootstrap.bundle.js" />
    <asset:javascript src="adminlte.js"/>
    <asset:javascript src="daterangepicker/moment.min.js" />
    <asset:javascript src="daterangepicker/daterangepicker.js" />
    <asset:javascript src="select2/select2.full.js" />
    <asset:javascript src="summernote/summernote-bs4.js" />
</body>
</html>
