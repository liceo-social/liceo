<table class="table table-striped table-ma">
    <thead>
         <tr>
            <g:sortableColumn property="description" title="Description" />
            <g:sortableColumn class="text-center" property="project" title="Proyecto" />
            <th class="text-center">Creado</th>
            <th class="text-center">Actualizado</th>
            <th class="text-center"></th>
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
                        property="project"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="dateCreated"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}" />
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="lastUpdated"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}" />
                </td>
                <td class="text-right actions">
                    <g:link class="btn btn-warning btn-sm"
                        controller="attachment" action="download" id="${bean.attachment?.id}">
                        <i class="fas fa-download"></i>
                        descargar
                    </g:link>
                    <g:link class="btn btn-primary btn-sm"
                        controller="authorization" action="edit" id="${bean.id}">
                        <i class="fas fa-pen"></i>
                        editar
                    </g:link>
                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                        <g:link class="btn btn-danger btn-sm"
                            controller="authorization" action="delete" id="${bean.id}">
                            <i class="fas fa-trash"></i>
                            borrar
                        </g:link>
                    </sec:ifAllGranted>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
