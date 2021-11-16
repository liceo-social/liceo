<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card card-primary collapsed-card">
    <div class="card-header">
        <h3 class="card-title">Grupos de campos extra a exportar (CSV)</h3>
        <div class="card-tools">
             <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
         </button>
        </div>
    </div>
    <div class="card-body">
        <div class="row listed-checks">
            <div class="col-6">
                <f:field label="Situacion Administrativa" bean="${searchCommand}" property="exportAdministration"/>
                <f:field label="Contacto" bean="${searchCommand}" property="exportContact" />
                <f:field label="Formativo Laboral" bean="${searchCommand}" property="exportWork" />
            </div>
            <div class="col-6">
                <f:field label="Salud" bean="${searchCommand}" property="exportHealth" />
                <f:field label="Servicios Sociales" bean="${searchCommand}" property="exportSocial" />
            </div>
        </div>
    </div>
</div>
