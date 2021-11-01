<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Cambiar Password</h3>
    </div>
    <div class="card-body">
            <g:hiddenField name="id" value="${user.id}" />
            <f:field
                bean="${command}"
                property="password"
                widget="password"
                widget-placeholder="Introduce primero tu nuevo password" />
            <f:field
                bean="${command}"
                property="passwordAgain"
                widget="password"
                widget-placeholder="Repite tu nuevo password" />
    </div>
    <div class="card-footer">
        <g:submitButton
            name="create"
            class="btn btn-primary save"
            value="${message(code: 'default.button.change.label', default: 'Cambiar')}" />
        <g:link
            name="cancel"
            action="index"
            class="btn btn-default cancel float-right">${message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
    </div>
</div>
