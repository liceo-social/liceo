<div class="card card-primary">
  <div class="card-header">
    <h3 class="card-title">Ficha</h3>
  </div>
  <div class="card-body box-profile">
    <div class="profile-photo">
      <g:layoutBody />
    </div>
    <div class="profile-data">
      <hr />
      <strong><i class="fas fa-calendar mr-1"></i>ID</strong>
      <p class="text-muted"><f:display bean="person" property="id"/></p>
      <hr />
      <strong><i class="fas fa-calendar mr-1"></i>Fecha de nacimiento</strong>
      <p class="text-muted">
          <f:display bean="person" property="birthDate"/> (<g:message code="person.age.show" args="[person.age]" />)
      </p>
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
  </div>
  <g:if test="${person.active}">
      <!-- /.card-body -->
      <div class="card-footer">
          <g:link
            controller="person"
            action="edit"
            id="${person.id}"
            class="btn btn-primary btn-block"><b>Editar</b></g:link>
          <a class="btn btn-danger btn-block" href="#" data-toggle="modal" data-target="#disable_modal">
            Dar de baja
          </a>
          <g:render template="/person/disable/modal" />
      </div>
   </g:if>
   <g:else>     
    <sec:ifAllGranted roles='ROLE_ADMIN'>
        <div class="card-footer">
          <a class="btn btn-warning btn-block" href="#" data-toggle="modal" data-target="#enable_modal">
          Reactivar
          </a>
          <g:render template="/person/enable/modal" />
        </div>        
    </sec:ifAllGranted>
   </g:else>

</div>
<!-- /.card -->
