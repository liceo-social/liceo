<g:set var="tooltip">
    <g:if test="${bean.allDay}">Todo el dia</g:if>
    <g:else>
       <g:if test="${bean.isTimeAuditable}">
           ${bean.meetingStartTime} - ${bean.meetingEndTime}
       </g:if>
       <g:else>
           ${bean.meetingStartTime}
       </g:else>
    </g:else>
</g:set>
<span title="${tooltip}">
    <g:formatDate format="dd/MM/yyyy" date="${value}" />
</span>
