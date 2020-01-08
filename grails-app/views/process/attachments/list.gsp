<g:applyLayout name="person/details">
    <content tag="title">Procesos (Adjuntos)</content>
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
            <g:link controller="process" action="show" id="${process.id}">proceso</g:link>
        </li>
        <li class="breadcrumb-item active">adjuntos</li>
    </content>
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="selection">
        <g:render template="templates/tabs" model="[tabName: 'attachments']" />
    </content>
    <content tag="detail">
        <g:render template="attachments/templates/list" model="[attachments: process.attachments]" />
    </content>
     <content tag="actions">
        <g:link
            controller="process"
            action="addAttachment"
            id="${process.id}"
            class="btn btn-primary">Agregar nuevo adjunto</g:link>
        <g:link
            controller="process"
            action="index"
            id="${process.person.id}"
            class="btn btn-default float-right">Volver a procesos</g:link>
    </content>
</g:applyLayout>
