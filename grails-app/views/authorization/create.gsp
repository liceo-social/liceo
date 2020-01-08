<g:applyLayout name="person/creation">
    <content tag="title">Nueva autorizacion</content>
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
            <g:link controller="person" action="authorizations" id="${authorization.person.id}">autorizaciones</g:link>
        </li>
        <li class="breadcrumb-item active">nueva</li>
    </content>
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="form">
        <div class="card">
            <g:uploadForm resource="/authorization" method="POST">
                <div class="card-body">
                    <div class="tab-content" id="custom-tabs-one-tabContent">
                        <g:render template="templates/create_form" />
                    </div>
                </div>
                <div class="card-footer">
                    <g:submitButton
                        name="create"
                        class="btn btn-primary save"
                        value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <g:link
                        controller="authorization"
                        action="index"
                        id="${authorization.person.id}"
                        type="submit"
                        class="btn btn-default float-right">Volver a autorizaciones</g:link  >
                </div>
            </g:uploadForm>
        </div>
    </content>
</g:applyLayout>
