<div class="card card-danger">
    <div class="card-header">
        <h3 class="card-title">Datos basicos*</h3>
    </div>
    <div class="card-body">
        <fieldset>
            <f:field widget-placeholder="Nombre" label="Nombre" bean="person" property="personalInformation.name"/>
            <f:field widget-placeholder="Primer apellido" label="Primer apellido" bean="person" property="personalInformation.firstSurname"/>
            <f:field label="Sexo" bean="person" property="personalInformation.genre" value="${genreList}" />
            <f:field label="Fecha de nacimiento" bean="person" property="personalInformation.birthDate"/>
            <f:field widget-placeholder="Telefono o Email de contacto" label="Contacto" bean="person" property="address.contact1"/>
            <f:field label="Profesional de referencia" bean="person" property="identification.professionalReference" value="${users}" />
            <f:field label="Via de acceso" bean="person" property="identification.cameFrom" value="${cameFromList}" />
            <f:field label="Fecha de alta" bean="person" property="identification.registrationAt"/>

        </fieldset>
    </div>
    <div class="card-footer">
        <g:submitButton
            name="create"
            class="btn btn-primary save"
            value="${message(code: 'default.button.create.label',
            default: 'Create')}" />
    </div>
</div>