<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
  <li class="nav-item">
    <g:link
        controller="process"
        action="show"
        id="${process.id}"
        class="nav-link ${tabName == 'detail' ? 'active' : ''}"
        role="tab"
        aria-controls="custom-tabs-one-person"
        aria-selected="false">Detalle proceso</g:link>
  </li>
  <li class="nav-item">
    <g:link controller="process"
        action="attachments"
        id="${process.id}"
        class="nav-link ${tabName == 'attachments' ? 'active' : ''}"
        aria-controls="custom-tabs-two-projects"
        aria-selected="false">Adjuntos</g:link>
  </li>
</ul>
