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
            <div class="col-md-6">
                <g:render template="templates/mandatory" />
            </div>
            <div class="col-md-6">
                <g:render template="templates/personal_data" />
                <g:render template="templates/administration" />
                <g:render template="templates/contact" />
                <g:render template="templates/occupational" />
                <g:render template="templates/health" />
                <g:render template="templates/social_services" />
            </div>
        </g:form>
    </body>
</html>
