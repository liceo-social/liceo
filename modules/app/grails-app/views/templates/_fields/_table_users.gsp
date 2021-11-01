<table class="table table-striped table-ma">
    <thead>
         <tr>
            <th class="text-center">Foto</th>
            <g:sortableColumn property="username" title="Login" />
            <g:sortableColumn class="text-center" property="enabled" title="Activo" />
            <g:sortableColumn class="text-center" property="passwordExpired" title="Password caducada" />
            <g:sortableColumn class="text-center" property="accountLocked" title="Bloqueada" />
            <g:sortableColumn class="text-center" property="accountExpired" title="Cuenta caducada" />
            <td class="text-center"></td>
        </tr>
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="photo"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="contained">
                    <f:display
                        bean="${bean}"
                        property="username"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="enabled"
                        templates="active" />
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="passwordExpired"
                        widget="activable"
                        id="${bean.username}_expired"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}" />
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="accountLocked"
                        widget="activable"
                        id="${bean.username}_account_locked"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}" />
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="accountExpired"
                        widget="activable"
                        id="${bean.username}_account_expired"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}" />
                </td>
                <td class="text-right actions">
                    <g:link class="btn btn-primary btn-sm"
                        controller="user" action="edit" id="${bean.id}">
                        <i class="fas fa-pen"></i>
                        editar
                    </g:link>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
