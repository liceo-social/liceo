<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-${propertyName}" class="card" role="main">
                        <g:form resource="\${this.${propertyName}}" method="PUT">
            <div class="card-header">
                <h3 class="card-title">
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
                <g:if test="\${flash.message}">
                <div class="message" role="status">\${flash.message}</div>
                </g:if>
                <g:hasErrors bean="\${this.${propertyName}}">
                <ul class="errors" role="alert">
                    <g:eachError bean="\${this.${propertyName}}" var="error">
                    <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                    <g:hiddenField name="version" value="\${this.${propertyName}?.version}" />
                    <fieldset class="form">
                        <f:all bean="${propertyName}"/>
                    </fieldset>
            </div>
            <div class="card-footer">
                <fieldset class="buttons">
                    <input class="btn btn-primary save" type="submit" value="\${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </div>
            </g:form>
        </div>
    </body>
</html>