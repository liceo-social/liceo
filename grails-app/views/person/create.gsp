<content tag="title">Nueva Persona</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">Home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="person">Persona</g:link>
    </li>
    <li class="breadcrumb-item active">Nueva</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'person')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:form resource="/person" method="POST" class="form row">
            <div class="col-md-6">
                <g:render template="create/mandatory" />
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
