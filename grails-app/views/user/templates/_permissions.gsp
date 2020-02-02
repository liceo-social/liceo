<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Permisos</h3>
    </div>
    <div class="card-body">
            <g:hiddenField name="id" value="${user.id}" />
            <f:field bean="${user}" property="enabled" widget="switch" wrapper="switch"/>
            <f:field bean="${user}" property="passwordExpired" widget="switch"  wrapper="switch" />
            <f:field bean="${user}" property="accountLocked" widget="switch"  wrapper="switch" />
            <f:field bean="${user}" property="accountExpired" widget="switch"  wrapper="switch" />
    </div>
    <div class="card-footer">
        <g:submitButton
            name="create"
            class="btn btn-primary save"
            value="${message(code: 'default.button.save.label', default: 'Guardar')}" />
        <g:link
            name="cancel"
            action="index"
            class="btn btn-default cancel float-right">${message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
    </div>
</div>
