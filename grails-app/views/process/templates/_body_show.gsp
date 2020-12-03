<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<fieldset>
    <f:display
        label="Descripcion"
        bean="process"
        property="description" 
        wrapper="display/block" />        
    <f:display
        label="Fecha"
        bean="process"
        property="meetingDate" 
        wrapper="display/block" />
    <f:display
        label="Tipo de proceso"
        bean="process"
        property="type" 
        wrapper="display/block" />
    <f:display
        label="Contenido"
        bean="process"
        property="content"
        widget="display/html"
        wrapper="display/html" />
    <f:display
        label="Creado por"
        bean="process"
        property="createdBy"
        wrapper="display/block" />
</fieldset>
