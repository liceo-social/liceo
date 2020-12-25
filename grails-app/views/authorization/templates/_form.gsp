<div class="row">
    <div class="col-12">
        <f:field
            bean="authorization"
            property="description"
            widget-placeholder="Introduce una descripción para el documento" />
    </div>
</div>
<div class="row">
    <div class="col-4">
        <f:field
            label="Proyecto"
            bean="authorization"
            property="project"
            value="${authorization?.project}"
            widget-noSelection="${['':'Sin proyecto']}"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-value="${authorization?.project?.id}"
            widget-from="${availableProjects}" />
    </div>
</div>
<div class="row mb-4">
    <div class="col-4">
        <f:field
            label="Archivo"
            bean="authorization"
            property="attachment"
            widget="attachment"
            widget-labelName="authorization-attachment-label"
            widget-name="authorization-attachment"
            widget-placeholder="Pulsa para subir un fichero" />
        <!-- HIDDEN FIELDS -->
        <g:hiddenField name="person" value="${authorization?.person?.id}" />
        <g:hiddenField name="authorization" value="${authorization?.id}" />
        <!-- HIDDEN FIELDS -->
    </div>
</div>
