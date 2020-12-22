<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<fieldset>
    <div class="row">
        <div class="col-2">
            <f:display
                label="Proyecto"
                bean="process"
                property="project"
                value="${process.project.name}"
                wrapper="display/block" />
        </div>
        <div class="col-2">
            <f:display
                label="Tipo de proceso"
                bean="process"
                property="type"
                value="${process.type.name}"
                wrapper="display/block" />
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <f:display
                label="Fecha"
                bean="process"
                property="meetingDate"
                wrapper="display/block" />
        </div>
        <g:if test="${!process.allDay}">
            <div class="col-2">
                <f:display
                    label="Hora Inicio"
                    bean="process"
                    property="meetingStartTime"
                    wrapper="display/block" />
            </div>
            <div class="col-2">
               <g:if test="${process.meetingEndTime}">
                    <f:display
                        label="Hora fin"
                        bean="process"
                        property="meetingEndTime"
                        wrapper="display/block" />
               </g:if>
            </div>
        </g:if>
    </div>
    <div class="row">
        <div class="col-12">
            <f:display
                label="Descripción"
                bean="process"
                property="description"
                wrapper="display/block" />
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <f:display
                label="Contenido"
                bean="process"
                property="content"
                widget="display/html"
                wrapper="display/html" />
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <f:display
                label="Creado por"
                bean="process"
                property="createdBy"
                wrapper="display/block" />
        </div>
    </div>
</fieldset>
