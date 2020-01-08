<label>Adjunto</label>
<f:field
    bean="command"
    property="attachment"
    widget="attachment"
    widget-labelName="process-attachment-label"
    widget-name="process-attachment"
    widget-placeholder="Pulsa para subir un fichero" />
<g:hiddenField
    name="process.id"
    value="${command?.process?.id}" />

