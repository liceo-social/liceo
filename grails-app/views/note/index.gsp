<g:applyLayout name="person/details">
    <content tag="title">Alertas</content>
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
        <li class="breadcrumb-item active">Alertas</li>
    </content>
    <content tag="photoStatus">
        <g:render template="/person/photo/show" />
    </content>
    <content tag="selection">
        <g:render template="/person/show/tabs" model="[tabName: 'notes']" />
    </content>
    <content tag="detail">
        <g:render template="templates/list" />
    </content>
</g:applyLayout>
