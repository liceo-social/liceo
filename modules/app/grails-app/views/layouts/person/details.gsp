<content tag="title">
    <g:pageProperty name="page.title" />
</content>
<content tag="breadcrumb">
    <g:pageProperty name="page.breadcrumb" />
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
            <g:applyLayout name="person/header">
                <g:pageProperty name="page.photoStatus" />
            </g:applyLayout>
         </div>
          <div class="col-md-9">
              <div class="card card-primary card-tabs">
                  <div class="card-header p-0 pt-1">
                      <g:pageProperty name="page.selection" />
                  </div>
                  <div class="card-body">
                    <div class="tab-content" id="custom-tabs-one-tabContent">
                        <g:pageProperty name="page.detail" />
                    </div>
                  </div>
                  <g:if test="${g.pageProperty(name: 'page.actions')}">
                    <div class="card-footer">
                        <g:pageProperty name="page.actions" />
                    </div>
                  </g:if>
               </div>
           </div>
        </div>
    </body>
</html>
