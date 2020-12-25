<div class="fluid-container">
  <div class="row mb-4">
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Datos</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="name" label="Nombre" wrapper="display/inline" />
                <f:display bean="person" property="firstSurname" label="Primer apellido" wrapper="display/inline" />
                <f:display bean="person" property="secondSurname" label="Segundo apellido" wrapper="display/inline" />
                <f:display bean="person" property="birthDate" label="Fecha de nacimiento" wrapper="display/inline" />
                <f:display bean="person" property="contact1" label="Contacto" wrapper="display/inline" />
                <f:display bean="person" property="sex" label="Sexo" wrapper="display/inline" />
                <f:display bean="person" property="genre" label="Genero" wrapper="display/inline" />
            </div>
        </div>
    </div>
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Datos internos</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="professionalReference" label="Profesional de referencia" wrapper="display/inline" />
                <f:display bean="person" property="cameFrom" label="Via de acceso" wrapper="display/inline" />
                <f:display bean="person" property="registrationAt" label="Fecha de alta" wrapper="display/inline" />
                <f:display bean="person" property="deletedAt" label="Fecha de baja" wrapper="display/inline" />
            </div>
        </div>
    </div>
  </div>
  <div class="row mb-4">
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Origen</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="nationality" label="Nacionalidad" wrapper="display/inline" />
                <f:display bean="person" property="regionOfBirth" label="Provincia de nacimiento" wrapper="display/inline" />
                <f:display bean="person" property="culturalUpbringing" label="Origen cultural" wrapper="display/inline" />
            </div>
        </div>
    </div>
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Formación</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="studiesLevel" label="Nivel formativo" wrapper="display/inline" />
                <f:display bean="person" property="studiesCenter" label="Situación formativo laboral" wrapper="display/inline" />
                <f:display bean="person" property="professionalStatus" label="Centro de estudios" wrapper="display/inline" />
                <f:display bean="person" property="professionalBackground" label="Experiencia profesional" wrapper="display/inline" />
            </div>
        </div>
    </div>
  </div>
  <div class="row mb-4">
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Contacto</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="streetType" label="Tipo de vía" wrapper="display/inline" />
                <f:display bean="person" property="street" label="Vía" wrapper="display/inline" />
                <f:display bean="person" property="number" label="Número" wrapper="display/inline" />
                <f:display bean="person" property="ladder" label="Escalera" wrapper="display/inline" />
                <f:display bean="person" property="floor" label="Planta" wrapper="display/inline" />
                <f:display bean="person" property="door" label="Puerta" wrapper="display/inline" />
                <f:display bean="person" property="neighborhood" label="Barrio" wrapper="display/inline" />
                <f:display bean="person" property="district" label="Distrito" wrapper="display/inline" />
                <f:display bean="person" property="postalCode" label="Código postal" wrapper="display/inline" />
                <f:display bean="person" property="contact2" label="Contacto 2" wrapper="display/inline" />
                <f:display bean="person" property="contact3" label="Contacto 3" wrapper="display/inline" />
            </div>
        </div>
    </div>
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Servicios Sociales</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="center" label="Centro de servicios sociales" wrapper="display/inline" />
                <f:display bean="person" property="socialWorker" label="Trabajador/a social" wrapper="display/inline" />
                <f:display bean="person" property="hasPrimaryAttentionFile" label="Tiene expediente en atención primaria" widget="boolean" wrapper="display/inline" />
                <f:display bean="person" property="hasOtherResourcesCase" label="Tiene intervención con otros recursos" widget="boolean" wrapper="display/inline" />
                <f:display bean="person" property="otherResourcesCase" label="Otros recursos" wrapper="display/inline" />
                <f:display bean="person" property="hasEtmfCase" label="Tiene en ETMF" widget="boolean" wrapper="display/inline" />
                <f:display bean="person" property="caiCase" label="Expendiente en CAI" wrapper="display/inline" />
                <f:display bean="person" property="hasCafCase" label="Tiene caso en CAF" widget="boolean" wrapper="display/inline" />
            </div>
        </div>
    </div>
  </div>
  <div class="row">
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Alergias / enfermedades</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="allergies" label="Alergia o intolerancia" wrapper="display/inline" />
                <f:display bean="person" property="illnesses" label="Enfermedad" wrapper="display/inline" />
                <f:display bean="person" property="medication" label="Medicación" wrapper="display/inline" />
            </div>
        </div>
    </div>
    <div class="col-6">
        <div class="card card-info h-100">
            <div class="card-header">
                <h3 class="card-title">Identificación</h3>
            </div>
            <div class="card-body pb-0">
                <f:display bean="person" property="documentType" label="Documento de identificación" wrapper="display/inline" />
                <f:display bean="person" property="identification" label="Número" wrapper="display/inline" />
            </div>
        </div>
    </div>
  </div>
</div>
