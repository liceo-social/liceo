<content tag="title">Editar proyecto</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="person">Proyectos</g:link>
    </li>
    <li class="breadcrumb-item active">editar</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'project')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:form resource="/project" method="PUT" class="form row">
            <div class="col-md-12">
                <div class="card card-main">
                    <div class="card-header">
                        <h3 class="card-title">Editar proyecto</h3>
                    </div>
                    <div class="card-body">
                        <g:hiddenField name="id" value="${project.id}" />
                        <f:field
                            widget-placeholder="Nombre del proyecto"
                            label="Nombre"
                            bean="project"
                            property="name" />

                        <f:field
                            widget-placeholder="Código del proyecto"
                            label="Código"
                            bean="project"
                            property="code" />

                        <f:field
                            widget-placeholder="Descripcion del proyecto"
                            label="Descripcion"
                            bean="project"
                            property="description" />
                    </div>
                    <div class="card-footer">
                        <g:submitButton
                            name="create"
                            class="btn btn-primary save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}" />

                        <g:link
                            controller="project"
                            action="index"
                            type="submit"
                            class="btn btn-default float-right">Ir al listado</g:link  >
                    </div>
                </div>
            </div>
        </g:form>
    </body>
</html>
