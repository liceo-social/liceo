<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
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
        <f:field label="Segundo apellido" bean="person" property="secondSurname"/>
        <f:field
            label="Nacionalidad"
            bean="person"
            property="nationality"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-from="${Country.list()}"
            widget-value="${person?.nationality?.id}" />
        <f:field label="Provincia de nacimiento" bean="person" property="regionOfBirth"/>
        <f:field
            label="Origen cultural"
            bean="person"
            property="culturalUpbringing"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-from="${Country.list()}"
            widget-value="${person?.culturalUpbringing?.id}"/>
    </div>
    <!-- /.card-body -->
    <!-- /.card -->
</div>