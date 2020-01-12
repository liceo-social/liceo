<table class="table table-striped table-ma">
    <thead>
         <tr>
            <g:sortableColumn property="name" title="Name" />
            <g:sortableColumn class="text-center" property="description" title="Description" />
            <g:sortableColumn class="text-center" property="processes" title="Processes" />
            <g:sortableColumn class="text-center" property="people" title="People" />
            <td class="text-center"></td>
        </tr>
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td class="contained">
                    <f:display
                        bean="${bean}"
                        property="name"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="desciption"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="processes"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"
                        description="${bean?.project?.processes}" />
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="people"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"
                        description="${bean?.project?.people}" />
                </td>
                <td class="text-right actions">
                    <g:link class="btn btn-default btn-sm"
                        controller="process" action="show" id="${bean.id}">
                        <i class="fas fa-eye"></i>
                        detalle
                    </g:link>
                    <g:link class="btn btn-primary btn-sm"
                        controller="process" action="edit" id="${bean.id}">
                        <i class="fas fa-pen"></i>
                        editar
                    </g:link>
                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                        <g:link class="btn btn-danger btn-sm"
                            controller="process" action="delete" id="${bean.id}">
                            <i class="fas fa-trash"></i>
                            borrar
                        </g:link>
                    </sec:ifAllGranted>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
