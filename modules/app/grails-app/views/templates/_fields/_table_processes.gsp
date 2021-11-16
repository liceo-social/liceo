<table class="table table-striped table-ma">
    <thead>
         <tr>
            <g:sortableColumn property="description" title="Descripción" />
            <g:sortableColumn class="text-center" property="meetingDate" title="Fecha" />
            <g:sortableColumn class="text-center" property="isTimeAuditable" title="Auditable" />
            <g:sortableColumn class="text-center" property="project" title="Proyecto" />
            <g:sortableColumn class="text-center" property="type" title="Tipo" />
            <g:sortableColumn class="text-center" property="createdBy" title="Creador" />
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
                        displayStyle="showStartEndTime"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="isTimeAuditable"
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
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="createdBy"
                        displayStyle="html"
                        theme="${theme}"
                        description="${bean.createdBy.name}" />
                </td>
                <td class="text-right actions">
                    <g:link class="btn btn-default btn-sm"
                        controller="process" action="show" id="${bean.id}">
                        <i class="fas fa-eye"></i> Detalle
                    </g:link>
                    <masec:isCreatorOrAdmin createdBy="${bean.createdBy}">
                        <g:if test="${bean.person.active}">
                            <g:link class="btn btn-primary btn-sm"
                                controller="process" action="edit" id="${bean.id}">
                                <i class="fas fa-pen"></i> Editar
                            </g:link>
                            <g:render template="/templates/modals/delete" model="[bean: bean]" />
                        </g:if>
                    </masec:isCreatorOrAdmin>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
