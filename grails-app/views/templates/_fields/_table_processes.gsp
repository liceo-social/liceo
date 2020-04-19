<table class="table table-striped table-ma">
    <thead>
         <tr>
            <g:sortableColumn property="description" title="Description" />
            <g:sortableColumn class="text-center" property="meetingDate" title="Date" />
            <g:sortableColumn class="text-center" property="project" title="Project" />
            <g:sortableColumn class="text-center" property="type" title="Type" />
            <td class="text-center"></td>
        </tr>
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td class="contained">
                    <f:display
                        bean="${bean}"
                        property="description"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="meetingDate"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="project"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"
                        description="${bean?.project?.name}" />
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="type"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"
                        description="${bean.type.name}" />
                </td>
                <td class="text-right actions">
                    <g:link class="btn btn-default btn-sm"
                        controller="process" action="show" id="${bean.id}">
                        <i class="fas fa-eye"></i>
                        detalle
                    </g:link>
                    <g:if test="${bean.person.active}">
                        <g:link class="btn btn-primary btn-sm"
                            controller="process" action="edit" id="${bean.id}">
                            <i class="fas fa-pen"></i>
                            editar
                        </g:link>
                        <g:render template="/templates/modals/delete" model="[bean: bean]" />
                    </g:if>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
