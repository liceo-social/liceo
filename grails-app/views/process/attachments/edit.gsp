<g:applyLayout name="person/creation">
    <content tag="title">Procesos (Nuevo Adjunto)</content>
    <content tag="breadcrumb">
        <li class="breadcrumb-item">
            <g:link controller="home">home</g:link>
        </li>
        <li class="breadcrumb-item">
            <g:link controller="person">personas</g:link>
        </li>
        <li class="breadcrumb-item">
            <g:link controller="process" action="index" id="${person.id}">procesos</g:link>
        </li>
        <li class="breadcrumb-item">
            <g:link controller="process" action="show" id="${command.process.id}">proceso</g:link>
        </li>
        <li class="breadcrumb-item active">adjuntos</li>
    </content>
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="form">
        <g:uploadForm controller="process" action="updateAttachment" method="POST">
            <div class="card card-primary card-tabs">
                <div class="card-header p-0 pt-1">
                    <g:render template="/process/templates/tabs" model="[tabName: 'new_attachment']" />
                </div>
                <div class="card-body">
                    <div class="tab-content" id="custom-tabs-one-tabContent">
                        <g:render template="attachments/templates/form" />
                    </div>
                </div>
                <div class="card-footer">
                    <g:submitButton
                        name="create"
                        class="btn btn-primary save"
                        value="${message(code: 'default.button.save.label', default: 'Salvar')}" />
                    <g:link
                        controller="process"
                        action="attachments"
                        id="${command?.process?.id}"
                        type="submit"
                        class="btn btn-default float-right">Cancelar</g:link  >
                </div>
            </g:uploadForm>
        </div>
    </content>
</g:applyLayout>
