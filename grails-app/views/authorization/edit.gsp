<g:applyLayout name="person/creation">
    <content tag="title">Editar autorizacion</content>
    <content tag="breadcrumb">
        <li class="breadcrumb-item">
            <g:link controller="home">home</g:link>
        </li>
        <li class="breadcrumb-item">
            <g:link controller="person">personas</g:link>
        </li>
        <li class="breadcrumb-item">
            <g:link controller="person" action="show" id="${authorization.person.id}">detalle</g:link>
        </li>
        <li class="breadcrumb-item">
            <g:link controller="person" action="authorizations" id="${authorization.person.id}">documentación</g:link>
        </li>
        <li class="breadcrumb-item active">edicion</li>
    </content>
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="form">
        <g:uploadForm name="authorization-update" action="updateAuthorization" method="POST">
            <div class="card card-primary card-tabs">
                <div class="card-header p-0 pt-1">
                    <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                        <li class="nav-item">
                            <span class="nav-link">Detalle de documento</span>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content" id="custom-tabs-one-tabContent">
                        <g:render template="templates/edit_form" />
                    </div>
                </div>
                <div class="card-footer">
                    <g:submitButton
                        name="create"
                        class="btn btn-primary save"
                        value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:link
                        controller="authorization"
                        action="index"
                        id="${authorization.person.id}"
                        type="submit"
                        class="btn btn-default float-right">Volver a listado</g:link  >
                   </div>
            </div>
        </g:uploadForm>
    </content>
</g:applyLayout>
