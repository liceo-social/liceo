<table class="table table-striped">
    <thead>
         <tr>         
            <g:each in="${domainProperties}" var="p" status="i">
                <g:sortableColumn property="${p.property}" title="${p.label}" />
            </g:each>
            <th></td>
        </tr>        
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <g:each in="${domainProperties}" var="p" status="j">
                    <g:if test="${p.name == linkColumn}">
                        <td><g:link method="GET" resource="${bean}"><f:display bean="${bean}" property="${p.property}" displayStyle="${displayStyle?:'table'}" theme="${theme}"/></g:link></td>
                    </g:if>
                    <g:elseif test="${p.name in ['name', 'username', 'id']}">
                        <td><g:link method="GET" resource="${bean}"><f:display bean="${bean}" property="${p.property}" displayStyle="${displayStyle?:'table'}" theme="${theme}"/></g:link></td>
                    </g:elseif>
                    <g:else>
                        <td><f:display bean="${bean}" property="${p.property}"  displayStyle="${displayStyle?:'table'}" theme="${theme}"/></td>
                    </g:else>
                </g:each>
                <td class="text-right">
                    <g:link class="btn btn-default btn-sm" 
                        controller="${property}" action="show" id="${bean.id}">
                        <i class="fas fa-eye"></i>
                        <g:message code="table.actions.show" />
                    </g:link>
                    <g:link class="btn btn-primary btn-sm" 
                        controller="${property}" action="edit" id="${bean.id}">
                        <i class="fas fa-pen"></i>
                        <g:message code="table.actions.edit" />
                    </g:link>
                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                        <g:link class="btn btn-danger btn-sm" 
                            controller="${property}" action="delete" id="${bean.id}">
                            <i class="fas fa-trash"></i>
                            <g:message code="table.actions.delete" />
                        </g:link>
                    </sec:ifAllGranted>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
