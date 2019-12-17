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


        <asset:stylesheet src="adminlte.css"/>
        <asset:stylesheet src="all.css"/>
        <asset:stylesheet src="main.css"/>

        <g:layoutHead/>
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
          </li>
          <li class="nav-item d-none d-sm-inline-block">
            <a href="/" class="nav-link">Home</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
            <g:link controller='logout'>
                Logout
                <i class="fas fa-sign-out-alt"></i>
            </g:link>
            </li>
        </ul>
       </nav>
         <!-- Main Sidebar Container -->
         <aside class="main-sidebar sidebar-dark-primary elevation-4">
           <!-- Brand Logo -->
           <a href="index3.html" class="brand-link">
             <asset:image src="AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8" />
             <span class="brand-text font-weight-light">Woodward</span>
           </a>

           <!-- Sidebar -->
           <div class="sidebar">
             <!-- Sidebar user panel (optional) -->
             <div class="user-panel mt-3 pb-3 mb-3 d-flex">
               <div class="image">
                 <asset:image src="user2-160x160.jpg" class="img-circle elevation-2" alt="User Image" />
               </div>
               <div class="info">
                 <a href="#" class="d-block">Alexander Pierce</a>
               </div>
             </div>

             <!-- Sidebar Menu -->
             <nav class="mt-2">
               <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                 <!-- Add icons to the links using the .nav-icon class
                      with font-awesome or any other icon font library -->
                 <li class="nav-item has-treeview menu-open">
                   <a href="#" class="nav-link active">
                     <i class="nav-icon fas fa-database"></i>
                     <p>
                       Data
                       <i class="right fas fa-angle-left"></i>
                     </p>
                   </a>
                   <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <g:link controller="process" class="nav-link" action="index">
                             <i class="far fa-circle nav-icon"></i>
                             <p>Procesos</p>
                           </g:link>
                       </li>
                   </ul>
                 </li>
                 <sec:ifAllGranted roles='ROLE_ADMIN'>
                     <li class="nav-item has-treeview menu-open">
                       <a href="#" class="nav-link">
                         <i class="nav-icon fas fa-shield-alt"></i>
                         <p>
                           Admin
                           <i class="right fas fa-angle-left"></i>
                         </p>
                       </a>
                       <ul class="nav nav-treeview">
                           <li class="nav-item">
                               <g:link controller="user" class="nav-link" action="index">
                                 <i class="far fa-circle nav-icon"></i>
                                 <p>Users</p>
                               </g:link>
                           </li>
                            <li class="nav-item">
                                <g:link controller="processType" class="nav-link" action="index">
                                 <i class="far fa-circle nav-icon"></i>
                                 <p>Tipos de procesos</p>
                               </g:link>
                           </li>
                          <li class="nav-item">
                              <g:link controller="project" class="nav-link" action="index">
                                <i class="far fa-circle nav-icon"></i>
                                <p><g:message code="layout.main.projects"/></p>
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
            <div class="content-header">

            </div>
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
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="adminlte.js"/>

</body>
</html>
