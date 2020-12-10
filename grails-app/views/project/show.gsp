<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set
            var="entityName"
            value="${message(code: 'project.label', default: 'Proyecto')}" />
        <title>
            <g:message code="default.show.label" args="[entityName]" />
        </title>
    </head>
    <body>
        <g:form resource="${project}" method="DELETE" class="form row">
            <div class="col-md-12">
                <div class="card card-main">
                    <div class="card-header">
                        <h3 class="card-title">
                            <g:message code="default.show.label" args="[entityName]" />
                        </h3>
                        <div class="card-tools">
                            <ul class="nav nav-grails">
                                <li class="nav-item">
                                    <g:link class="list btn btn-default mr-2" action="index">
                                        <i class="nav-icon fas fa-list"></i>
                                        <g:message code="default.list.label" args="[entityName]" />
                                    </g:link>
                                </li>
                                <li class="nav-item">
                                    <g:link class="create btn btn-default" action="create">
                                        <i class="nav-icon fas fa-plus"></i>
                                        <g:message code="default.new.label" args="[entityName]" />
                                    </g:link>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <f:display bean="project" property="name" label="Nombre" wrapper="display/block" />
                        <f:display bean="project" property="code" label="Código" wrapper="display/block" />
                        <f:display bean="project" property="description" label="Description" wrapper="display/block" />
                    </div>
                    <div class="card-footer">
                        <g:link
                            class="btn btn-primary edit"
                            action="edit"
                            resource="${project}">
                                <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>
                        <g:link
                            controller="project"
                            action="index"
                            type="submit"
                            class="btn btn-default float-right">Volver a listado</g:link  >
                    </div>
                </div>
            </div>
        </g:form>
    </body>
</html>
