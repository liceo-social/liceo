<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card card-info collapsed-card">
    <div class="card-header">
        <h3 class="card-title">Proyectos</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
        </button>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <f:field
            label="Proyecto"
            bean="person"
            property="project"
            value="${person?.project}"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-value="${person?.project?.id}"
            widget-from="${Project.list()}" />
    </div>
    <!-- /.card-body -->
<!-- /.card -->
</div>