<div class="card card-info collapsed-card">
    <div class="card-header">
        <h3 class="card-title">Formativo laboral</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
        </button>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <f:field label="Nivel formativo" bean="person" property="studiesLevel"/>
        <f:field label="Situación formativo laboral" bean="person" property="studiesCenter"/>
        <f:field label="Centro de estudios" bean="person" property="professionalStatus"/>
        <f:field label="Experiencia profesional" bean="person" property="professionalBackground"/>
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>