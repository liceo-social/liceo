<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card card-info collapsed-card">
    <div class="card-header">
        <h3 class="card-title">Situación administrativa</h3>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
        </button>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <f:field
            label="Tipo de documento"
            bean="person"
            property="documentType"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-from="${DocumentType.list()}"
            widget-value="${person?.documentType?.id}"/>
        <f:field label="Número" bean="person" property="identification"/>
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>