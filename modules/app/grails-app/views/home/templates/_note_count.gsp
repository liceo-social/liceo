<g:set var="noteStats" value="${person.noteStatistics}" />
<g:set var="noteCount" value="${noteStats.notes}" />
<g:set var="warningCount" value="${noteStats.warnings}" />
<g:set var="dangerCount" value="${noteStats.dangers}" />

<g:if test="${noteCount}">
    <g:link
        controller="note"
        action="index"
        id="${person.id}"
        params="[severity: 'NOTE']">
        <span title="${noteCount} alerta/s a revisar" class="badge badge-primary float-right ml-1">${noteCount}</span>
    </g:link>
</g:if>
<g:if test="${warningCount}">
    <g:link
        controller="note"
        action="index"
        id="${person.id}"
        params="[severity: 'WARNING']">
        <span title="${warningCount} alerta/s a tener en cuenta" class="badge badge-warning float-right ml-1">${warningCount}</span>
    </g:link>
</g:if>
<g:if test="${dangerCount}">
    <g:link
        controller="note"
        action="index"
        id="${person.id}"
        params="[severity: 'DANGER']">
        <span title="${dangerCount} alerta/s requieren accion inmediata" class="badge badge-danger float-right ml-1">${dangerCount}</span>
    </g:link>
</g:if>
