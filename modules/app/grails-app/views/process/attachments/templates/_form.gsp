<div class="row">
    <div class="col-12">
        <f:field
            widget-placeholder="Introduce una descripcion para el adjunto"
            bean="command"
            property="description" />
    </div>
</div>
<div class="row">
    <div class="col-4">
        <f:field
            bean="command"
            property="attachment"
            widget="attachment"
            widget-labelName="process-attachment-label"
            widget-name="process-attachment"
            widget-placeholder="Pulsa para subir un fichero" />
        <!-- HIDDEN FIELDS -->
        <g:hiddenField name="id" value="${command.id}" />
        <!-- ONLY FOR CREATION -->
        <g:hiddenField name="process.id" value="${command?.process?.id}" />
    </div>
</div>
