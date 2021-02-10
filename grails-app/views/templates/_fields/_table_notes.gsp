<table class="table table-striped table-ma">
    <thead>
         <tr>
            <g:sortableColumn class="text-center" property="severity" title="Importancia" />
            <g:sortableColumn property="comment" title="Description" />
            <th class="text-center">Creado</th>
            <th class="text-center">Actualizado</th>
            <th class="text-center">Creado por</th>
            <th class="text-center"></th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td  class="text-center">
                    <f:display
                        bean="${bean}"
                        property="severity"
                        templates="importance"
                        theme="${theme}"/>
                </td>
                <td>
                    <f:display
                        bean="${bean}"
                        property="comment"
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
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="createdBy"
                        displayStyle="html"
                        theme="${theme}" />
                </td>
                <td class="text-right actions">
                    <masec:isCreatorOrAdmin createdBy="${bean.createdBy}">
                        <g:if test="${bean.person.active}">
                            <g:link class="btn btn-primary btn-sm"
                                controller="note" action="edit" id="${bean.id}">
                                <i class="fas fa-pen"></i>
                                editar
                            </g:link>
                            <g:render template="/templates/modals/delete" model="[bean: bean]" />
                        </g:if>
                    </masec:isCreatorOrAdmin>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
