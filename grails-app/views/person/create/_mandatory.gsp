<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card card-main">
    <div class="card-header">
        <h3 class="card-title">Datos obligatorios</h3>
    </div>
    <div class="card-body">
        <fieldset>
            <f:field widget-placeholder="Nombre" label="Nombre" bean="person" property="name"/>
            <f:field widget-placeholder="Primer apellido" label="Primer apellido" bean="person" property="firstSurname"/>
            <f:field
                label="Sexo"
                bean="person"
                property="genre"
                value="${person?.genre}"
                widget-optionKey="id"
                widget-optionValue="name"
                widget-value="${person?.genre?.id}"
                widget-from="${Genre.list()}" />

            <f:field label="Fecha de nacimiento" bean="person" property="birthDate" widget-value="${person?.birthDate}" />
            <f:field widget-placeholder="Telefono o Email de contacto" label="Contacto" bean="person" property="contact1"/>
            <f:field
                label="Profesional de referencia"
                bean="person"
                property="professionalReference"
                widget-optionKey="id"
                widget-optionValue="name"
                widget-value="${person?.professionalReference?.id}"
                widget-from="${User.list()}" />
            <f:field
                label="Via de acceso"
                bean="person"
                property="cameFrom"
                widget-optionKey="id"
                widget-optionValue="name"
                widget-value="${person?.cameFrom?.id}"
                widget-from="${CameFrom.list()}" />
            <f:field label="Fecha de alta" bean="person" property="registrationAt" widget-value="${person?.registrationAt}"/>
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
