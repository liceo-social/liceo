<div class="card card-info collapsed-card">
    <div class="card-header">
    
        <h3 class="card-title">Servicios sociales</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
        </button>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <f:field label="Centro de servicios sociales" bean="person" property="center"/>
        <f:field label="Trabajador/a social" bean="person" property="socialWorker"/>
        <f:field label="Tiene expediente en atención primaria" bean="person" property="hasPrimaryAttentionFile"/>
        <f:field label="Tiene intervención con otros recursos" bean="person" property="hasOtherResourcesCase"/>
        <f:field label="Otros recursos" bean="person" property="otherResourcesCase"/>
        <f:field label="Caso en ETMF" bean="person" property="etmfCase"/>
        <f:field label="Tiene expediente en CAI" bean="person" property="hasCaiFile"/>
        <f:field label="Caso en CAF" bean="person" property="cafCase"/>
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>