<table class="table table-striped table-ma">
    <thead>
         <tr>
            <g:sortableColumn property="description" title="Descripcion" />
            <g:sortableColumn property="attachment.filename" title="Archivo" />
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
                <td class="contained">
                    <f:display
                        bean="${bean}"
                        property="attachment.originalFilename"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-right actions">
                    <g:link class="btn btn-warning btn-sm"
                        controller="attachment" action="download" id="${bean.attachment.id}">
                        <i class="fas fa-download"></i>
                        descargar
                    </g:link>
                    <g:link
                        class="btn btn-primary btn-sm"
                        controller="process"
                        action="editAttachment"
                        id="${bean.id}">
                        <i class="fas fa-pen"></i>
                        editar
                    </g:link>
                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                        <g:set var="action" value="deleteAttachment" />
                        <g:set var="controller" value="process" />
                        <g:render
                            template="/templates/modals/delete"
                            model="[bean: bean, action: action, controller: controller, id: bean.id]" />
                    </sec:ifAllGranted>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
