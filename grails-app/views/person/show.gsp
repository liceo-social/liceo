<content tag="title">Persona</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link controller="home">home</g:link>
     </li>
    <li class="breadcrumb-item">
        <g:link controller="person">personas</g:link>
    </li>
    <li class="breadcrumb-item">
        <g:link controller="person" action="show" id="${person.id}">detalle</g:link>
    </li>
    <li class="breadcrumb-item active">datos personales</li>
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
         <div class="col-md-3">
            <g:applyLayout name="personHeader" template="photo/show" />
         </div>
          <div class="col-md-9">
              <div class="card card-primary card-tabs">
                  <div class="card-header p-0 pt-1">
                      <g:render template="show/tabs" model="[tabName: 'detail']" />
                  </div>
                  <div class="card-body">
                    <div class="tab-content" id="custom-tabs-one-tabContent">
                      <g:render template="show/tab_personal_data" />
                  </div>
              </div>
          </div>
       </div>
    </body>
</html>
