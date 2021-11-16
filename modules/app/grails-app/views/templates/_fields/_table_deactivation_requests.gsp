<table class="table table-striped table-ma">
    <thead>
         <tr>
             <g:sortableColumn class="text-center" property="person" title="Persona" params="${params}" />
            <g:sortableColumn class="text-center" property="person.fullname" title="Nombre Completo" params="${params}" />
            <g:sortableColumn class="text-center" property="requestedBy" title="Solicitado Por" params="${params}" />
            <g:sortableColumn class="text-center" property="motivation" title="Motivo" params="${params}" />
            <th class="text-center"></th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td class="contained text-center">
                    <f:display
                        bean="${bean}"
                        property="person"
                        displayStyle="html"
                        theme="${theme}"/>
                </td>
                <td class="contained text-center">
                    <f:display
                        bean="${bean}"
                        property="person.fullname"
                        displayStyle="html"
                        theme="${theme}"/>
                </td>
                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="requestedBy"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>

                <td class="text-center">
                    <f:display
                        bean="${bean}"
                        property="motivation"
                        displayStyle="${displayStyle?:'table'}"
                        theme="${theme}"/>
                </td>
                <td class="text-right actions">
                    <!-- APPROVAL -->
                    <g:form action="approveDeactivation" controller="person" id="${id}">
                        <g:hiddenField name="motivation" property="motivation" value="${bean.motivation}" />
                        <g:hiddenField name="person.id" property="person" value="${bean.person?.id}" />
                        <a class="btn btn-warning btn-sm"
                            href="#"
                            data-toggle="modal"
                            data-target="#show_approve_request_modal_${bean.id}">
                            <i class="fas fa-check"></i>
                            Aprobar
                        </a>
                        <g:render
                            template="/templates/modals/confirmation"
                            model="[
                               modalId:"show_approve_request_modal_${bean.id}",
                               modalMessage:"Quieres aprobar la solicitud de baja ?",
                               cancelButtonMessage: "Cancelar",
                               proceedButtonMessage: "Aprobar"
                           ]"
                        />
                    </g:form>
                    <!-- DELETE -->
                    <g:render
                        template="/templates/modals/delete"
                        model="[
                           bean: bean,
                           nodeParam: bean,
                           id: bean.id,
                           modalMessage: 'Quieres eliminar la solicitud de baja ?'
                        ]"
                    />
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
