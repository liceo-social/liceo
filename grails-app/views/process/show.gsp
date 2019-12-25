<content tag="title">Nuevo proceso</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">home</g:link>
     </li>
     <li class="breadcrumb-item">
        <g:link controller="person">personas</g:link>
    </li>
    <li class="breadcrumb-item">
        <g:link controller="person" action="show" id="${process.person.id}">detalle</g:link>
    </li>
    <li class="breadcrumb-item">
        <g:link controller="person" action="processes" id="${process.person.id}">procesos</g:link>
    </li>
    <li class="breadcrumb-item active">nuevo</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="card card-primary">    
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="card-header">
                <g:render template="templates/header" />
            </div>
            <div class="card-body">
                <g:render template="templates/body_show" />
            </div>
            <div class="card-footer">
                <fieldset class="buttons">
                    <g:link 
                        controller="process" 
                        action="edit" 
                        id="${process.id}"                         
                        class="btn btn-primary">Edit</g:link>
                    <g:link 
                        controller="person" 
                        action="processes" 
                        id="${process.person.id}"
                        class="btn btn-default float-right">Volver</g:link>
                </fieldset>
            </div>            
        </div>
    </body>
</html>