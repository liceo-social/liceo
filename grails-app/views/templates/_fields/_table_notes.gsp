<table class="table table-striped table-ma">
    <thead>
         <tr>
            <g:sortableColumn class="text-center" property="severity" title="Importancia" />
            <g:sortableColumn property="comment" title="Description" />
            <th class="text-center">Creado</th>
            <th class="text-center">Actualizado</th>
            <th class="text-center">Resuelta</th>
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
                    <g:if test="${bean.resolutionDate}">
                        <f:display
                            bean="${bean}"
                            property="resolutionDate"
                            displayStyle="${displayStyle?:'table'}"
                            theme="${theme}" />
                    </g:if>
                    <g:else>--</g:else>
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
                        <g:if test="${bean.person.active && !bean.resolutionDate}">
                            <g:link class="btn btn-primary btn-sm"
                                controller="note" action="edit" id="${bean.id}">
                                <i class="fas fa-pen"></i>
                                editar
                            </g:link>

                        </g:if>
                    </masec:isCreatorOrAdmin>
                    <g:if test="${bean.person.active && !bean.resolutionDate}">
                        <g:render template="/note/templates/resolve_modal" model="[bean: bean]" />
                        <a class="btn btn-warning btn-sm"
                            href="#"
                            data-toggle="modal"
                            data-target="#resolve_modal">
                            <i class="fas fa-lightbulb"></i>
                            Resolver
                        </a>
                    </g:if>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
