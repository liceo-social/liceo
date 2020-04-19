<table class="table table-striped table-ma">
    <thead>
         <tr>
            <th class="text-center">Foto</th>
            <th class="text-center">Nombre</th>
            <g:sortableColumn class="text-center" property="birthDate" title="Edad" params="${params}" />
            <g:sortableColumn class="text-center" property="cameFrom" title="Via de acceso" params="${params}" />
            <g:sortableColumn class="text-center" property="registrationAt" title="Registration Date" params="${params}" />
            <th class="text-center">Projects</th>
            <th class="text-center">Activo</th>
            <g:sortableColumn class="text-center" property="professionalReference" title="Responsable" params="${params}" />
            <th class="text-center"></th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td class="contained text-center">
                    <f:display
                        bean="${bean}"
                        property="photo"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="fullname"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>

                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="age"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="cameFrom"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="registrationAt"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="projects"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="active"
                        templates="active" />
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="professionalReference"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-right actions">
                    <g:link class="btn btn-default btn-sm"
                        controller="person" action="show" id="${bean.id}">
                        <i class="fas fa-eye"></i>
                        detalle
                    </g:link>
                    <g:if test="${bean.active}">
                        <g:link class="btn btn-primary btn-sm"
                            controller="person" action="edit" id="${bean.id}">
                            <i class="fas fa-pen"></i>
                            editar
                        </g:link>
                        <sec:ifAllGranted roles='ROLE_ADMIN'>
                            <g:render template="/templates/modals/delete" model="[bean: bean]" />
                        </sec:ifAllGranted>
                    </g:if>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
