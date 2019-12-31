<g:applyLayout name="person/details">
    <content tag="title">Detalle de proceso</content>
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
        <li class="breadcrumb-item active">detalle</li>
    </content>
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="selection">
        <g:render template="templates/tabs" model="[tabName: 'detail']" />
    </content>
    <content tag="detail">
        <g:render template="templates/body_show" />
    </content>
    <content tag="actions">
        <g:link
            controller="process"
            action="edit"
            id="${process.id}"
            class="btn btn-primary">Edit</g:link>
        <g:link
            controller="process"
            action="index"
            id="${process.person.id}"
            class="btn btn-default float-right">Volver</g:link>
    </content>
</g:applyLayout>
