<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<fieldset>
    <div class="row">
       <div class="col-4">
            <f:field
                label="Proyecto"
                bean="process"
                property="project"
                value="${process?.project}"
                widget-optionKey="id"
                widget-optionValue="name"
                widget-value="${process?.project?.id}"
                widget-from="${Project.list()}" />
      </div>
      <div class="col-4">
            <f:field
                label="Tipo de proceso"
                bean="process"
                property="type"
                value="${process?.type}"
                widget-optionKey="id"
                widget-optionValue="name"
                widget-value="${process?.type?.id}"
                widget-from="${ProcessType.list()}" />
    </div>
    </div>
    <div class="row mb-4">
       <div class="col-2">
            <f:field
                label="Fecha"
                bean="process"
                property="meetingDate"
                widget-value="${process?.meetingDate}"/>
       </div>
        <div class="col-2 text-center pt-3">
           <g:javascript>
                 function toggleMeetingStartTime(checkbox) {
                    if (checkbox.checked) {
                        $("#meetingStartTime").attr("disabled", true);

                        $("#isTimeAuditable").attr("disabled", true);
                        $("#isTimeAuditable").prop("checked", false);
                        $("#meetingEndTime").attr("disabled", true);
                    } else {
                        $("#meetingStartTime").removeAttr("disabled");
                        $("#isTimeAuditable").removeAttr("disabled");
                    }
                 };
           </g:javascript>
           <f:field
               label="Todo el dia"
               class="pt-4"
               bean="process"
               property="allDay"
               widget="switch"
               wrapper="switch"
               widget-switch="toggleMeetingStartTime(this);"
               widget-value="${process?.allDay}"/>
        </div>
        <div class="col-2">
           <f:field
               label="Hora Inicio"
               bean="process"
               property="meetingStartTime"
               widget-disabled="${process?.allDay}"
               widget-value="${process?.meetingStartTime}"/>
        </div>
        <div class="col-2 text-center pt-3">
           <g:javascript>
                 function toggleMeetingEndDate(checkbox) {
                    if (checkbox.checked) {
                        $("#meetingEndTime").removeAttr("disabled");
                    } else {
                        $("#meetingEndTime").attr("disabled", true);
                    }
                 };
           </g:javascript>
           <f:field
               label="Es auditable ?"
               class="pt-4"
               bean="process"
               property="isTimeAuditable"
               widget="switch"
               wrapper="switch"
               widget-disabled="${process?.allDay}"
               widget-switch="toggleMeetingEndDate(this);"
               widget-value="${process?.isTimeAuditable}"/>
        </div>
        <div class="col-2">
           <f:field
              label="Hora Fin"
              bean="process"
              property="meetingEndTime"
              widget-disabled="${!process.isTimeAuditable}"
              widget-value="${process?.meetingEndTime}"/>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <f:field
                label="Descripción"
                bean="process"
                property="description"
                widget-placeholder="Introduce una breve descripción sobre el motivo de la reunion"
                widget-value="${process?.description}"/>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <f:field
                widget-placeholder="Contenido"
                label="Contenido"
                bean="process"
                widget-rich="true"
                widget-value="${process?.content}"
                property="content"/>
            <g:hiddenField name="person.id" value="${process?.person?.id}" />
        </div>
    </div>
</fieldset>
