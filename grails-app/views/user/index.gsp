<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-user" class="card" role="main">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="nav-icon fas fa-list"></i>
                    <g:message code="default.list.label" args="[entityName]" />
                </h3>
                <div class="card-tools">
                    <ul class="nav nav-grails">
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
                <f:table properties="username, enabled, passwordExpired, accountLocked, accountExpired" collection="${userList}" />

                <div class="pagination">
                    <g:paginate total="${userCount ?: 0}" />
                </div>
            </div>
        </div>
    </body>
</html>
