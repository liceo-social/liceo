<g:set var="entityName" value="${message(code: 'deactivationRequestEntity.label', default: 'DeactivationRequestEntity')}" />
<content tag="title"><g:message code="default.list.label" args="[entityName]" />s</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link url="/">Home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="deactivationRequestEntity"><g:message code="default.list.label" args="[entityName]" /></g:link>
    </li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-person" class="card" role="main">
            <div class="card-header">
                <h3 class="card-title">
                    <g:message code="default.list.label" args="[entityName]" />
                </h3>

            </div>
            <div class="card-body p-0">
                <g:if test="${deactivationRequestEntityList}">
                <f:table
                        collection="${deactivationRequestEntityList}"
                        displayStyle="table_wnr"
                        template="table_deactivation_requests"
                        properties="person.fullname,requestedBy,motivation,deactivationDate" />
                <div class="pagination">
                    <g:paginate total="${deactivationRequestEntityCount ?: 0}" />
                </div>
                </g:if>
                <g:else>
                    <g:render template="/templates/tables/no_results" />
                </g:else>
            </div>
        </div>
    </body>
</html>
