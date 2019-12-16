<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
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
                <g:uploadForm name="upload" url="[action:'save']">
                  <fieldset class="form">
                      <f:field bean="person" property="username"/>
                      <f:field bean="person" property="password" />
                      <label class="control-label" for="photo">Photo</label>
                      <input type="file" name="photo" /><br/>
                  </fieldset>
                  <fieldset class="buttons">
                      <g:submitButton
                          name="create"
                          class="btn btn-primary save"
                          value="${message(code: 'default.button.create.label', default: 'Create')}" />
                  </fieldset>
                </g:uploadForm>
            </div>
        </div>
    </body>
</html>