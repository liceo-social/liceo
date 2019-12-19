<content tag="title">Detalle Persona</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">Home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="person">Persona</g:link>
    </li>
    <li class="breadcrumb-item active">Detalle</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'person')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-person" class="card" role="main">
            <div class="card-header">
                <h3 class="card-title">
                    <g:message code="default.show.label" args="[entityName]" />
                </h3>
                <div class="card-tools">
                    <ul class="nav nav-grails">
                        <li class="nav-item">
                          <g:link class="list" action="index">
                              <i class="nav-icon fas fa-list"></i>
                              <g:message code="default.list.label" args="[entityName]" />
                          </g:link>
                      </li>
                        <li class="nav-item">
                          <g:link class="create" action="create">
                              <i class="nav-icon fas fa-plus"></i>
                              <g:message code="default.new.label" args="[entityName]" />
                          </g:link>
                      </li>
                    </ul>
                </div>
            </div>
            <div class="card-body">
                <g:if test="${flash.message}">
                <div class="message" role="status">\${flash.message}</div>
                </g:if>
                <div class="row">
                  <div class="col-md-6">
                    <p>Nombre</p>
                    <p>Primer apellido</p>
                    <p>Sexo</p>
                    <p>Fecha de nacimiento</p>
                    <p>Contacto</p>
                  </div>
                  <div class="col-md-6">
                    <p>Profesional de referencia</p>
                    <p>Via de acceso</p>
                    <p>Fecha de alta</p>
                    <p>Estado</p>
                  </div>
                        <!-- ./row -->
                  <div class="col-12">
                    <div class="card card-primary card-tabs">
                      <div class="card-header p-0 pt-1">
                        <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                          <li class="nav-item">
                            <a class="nav-link active" id="custom-tabs-one-person-tab" data-toggle="pill" href="#custom-tabs-one-person" role="tab" aria-controls="custom-tabs-one-person" aria-selected="false">Datos personales</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" id="custom-tabs-one-projects-tab" data-toggle="pill" href="#custom-tabs-one-projects" role="tab" aria-controls="custom-tabs-one-projects" aria-selected="false">Proyectos</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" id="custom-tabs-one-relationships-tab" data-toggle="pill" href="#custom-tabs-one-relationships" role="tab" aria-controls="custom-tabs-one-relationships" aria-selected="false">Círculos familiares</a>
                          </li>
                        </ul>
                      </div>
                      <div class="card-body">
                        <div class="tab-content" id="custom-tabs-one-tabContent">
                          <div class="tab-pane fade show active col-12" id="custom-tabs-one-person" role="tabpanel" aria-labelledby="custom-tabs-one-person-tab">
                            <div class="row">
                              <div class="card col-md-6">
                                <p>Segundo apellido</p>
                                <p>Nacionalidad</p>
                                <p>Provincia de nacimiento</p>
                                <p>Origen cultural</p>
                              </div>
                              <div class="card col-md-6">
                                <p>Nivel formativo</p>
                                <p>Situación formativo laboral</p>
                                <p>Centro de estudios</p>
                                <p>Experiencia profesional</p>
                              </div>
                              <div class="card col-md-6">
                                <p>Fecha de baja</p>
                                <p>Motivo de baja</p>
                              </div>
                              <div class="card col-md-6">
                                <p>Documento de identificación</p>
                                <p>Número</p>
                              </div>
                              <div class="card col-md-6">
                                <p>Tipo de vía</p>
                                <p>Vía</p>
                                <p>Número</p>
                                <p>Escalera</p>
                                <p>Planta</p>
                                <p>Puerta</p>
                                <p>Barrio</p>
                                <p>Districto</p>
                                <p>Código postal</p>
                                <p>Contacto 2</p>
                                <p>Contacto 3</p>
                              </div>
                              <div class="card col-md-6">
                                <p>Centro de servicios sociales</p>
                                <p>Trabajador social</p>
                                <p>Tiene expediente en atención primaria</p>
                                <p>Tiene intervención con otros recursos</p>
                                <p>Otros recursos</p>
                                <p>Caso en ETMF</p>
                                <p>Tiene expediente en CAI</p>
                                <p>Caso en CAF</p>
                              </div>
                              <div class="card col-md-6">
                                <p>Alergia o intolerancia</p>
                                <p>Enfermedad</p>
                                <p>Mediación</p>
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="custom-tabs-one-projects" role="tabpanel" aria-labelledby="custom-tabs-one-projects-tab">
                            PROYECTOS
                          </div>
                          <div class="tab-pane fade" id="custom-tabs-one-relationships" role="tabpanel" aria-labelledby="custom-tabs-one-relationships-tab">
                            FAMILIA
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <%-- <f:display bean="person" /> --%>
                <g:form resource="${this.person}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="btn btn-primary edit" action="edit" resource="${this.person}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-danger delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </body>
</html>
