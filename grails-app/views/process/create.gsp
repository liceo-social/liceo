<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<content tag="title">Nuevo proceso</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">Home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="process">Proceso</g:link>
    </li>
    <li class="breadcrumb-item active">Nuevo</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="card card-widget widget-user-2">
            <g:form resource="/process" method="POST">
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="widget-user-header bg-primary">
                    <div class="widget-user-image">
                        <g:img class="img-circle elevation-2" dir="images" file="default_user.jpg" />
                    </div>
                    <!-- /.widget-user-image -->
                    <h3 class="widget-user-username">Persona: ${process?.person?.name}</h3>
                    <h5 class="widget-user-desc">Proyecto: ${process?.project?.name ?: 'Sin proyecto'}</h5>
                </div>
                <div class="card-body">
                    <fieldset>
                        <f:field
                            label="Fecha"
                            bean="process"
                            property="meetingDate"
                            widget-value="${process?.meetingDate}"/>
                        <f:field
                            label="Tipo de proceso"
                            bean="process"
                            property="type"
                            value="${process?.type}"
                            widget-optionKey="id"
                            widget-optionValue="name"
                            widget-value="${process?.type?.id}"
                            widget-from="${ProcessType.list()}" />
                        <f:field
                            widget-placeholder="Contenido"
                            label="Contenido"
                            bean="process"
                            widget-rich="true"
                            property="description"/>
                        <g:hiddenField name="person.id" value="${process?.person?.id}" />
                        <g:hiddenField name="project.id" value="${process?.project?.id}" />                        
                    </fieldset>
                </div>
                <div class="card-footer">
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-primary save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </div>
            </g:form>
        </div>
    </body>
</html>