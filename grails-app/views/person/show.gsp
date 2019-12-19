<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>

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
        <g:set var="entityName" value="${message(code: 'person.label', default: 'persona')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

          <div class="card-body" id="show-person" role="main">
              <g:if test="${flash.message}">
              <div class="message" role="status">\${flash.message}</div>
              </g:if>
              <div class="row card">
                <div class="card-header">
                  <h4 class="float-left">Datos generales</h4>
                  <div class="card-tools">
                    <%-- <f:display bean="person" /> --%>
                    <g:form resource="${this.person}" method="DELETE">
                        <g:link class="btn btn-primary edit" action="edit" resource="${this.person}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-danger delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                  </div>
                </div>
                <div class="card-body show-data">
                  <div class="col-md-6">
                    <p><strong>Nombre: </strong><f:display bean="person" property="name"/></p>
                    <p><strong>Primer apellido: </strong><f:display bean="person" property="firstSurname"/></p>
                    <p><strong>Segundo apellido: </strong><f:display bean="person" property="secondSurname"/></p>
                    <p><strong>Fecha de nacimiento: </strong><f:display bean="person" property="birthDate"/></p>
                    <p><strong>Contacto: </strong><f:display bean="person" property="contact1"/></p>
                  </div>
                  <div class="col-md-6">
                    <p><strong>Profesional de referencia: </strong><f:display bean="person" property="professionalReference"/></p>
                    <p><strong>Via de acceso: </strong><f:display bean="person" property="cameFrom"/></p>
                    <p><strong>Fecha de alta: </strong><f:display bean="person" property="registrationAt"/></p>
                    <p><strong>Estado: </strong><f:display bean="person" property="active"/></p>
                  </div>
                </div>
              </div>
                      <!-- ./row -->
                  <div class="card card-primary card-tabs row">
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
                          <div class="row show-data">
                            <div class="col-md-6 block-data">
                              <p>Nacionalidad: <f:display bean="person" property="nationality"/></p>
                              <p>Provincia de nacimiento: <f:display bean="person" property="regionOfBirth"/></p>
                              <p>Origen cultural: <f:display bean="person" property="culturalUpbringing"/></p>
                            </div>
                            <div class="col-md-6 block-data">
                              <p>Nivel formativo: <f:display bean="person" property="studiesLevel"/></p>
                              <p>Situación formativo laboral: <f:display bean="person" property="studiesCenter"/></p>
                              <p>Centro de estudios: <f:display bean="person" property="professionalStatus"/></p>
                              <p>Experiencia profesional: <f:display bean="person" property="professionalBackground"/></p>
                            </div>
                            <div class="col-md-6 block-data">
                              <p>Tipo de vía: <f:display bean="person" property="streetType"/></p>
                              <p>Vía: <f:display bean="person" property="street"/></p>
                              <p>Número: <f:display bean="person" property="number"/></p>
                              <p>Escalera: <f:display bean="person" property="ladder"/></p>
                              <p>Planta: <f:display bean="person" property="floor"/></p>
                              <p>Puerta: <f:display bean="person" property="door"/></p>
                              <p>Barrio: <f:display bean="person" property="neighborhood"/></p>
                              <p>Districto: <f:display bean="person" property="district"/></p>
                              <p>Código postal: <f:display bean="person" property="postalCode"/></p>
                              <p>Contacto 2: <f:display bean="person" property="contact2"/></p>
                              <p>Contacto 3: <f:display bean="person" property="contact3"/></p>
                            </div>
                            <div class="col-md-6 block-data">
                              <p>Centro de servicios sociales: <f:display bean="person" property="center"/></p>
                              <p>Trabajador social: <f:display bean="person" property="socialWorker"/></p>
                              <p>Tiene expediente en atención primaria: <f:display bean="person" property="hasPrimaryAttentionFile"/></p>
                              <p>Tiene intervención con otros recursos: <f:display bean="person" property="hasOtherResourcesCase"/></p>
                              <p>Otros recursos: <f:display bean="person" property="otherResourcesCase"/></p>
                              <p>Caso en ETMF: <f:display bean="person" property="etmfCase"/></p>
                              <p>Tiene expediente en CAI: <f:display bean="person" property="hasCaiFile"/></p>
                              <p>Caso en CAF: <f:display bean="person" property="cafCase"/></p>
                            </div>
                            <div class="col-md-6 block-data">
                              <p>Alergia o intolerancia: <f:display bean="person" property="allergies"/></p>
                              <p>Enfermedad: <f:display bean="person" property="illnesses"/></p>
                              <p>Mediación: <f:display bean="person" property="medication"/></p>
                            </div>
                            <div class="col-md-6 block-data">
                              <p>Documento de identificación: <f:display bean="person" property="documentType"/></p>
                              <p>Número: <f:display bean="person" property="identification"/></p>
                            </div>
                          </div>
                        </div>
                        <div class="tab-pane fade" id="custom-tabs-one-projects" role="tabpanel" aria-labelledby="custom-tabs-one-projects-tab">
                          ${person.project?.name}

                               <g:set var="processList" value="${Process.findAllByPerson(person)}" />
                          <f:table collection="processList" properties="type, description"/>


                        <g:if test='${person.project}'>
                          <g:link controller="process" action="create" params="[project: person.project?.id, person: person.id]">
                            Crear Proceso
                          </g:link>
                        </g:if>
                        </div>
                        <div class="tab-pane fade" id="custom-tabs-one-relationships" role="tabpanel" aria-labelledby="custom-tabs-one-relationships-tab">
                          FAMILIA
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
    </body>
</html>
