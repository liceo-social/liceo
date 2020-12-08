<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-${propertyName}" class="card" role="main">
        <g:form resource="\${this.${propertyName}}" method="DELETE">
            <div class="card-header">
                <h3 class="card-title">
                    <g:message code="default.show.label" args="[entityName]" />
                </h3>
                <div class="card-tools">
                     <sec:ifAllGranted roles="ROLE_ADMIN">
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
                     </sec:ifAllGranted>
                </div>
            </div>
            <div class="card-body">
                <g:if test="\${flash.message}">
                <div class="message" role="status">\${flash.message}</div>
                </g:if>
                <f:display bean="${propertyName}" />
            </div>
            <div class="card-footer">
            <fieldset class="buttons">
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <g:link class="btn btn-primary edit" action="edit" resource="\${this.${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="btn btn-danger delete" type="submit" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </sec:ifAllGranted>
            </fieldset>
            </div>
            </g:form>
        </div>
    </body>
</html>
