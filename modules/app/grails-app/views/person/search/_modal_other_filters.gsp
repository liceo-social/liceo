<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card card-primary collapsed-card">
     <div class="card-header">
         <h3 class="card-title">Otros Filtros</h3>
         <div class="card-tools">
             <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
             </button>
         </div>
     </div>
     <div class="card-body">
        <f:field
            label="Vias de acceso"
            bean="${searchCommand}"
            property="cameFrom"
            template="oneToMany"
            widget="oneToOne"
            widget-value="${searchCommand.cameFrom}"
            widget-multiple="true"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-from="${CameFrom.list()}" />
        <f:field
            label="Proyectos"
            bean="${searchCommand}"
            property="projects"
            template="oneToMany"
            widget="oneToOne"
            widget-value="${searchCommand.projects}"
            widget-multiple="true"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-from="${Project.list()}" />
        <f:field
            label="Origen"
            bean="${searchCommand}"
            property="countries"
            template="oneToMany"
            widget="oneToOne"
            widget-value="${searchCommand.countries}"
            widget-multiple="true"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-from="${Country.list()}" />
        <f:field
            label="Responsables"
            bean="${searchCommand}"
            property="handlers"
            template="oneToMany"
            widget="oneToOne"
            widget-value="${searchCommand.handlers}"
            widget-multiple="true"
            widget-optionKey="id"
            widget-optionValue="name"
            widget-from="${User.list()}" />
     </div>
</div>
