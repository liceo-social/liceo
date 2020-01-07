<g:applyLayout name="person/details">
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
            <g:link controller="process" action="show" id="${process.id}">proceso</g:link>
        </li>
        <li class="breadcrumb-item active">adjuntos</li>
    </content>
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="selection">

    </content>
    <content tag="detail">
        <g:render template="attachments/templates/form" />
    </content>
     <content tag="actions">
        acciones
    </content>
</g:applyLayout>
