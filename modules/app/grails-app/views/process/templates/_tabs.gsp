<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
  <li class="nav-item">
    <g:link
        id="${process.id}"
        controller="process"
        action="show"
        class="nav-link ${tabName == 'detail' ? 'active' : ''}"
        role="tab"
        aria-controls="custom-tabs-one-person"
        aria-selected="false">Detalle proceso</g:link>
  </li>
  <li class="nav-item">
    <g:set var="attachmentSize" value="${process.attachments?.size()}" />
    <g:if test="${attachmentSize}">
        <g:set var="attachmentTip" value="(${attachmentSize})" />
    </g:if>
    <g:if test="${disableRemainingTabs}">
        <span class="nav-link disabled">Adjuntos ${attachmentTip}</span>
    </g:if>
    <g:else>
        <g:link
            id="${process.id}"
            controller="process"
            action="attachments"
            class="nav-link ${tabName == 'attachments' ? 'active' : ''}"
            aria-controls="custom-tabs-two-projects"
            aria-selected="false">Adjuntos ${attachmentTip}</g:link>
    </g:else>
  </li>
  <g:if test="${tabName == 'new_attachment'}">
    <li class="nav-item">
        <span class="nav-link active">Nuevo adjunto</span>
    </li>
  </g:if>
</ul>
