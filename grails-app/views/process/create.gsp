<g:applyLayout name="person/creation">
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
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="form">
        <g:form controller="process" action="save" method="POST">
            <div class="card card-default card-tabs">
                <div class="card-header p-0 pt-1">
                    <g:render template="templates/tabs" model="[tabName: 'detail', disableRemainingTabs: true]" />
                </div>
                <div class="card-body">
                    <div class="tab-content" id="custom-tabs-one-tabContent">
                        <g:render template="templates/body" />
                    </div>
                </div>
                <div class="card-footer">                    
                    <g:submitButton name="create" class="btn btn-primary save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <g:link
                        controller="process"
                        action="index"
                        id="${process.person.id}"
                        type="submit"
                        class="btn btn-default float-right">Ir al listado</g:link  >
                </div>
            </div>
        </g:form>
    </content>
</g:applyLayout>
