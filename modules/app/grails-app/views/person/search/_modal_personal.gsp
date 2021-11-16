<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card card-primary">
    <div class="card-header">
       <h3 class="card-title">Datos personales</h3>
    </div>
    <div class="card-body">
       <div class="row">
           <div class="col-12">
            <f:field
                bean="${searchCommand}"
                property="name"
                label="Nombre"
                class="form-control"
                widget-placeholder="Termino que este contenido en el nombre" />
           </div>
       </div>
       <div class="row">
           <div class="col-6">
               <f:field
                   label="Sexo"
                   bean="${searchCommand}"
                   property="sexes"
                   template="oneToMany"
                   widget="oneToOne"
                   widget-multiple="true"
                   widget-optionKey="id"
                   widget-optionValue="name"
                   widget-value="${searchCommand.sexes}"
                   widget-from="${Sex.list()}" />
           </div>
           <div class="col-6">
               <f:field
                   label="Genero"
                   bean="${searchCommand}"
                   property="genres"
                   template="oneToMany"
                   widget="oneToOne"
                   widget-multiple="true"
                   widget-optionKey="id"
                   widget-optionValue="name"
                   widget-value="${searchCommand.genres}"
                   widget-from="${Genre.list()}" />
           </div>
       </div>
       <div class="row">
           <div class="col-6">
              <g:render template="search/age_range" />
           </div>
           <div class="col-6">
               <f:field
                   label="Mostrar solo activos"
                   bean="${searchCommand}"
                   property="showOnlyActive" />
           </div>
       </div>
    </div>
</div>
