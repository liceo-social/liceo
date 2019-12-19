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
        <f:field label="Tipo de vía" bean="person" property="address.streetType"/>
        <f:field label="Vía" bean="person" property="address.street"/>
        <f:field label="Número" bean="person" property="address.number"/>
        <f:field label="Escalera" bean="person" property="address.ladder"/>
        <f:field label="Planta" bean="person" property="address.floor"/>
        <f:field label="Puerta" bean="person" property="address.door"/>
        <f:field label="Barrio" bean="person" property="address.neighborhood"/>
        <f:field label="Districto" bean="person" property="address.district"/>
        <f:field label="Código postal" bean="person" property="address.postalCode"/>
        <f:field label="Contacto 2" bean="person" property="address.contact2"/>
        <f:field label="Contacto 3" bean="person" property="address.contact3"/>
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>