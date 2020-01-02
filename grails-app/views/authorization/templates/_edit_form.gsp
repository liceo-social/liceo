<f:field
    widget-placeholder="Introduce una descripcion para la autorizacion"
    bean="authorization"
    property="description" />
<f:field
    bean="authorization"
    property="attachment"
    widget="attachment"
    widget-labelName="authorization-attachment-label"
    widget-name="authorization-attachment"
    widget-placeholder="Pulsa para subir un fichero" />

<g:hiddenField name="authorization.id" value="${authorization.id}" />
