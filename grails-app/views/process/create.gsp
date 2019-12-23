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
        <div id="create-process" class="card" role="main">
            <g:form resource="/process" method="POST">
                <div class="card-header">
                    <h3 class="card-title">
                        ${message}
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
                   <div class="col-md-12">
                    <g:render template="create/header_info" />
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
                        widget-from="${processTypeList}" />
                     <f:field
                         widget-placeholder="Contenido"
                         label="Contenido"
                         bean="process"
                         widget-rich="true"
                         property="description"/>
                     <g:hiddenField name="person.id" value="${person?.id}" />
                     <g:hiddenField name="project.id" value="${project?.id}" />
                   </div>
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