<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'person')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-person" class="card" role="main">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="nav-icon fas fa-plus"></i>
                    <g:message code="default.create.label" args="[entityName]" />
                </h3>
                <div class="card-tools">
                    <ul class="nav nav-grails">
                        <li class="nav-item">
                            <g:link class="list" action="index">
                               <i class="nav-icon fas fa-list"></i>
                               <g:message code="default.list.label" args="[entityName]" />
                            </g:link>
                         </li>
                    </ul>
                </div>
            </div>
            <div class="card-body">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.person}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.person}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                <g:form resource="/person" method="POST" class="form row">
                    <fieldset class="col-md-6">
                        <div class="card card-info">
                            <div class="card-header">
                                <h3 class="card-title">Campos obligatorios*</h3>
                            </div>
                            <div class="card-body">
                                <f:field label="Nombre" bean="person" property="personalInformation.name"/>
                                <f:field label="Primer apellido" bean="person" property="personalInformation.firstSurname"/>
                                <f:field label="Sexo"
                                    bean="person"
                                    property="personalInformation.genre" value="${genreList}"/>
                                <f:field label="Fecha de nacimiento" bean="person" property="personalInformation.birthDate"/>
                                <f:field label="Contacto" bean="person" property="address.contact1"/>
                                <f:field label="Profesional de referencia" bean="person" property="identification.professionalReference.name"/>
                                <f:field label="Via de acceso"
                                    bean="person"
                                    property="identification.cameFrom"
                                    optionValue="${person?.identification?.cameFrom?.name}"
                                    optionKey="id"
                                    from="${cameFromList}" />
                                <f:field label="Fecha de alta" bean="person" property="identification.registrationAt"/>
                                <f:field label="Estado" bean="person" property="identification.active"/>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="col-md-6">
                        <div class="card card-info collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">Datos personales</h3>

                                <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <f:field label="Segundo apellido" bean="person" property="personalInformation.secondSurname"/>
                                <f:field label="Nacionalidad" bean="person" property="personalInformation.nationality.name"/>
                                <f:field label="Provincia de nacimiento" bean="person" property="personalInformation.regionOfBirth"/>
                                <f:field label="Origen cultural" bean="person" property="personalInformation.culturalUpbringing.name"/>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </fieldset>
                    <fieldset class="col-md-6">
                        <div class="card card-info collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">Identification</h3>

                                <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <f:field label="Fecha de baja" bean="person" property="identification.deletedAt"/>
                                <f:field label="Motivo de baja" bean="person" property="identification.deletionMotivation"/>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </fieldset>
                    <fieldset class="col-md-6">
                        <div class="card card-info collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">Situación administrativa</h3>

                                <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <f:field label="Documento de identificación" bean="person" property="administration.type.name"/>
                                <f:field label="Número" bean="person" property="administration.identification"/>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </fieldset>
                    <fieldset class="col-md-6">
                        <div class="card card-info collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">Contacto</h3>

                                <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <f:field label="Tipo de vía" bean="person" property="address.streetType"/>
                                <f:field label="Vía" bean="person" property="address.street"/>
                                <f:field label="Número" bean="person" property="address.number"/>
                                <f:field label="Vía" bean="person" property="address.street"/>
                                <f:field label="Escalera" bean="person" property="address.ladder"/>
                                <f:field label="Planta" bean="person" property="address.floor"/>
                                <f:field label="Puerta" bean="person" property="address.door"/>
                                <f:field label="Barrio" bean="person" property="address.neighborhood"/>
                                <f:field label="Districto" bean="person" property="address.district"/>
                                <f:field label="Código postal" bean="person" property="address.postalCode"/>
                                <f:field label="Vía" bean="person" property="address.street"/>
                                <f:field label="Contacto 2" bean="person" property="address.contact2"/>
                                <f:field label="Contacto 3" bean="person" property="address.contact3"/>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </fieldset>
                    <fieldset class="col-md-6">
                        <div class="card card-info collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">Formativo laboral</h3>

                                <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <f:field label="Nivel formativo" bean="person" property="occupationalTraining.studiesLevel"/>
                                <f:field label="Situación formativo laboral" bean="person" property="occupationalTraining.studiesCenter"/>
                                <f:field label="Centro de estudios" bean="person" property="occupationalTraining.professionalStatus"/>
                                <f:field label="Experiencia profesional" bean="person" property="occupationalTraining.professionalBackground"/>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </fieldset>
                    <fieldset class="col-md-6">
                        <div class="card card-info collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">Salud</h3>

                                <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <f:field label="Alergia o intolerancia" bean="person" property="health.allergies"/>
                                <f:field label="Enfermedad" bean="person" property="health.illnesses"/>
                                <f:field label="Mediación" bean="person" property="health.medication"/>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </fieldset>
                    <fieldset class="col-md-6">
                        <div class="card card-info collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">Servicios sociales</h3>

                                <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <f:field label="Centro de servicios sociales" bean="person" property="socialServices.center"/>
                                <f:field label="Trabajador social" bean="person" property="socialServices.socialWorker"/>
                                <f:field label="Tiene expediente en atención primaria" bean="person" property="socialServices.hasPrimaryAttentionFile"/>
                                <f:field label="Tiene intervención con otros recursos" bean="person" property="socialServices.hasOtherResourcesCase"/>
                                <f:field label="Otros recursos" bean="person" property="socialServices.otherResourcesCase"/>
                                <f:field label="Caso en ETMF" bean="person" property="socialServices.etmfCase"/>
                                <f:field label="Tiene expediente en CAI" bean="person" property="socialServices.hasCaiFile"/>
                                <f:field label="Caso en CAF" bean="person" property="socialServices.cafCase"/>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton
                        name="create"
                        class="btn btn-primary save"
                        value="${message(code: 'default.button.create.label',
                        default: 'Create')}" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </body>
</html>
