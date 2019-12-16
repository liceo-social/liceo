<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-${propertyName}" class="card" role="main">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="nav-icon fas fa-eye"></i>
                    <g:message code="default.show.label" args="[entityName]" />
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
                <f:display bean="${propertyName}" />
                <g:form resource="\${this.${propertyName}}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="btn btn-primary edit" action="edit" resource="\${this.${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-danger delete" type="submit" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </body>
</html>