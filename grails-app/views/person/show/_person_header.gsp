<!-- Profile Image -->
<%-- 
<div class="card card-primary card-outline">
  <div class="card-body box-profile">
    <div class="text-center">
      <img class="profile-user-img img-fluid img-circle" src="../../dist/img/user4-128x128.jpg" alt="User profile picture">
    </div>
    <h3 class="profile-username text-center">${person.fullname}</h3>
    <a href="#" class="btn btn-primary btn-block"><b>Editar</b></a>
  </div>
  <!-- /.card-body -->
</div>
--%>
<!-- /.card -->
<!-- About Me Box -->
<div class="card card-primary">
  <div class="card-header">
    <h3 class="card-title">Ficha</h3>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <strong><i class="fas fa-user mr-1"></i>Name</strong>
    <p class="text-muted"><f:display bean="person" property="fullname"/></p>
    <hr>
    <strong><i class="fas fa-calendar mr-1"></i>Fecha de nacimiento</strong>
    <p class="text-muted"><f:display bean="person" property="birthDate"/></p>
    <hr>    
    <strong><i class="fas fa-id-card mr-1"></i>Contacto</strong>
    <p class="text-muted"><f:display bean="person" property="contact1"/></p>
    <hr>
    <strong><i class="fas fa-user mr-1"></i> Profesional de referencia</strong>
    <p class="text-muted"><f:display bean="person" property="professionalReference"/></p>
    <hr>            
    <strong><i class="fas fa-road mr-1"></i> Via de acceso</strong>
    <p class="text-muted"><f:display bean="person" property="cameFrom"/></p>
    <hr>                
    <strong><i class="fas fa-calendar mr-1"></i> Fecha de alta</strong>
    <p class="text-muted"><f:display bean="person" property="registrationAt"/></p>
  </div>
  <!-- /.card-body -->
  <div class="card-footer">
    <g:link 
      controller="person" 
      action="edit"
      id="${person.id}"
      class="btn btn-primary btn-block"><b>Editar</b></g:link>
  </div>
</div>
<!-- /.card -->