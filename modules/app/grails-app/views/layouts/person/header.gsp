<div class="card card-primary">
  <!--
  <div class="card-header">
    <h3 class="card-title">Ficha</h3>
  </div>
  -->

  <div class="card-body box-profile">
    <div class="profile-photo">
      <g:layoutBody />
    </div>
    <div class="row">
    <div class="col-12 mt-2">
      <g:if test="${person.active}">
          <!-- /.card-body -->
            <g:link controller="person" action="edit" id="${person.id}" class="btn btn-primary btn-block"><b>Editar</b></g:link>

            <sec:ifAllGranted roles='ROLE_ADMIN'>
              <!-- ADMIN -->
              <!-- DAR DE BAJA -->
              <g:if test="${!person.isDeactivationRequested()}">
                  <a class="btn btn-danger btn-block" href="#" data-toggle="modal" data-target="#disable_modal">Dar de baja</a>
                  <g:render template="/person/deactivation/modal" />
              </g:if>
              <g:else>
                  <a class="btn btn-danger btn-block" href="#" data-toggle="modal" data-target="#modal_approval">Approbar baja</a>
                  <g:render template="/person/deactivation/modal_approval" />
              </g:else>
            </sec:ifAllGranted>

            <sec:ifAllGranted roles='ROLE_USER'>
             <!-- USER -->
             <!-- SOLICITUD DE BAJA -->
             <g:if test="${!person.isDeactivationRequested()}">
                 <a class="btn btn-warning btn-block" href="#" data-toggle="modal" data-target="#modal_request">Solicitar baja</a>
                 <g:render template="/person/deactivation/modal_request" />
             </g:if>
             <g:else>
                 <a class="btn btn-block wip disable">Baja solicitada</a>
             </g:else>
            </sec:ifAllGranted>
       </g:if>
       <g:else>
            <sec:ifAllGranted roles='ROLE_ADMIN'>
                  <a class="btn btn-warning btn-block" href="#" data-toggle="modal" data-target="#enable_modal">
                  Reactivar
                  </a>
                  <g:render template="/person/enable/modal" />
            </sec:ifAllGranted>
       </g:else>
       </div>
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
      <strong><i class="fas fa-project-diagram mr-1"></i>Projects</strong>
      <p class="text-muted">
          <g:set var="projects" value="${person.projects}" />
          <g:if test="${projects}">
              <g:set var="projectSize" value="${projects.size()}" />
              <g:each var="project" in="${projects}" status="status">
                <g:link controller="project" action="show" id="${project.id}">${project.name}</g:link>
                <g:if test="${projectSize - 1 > status}">,</g:if>
              </g:each>
          </g:if>
          <g:else>
          ---
          </g:else>
      </p>
      <hr>
      <strong><i class="fas fa-road mr-1"></i> Via de acceso</strong>
      <p class="text-muted"><f:display bean="person" property="cameFrom"/></p>
      <hr>
      <strong><i class="fas fa-calendar mr-1"></i> Fecha de alta</strong>
      <p class="text-muted"><f:display bean="person" property="registrationAt"/></p>
    </div>
  </div>


</div>
<!-- /.card -->
