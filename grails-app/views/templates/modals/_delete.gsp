 <!-- DELETE::START -->
 <g:if test="${!(action && controller)}">
    <g:form resource="${bean}" method="DELETE">
        <g:set var="modalId" value="deleteRecord${bean.id}" />
        <g:if test="${!modalTitle}">
            <g:set var="modalTitle" value="${g.message(code: 'default.button.delete.label')}" />
        </g:if>
        <g:if test="${!modalMessage}">
            <g:set var="modalMessage" value="${g.message(code: 'default.button.delete.confirm.message')}" />
        </g:if>
        <g:if test="${!cancelButtonMessage}">
            <g:set var="cancelButtonMessage" value="${g.message(code: 'default.button.cancel.label')}" />
        </g:if>
        <g:if test="${!proceedButtonMessage}">
            <g:set var="proceedButtonMessage" value="${g.message(code: 'default.button.delete.label')}" />
        </g:if>
        <a class="btn btn-danger btn-sm"
            href="#"
            data-toggle="modal"
            data-target="#${modalId}">
                <i class="fas fa-trash"></i>
                Borrar
            </a>
        <g:render template="/templates/modals/confirmation" />
    </g:form>
</g:if>
<g:else>
    <g:form action="${action}" controller="${controller}" id="${id}" method="DELETE">
        <g:set var="modalId" value="deleteRecord${bean.id}" />
        <g:if test="${!modalTitle}">
            <g:set var="modalTitle" value="${g.message(code: 'default.button.delete.label')}" />
        </g:if>
        <g:if test="${!modalMessage}">
            <g:set var="modalMessage" value="${g.message(code: 'default.button.delete.confirm.message')}" />
        </g:if>
        <g:if test="${!cancelButtonMessage}">
            <g:set var="cancelButtonMessage" value="${g.message(code: 'default.button.cancel.label')}" />
        </g:if>
        <g:if test="${!proceedButtonMessage}">
            <g:set var="proceedButtonMessage" value="${g.message(code: 'default.button.delete.label')}" />
        </g:if>
        <a class="btn btn-danger btn-sm"
            href="#"
            data-toggle="modal"
            data-target="#${modalId}">
                <i class="fas fa-trash"></i>
                Borrar
            </a>
        <g:render template="/templates/modals/confirmation" />
    </g:form>
</g:else>
<!-- DELETE::END -->
