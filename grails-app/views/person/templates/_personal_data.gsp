<div class="card card-info collapsed-card">
    <div class="card-header">
        <h3 class="card-title">Datos personales</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
        </button>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <f:field label="Segundo apellido" bean="person" property="personalInformation.secondSurname"/>
        <f:field label="Nacionalidad" bean="person" property="personalInformation.nationality" value="${countries}" />
        <f:field label="Provincia de nacimiento" bean="person" property="personalInformation.regionOfBirth"/>
        <f:field label="Origen cultural" bean="person" property="personalInformation.culturalUpbringing" value="${countries}"/>
    </div>
    <!-- /.card-body -->
    <!-- /.card -->
</div>