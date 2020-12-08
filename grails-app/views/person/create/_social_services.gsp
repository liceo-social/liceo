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
        <f:field label="Tiene caso en ETMF" bean="person" property="hasEtmfCase"/>
        <f:field label="Tiene caso en CAF" bean="person" property="hasCafCase"/>
        <f:field label="Caso en CAI" bean="person" property="caiCase"/>
        <f:field label="Tiene intervención con otros recursos" bean="person" property="hasOtherResourcesCase"/>
        <f:field label="Otros recursos" bean="person" property="otherResourcesCase"/>
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>
