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
        <g:form name="process-update" action="update" id="${process.id}" method="POST">
            <div class="card">    
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="card-header">
                    <g:render template="templates/header" />
                </div>
                <div class="card-body">
                    <g:render template="templates/body" />
                </div>
                <div class="card-footer">
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-primary save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        <g:link 
                            controller="person" 
                            action="processes" 
                            id="${process.person.id}" 
                            type="submit" 
                            class="btn btn-default float-right">Cancel</g:link  >
                    </fieldset>
                </div>            
            </div>
        </g:form>
    </body>
</html>