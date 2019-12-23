<content tag="title">Projectos</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">Home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="person">Persona</g:link>
    </li>
    <li class="breadcrumb-item active">Proyectos</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'persona')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="row">
          <div class="col-md-12">
              <g:if test="${flash.message}">
                  <div class="message" role="status">\${flash.message}</div>
              </g:if>
              <g:render template="show/person_header" />
          </div>
        </div>
      <div class="row">
          <div class="col-md-12">
              <div class="card card-primary card-tabs">
                  <div class="card-header p-0 pt-1">
                      <g:render template="show/tabs" model="[tabName: 'projects']" />
                  </div>
                  <div class="card-body">
                    <div class="tab-content" id="custom-tabs-one-tabContent">
                      <g:render template="show/tab_projects" />
                  </div>
              </div>
          </div>
       </div>
    </body>
</html>
