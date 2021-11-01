<span class="badge badge-${value ? 'success' : 'danger'}">
    <g:if test="${value}">
        <g:message code="person.active" />
    </g:if>
    <g:else>
        <g:message code="person.inactive" />
    </g:else>
</span>