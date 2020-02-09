<div class="tab-pane fade show active col-12" id="custom-tabs-one-person" role="tabpanel" aria-labelledby="custom-tabs-one-person-tab">
  <div class="row show-data">
    <div class="col-md-6 block-data">
      <strong>Datos</strong>
      <hr />
      <f:display bean="person" property="name" label="Nombre" wrapper="display/inline" />
      <f:display bean="person" property="firstSurname" label="Primer apellido" wrapper="display/inline" />
      <f:display bean="person" property="secondSurname" label="Segundo apellido" wrapper="display/inline" />
      <f:display bean="person" property="birthDate" label="Fecha de nacimiento" wrapper="display/inline" />
      <f:display bean="person" property="contact1" label="Contacto" wrapper="display/inline" />
    </div>
    <div class="col-md-6 block-data">
      <strong>Datos internos</strong>
      <hr />
      <f:display bean="person" property="professionalReference" label="Profesional de referencia" wrapper="display/inline" />
      <f:display bean="person" property="cameFrom" label="Via de acceso" wrapper="display/inline" />
      <f:display bean="person" property="registrationAt" label="Fecha de alta" wrapper="display/inline" />
      <f:display bean="person" property="active" label="Estado" widget="active" wrapper="display/inline" />
    </div>
  </div>
  <div class="row show-data">
    <div class="col-md-6 block-data">
    <strong>Origen</strong>
    <hr />
      <p>Nacionalidad: <f:display bean="person" property="nationality"/></p>
      <p>Provincia de nacimiento: <f:display bean="person" property="regionOfBirth"/></p>
      <p>Origen cultural: <f:display bean="person" property="culturalUpbringing"/></p>
    </div>
    <div class="col-md-6 block-data">
    <strong>Formacion</strong>
    <hr />
      <p>Nivel formativo: <f:display bean="person" property="studiesLevel"/></p>
      <p>Situación formativo laboral: <f:display bean="person" property="studiesCenter"/></p>
      <p>Centro de estudios: <f:display bean="person" property="professionalStatus"/></p>
      <p>Experiencia profesional: <f:display bean="person" property="professionalBackground"/></p>
    </div>
    <div class="col-md-6 block-data">
    <strong>Contacto</strong>
    <hr />
      <p>Tipo de vía: <f:display bean="person" property="streetType"/></p>
      <p>Vía: <f:display bean="person" property="street"/></p>
      <p>Número: <f:display bean="person" property="number"/></p>
      <p>Escalera: <f:display bean="person" property="ladder"/></p>
      <p>Planta: <f:display bean="person" property="floor"/></p>
      <p>Puerta: <f:display bean="person" property="door"/></p>
      <p>Barrio: <f:display bean="person" property="neighborhood"/></p>
      <p>Districto: <f:display bean="person" property="district"/></p>
      <p>Código postal: <f:display bean="person" property="postalCode"/></p>
      <p>Contacto 2: <f:display bean="person" property="contact2"/></p>
      <p>Contacto 3: <f:display bean="person" property="contact3"/></p>
    </div>
    <div class="col-md-6 block-data">
    <strong>Servicios sociales</strong>
    <hr />
      <p>Centro de servicios sociales: <f:display bean="person" property="center"/></p>
      <p>Trabajador social: <f:display bean="person" property="socialWorker"/></p>
      <p>Tiene expediente en atención primaria: <f:display bean="person" property="hasPrimaryAttentionFile"/></p>
      <p>Tiene intervención con otros recursos: <f:display bean="person" property="hasOtherResourcesCase"/></p>
      <p>Otros recursos: <f:display bean="person" property="otherResourcesCase"/></p>
      <p>Caso en ETMF: <f:display bean="person" property="etmfCase"/></p>
      <p>Tiene expediente en CAI: <f:display bean="person" property="hasCaiFile"/></p>
      <p>Caso en CAF: <f:display bean="person" property="cafCase"/></p>
    </div>
    <div class="col-md-6 block-data">
    <strong>Alergias / enfermedades</strong>
    <hr />
      <p>Alergia o intolerancia: <f:display bean="person" property="allergies"/></p>
      <p>Enfermedad: <f:display bean="person" property="illnesses"/></p>
      <p>Mediación: <f:display bean="person" property="medication"/></p>
    </div>
    <div class="col-md-6 block-data">
    <strong>Identificacion</strong>
    <hr />
      <p>Documento de identificación: <f:display bean="person" property="documentType"/></p>
      <p>Número: <f:display bean="person" property="identification"/></p>
    </div>
  </div>
</div>
