<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-person" class="card" role="main">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="nav-icon fas fa-edit"></i>
                    <g:message code="default.edit.label" args="[entityName]" />
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
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.person}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.person}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                <g:form resource="${this.person}" method="PUT">
                    <g:hiddenField name="version" value="${this.person?.version}" />
                    <fieldset class="form">
                        <f:all bean="person"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <input class="btn btn-primary save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </body>
</html>