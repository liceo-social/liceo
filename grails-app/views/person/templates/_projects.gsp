<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Proyectos</h3>
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
