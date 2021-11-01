<fieldset class="p-4">
    <div class="row">
        <div class="col-4">
            <f:display label="Proyecto" bean="process" property="project" value="${process.project.name}"wrapper="display/inline" />
        </div>
        <div class="col-4">
            <f:display label="Fecha" bean="process" property="meetingDate"wrapper="display/inline" />
        </div>
        <div class="col-4">
            <f:display label="Hora Inicio" bean="process" property="meetingStartTime" wrapper="display/inline" />
        </div>
    </div>
    <div class="row">
        <div class="col-4">
            <f:display label="Tipo de proceso" bean="process" property="type" value="${process.type.name}" wrapper="display/inline" />
        </div>
        <div class="col-4">
            <f:display label="Todo el dia" bean="process" property="allDay" wrapper="display/inline" />
        </div>
        <div class="col-4">
            <f:display label="Hora fin" bean="process" property="meetingEndTime" wrapper="display/inline" />
        </div>
    </div>
    <div class="row">
        <div class="col-4">
            <f:display label="Creado por" bean="process" property="createdBy" wrapper="display/inline" />
        </div>
        <div class="col-4">
            <f:display label="Auditable" bean="process" property="isTimeAuditable" wrapper="display/inline" />
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <f:display label="Descripción" bean="process" property="description" wrapper="display/block" />
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <f:display label="Contenido" bean="process" property="content" widget="display/html" wrapper="display/html" />
        </div>
    </div>
</fieldset>
