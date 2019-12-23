<div class="card">
    <div class="card-header">
      <h3 class="card-title">Datos generales</h3>
    </div>
    <div class="card-body show-data">
      <div class="col-md-6">
        <p><strong>Nombre: </strong><f:display bean="person" property="name"/></p>
        <p><strong>Primer apellido: </strong><f:display bean="person" property="firstSurname"/></p>
        <p><strong>Segundo apellido: </strong><f:display bean="person" property="secondSurname"/></p>
        <p><strong>Fecha de nacimiento: </strong><f:display bean="person" property="birthDate"/></p>
        <p><strong>Contacto: </strong><f:display bean="person" property="contact1"/></p>
      </div>
      <div class="col-md-6">
        <p><strong>Profesional de referencia: </strong><f:display bean="person" property="professionalReference"/></p>
        <p><strong>Via de acceso: </strong><f:display bean="person" property="cameFrom"/></p>
        <p><strong>Fecha de alta: </strong><f:display bean="person" property="registrationAt"/></p>
        <p><strong>Estado: </strong><f:display bean="person" property="active"/></p>
      </div>
    </div>
    <div class="card-footer">
        <g:form resource="${this.person}" method="DELETE">
            <g:link class="btn btn-primary edit" action="edit" resource="${this.person}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        </g:form>
    </div>
</div>