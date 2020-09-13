<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
    <li class="nav-item">
        <g:link
            controller="person"
            action="show"
            id="${person.id}"
            class="nav-link ${tabName == 'detail' ? 'active' : ''}"
            role="tab"
            aria-controls="custom-tabs-one-person"
            aria-selected="false">Datos personales</g:link>
    </li>
    <li class="nav-item">
        <g:link controller="process"
            action="index"
            id="${person.id}"
            class="nav-link ${tabName == 'processes' ? 'active' : ''}"
            aria-controls="custom-tabs-two-projects"
            aria-selected="false">Procesos</g:link>
    </li>
    <li class="nav-item">
        <g:link controller="authorization"
            action="index"
            id="${person.id}"
            class="nav-link ${tabName == 'authorizations' ? 'active' : ''}"
            aria-controls="custom-tabs-two-projects"
            aria-selected="false">Documentación</g:link>
    </li>
</ul>
