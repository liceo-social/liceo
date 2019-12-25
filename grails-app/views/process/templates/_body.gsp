<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<fieldset>
    <f:field
        label="Descripcion"
        bean="process"
        property="description"
        widget-placeholder="Introduce una breve descripcion de la reunion"
        widget-value="${process?.description}"/>
    <f:field
        label="Fecha"
        bean="process"
        property="meetingDate"
        widget-value="${process?.meetingDate}"/>
    <f:field
        label="Tipo de proceso"
        bean="process"
        property="type"
        value="${process?.type}"
        widget-optionKey="id"
        widget-optionValue="name"
        widget-value="${process?.type?.id}"
        widget-from="${ProcessType.list()}" />
    <f:field
        widget-placeholder="Contenido"
        label="Contenido"
        bean="process"
        widget-rich="true"
        widget-value="${process?.content}"
        property="content"/>
    <g:hiddenField name="person.id" value="${process?.person?.id}" />
    <g:hiddenField name="project.id" value="${process?.project?.id}" />                        
</fieldset>