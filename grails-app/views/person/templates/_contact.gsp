<div class="card card-info collapsed-card">
    <div class="card-header">
        <h3 class="card-title">Contacto</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
        </button>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <f:field label="Tipo de vía" bean="person" property="streetType"/>
        <f:field label="Vía" bean="person" property="street"/>
        <f:field label="Número" bean="person" property="number"/>
        <f:field label="Escalera" bean="person" property="ladder"/>
        <f:field label="Planta" bean="person" property="floor"/>
        <f:field label="Puerta" bean="person" property="door"/>
        <f:field label="Barrio" bean="person" property="neighborhood"/>
        <f:field label="Districto" bean="person" property="district"/>
        <f:field label="Código postal" bean="person" property="postalCode"/>
        <f:field label="Contacto 2" bean="person" property="contact2"/>
        <f:field label="Contacto 3" bean="person" property="contact3"/>
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>