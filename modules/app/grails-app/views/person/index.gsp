<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
<content tag="title"><g:message code="default.list.label" args="[entityName]" />s</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link url="/">Home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="person"><g:message code="default.list.label" args="[entityName]" /></g:link>
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
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="create btn btn-default" href="#" data-toggle="modal" data-target="#search_form">
                                <i class="nav-icon fas fa-search"></i> Filtros
                            </a>
                            <g:link class="create btn btn-default" action="index">
                                <i class="nav-icon fas fa-trash"></i> Borrar filtros
                            </g:link>
                        </li>
                    </ul>
                    <g:render template="search/modal"/>
                </h3>
                <div class="card-tools">
                    <ul class="nav nav-grails">
                        <li class="nav-item mr-2">
                            <g:link class="create btn btn-default" action="create">
                                <i class="nav-icon fas fa-plus"></i>
                                Nuevo
                            </g:link>
                        </li>
                        <li class="nav-item">
                            <g:link
                                class="create btn btn-default ${personList ? '' : 'disabled'}"
                                action="export"
                                params="${params}">
                                    <i class="nav-icon fas fa-download"></i>
                                    Exportar
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-12 pl-4 p-3">
                        <label class="mb-0">Filtros activos:</label>
                        <g:render template="search/show_filters" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <g:if test="${personList}">
                        <f:table
                                collection="${personList}"
                                displayStyle="table_wnr"
                                template="table_people"
                                properties="photo, name" />
                        </g:if>
                        <g:else>
                            <g:render template="/templates/tables/no_results" />
                        </g:else>
                    </div>
                </div>
            </div> <!-- card-body -->
            <g:set var="paginationMax" value="${grailsApplication.config.app.pagination.max}" />
            <g:set var="totalCount" value="${personList?.totalCount ?: 0}" />
            <g:if test="${personList && totalCount >= paginationMax}">
                <div class="card-footer">
                    <div class="pagination">
                        <g:paginate
                            max="${paginationMax}"
                            controller="person"
                            action="index"
                            total="${totalCount}"
                            params="${params}"/>
                    </div>
                </div>
            </g:if>
        </div>
    </body>
</html>
