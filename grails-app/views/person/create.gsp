<content tag="title">Nueva Persona</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="person">personas</g:link>
    </li>
    <li class="breadcrumb-item active">nueva</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'person')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:form resource="/person" method="POST" class="form row" useToken="true">
            <div class="col-md-6">
                <div class="card card-main">
                    <div class="card-header">
                        <h3 class="card-title">Datos obligatorios</h3>
                    </div>
                    <div class="card-body">
                        <g:render template="create/mandatory" />
                    </div>
                    <div class="card-footer">
                        <g:submitButton
                            name="create"
                            class="btn btn-primary save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>                
                </div>
            </div>
            <div class="col-md-6">
                <g:render template="create/projects" />
                <g:render template="create/personal_data" />
                <g:render template="create/administration" />
                <g:render template="create/contact" />
                <g:render template="create/occupational" />
                <g:render template="create/health" />
                <g:render template="create/social_services" />
            </div>
        </g:form>
    </body>
</html>
