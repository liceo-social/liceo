<div class="card card-info collapsed-card">
    <div class="card-header">
        <h3 class="card-title">Salud</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
        </button>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <f:field label="Alergia o intolerancia" bean="person" property="allergies"/>
        <f:field label="Enfermedad" bean="person" property="illnesses"/>
        <f:field label="Medicación" bean="person" property="medication"/>
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>
