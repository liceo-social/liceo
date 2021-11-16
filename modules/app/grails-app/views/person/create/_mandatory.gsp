<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<fieldset>
    <div class="row">
       <div class="col-6">
            <f:field widget-placeholder="Nombre" label="Nombre" bean="person" property="name"/>
       </div>
       <div class="col-6">
        <f:field widget-placeholder="Primer apellido" label="Primer apellido" bean="person" property="firstSurname"/>
       </div>
    </div>
    <div class="row">
       <div class="col-6">
            <f:field
                label="Sexo"
                bean="person"
                property="sex"
                value="${person?.sex}"
                widget-optionKey="id"
                widget-optionValue="name"
                widget-value="${person?.sex?.id}"
                widget-from="${Sex.list()}" />
       </div>
       <div class="col-6">
           <f:field
                   label="Genero"
                   bean="person"
                   property="genre"
                   value="${person?.genre}"
                   widget-optionKey="id"
                   widget-optionValue="name"
                   widget-value="${person?.genre?.id}"
                   widget-from="${Genre.list()}" />
       </div>
     </div>
    <div class="row">
        <div class="col-6">
            <f:field
                label="Fecha de nacimiento"
                bean="person"
                property="birthDate"
                widget-to="${g.formatDate(date: new Date(), format: 'yyyy')}"
                widget-value="${person?.birthDate}" />
        </div>
        <div class="col-6">
            <f:field label="Fecha de alta" bean="person" property="registrationAt" widget-value="${person?.registrationAt}"/>
        </div>
    </div>
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

</fieldset>
